USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Products;
GO

;WITH Dedup AS (
    SELECT
        p.ProductID,

        -- Normalização básica
        LTRIM(RTRIM(p.[Description])) AS DescriptionNorm,
        p.CategoryID,

        CASE
            WHEN p.AvailablePortal IN (0,1) THEN CONVERT(BIT, p.AvailablePortal)
            ELSE NULL
        END AS AvailablePortalNorm,

        p.BoxID,

        CASE
            WHEN p.Active IN (0,1) THEN CONVERT(BIT, p.Active)
            ELSE NULL
        END AS ActiveNorm,

        p.CreateDate,
        p.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY p.ProductID
            ORDER BY
                ISNULL(p.LastUpdateDate,'19000101') DESC,
                ISNULL(p.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Products p
)

INSERT INTO dqp.Products
(
    ProductID, [Description], CategoryID, AvailablePortal,
    BoxID, Active, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    ProductID,
    DescriptionNorm,
    CategoryID,
    AvailablePortalNorm,
    BoxID,
    ActiveNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN ProductID IS NULL THEN 'ProductID em falta'
        WHEN DescriptionNorm IS NULL OR LEN(DescriptionNorm) = 0 THEN 'Description em falta'
        WHEN CategoryID IS NULL THEN 'CategoryID em falta'
        WHEN ActiveNorm IS NULL THEN 'Active inválido (0/1)'
        WHEN AvailablePortalNorm IS NULL THEN 'AvailablePortal inválido (0/1)'
        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
