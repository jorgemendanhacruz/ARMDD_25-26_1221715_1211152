USE PlusOrders_StagingArea;
GO

SELECT COUNT(*) AS Total FROM dqp.Categories;
SELECT COUNT(*) AS Accepted FROM dqp.Categories WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Categories WHERE DQP_Error IS NOT NULL;

-- dedup check
SELECT CategoryID, COUNT(*) AS Cnt
FROM dqp.Categories
GROUP BY CategoryID
HAVING COUNT(*) > 1;

-- motivos
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Categories
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Categories
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, CategoryID;

-- fonte para o DM
SELECT *
FROM dqp.Categories
WHERE DQP_Error IS NULL;
GO
