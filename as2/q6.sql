SELECT *
FROM (
	SELECT NB.Business_ID AS BID, NB.Business_Name AS Name, MAX(Rs.Rating) AS Scores, Review_Count 
	FROM(
		SELECT B.Business_ID, B.Business_Name, B.Review_Count
		FROM Business B, Business_category BC, Reviews Rs
		WHERE B.Business_Cat_ID = BC.Business_Cat_ID
		AND BC.Business_Type = 'Burgers' 
		AND B.Address Like '%San Jose%'
		AND B.States = 'CA'
	) NB, Reviews Rs
	WHERE NB.Business_ID = Rs.Business_ID
	GROUP BY NB.Business_ID, NB.Business_Name, Review_Count
	ORDER BY Scores DESC, Review_Count DESC, BID
)
WHERE ROWNUM <= 5
;