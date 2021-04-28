CREATE TABLE Yelp_User (
Yelp_ID varchar(10) PRIMARY KEY,
Email varchar(50) NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
DOB date NOT NULL,
Birthplace varchar(50) NOT NULL,
Gender char(1));

CREATE TABLE Business(
Business_Id varchar(10) PRIMARY KEY,
Business_Name varchar(50) NOT NULL,
Address varchar(100) NOT NULL,
State varchar(5) NOT NULL,
Phone_No varchar(50) NOT NULL,
Review_Count NUMBER(10), 
Business_Cat_Id varchar(10) NOT NULL);

CREATE TABLE Business_category(
Business_Cat_Id varchar(10) PRIMARY KEY,
Business_Type varchar(50) NOT NULL);

CREATE TABLE Photo(
Photo_Id varchar(50) PRIMARY KEY,
Photo_Description varchar(50) NOT NULL,
Location varchar(50) NOT NULL,
Author varchar(50));

CREATE TABLE Reviews(
Review_Id varchar(10) PRIMARY KEY,
Rating NUMBER(5) CHECK (Rating >=1 and Rating <=5) NOT NULL,
Author varchar(10) NOT NULL,
Publish_Date date NOT NULL,
Friend_list_Cool_Fun_Use varchar(20) NOT NULL,
Review_type varchar(10) NOT NULL,
Business_Id varchar(10) NOT NULL,
Funny NUMBER(10)NOT NULL,
Cool NUMBER(10) NOT NULL,
Useful NUMBER(10) NOT NULL,			
FOREIGN KEY (Author) REFERENCES Yelp_User(Yelp_ID) ON DELETE SET NULL,
FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id) ON DELETE SET NULL);






CREATE TABLE business_has_category(
Business_Id varchar(50) NOT NULL,
BC_Id varchar(50) NOT NULL,
FOREIGN KEY (BC_Id) REFERENCES Business_category(Business_Cat_Id),
FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id) ON DELETE SET NULL);

CREATE TABLE List_of_Friends(
			Yelp_Id varchar(10) NOT NULL,
			Friends_ID varchar(10) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Friends_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL);
CREATE TABLE Complimented_Friendlist(
			Yelp_Id varchar(10) NOT NULL,
			Friends_ID varchar(10) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Friends_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL);

CREATE TABLE Recommended_Review(
			Business_Id varchar(50) NOT NULL,
			Rec char(1), 
			FOREIGN KEY (Business_Id)REFERENCES Business(Business_Id) ON DELETE SET NULL);



CREATE TABLE Review(
			Yelp_Id varchar(10) NOT NULL,
			Review_Id varchar(10) NOT NULL,
			Funny varchar(50) NOT NULL,
			Cool varchar(50) NOT NULL,
			Useful varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Review_Id) REFERENCES Reviews(Review_Id) ON DELETE SET NULL);

CREATE TABLE Yelp_Photo(
			Photo_Id varchar(50) NOT NULL,
            Yelp_Id varchar(50) NOT NULL,
            Business_Id varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id),
			FOREIGN KEY (Photo_Id) REFERENCES Photo(Photo_Id) ON DELETE SET NULL,
            FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id) ON DELETE SET NULL);


