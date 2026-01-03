USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Currencies;
GO

;WITH Dedup AS (
    SELECT
        UPPER(LTRIM(RTRIM(c.CurrencyID))) AS CurrencyIDNorm,
        LTRIM(RTRIM(c.CurrencyName))      AS CurrencyNameNorm,
        LTRIM(RTRIM(c.CurrencySymbol))    AS CurrencySymbolNorm,
        c.CreateDate,
        c.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY UPPER(LTRIM(RTRIM(c.CurrencyID)))
            ORDER BY
                ISNULL(c.LastUpdateDate,'19000101') DESC,
                ISNULL(c.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Currencies c
)

INSERT INTO dqp.Currencies
(
    CurrencyID, CurrencyName, CurrencySymbol,
    CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    CurrencyIDNorm,
    CurrencyNameNorm,
    CurrencySymbolNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN CurrencyIDNorm IS NULL OR LEN(CurrencyIDNorm) = 0 THEN 'CurrencyID em falta'
        WHEN CurrencyNameNorm IS NULL OR LEN(CurrencyNameNorm) = 0 THEN 'CurrencyName em falta'
        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
