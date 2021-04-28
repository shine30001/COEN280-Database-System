SELECT NR.Business_ID AS BID, B.Business_Name AS Name, B.Review_Count
FROM (
	SELECT Rs.Business_ID, Rs.Author, MAX(Rs.Rating) AS rate
	FROM Reviews Rs
	GROUP BY Rs.Author, Rs.Business_ID
	HAVING COUNT(*) = 1
	) NR, Business B
WHERE NR.Business_ID = B.Business_ID
AND NR.rate = 5
GROUP BY NR.Business_ID, B.Business_Name, B.Review_Count
HAVING COUNT(*) > 50
ORDER BY B.Review_Count DESC, Name, BID
;