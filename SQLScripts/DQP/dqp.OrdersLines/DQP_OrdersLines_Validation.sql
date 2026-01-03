USE PlusOrders_StagingArea;
GO

-- Totais
SELECT COUNT(*) AS Total FROM dqp.OrdersLines;
SELECT COUNT(*) AS Accepted FROM dqp.OrdersLines WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.OrdersLines WHERE DQP_Error IS NOT NULL;

-- Confirmar deduplicação
SELECT OrderLineID, COUNT(*) AS Cnt
FROM dqp.OrdersLines
GROUP BY OrderLineID
HAVING COUNT(*) > 1;

-- Motivos de erro
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.OrdersLines
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- Exemplos rejeitados
SELECT TOP (50) *
FROM dqp.OrdersLines
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, OrderLineID;

-- Fonte para FactOrders
SELECT *
FROM dqp.OrdersLines
WHERE DQP_Error IS NULL;
GO