insert into Yelp_User values('Y1','john@yahoo.com','John','Smith',TO_DATE('1992/12/12', 'YYYY/MM/DD'),'LAKE CITY,FL 32056','M');
insert into Yelp_User values('Y2','juan@gmail.com','Juan','Carlos',TO_DATE('1988/02/07','YYYY/MM/DD'),'Adak,AK 99546','M');
insert into Yelp_User values('Y3','Jane@gmail.com','Jane','Chapel',TO_DATE('1980/06/01','YYYY/MM/DD'),'VERNON HILLS,IL 60061','F');
insert into Yelp_User values('Y4','adi@yahoo.com','Aditya','Awasthi',TO_DATE('1964/04/12','YYYY/MM/DD'),'SAN FRANCISCO, CA 94102','M');
insert into Yelp_User values('Y5','james@hotmail.com','James','Williams',TO_DATE('1991/05/05','YYYY/MM/DD'),'NEW YORK ,NY 10010','M');
insert into Yelp_User values('Y6','mike@yahoo.com','Mike','Brown',TO_DATE('1988/03/01','YYYY/MM/DD'),'CEDAR FALLS, NC 27230','M');
insert into Yelp_User values('Y7','bob@yahoo.com','Bob','Jones',TO_DATE('1970/02/19','YYYY/MM/DD'),'FISHERS ISLAND,NY 06390','M');
insert into Yelp_User values('Y8','wei@gmail.com','Wei','Zhang',TO_DATE('1975/03/18','YYYY/MM/DD'),'LAS VEGAS,NV 89030','F');
insert into Yelp_User values('Y9','mark@gmail.com','Mark','Davis',TO_DATE('1945/11/02','YYYY/MM/DD'),'LOS ANGELES,CA 90007','M');
insert into Yelp_User values('Y10','daniel@yahoo.com','Daniel','Garcia',TO_DATE('1984/05/10','YYYY/MM/DD'),'CALDWELL,NJ 07004','M');
insert into Yelp_User values('Y11','maria@hotmail.com','Maria','Rodriguez',TO_DATE('1985/08/12','YYYY/MM/DD'),'LOS ANGELES,CA 90007','F');
insert into Yelp_User values('Y12','freya@yahoo.com','Freya','Wilson',TO_DATE('1990/10/05', 'YYYY/MM/DD'),'CLIFFSIDE PARK ,NJ 07010','F');
insert into Yelp_User values('Y13','kell@gmail.com','Kelley','Abraham',TO_DATE('1995/11/27','YYYY/MM/DD'),'REDONDO BEACH,CA 90278','F');
insert into Yelp_User values('Y14','xiuying@yahoo.com','Xiuying','Wang',TO_DATE('1982/09/23', 'YYYY/MM/DD'),'ALLEMAN,IA 50007','F');
insert into Yelp_User values('Y15','sahil@yahoo.com','Sahil','Gupta',TO_DATE('1976/02/19','YYYY/MM/DD'),'AMHERST,MA 01004','M');
insert into Yelp_User values('Y16','david@gmail.com','David','Atkinson',TO_DATE('1992/01/02','YYYY/MM/DD'),'SANTA MONICA ,CA 90411','M');
insert into Yelp_User values('Y17','qui@gmail.com','Qui','Liu',TO_DATE('1979/03/13','YYYY/MM/DD'),'CHARLOTTE HALL ,MD 20622','F');
insert into Yelp_User values('Y18','chris@yahoo.com','Chris','Miller',TO_DATE('1979/07/09','YYYY/MM/DD'),'PHOENIX, AZ 85009','M');
insert into Yelp_User values('Y19','david@yahoo.co.in','David','Johnson',TO_DATE('1981/06/23','YYYY/MM/DD'),'BELLEVUE,NE 68005','M');
insert into Yelp_User values('Y20','alana@hotmail.com','Alana','Diaz',TO_DATE('1993/09/15','YYYY/MM/DD'),'AMA ,LA  70031','F');
insert into Yelp_User values('Y21','abner@gmail.com','Abner ','Harris',TO_DATE('1990/08/12','YYYY/MM/DD'),'SANTA CLARA, CA 95050','M');
insert into Yelp_User values('Y22','abby@hotmail.com','Abby','Garcia',TO_DATE('1989/2/14','YYYY/MM/DD'),'SANTA CLARA, CA 95050','M');
insert into Yelp_User values('Y23','alana@yahoo.com','Alana','Robinson',TO_DATE('1984/04/07','YYYY/MM/DD'),'Santa Clara, CA 95053','F');
insert into Yelp_User values('Y24','joanne@yahoo.com','Joanne','Lesniak',TO_DATE('1984/04/08','YYYY/MM/DD'),'Santa Clara, CA 95050','F');
insert into Yelp_User values('Y25','bethany@gmail.com','Bethany','Hughes',TO_DATE('1984/04/08','YYYY/MM/DD'),'Santa Clara, CA 95051','F');

