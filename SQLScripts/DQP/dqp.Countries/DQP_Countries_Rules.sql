USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Countries;
GO

;WITH Dedup AS (
    SELECT
        c.CountryID,
        LTRIM(RTRIM(c.[Name])) AS NameNorm,

        CASE
            WHEN c.Code IS NULL THEN NULL
            ELSE UPPER(LTRIM(RTRIM(c.Code)))
        END AS CodeNorm,

        c.VAT,

        CASE
            WHEN c.EuroZone IN (0,1) THEN c.EuroZone
            ELSE NULL
        END AS EuroZoneNorm,

        c.CreateDate,
        c.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY c.CountryID
            ORDER BY
                ISNULL(c.LastUpdateDate,'19000101') DESC,
                ISNULL(c.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Countries c
)

INSERT INTO dqp.Countries
(
    CountryID, [Name], Code, VAT, EuroZone, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    CountryID,
    NameNorm,
    CodeNorm,
    VAT,
    EuroZoneNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN CountryID IS NULL THEN 'CountryID em falta'
        WHEN NameNorm IS NULL OR LEN(NameNorm) = 0 THEN 'Name em falta'
        WHEN CodeNorm IS NULL OR LEN(CodeNorm) = 0 THEN 'Code em falta'
        WHEN EuroZoneNorm IS NULL THEN 'EuroZone inválido (0/1)'
        WHEN VAT IS NOT NULL AND VAT < 0 THEN 'VAT negativo'
        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
