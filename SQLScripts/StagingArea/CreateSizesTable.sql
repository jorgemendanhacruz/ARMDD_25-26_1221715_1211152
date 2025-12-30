IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Sizes')	
	CREATE TABLE [dbo].[Sizes](
		[SizeID] [int] NOT NULL,
		[Name] [nvarchar](255) NULL,
		[FriendlyName] [nvarchar](255) NULL,
		[RetailInvisible] [bit] NULL,
		[MinimunSizeAvailable] [int] NULL,
		[MaximunSizeAvailable] [int] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Sizes


