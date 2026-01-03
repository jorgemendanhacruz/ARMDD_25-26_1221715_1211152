USE PlusOrders_StagingArea;
GO

-- Totais
SELECT COUNT(*) AS Total FROM dqp.Customers;
SELECT COUNT(*) AS Accepted FROM dqp.Customers WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Customers WHERE DQP_Error IS NOT NULL;

-- Motivos mais comuns
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Customers
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- Ver exemplos de problemas de DateOfBirth
SELECT TOP (50) CustomerID, DateOfBirth, DQP_Error
FROM dqp.Customers
WHERE DQP_Error LIKE 'DateOfBirth%'
ORDER BY DateOfBirth;

-- Fonte para o DataMart (só os bons)
SELECT *
FROM dqp.Customers
WHERE DQP_Error IS NULL;
GO




