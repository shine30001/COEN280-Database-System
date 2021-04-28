SELECT *
FROM (
	SELECT NB.Business_ID AS BID, NB.Business_Name AS Name, Review_Count, AVG(Rs.Rating) As Scores
	FROM(
		SELECT B.Business_ID, B.Business_Name, B.Review_Count
		FROM Business B, Business_category BC
		WHERE B.Business_Cat_ID = BC.Business_Cat_ID
		AND BC.Business_Type = 'Breakfast and Brunch' 
		AND B.Address Like '%San Jose%'
		AND B.States = 'CA'
		) NB, Reviews Rs 
	WHERE NB.Business_ID = Rs.Business_ID
	GROUP BY NB.Business_ID, NB.Business_Name, Review_Count
	ORDER BY Scores DESC, Review_Count DESC, BID
	)
WHERE ROWNUM <= 10
;
/*



*/