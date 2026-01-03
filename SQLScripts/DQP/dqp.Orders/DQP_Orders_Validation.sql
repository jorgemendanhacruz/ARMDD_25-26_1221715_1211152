USE PlusOrders_StagingArea;
GO

-- Totais
SELECT COUNT(*) AS Total FROM dqp.Orders;
SELECT COUNT(*) AS Accepted FROM dqp.Orders WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Orders WHERE DQP_Error IS NOT NULL;

-- Confirmar deduplicação
SELECT OrderID, COUNT(*) AS Cnt
FROM dqp.Orders
GROUP BY OrderID
HAVING COUNT(*) > 1;

-- Motivos de erro
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Orders
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- Exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Orders
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, OrderID;

-- Fonte para o DataMart
SELECT *
FROM dqp.Orders
WHERE DQP_Error IS NULL;
GO
