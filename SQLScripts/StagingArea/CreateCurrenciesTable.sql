IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Currencies')	
	CREATE TABLE [dbo].[Currencies](
		[CurrencyID] [nvarchar](3) NOT NULL,
		[CurrencyName] [nvarchar](20) NULL,
		[CurrencySymbol] [nvarchar](3) NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Currencies


