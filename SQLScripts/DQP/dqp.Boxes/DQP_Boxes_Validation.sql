USE PlusOrders_StagingArea;
GO

SELECT COUNT(*) AS Total FROM dqp.Boxes;
SELECT COUNT(*) AS Accepted FROM dqp.Boxes WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Boxes WHERE DQP_Error IS NOT NULL;

-- dedup check
SELECT BoxID, COUNT(*) AS Cnt
FROM dqp.Boxes
GROUP BY BoxID
HAVING COUNT(*) > 1;

-- motivos
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Boxes
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Boxes
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, BoxID;

-- fonte limpa para o DM
SELECT *
FROM dqp.Boxes
WHERE DQP_Error IS NULL;
GO
