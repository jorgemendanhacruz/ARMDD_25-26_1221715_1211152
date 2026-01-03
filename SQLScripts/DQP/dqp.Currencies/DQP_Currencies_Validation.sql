USE PlusOrders_StagingArea;
GO

SELECT COUNT(*) AS Total FROM dqp.Currencies;
SELECT COUNT(*) AS Accepted FROM dqp.Currencies WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Currencies WHERE DQP_Error IS NOT NULL;

-- dedup check
SELECT CurrencyID, COUNT(*) AS Cnt
FROM dqp.Currencies
GROUP BY CurrencyID
HAVING COUNT(*) > 1;

-- motivos
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Currencies
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Currencies
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, CurrencyID;

-- fonte limpa para o DM
SELECT *
FROM dqp.Currencies
WHERE DQP_Error IS NULL;
GO
