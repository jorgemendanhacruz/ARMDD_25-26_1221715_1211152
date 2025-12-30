IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Sites')	
	CREATE TABLE [dbo].[Sites](
		[SiteID] [int] NOT NULL,
		[Name] [nvarchar](255) NULL,
		[IsSite] [bit] NULL,
		[SiteURL] [nvarchar](255) NULL,
		[SiteName] [nvarchar](255) NULL,
		[Initials] [nvarchar](3) NULL,
		[Currency] [nvarchar](3) NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	)
ELSE 
	TRUNCATE TABLE Sites


