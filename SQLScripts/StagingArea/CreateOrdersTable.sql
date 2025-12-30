IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'Orders')	
	CREATE TABLE [dbo].[Orders](
		[OrderID] [int] NOT NULL,
		[OrderDate] [date] NULL,
		[SiteID] [int] NULL,
		[CustomerID] [int] NULL,
		[TotalQuantity] [int] NULL,
		[ShippingCost] [money] NULL,
		[TotalWithoutShipping] [money] NULL,
		[TotalWithShipping] [money] NULL,
		[Address] [nvarchar](255) NULL,
		[CountryID] [int] NULL,
		[City] [nvarchar](255) NULL,
		[State] [nvarchar](255) NULL,
		[Zip] [float] NULL,
		[CurrencyID] [nvarchar](3) NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE Orders


