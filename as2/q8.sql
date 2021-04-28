SELECT B.Business_ID AS BID, B.Business_Name AS Name, Review_Count
FROM Business B, Reviews Rs
WHERE B.States = 'CA' AND Review_Count > 10 AND B.Business_ID = Rs.Business_ID
GROUP BY B.Business_ID, B.Business_Name, Review_Count
HAVING MIN(Rating) = 5
ORDER BY B.Review_Count DESC, B.Business_ID
;