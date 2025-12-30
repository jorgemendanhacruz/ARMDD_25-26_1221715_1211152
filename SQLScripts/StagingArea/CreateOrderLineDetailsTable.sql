IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'OrdersLinesDetails')
	CREATE TABLE [dbo].[OrdersLinesDetails](
		[OrderLineID] [int] NOT NULL,
		[Currency] [nvarchar](3) NULL,
		[Discount] [money] NULL,
		[PromotionDiscount] [money] NULL,
		[CreateDate] [date] NULL,
		[LastUpdateDate] [date] NULL,
	 )
ELSE
	TRUNCATE TABLE OrdersLinesDetails


