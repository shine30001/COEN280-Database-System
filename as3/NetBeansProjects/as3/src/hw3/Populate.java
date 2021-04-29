/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hw3;

import java.io.*;
import java.sql.*;
import java.util.*;
import org.json.*;
/**
 *
 * @author jialin
 */

class MainCategory {
    String b_id;
    String main_c;
    MainCategory(String b_id, String main_c) {
        this.b_id = b_id;
        this.main_c = main_c;
    }
}

class SubCategory {
    String b_id;
    String sub_c;
    SubCategory(String b_id, String sub_c) {
        this.b_id = b_id;
        this.sub_c = sub_c;
    }
}

class Attribute {
    String b_id;
    String attr;
    Attribute(String b_id, String attr) {
        this.b_id = b_id;
        this.attr = attr;
    }
}

class Workingtime {
    String b_id;
    String workingday;
    int close;
    int open;
      
    Workingtime(String b_id, String workingday, int close, int open) {
        this.b_id = b_id;
        this.workingday = workingday;
        this.close = close;
        this.open = open;
    }
}

public class Populate {
    public static Set<String> mainCategoriesHash = new HashSet<>();
    public static ArrayList<MainCategory> mainCategories = new ArrayList<>();
    public static ArrayList<SubCategory> subCategories = new ArrayList<>();
    public static ArrayList<Attribute> attributes = new ArrayList<>();
    public static ArrayList<Workingtime> workingtimes = new ArrayList<>();
    private static String FileBusiness;
    private static String FileUser;
    private static String FileReview;
    private static String FileCheck;
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException, IOException {
        if(args.length != 4)
            throw new IllegalArgumentException("Exactly 4 parameters required !");
        FileBusiness = args[0];
        FileReview = args[1];
        FileCheck = args[2];
        FileUser = args[3];
        
        // TODO code application logic here
        Populate p = new Populate();
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = null;
        //connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
        try {

            connection = DriverManager.getConnection(
                            "jdbc:oracle:thin:@localhost:1521:XE", "system","oracle");
            System.out.println("connection suc");
        } catch (SQLException e) {

            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return;

        }
        p.Clean_tables(connection);
        p.addMainCategories();
        p.Populate_business(connection);
        p.Populate_user(connection);
        p.Populate_checkin(connection);
        p.Populate_reviews(connection);
        connection.close();
    }
    private void Populate_business(/*String name,*/ Connection con) throws FileNotFoundException, IOException, SQLException{
        System.out.println("Populate_business");
        
        BufferedReader br = new BufferedReader(new FileReader(FileBusiness));
        int count = 0;
        int b_size = 1000;
        String line = null;
        try{
            PreparedStatement preparedstmt = con.prepareStatement("INSERT into Businesses values(?,?,?,?,?,?,?)");
            while((line = br.readLine())!= null){
                JSONObject jo = new JSONObject(line);
                String b_id = jo.getString("business_id");
                String address = jo.getString("full_address");
                String city = jo.getString("city");
                String state = jo.getString("state");
                Integer reviews_count = jo.getInt("review_count");
                String b_name = jo.getString("name");
                Double stars = jo.getDouble("stars");
                
                parsing_categories_attributes_workingtime(b_id, jo);
                
                preparedstmt.setString(1, b_id);
                preparedstmt.setString(2, address);                
                preparedstmt.setString(3, city);
                preparedstmt.setInt(4, reviews_count);
                preparedstmt.setString(5, b_name);
                preparedstmt.setString(6, state);                
                preparedstmt.setDouble(7, stars);
                /*
                System.out.println("id:" + b_id + " ");
                System.out.println("info:" + address + " ");      
                System.out.println("city:" + city + " ");
                System.out.println("rCount:" + reviews_count + " ");
                System.out.println("b_name:" + b_name + " ");
                System.out.println("state:" + state + " ");
                System.out.println("stars:" + stars + " ");
                */
                preparedstmt.addBatch();
                count++;
                if(count % b_size == 0){
                    preparedstmt.executeBatch();
                    //System.out.println(count);
                }
             
            }
            if(count % b_size != 0)
                preparedstmt.executeBatch(); 
            
            preparedstmt.close();
            populate_maincatgory(con);
            populate_subcatgory(con);
            populate_attribute(con);
            populate_workingtime(con);
        }
        catch(Exception e){
                e.printStackTrace();
        }
        
    }
    private void addMainCategories(){
        mainCategoriesHash.add("Active Life");
        mainCategoriesHash.add("Arts & Entertainment");
        mainCategoriesHash.add("Automotive");
        mainCategoriesHash.add("Car Rental");
        mainCategoriesHash.add("Cafes");
        mainCategoriesHash.add("Beauty & Spas");
        mainCategoriesHash.add("Convenience Stores");
        mainCategoriesHash.add("Dentists");
        mainCategoriesHash.add("Doctors");
        mainCategoriesHash.add("Drugstores");
        mainCategoriesHash.add("Department Stores");
        mainCategoriesHash.add("Education");
        mainCategoriesHash.add("Event Planning & Services");
        mainCategoriesHash.add("Flowers & Gifts");
        mainCategoriesHash.add("Food");
        mainCategoriesHash.add("Health & Medical");
        mainCategoriesHash.add("Home Services");
        mainCategoriesHash.add("Home & Garden");
        mainCategoriesHash.add("Hospitals");
        mainCategoriesHash.add("Hotels & Travel");
        mainCategoriesHash.add("Hardware Stores");
        mainCategoriesHash.add("Grocery");
        mainCategoriesHash.add("Medical Centers");
        mainCategoriesHash.add("Nurseries & Gardening");
        mainCategoriesHash.add("Nightlife");
        mainCategoriesHash.add("Restaurants");
        mainCategoriesHash.add("Shopping");
        mainCategoriesHash.add("Transportation");
    }
    private void parsing_categories_attributes_workingtime(String b_id, JSONObject jo){
        JSONArray categories = jo.getJSONArray("categories");
        for(int i = 0; i < categories.length(); i++){
            String category = categories.getString(i);
            if (mainCategoriesHash.contains(category)){
                mainCategories.add(new MainCategory(b_id, category));
            }         
            else{
                subCategories.add(new SubCategory(b_id, category));
            }
        }
            
        JSONObject allattributes = jo.getJSONObject("attributes");
        Iterator keys = allattributes.keys();

        while(keys.hasNext()){
            String nextKeys = (String)keys.next();

            try{
                if(allattributes.get(nextKeys) instanceof JSONObject){
                    JSONObject subattributes = allattributes.getJSONObject(nextKeys);
                    Iterator subkeys = subattributes.keys();
                    while(subkeys.hasNext()){
                        String nextsubKeys = (String)subkeys.next();
                        attributes.add(new Attribute(b_id, nextKeys + "_" + nextsubKeys + "_" + subattributes.get(nextsubKeys)));
                        //System.out.println(nextKeys + "_" + nextsubKeys + "_" + subattributes.get(nextsubKeys));
                    }
                }                      
                else{
                     attributes.add(new Attribute(b_id, nextKeys + "_" + allattributes.get(nextKeys)));
                     //System.out.println(nextKeys + "_"  + allattributes.get(nextKeys));
                }

            }catch (Exception e) {
                e.printStackTrace();
            }
            
            
        }
        
        JSONObject hours = jo.getJSONObject("hours");
        keys = hours.keys();
        while(keys.hasNext()){
            String nextKeys = (String)keys.next();
            
            try{
                if(hours.get(nextKeys) instanceof JSONObject){
                    JSONObject hour = hours.getJSONObject(nextKeys);
                  
                        
                    String[] close_time = hour.getString("close").split(":");
                    String[] open_time = hour.getString("open").split(":");
       
                    int close = Integer.parseInt(close_time[0])*100+Integer.parseInt(close_time[1]);
                    int open = Integer.parseInt(open_time[0])*100+Integer.parseInt(open_time[1]);
                    workingtimes.add(new Workingtime(b_id, nextKeys, close, open));
                    
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        
    
    }
    private void populate_maincatgory(/*String name,*/ Connection con) throws SQLException{
        PreparedStatement preparedstmt = con.prepareStatement("INSERT into MainCategories values(?,?)");
        for(int i = 0; i < mainCategories.size(); i++){
            MainCategory m = mainCategories.get(i);
            
            
            preparedstmt.setString(1, m.b_id);
            preparedstmt.setString(2, m.main_c);
            preparedstmt.executeUpdate();
            
        }
        preparedstmt.close(); 
    }
    
    private void populate_subcatgory(/*String name,*/ Connection con) throws SQLException{
        PreparedStatement preparedstmt = con.prepareStatement("INSERT into SubCategories values(?,?)");
        int count = 0;
        int b_size = 1000;
        for(int i = 0; i < subCategories.size(); i++){
            SubCategory s = subCategories.get(i);
            
            preparedstmt.setString(1, s.b_id);
            preparedstmt.setString(2, s.sub_c);
            preparedstmt.addBatch();
            count++;
            if(count % b_size == 0){
                preparedstmt.executeBatch();
                //System.out.println(count);
            }
             
        }
        if(count % b_size != 0)
            preparedstmt.executeBatch(); 

        preparedstmt.close(); 
    }
    
    private void populate_attribute(/*String name,*/ Connection con) throws SQLException{
        System.out.println("populate_attribute");
        PreparedStatement preparedstmt = con.prepareStatement("INSERT into Attributes values(?,?)");
        int count = 0;
        int b_size = 1000;
        for(int i = 0; i < attributes.size(); i++){
            Attribute a = attributes.get(i);
            
            preparedstmt.setString(1, a.b_id);
            preparedstmt.setString(2, a.attr);
            preparedstmt.addBatch();
            //System.out.println(a.b_id);
            //System.out.println(a.attr);
            
            count++;
            if(count % b_size == 0){
                preparedstmt.executeBatch();
                
            }
             
        }
        if(count % b_size != 0)
            preparedstmt.executeBatch(); 
            
        preparedstmt.close(); 
    }
    
    private void populate_workingtime(/*String name,*/ Connection con) throws SQLException{
        System.out.println("populate_workingtime");
        PreparedStatement preparedstmt = con.prepareStatement("INSERT into BusinessTime values(?,?,?,?)");
        int count = 0;
        int b_size = 1000;
        for(int i = 0; i < workingtimes.size(); i++){
            Workingtime w = workingtimes.get(i);
            
            
            preparedstmt.setString(1, w.b_id);
            preparedstmt.setString(2, w.workingday);
            preparedstmt.setInt(3, w.close);
            preparedstmt.setInt(4, w.open);
            preparedstmt.addBatch();
            
            count++;
            if(count % b_size == 0){
                preparedstmt.executeBatch();
                
            }
             
        }
        if(count % b_size != 0)
            preparedstmt.executeBatch(); 
        preparedstmt.close(); 
    }
    private void Populate_user(/*String name,*/ Connection con) throws FileNotFoundException, IOException{
        System.out.println("Populate_user");
        BufferedReader br = new BufferedReader(new FileReader(FileUser));
        int count = 0;
        int b_size = 1000;
        String line = null;
        try{
            PreparedStatement preparedstmt = con.prepareStatement("INSERT into Users values(?,?)");
            while((line = br.readLine())!= null){
                JSONObject jo = new JSONObject(line);
                String u_name = jo.getString("name");
                String u_id = jo.getString("user_id");  

                
                preparedstmt.setString(1, u_name);
                preparedstmt.setString(2, u_id);                     
      
                preparedstmt.addBatch();
                count++;
                if(count % b_size == 0){
                    preparedstmt.executeBatch();
                    //System.out.println(count);
                }
             
            }
            if(count % b_size != 0)
                preparedstmt.executeBatch(); 
            
            preparedstmt.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    private void Populate_checkin(/*String name,*/ Connection con) throws FileNotFoundException{
        System.out.println("Populate_checkin");
        BufferedReader br = new BufferedReader(new FileReader(FileCheck));
        int count = 0;
        int b_size = 1000;
        String line = null;
        try{
            PreparedStatement preparedstmt = con.prepareStatement("INSERT into Checkins values(?,?)");
            while((line = br.readLine())!= null){
                JSONObject jo = new JSONObject(line);
                String b_id = jo.getString("business_id"); 
                JSONObject checkin_info = jo.getJSONObject("checkin_info");
                Iterator keys = checkin_info.keys();
                int sum = 0;
                while(keys.hasNext()){
                    String nextKeys = (String)keys.next();
                    
                    sum+=checkin_info.getInt(nextKeys);
                    
                }
                
                preparedstmt.setString(1, b_id);
                preparedstmt.setInt(2, sum);
                
                preparedstmt.addBatch();
                count++;
                if(count % b_size == 0){
                    preparedstmt.executeBatch();
                    //System.out.println(count);
                }
             
            }
            if(count % b_size != 0)
                preparedstmt.executeBatch(); 
            
            preparedstmt.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    private void Populate_reviews(/*String name,*/ Connection con) throws FileNotFoundException{
        System.out.println("Populate_reviews");
        BufferedReader br = new BufferedReader(new FileReader(FileReview));
        int count = 0;
        int b_size = 500;
        String line = null;
        try{
            PreparedStatement preparedstmt = con.prepareStatement("INSERT into Reviews values(?,?,?,?,?,?,?,?,?)");
            while((line = br.readLine())!= null){
                JSONObject jo = new JSONObject(line);
                JSONObject votes = (JSONObject) jo.get("votes");
                
                Integer f_vote = votes.getInt("funny");
                Integer u_vote = votes.getInt("useful");
                Integer c_vote = votes.getInt("cool");
                
                String u_id = jo.getString("user_id");
                String r_id = jo.getString("review_id");
                Double stars = jo.getDouble("stars");
                String b_id = jo.getString("business_id");
                String v_date = jo.getString("date");
                String text = jo.getString("text");
                
                /*System.out.println("f:" + f_vote + " ");
                System.out.println("u:" + u_vote + " ");      
                System.out.println("c:" + c_vote + " ");
                System.out.println("uid:" + u_id + " ");
                System.out.println("rid:" + r_id + " ");
                System.out.println("bid:" + b_id + " ");
                System.out.println("date:" + v_date + " ");
                System.out.println("text:" + text + " ");
                */
                
                preparedstmt.setInt(1, f_vote);
                preparedstmt.setInt(2, u_vote);
                preparedstmt.setInt(3, c_vote);
                preparedstmt.setString(4, u_id);
                preparedstmt.setString(5, r_id); 
                preparedstmt.setDouble(6, stars);
                preparedstmt.setString(7, b_id);               
                preparedstmt.setString(8, v_date);    
                preparedstmt.setString(9, text); 
                preparedstmt.addBatch();
                
                count++;
                if(count % b_size == 0){
                    preparedstmt.executeBatch();
                    //System.out.println(count);
                }
             
            }
            if(count % b_size != 0)
                    preparedstmt.executeBatch(); 
            
            preparedstmt.close(); 
        }
        catch(Exception e){
                e.printStackTrace();
        }
        
    }
    
    private void Clean_tables(Connection con) throws SQLException{
        System.out.println("Clean Tables");
        Statement stmt = con.createStatement();
        stmt.executeUpdate("DELETE FROM Reviews");
        stmt.executeUpdate("DELETE FROM Users");
        stmt.executeUpdate("DELETE FROM Checkins");
        stmt.executeUpdate("DELETE FROM BusinessTime");
        stmt.executeUpdate("DELETE FROM MainCategories");
        stmt.executeUpdate("DELETE FROM SubCategories");
        stmt.executeUpdate("DELETE FROM Attributes");
        stmt.executeUpdate("DELETE FROM Businesses");
        System.out.println("Overs");
 
    }

}

