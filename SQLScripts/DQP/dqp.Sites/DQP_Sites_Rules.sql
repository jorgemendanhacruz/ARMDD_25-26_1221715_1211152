USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Sites;
GO

;WITH Dedup AS (
    SELECT
        s.SiteID,
        LTRIM(RTRIM(s.[Name])) AS NameNorm,

        CASE
            WHEN s.IsSite IN (0,1) THEN s.IsSite
            ELSE NULL
        END AS IsSiteNorm,

        LTRIM(RTRIM(s.SiteURL))  AS SiteURLNorm,
        LTRIM(RTRIM(s.SiteName)) AS SiteNameNorm,

        CASE
            WHEN s.Initials IS NULL THEN NULL
            ELSE UPPER(LTRIM(RTRIM(s.Initials)))
        END AS InitialsNorm,

        CASE
            WHEN s.Currency IS NULL THEN NULL
            ELSE UPPER(LTRIM(RTRIM(s.Currency)))
        END AS CurrencyNorm,

        s.CreateDate,
        s.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY s.SiteID
            ORDER BY
                ISNULL(s.LastUpdateDate,'19000101') DESC,
                ISNULL(s.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Sites s
)

INSERT INTO dqp.Sites
(
    SiteID, [Name], IsSite, SiteURL, SiteName,
    Initials, Currency, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    SiteID,
    NameNorm,
    IsSiteNorm,
    SiteURLNorm,
    SiteNameNorm,
    InitialsNorm,
    CurrencyNorm,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN SiteID IS NULL THEN 'SiteID em falta'
        WHEN NameNorm IS NULL OR LEN(NameNorm) = 0 THEN 'Name em falta'
        WHEN IsSiteNorm IS NULL THEN 'IsSite inválido (0/1)'
        WHEN CurrencyNorm IS NULL OR LEN(CurrencyNorm) = 0 THEN 'Currency em falta'
        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
