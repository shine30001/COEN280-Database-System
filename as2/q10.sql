SELECT *
FROM(
	SELECT B.Business_ID AS BID, B.Business_Name AS Name, (E.avg_r-S.avg_r) AS Jump_Magnitude
	FROM (
		SELECT Business_ID, AVG(Rating) AS avg_r
		FROM Reviews
		WHERE Publish_Date >= TO_TIMESTAMP_TZ('2011/05/01 00:00:00 PDT','YYYY/MM/DD HH24:MI:SS TZD')
		AND Publish_Date < TO_TIMESTAMP_TZ('2011/06/01 00:00:00 PDT','YYYY/MM/DD HH24:MI:SS TZD')
		GROUP BY Business_ID
	) S,
	(
		SELECT Business_ID, AVG(Rating) AS avg_r
		FROM Reviews
		WHERE Publish_Date >= TO_TIMESTAMP_TZ('2011/06/01 00:00:00 PDT','YYYY/MM/DD HH24:MI:SS TZD')
		AND Publish_Date < TO_TIMESTAMP_TZ('2011/07/01 00:00:00 PDT','YYYY/MM/DD HH24:MI:SS TZD')
		GROUP BY Business_ID
	) E, Business B
	WHERE S.Business_ID = E.Business_ID
	AND S.Business_ID = B.Business_ID
	AND (E.avg_r-S.avg_r) > 1
	ORDER BY Jump_Magnitude DESC, Name, BID
)
WHERE ROWNUM <= 10
;
	