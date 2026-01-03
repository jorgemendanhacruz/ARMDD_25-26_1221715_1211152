USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Categories;
GO

;WITH Dedup AS (
    SELECT
        c.CategoryID,
        LTRIM(RTRIM(c.[Name])) AS NameNorm,

        CASE
            WHEN c.Gender IS NULL THEN NULL
            WHEN UPPER(LTRIM(RTRIM(CONVERT(NVARCHAR(10), c.Gender)))) IN ('M','MALE') THEN 'M'
            WHEN UPPER(LTRIM(RTRIM(CONVERT(NVARCHAR(10), c.Gender)))) IN ('F','FEMALE') THEN 'F'
            ELSE NULL
        END AS GenderNorm,

        c.CreateDate,
        c.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY c.CategoryID
            ORDER BY
                ISNULL(c.LastUpdateDate,'19000101') DESC,
                ISNULL(c.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Categories c
)

INSERT INTO dqp.Categories
(
    CategoryID, [Name], Gender, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    CategoryID,
    NameNorm,
    GenderNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN CategoryID IS NULL THEN 'CategoryID em falta'
        WHEN NameNorm IS NULL OR LEN(NameNorm) = 0 THEN 'Name em falta'
        WHEN GenderNorm IS NULL THEN 'Gender inválido'
        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
