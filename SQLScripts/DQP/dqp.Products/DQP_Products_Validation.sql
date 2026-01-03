USE PlusOrders_StagingArea;
GO

-- Totais
SELECT COUNT(*) AS Total FROM dqp.Products;
SELECT COUNT(*) AS Accepted FROM dqp.Products WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Products WHERE DQP_Error IS NOT NULL;

-- Confirmar unicidade
SELECT ProductID, COUNT(*) AS Cnt
FROM dqp.Products
GROUP BY ProductID
HAVING COUNT(*) > 1;

-- Motivos de erro
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Products
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- Fonte para o DataMart (só produtos bons)
SELECT *
FROM dqp.Products
WHERE DQP_Error IS NULL;
GO