insert into Business values('B1','Big Surf','1500 N McClintock Dr, Tempe, AZ 85281','AZ','(520) 622-6400','2.0','BCT1');
insert into Business values('B2','AirBorne COFFEE','1515, Walsh Avenue, Santa Clara, CA 95050','CA','(408) 524-3580','0','BCT2');
insert into Business values('B3','Pedley Richard Architect','2231 Schrock Road, Columbus, OH 43229','OH','(419)-244-5200','0','BCT3');
insert into Business values('B4','Safelite AutoGlass','2080 West Chandler Blvd. Chandler, AZ 85224','AZ','(520)-465-5225 ','11.0','BCT4');
insert into Business values('B5','SMITH THOMSON ','1595 Spring Hill Road Suite 110 Vienna VA 22182','VA','(855)-808-1480','1.0','BCT5');
insert into Business values('B6','Bay Area Coffee Shop','1522 W. Sam Rayburn Dr. Bonham, CA 95051','CA','(408)-876 7785','0','BCT7');
insert into Business values('B7','China  Coffee Toffee ','2570 El Camino Real, Santa Clara, CA 95051','CA','(408)-261-9000','0','BCT8');
insert into Business values('B8','Hastings Water Works','10331 Brecksville Rd. Brecksville, OH 44141','OH','(440)-832-7700','0','BCT9');
insert into Business values('B9','Catch Your Big Break','2341 Roosevelt Ct Santa Clara, CA 95051','CA',' (408)-827-8383','0','BCT6');
insert into Business values('B10','The Cinebar','2O285 South Western Ave., Suite # 2OO, Torrance, CA 9O5O1','CA','(408)-465-8308','12.0','BCT10');
insert into Business values('B11','Coffee Bar and Bistro','2585 El Camino Real Santa Clara, CA','CA','(408)-465-8208','1.0','BCT10');
insert into Business values('B12','Renegades','2515, Winceshter Road, Santa Clara, CA 95051','CA','(408)-465-8108','0','BCT10');
insert into Business values('B13','Alexs 49er Inn','2232 Schrock Road, Columbus, OH 43229','OH','(419)-465-8018','1.0','BCT10');
insert into Business values('B14','Red Stag Lounge','1031 Brecksville Rd. Brecksville, OH 44141','OH','(419)-465-8028','1.0','BCT10');
insert into Business values('B15','JJs Blues','331 Brecksville Rd. Brecksville, OH 44141','OH','(419)-465-8108','0','BCT10');
insert into Business values('B16','The Bears Cocktails','15 Spring Hill Road Suite 110 Vienna VA 22182','VA','(844)-465-8028','1.0','BCT10');
insert into Business values('B17','Trials Pub','95 Spring Hill Road Suite 110 Vienna VA 22182','VA','(844)-465-8038','0','BCT10');
insert into Business values('B18','Santa Cruz Wine Bar','25 Spring Hill Road Suite 110 Vienna VA 22182','VA','(844)-465-8048','1.0','BCT10');
insert into Business values('B19','Firehouse No 1 Gastropub','1501 N McClintock Dr, Tempe, AZ 85281','AZ','(520)-465-8058','1.0','BCT10');
insert into Business values('B20','Original Gravity Public House','1502 N McClintock Dr, Tempe, AZ 85281','AZ','(520)-465-8068','0','BCT10');
insert into Business values('B21','Hobees','90 Skyport Dr San Jose, CA 95110','CA','(408)-465-8078','2.0','BCT5');
insert into Business values('B22','Cafe Gourmet','80 N Market St San Jose, CA 95113','CA','(408)-465-8088','2.0','BCT5');
insert into Business values('B23','The Table','72 S 1st St San Jose, CA 95113','CA','(408)-465-8908','2.0','BCT5');
insert into Business values('B24','Top Nosh Café','69 N San Pedro St San Jose, CA 95110','CA','(408)-465-8098','3.0','BCT5');
insert into Business values('B25','Breakfast Place','30 E Santa Clara St San Jose, CA 95113','CA','(408)-465-8808','2.0','BCT5');
insert into Business values('B26','Cafe Rosalena','87 N San Pedro St San Jose, CA 95110','CA','(408)-465-8708','2.0','BCT5');
insert into Business values('B27','Southern Kitchen','100 W San Carlos St San Jose, CA 95113','CA','(408)-465-8608','2.0','BCT5');
insert into Business values('B28','Holders Country Inn','22 N Almaden Ave San Jose, CA 95110','CA','(408)-465-8508','1.0','BCT5');
insert into Business values('B29','Hobees Restaurant','1110 Willow St San Jose, CA 95125','CA','(408)-465-8408','1.0','BCT5');
insert into Business values('B30','Cafe San Jose','21 N 2nd St San Jose, CA 95113','CA','(408)-465-8308','1.0','BCT5');
insert into Business values('B31','Bill of Fare','96 S 1st St San Jose, CA 95113','CA','(408)-465-8208','1.0','BCT5');
insert into Business values('B32','Bills Café','16 S 2nd St San Jose, CA 95113','CA','(408)-465-8108','1.0','BCT5');
insert into Business values('B33','American Gymnastics Association','5847 San Felipe, Suite 2400 Houston, TX 77057','TX','(432)-520-7647','1.0','BCT2');
insert into Business values('B34','Dollamur Sport Surfaces','5850 San Felipe, Suite 2400 Houston, TX 77057','TX','(432)-386-3125','1.0','BCT2');
insert into Business values('B35','Connecticut Gymnastics','132 Terry Road, Hartford, CT 06105','CT','(203) 483-5896','1.0','BCT2');
insert into Business values('B36','Sherleys Gymnastics','1132 Terry Road, Hartford, CT 06105','CT','(860) 522-2530','1.0','BCT2');
insert into Business values('B37','In-N-Out Burger','380 South 9th Street, San Jose, CA 95112','CA','(408)-804-8782','1.0','BCT11');
insert into Business values('B38','The Counter Santana Row','350 South 9th Street, San Jose, CA 95112','CA','(408)-804-8783','1.0','BCT11');
insert into Business values('B39','Sliders','320 South 9th Street, San Jose, CA 95112','CA','(408)-804-8784','2.0','BCT11');
insert into Business values('B40','Burger Barn','325 South 8th Street, San Jose, CA 95112','CA','(408)-804-8785','2.0','BCT11');
insert into Business values('B41','The Habit Burger Grill','375 South 9th Street, San Jose, CA 95112','CA','(408)-804-8786','2.0','BCT11');
insert into Business values('B42','Konjoe Burger Bar','355 South 8th Street, San Jose, CA 95112','CA','(408)-804-8787','12.0','BCT11');

