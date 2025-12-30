IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Customers')	
	CREATE TABLE [dbo].[Customers](
		[CustomerID] [int] NOT NULL,
		[CountryID] [int] NULL,
		[DateOfBirth] [nvarchar](255) NULL,
		[Gender] [nchar](1) NULL,
		[GeographicRegion] [int] NULL,
		[Language] [nvarchar](2) NULL,
		[VipCustomer] [bit] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Customers


