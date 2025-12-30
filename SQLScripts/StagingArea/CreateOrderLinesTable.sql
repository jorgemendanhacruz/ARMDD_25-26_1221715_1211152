IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'OrdersLines')	
	CREATE TABLE [dbo].[OrdersLines](
		[OrderLineID] [int] NOT NULL,
		[OrderID] [int] NULL,
		[ProductID] [int] NULL,
		[Quantity] [int] NULL,
		[SizeID] [int] NULL,
		[LineTotal] [money] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE OrdersLines 