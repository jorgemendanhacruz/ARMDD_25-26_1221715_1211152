IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Countries')
	CREATE TABLE [dbo].[Countries](
		[CountryID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [nvarchar](255) NULL,
		[Code] [nvarchar](2) NULL,
		[VAT] [float] NULL,
		[EuroZone] [bit] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Countries


