IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimSite')
BEGIN
    CREATE TABLE [dbo].[DimSite](
        [SiteKey]       [int]          NOT NULL,
        [SiteID]        [int]          NOT NULL,
        [SiteName]      [varchar](50)  NULL,
        [SiteURL]       [varchar](50)  NULL,
        [SiteInitials]  [char](3)      NULL,
        [IsSite]        [tinyint]      NULL,
        [EffectiveDate] [date]         NULL,
        [ExpiredDate]   [date]         NULL,
        [IsCurrent]     [tinyint]      NULL,
        CONSTRAINT [PK_DimSite] PRIMARY KEY CLUSTERED ([SiteKey] ASC)
    );
END
