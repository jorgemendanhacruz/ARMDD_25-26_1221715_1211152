IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Categories')
	CREATE TABLE [dbo].[Categories](
		[CategoryID] [int] NOT NULL,
		[Name] [nvarchar](255) NULL,
		[Gender] [nchar](1) NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Categories