insert into Reviews values('R1','2','Y1',to_timestamp_tz('Oct-02-07 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','2','2','2');
insert into Reviews values('R2','5','Y4',to_timestamp_tz('Oct-02-07 01:31:39 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','N','B4','3','2','1');
insert into Reviews values('R3','4','Y2',to_timestamp_tz(' Oct-02-07 09:10:54 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6,Y9,Y18','R','B5','1','2','3');
insert into Reviews values('R4','5','Y3',to_timestamp_tz('Oct-02-07 13:05:56 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6,Y11,Y5','R','B4','2','3','1');
insert into Reviews values('R5','5','Y6',to_timestamp_tz('Sep-29-07 10:38:25 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2,Y15','R','B4','3','1','2');
insert into Reviews values('R6','5','Y12',to_timestamp_tz('Sep-29-07 14:30:47 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y11,Y14','N','B4','1','4','2');
insert into Reviews values('R7','5','Y5',to_timestamp_tz('Sep-29-07 13:52:25 PDT ','Mon-DD-YY HH24:MI:SS TZD'),'Y17, Y15','N','B4','3','2','1');
insert into Reviews values('R8','4','Y2',to_timestamp_tz('Sep-28-07 19:46:08 PDT ','Mon-DD-YY HH24:MI:SS TZD'),'Y6,Y9','R','B14','2','3','3');
insert into Reviews values('R9','1','Y1',to_timestamp_tz('Sep-29-07 13:45:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B11','3','1','3');
insert into Reviews values('R10','1','Y2',to_timestamp_tz('Sep-30-07 05:12:29 PDT ','Mon-DD-YY HH24:MI:SS TZD'),'Y18','R','B18','3','1','1');
insert into Reviews values('R11','2','Y1',to_timestamp_tz('Sep-29-07 16:06:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7,Y2','R','B13','3','3','1');
insert into Reviews values('R12','4','Y1',to_timestamp_tz('Oct-02-07 14:28:20 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2, Y7','N','B16','5','2','1');
insert into Reviews values('R13','5','Y2',to_timestamp_tz('Sep-27-07 11:00:33 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1,Y6','N','B24','4','5','3');
insert into Reviews values('R14','5','Y14',to_timestamp_tz('Oct-02-07 12:45:00 PDT ','Mon-DD-YY HH24:MI:SS TZD'),'Y12','N','B4','3','3','1');
insert into Reviews values('R15','3','Y1',to_timestamp_tz('Sep-29-07 16:08:39 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7,Y9','R','B33','2','2','3');
insert into Reviews values('R16','2','Y1',to_timestamp_tz('Sep-29-07 16:45:34 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','1','2','3');
insert into Reviews values('R17','4','Y2',to_timestamp_tz('Sep-25-07 17:18:31 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6,Y9','R','B34','3','1','2');
insert into Reviews values('R18','5','Y3',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y11','N','B4','2','1','2');
insert into Reviews values('R19','1','Y1',to_timestamp_tz('Oct-01-07 17:15:05 PDT ','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B35','1','2','2');
insert into Reviews values('R20','2','Y2',to_timestamp_tz('Sep-30-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B36','1','1','1');
insert into Reviews values('R21','2','Y2',to_timestamp_tz('Oct-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','N','B19','1','1','2');
insert into Reviews values('R22','5','Y4',to_timestamp_tz('Sep-26-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','N','B4','1','1','1');
insert into Reviews values('R23','5','Y6',to_timestamp_tz('Sep-26-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B4','1','1','1');
insert into Reviews values('R24','5','Y7',to_timestamp_tz('Sep-27-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','N','B4','1','1','1');
insert into Reviews values('R25','5','Y4',to_timestamp_tz('Sep-28-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','N','B4','1','1','1');
insert into Reviews values('R26','5','Y12',to_timestamp_tz('Oct-29-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y11','N','B10','1','1','1');
insert into Reviews values('R27','5','Y5',to_timestamp_tz('Sep-30-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y17','N','B10','1','1','1');
insert into Reviews values('R28','5','Y14',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),' Y3','N','B10','1','1','1');
insert into Reviews values('R29','5','Y6',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B10','1','1','1');
insert into Reviews values('R30','5','Y5',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y17, Y15','N','B10','1','1','1');
insert into Reviews values('R31','5','Y6',to_timestamp_tz('Oct-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','N','B10','1','1','1');
insert into Reviews values('R32','5','Y14',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y12','N','B10','1','1','1');
insert into Reviews values('R33','5','Y6',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B10','1','1','1');
insert into Reviews values('R34','5','Y12',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y11,Y14','N','B10','1','1','1');
insert into Reviews values('R35','5','Y14',to_timestamp_tz('Oct-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y12','N','B10','1','1','1');
insert into Reviews values('R36','5','Y12',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y11','N','B10','1','1','1');
insert into Reviews values('R37','5','Y12',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y14','N','B10','1','1','1');
insert into Reviews values('R38','5','Y13',to_timestamp_tz('Oct-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','N','B42','1','1','1');
insert into Reviews values('R39','5','Y20',to_timestamp_tz('Sep-30-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y24','N','B42','1','1','1');
insert into Reviews values('R40','5','Y16',to_timestamp_tz('Sep-29-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','N','B42','1','1','1');
insert into Reviews values('R41','5','Y3',to_timestamp_tz('Sep-28-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y21','N','B42','1','1','1');
insert into Reviews values('R42','5','Y8',to_timestamp_tz('Sep-27-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y13','N','B42','1','1','1');
insert into Reviews values('R43','5','Y8',to_timestamp_tz('Sep-26-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y15','N','B42','1','1','1');
insert into Reviews values('R44','5','Y10',to_timestamp_tz('Sep-25-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y16','N','B42','1','1','1');
insert into Reviews values('R45','5','Y7',to_timestamp_tz('Sep-24-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y22','N','B42','1','1','1');
insert into Reviews values('R46','5','Y20',to_timestamp_tz('Sep-23-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y23','N','B42','1','1','1');
insert into Reviews values('R47','5','Y17',to_timestamp_tz('Sep-22-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y19','N','B42','1','1','1');
insert into Reviews values('R48','5','Y18',to_timestamp_tz('Sep-21-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y20','N','B42','1','1','1');
insert into Reviews values('R49','5','Y13',to_timestamp_tz('Sep-20-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y18','N','B21','1','1','1');
insert into Reviews values('R50','4','Y20',to_timestamp_tz('Sep-19-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y4','N','B22','1','1','1');
insert into Reviews values('R51','3','Y16',to_timestamp_tz('Sep-18-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B23','1','1','1');
insert into Reviews values('R52','1','Y3',to_timestamp_tz('Sep-17-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B24','1','1','1');
insert into Reviews values('R53','2','Y8',to_timestamp_tz('Sep-16-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B25','1','1','1');
insert into Reviews values('R54','4','Y8',to_timestamp_tz('Sep-15-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B26','1','1','1');
insert into Reviews values('R55','5','Y10',to_timestamp_tz('Sep-14-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y3','N','B27','1','1','1');
insert into Reviews values('R56','1','Y7',to_timestamp_tz('Sep-13-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','N','B28','1','1','1');
insert into Reviews values('R57','3','Y20',to_timestamp_tz('Sep-12-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y4','N','B29','1','1','1');
insert into Reviews values('R58','5','Y17',to_timestamp_tz('Sep-11-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','N','B30','1','1','1');
insert into Reviews values('R59','2','Y18',to_timestamp_tz('Sep-10-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B31','1','1','1');
insert into Reviews values('R60','2','Y8',to_timestamp_tz('Sep-09-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B32','1','1','1');
insert into Reviews values('R61','5','Y8',to_timestamp_tz('Sep-08-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B21','1','1','1');
insert into Reviews values('R62','4','Y10',to_timestamp_tz('Sep-07-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y3','N','B22','1','1','1');
insert into Reviews values('R63','3','Y7',to_timestamp_tz('Sep-06-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y4','N','B23','1','1','1');
insert into Reviews values('R64','1','Y20',to_timestamp_tz('Sep-05-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y4','N','B24','1','1','1');
insert into Reviews values('R65','2','Y16',to_timestamp_tz('Sep-04-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B25','1','1','1');
insert into Reviews values('R66','4','Y3',to_timestamp_tz('Sep-03-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B26','1','1','1');
insert into Reviews values('R67','5','Y8',to_timestamp_tz('Sep-02-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B27','1','1','1');
insert into Reviews values('R68','1','Y3',to_timestamp_tz('Oct-02-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B37','1','1','1');
insert into Reviews values('R69','2','Y4',to_timestamp_tz('Oct-02-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','N','B38','1','1','1');
insert into Reviews values('R70','3','Y5',to_timestamp_tz('Oct-02-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y17','N','B39','1','1','1');
insert into Reviews values('R71','3','Y6',to_timestamp_tz('May-01-11 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','N','B40','1','1','1');
insert into Reviews values('R72','4','Y7',to_timestamp_tz('May-02-11 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','N','B41','1','1','1');
insert into Reviews values('R73','5','Y8',to_timestamp_tz('May-15-07 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','N','B42','1','1','1');
insert into Reviews values('R74','2','Y9',to_timestamp_tz('Jun-02-11 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','N','B39','1','1','1');
insert into Reviews values('R75','3','Y10',to_timestamp_tz('Jun-30-11 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y3','N','B40','1','1','1');
insert into Reviews values('R76','3','Y11',to_timestamp_tz('Jun-12-11 17:15:00 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y12','N','B41','1','1','1');


insert into Business_category values('BCT1','Amusement Parks');
insert into Business_category values('BCT2','Gymnastics');
insert into Business_category values('BCT3','Architects');
insert into Business_category values('BCT4','Windshield');
insert into Business_category values('BCT5','Breakfast and Brunch');
insert into Business_category values('BCT6','Career Counseling');
insert into Business_category values('BCT7','Coffee Shops');
insert into Business_category values('BCT8','Food and More');
insert into Business_category values('BCT9','Pool Cleaners');
insert into Business_category values('BCT10','Bars');
insert into Business_category values('BCT11','Burgers');

insert into business_has_category values('B1','BCT1');
insert into business_has_category values('B2','BCT2');
insert into business_has_category values('B3','BCT3');
insert into business_has_category values('B4','BCT4');
insert into business_has_category values('B5','BCT5');
insert into business_has_category values('B6','BCT7');
insert into business_has_category values('B7','BCT8');
insert into business_has_category values('B8','BCT9');
insert into business_has_category values('B9','BCT6');
insert into business_has_category values('B10','BCT10');
insert into business_has_category values('B11','BCT10');
insert into business_has_category values('B12','BCT10');
insert into business_has_category values('B13','BCT10');
insert into business_has_category values('B14','BCT10');
insert into business_has_category values('B15','BCT10');
insert into business_has_category values('B16','BCT10');
insert into business_has_category values('B17','BCT10');
insert into business_has_category values('B18','BCT10');
insert into business_has_category values('B19','BCT10');
insert into business_has_category values('B20','BCT10');
insert into business_has_category values('B21','BCT5');
insert into business_has_category values('B22','BCT5');
insert into business_has_category values('B23','BCT5');
insert into business_has_category values('B24','BCT5');
insert into business_has_category values('B25','BCT5');
insert into business_has_category values('B26','BCT5');
insert into business_has_category values('B27','BCT5');
insert into business_has_category values('B28','BCT5');
insert into business_has_category values('B29','BCT5');
insert into business_has_category values('B30','BCT5');
insert into business_has_category values('B31','BCT5');
insert into business_has_category values('B32','BCT5');
insert into business_has_category values('B33','BCT2');
insert into business_has_category values('B34','BCT2');
insert into business_has_category values('B35','BCT2');
insert into business_has_category values('B36','BCT2');
insert into business_has_category values('B37','BCT11');
insert into business_has_category values('B38','BCT11');
insert into business_has_category values('B39','BCT11');
insert into business_has_category values('B40','BCT11');
insert into business_has_category values('B41','BCT11');
insert into business_has_category values('B42','BCT11');


insert into List_of_Friends values('Y1','Y2');
insert into List_of_Friends values('Y1','Y7');
insert into List_of_Friends values('Y1','Y9');
insert into List_of_Friends values('Y2','Y1');
insert into List_of_Friends values('Y2','Y6');
insert into List_of_Friends values('Y2','Y9');
insert into List_of_Friends values('Y2','Y16');
insert into List_of_Friends values('Y2','Y18');
insert into List_of_Friends values('Y3','Y6');
insert into List_of_Friends values('Y3','Y11');
insert into List_of_Friends values('Y3','Y5');
insert into List_of_Friends values('Y3','Y21');
insert into List_of_Friends values('Y4','Y7');
insert into List_of_Friends values('Y5','Y17');
insert into List_of_Friends values('Y5','Y15');
insert into List_of_Friends values('Y6','Y2');
insert into List_of_Friends values('Y6','Y15');
insert into List_of_Friends values('Y7','Y1');
insert into List_of_Friends values('Y7','Y4');
insert into List_of_Friends values('Y7','Y17');
insert into List_of_Friends values('Y8','Y13');
insert into List_of_Friends values('Y8','Y15');
insert into List_of_Friends values('Y8','Y6');
insert into List_of_Friends values('Y9','Y1');
insert into List_of_Friends values('Y9','Y2');
insert into List_of_Friends values('Y10','Y16');
insert into List_of_Friends values('Y10','Y3');
insert into List_of_Friends values('Y11','Y12');
insert into List_of_Friends values('Y12','Y11');
insert into List_of_Friends values('Y12','Y14');
insert into List_of_Friends values('Y13','Y8');
insert into List_of_Friends values('Y13','Y17');
insert into List_of_Friends values('Y14','Y12');
insert into List_of_Friends values('Y15','Y6');
insert into List_of_Friends values('Y15','Y8');
insert into List_of_Friends values('Y16','Y2');
insert into List_of_Friends values('Y16','Y10');
insert into List_of_Friends values('Y17','Y7');
insert into List_of_Friends values('Y17','Y19');
insert into List_of_Friends values('Y18','Y2');
insert into List_of_Friends values('Y18','Y20');
insert into List_of_Friends values('Y19','Y3');
insert into List_of_Friends values('Y19','Y1');
insert into List_of_Friends values('Y20','Y4');
insert into List_of_Friends values('Y20','Y9');
insert into List_of_Friends values('Y20','Y18');
insert into List_of_Friends values('Y21','Y1');
insert into List_of_Friends values('Y21','Y6');
insert into List_of_Friends values('Y22','Y5');
insert into List_of_Friends values('Y22','Y3');
insert into List_of_Friends values('Y23','Y10');
insert into List_of_Friends values('Y24','Y10');
insert into List_of_Friends values('Y25','Y10');

/*
CREATE TYPE list_type AS OBJECT( 
	yelp_id  VARCHAR2(10)  , 
	friend_id VARCHAR2(10)
) 
NOT FINAL; 
/ 


CREATE TYPE vote_type UNDER list_type( 	 
	funny VARCHAR2(1) ,
    cool VARCHAR2(1) ,
    useful VARCHAR2(1) ) 
NOT FINAL; 
/ 

CREATE TYPE businessreview_type UNDER list_type( 	 
	visible VARCHAR2(20) 
    ) 
NOT FINAL; 
/ 

CREATE TABLE list_of_user OF list_type;

INSERT INTO list_of_user VALUES (
list_type('Y13','Y8'));
INSERT INTO list_of_user VALUES (
list_type('Y2','Y1'));
INSERT INTO list_of_user VALUES (
list_type('Y3','Y6'));
INSERT INTO list_of_user VALUES (
list_type('Y4','Y7'));



INSERT INTO list_of_user VALUES (
vote_type('Y6','Y6','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y5','Y9','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y1','Y3','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y8','Y5','1','0','1'));




CREATE TYPE businesscat_type AS OBJECT( 
	bc_id  VARCHAR2(15) , 
	bcname_id VARCHAR2(50) 
) 
NOT FINAL; 
/ 

CREATE TYPE restaurant_type UNDER businesscat_type( 
    name VARCHAR2(20)
	) 
NOT FINAL; 
/
CREATE TYPE music_type UNDER businesscat_type( 	 name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TYPE departmental_type UNDER businesscat_type( 
name VARCHAR2(20)
	) 
NOT FINAL; 
/ 



CREATE TABLE business_category_table OF businesscat_type;

INSERT INTO business_category_table VALUES (
restaurant_type('BCT1','Olive Garden','Restaurant'));
INSERT INTO business_category_table VALUES (
restaurant_type('BCT2','PF Chang','Restaurant'));
INSERT INTO business_category_table VALUES (
music_type('BCT3','Spotify','Music'));
INSERT INTO business_category_table VALUES (
departmental_type('BCT4','Bed Bath and Beyond','Departmental Store'));




CREATE TYPE review_type AS OBJECT( 
	       Review_Id varchar(50) ,
			Rating varchar(5) ,
			Author varchar(5) ,
			Publish_Date varchar(30)
) 
NOT FINAL; 
/ 

CREATE TYPE recommended_type UNDER review_type( 	 name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TYPE notrecommended_type UNDER review_type( 
name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TABLE review_table OF review_type;

INSERT INTO review_table VALUES (
recommended_type('R1','2','Y1','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R2','5','Y2','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R3','3','Y3','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R4','4','Y4','March 25,1996','R'));
*/
