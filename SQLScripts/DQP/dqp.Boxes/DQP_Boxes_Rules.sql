USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Boxes;
GO

;WITH Dedup AS (
    SELECT
        b.BoxID,
        LTRIM(RTRIM(b.BoxName)) AS BoxNameNorm,
        b.BoxHeight,
        b.BoxLength,
        b.BoxWidth,
        b.BoxVolWeight,
        LTRIM(RTRIM(b.Location)) AS LocationNorm,
        b.CreateDate,
        b.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY b.BoxID
            ORDER BY
                ISNULL(b.LastUpdateDate,'19000101') DESC,
                ISNULL(b.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Boxes b
)

INSERT INTO dqp.Boxes
(
    BoxID, BoxName, BoxHeight, BoxLength, BoxWidth, BoxVolWeight,
    Location, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    BoxID,
    BoxNameNorm,
    BoxHeight,
    BoxLength,
    BoxWidth,
    BoxVolWeight,
    LocationNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN BoxID IS NULL THEN 'BoxID em falta'
        WHEN BoxNameNorm IS NULL OR LEN(BoxNameNorm) = 0 THEN 'BoxName em falta'

        WHEN BoxHeight IS NOT NULL AND BoxHeight < 0 THEN 'BoxHeight negativo'
        WHEN BoxLength IS NOT NULL AND BoxLength < 0 THEN 'BoxLength negativo'
        WHEN BoxWidth  IS NOT NULL AND BoxWidth  < 0 THEN 'BoxWidth negativo'
        WHEN BoxVolWeight IS NOT NULL AND BoxVolWeight < 0 THEN 'BoxVolWeight negativo'

        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
