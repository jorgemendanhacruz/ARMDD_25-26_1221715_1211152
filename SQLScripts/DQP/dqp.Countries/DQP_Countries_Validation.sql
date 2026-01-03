USE PlusOrders_StagingArea;
GO

SELECT COUNT(*) AS Total FROM dqp.Countries;
SELECT COUNT(*) AS Accepted FROM dqp.Countries WHERE DQP_Error IS NULL;
SELECT COUNT(*) AS Rejected FROM dqp.Countries WHERE DQP_Error IS NOT NULL;

-- dedup check
SELECT CountryID, COUNT(*) AS Cnt
FROM dqp.Countries
GROUP BY CountryID
HAVING COUNT(*) > 1;

-- motivos
SELECT DQP_Error, COUNT(*) AS Cnt
FROM dqp.Countries
WHERE DQP_Error IS NOT NULL
GROUP BY DQP_Error
ORDER BY Cnt DESC;

-- exemplos rejeitados
SELECT TOP (50) *
FROM dqp.Countries
WHERE DQP_Error IS NOT NULL
ORDER BY DQP_Error, CountryID;

-- fonte limpa para o DM
SELECT *
FROM dqp.Countries
WHERE DQP_Error IS NULL;
GO
