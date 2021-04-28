SELECT Yelp_ID, User_Name, COUNT(*) AS Number_States
FROM(
	SELECT Yelp_ID, CONCAT(CONCAT(First_Name , ' '), Last_Name) AS User_Name, B.States
	FROM Yelp_User Y, Reviews Rs, Business B
	WHERE Y.Yelp_ID = Rs.Author 
	AND Rs.Business_ID = B.Business_ID
	GROUP BY Yelp_ID, CONCAT(CONCAT(First_Name , ' '), Last_Name), B.States
)
GROUP BY Yelp_ID, User_Name
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC, Yelp_ID 
;