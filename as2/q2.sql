SELECT B.Business_ID AS BID, B.Business_Name AS Name
FROM Business B, Business_category BC
WHERE B.Business_Cat_ID = BC.Business_Cat_ID
AND B.Business_Name LIKE '%Coffee%' 
AND BC.Business_Type NOT LIKE '%Coffee%'
ORDER BY BID
;