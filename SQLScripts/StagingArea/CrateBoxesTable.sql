IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Boxes')	
	CREATE TABLE [dbo].[Boxes](
		[BoxID] [int] NOT NULL,
		[BoxName] [nvarchar](255) NULL,
		[BoxHeight] [float] NULL,
		[BoxLength] [float] NULL,
		[BoxWidth] [float] NULL,
		[BoxVolWeight] [float] NULL,
		[Location] [nvarchar](255) NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Boxes

