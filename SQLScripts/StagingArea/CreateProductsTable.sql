IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Products')	
	CREATE TABLE [dbo].[Products](
		[ProductID] [int] NOT NULL,
		[Description] [nvarchar](255) NULL,
		[CategoryID] [int] NULL,
		[AvailablePortal] [bit] NULL,
		[BoxID] [int] NULL,
		[Active] [bit] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Products



