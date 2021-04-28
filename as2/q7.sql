SELECT Yelp_ID AS BID, User_Name, Sum_of_Useful	
FROM(
	SELECT Y.Yelp_ID, CONCAT(CONCAT(First_Name , ' '), Last_Name) AS User_Name, SUM(Rs.Useful) AS Sum_of_Useful
	FROM Yelp_User Y, Reviews Rs
	WHERE Y.Yelp_ID = Rs.Author
	GROUP BY Y.Yelp_ID, CONCAT(CONCAT(First_Name , ' '), Last_Name)
)
WHERE Sum_of_Useful = (
	SELECT MAX(Sum_of_Useful_)
	FROM(
		SELECT SUM(Rs.Useful) AS Sum_of_Useful_
		FROM Reviews Rs
		GROUP BY Rs.Author
	)
)
ORDER BY Sum_of_Useful, BID
;
	
	