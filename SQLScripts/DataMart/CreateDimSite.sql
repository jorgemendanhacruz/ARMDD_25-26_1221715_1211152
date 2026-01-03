IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimSite')
BEGIN
    CREATE TABLE [dbo].[DimSite](
        [SiteKey]       [int] IDENTITY(1,1)    NOT NULL,
        [SiteID]        [int]          NOT NULL,
        [SiteName]      [nvarchar](50)  NULL,
        [SiteURL]       [nvarchar](50)  NULL,
        [SiteInitials]  [nvarchar](10)     NULL,
        [IsSite]        [nvarchar](10)     NULL,
        [EffectiveDate] [date]         NULL,
        [ExpiredDate]   [date]         NULL,
        [IsCurrent]     [tinyint]      NULL,
        CONSTRAINT [PK_DimSite] PRIMARY KEY CLUSTERED ([SiteKey] ASC)
    );
END
