SELECT Business_ID AS BID, Business_Name AS Name, Review_Count, States AS State
FROM (
	SELECT B.Business_ID, B.Business_Name, B.States, B.Review_Count, rank() OVER (PARTITION BY B.States ORDER BY B.Review_Count DESC) R
	FROM Business B, Business_category BC	
	WHERE BC.Business_Type = 'Bars' 
	AND B.Business_Cat_ID = BC.Business_Cat_ID
	) 
WHERE R = 1
ORDER BY State
;

