USE PlusOrders_StagingArea;
GO

SELECT COUNT(*) AS Total FROM dqp.Sites;
SELECT COUNT(*) AS Accepted FROM dqp.Sites WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Sites WHERE DQP_Error IS NOT NULL;

-- dedup check
SELECT SiteID, COUNT(*) AS Cnt
FROM dqp.Sites
GROUP BY SiteID
HAVING COUNT(*) > 1;

-- motivos
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Sites
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Sites
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, SiteID;

-- fonte limpa para DM
SELECT *
FROM dqp.Sites
WHERE DQP_Error IS NULL;
GO
