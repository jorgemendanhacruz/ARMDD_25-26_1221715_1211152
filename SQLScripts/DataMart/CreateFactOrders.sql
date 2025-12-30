IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactOrders')
BEGIN
    CREATE TABLE [dbo].[FactOrders](
        [DateKey]          [int] NOT NULL,
        [ShippingKey]      [int] NOT NULL,
        [SiteKey]          [int] NOT NULL,
        [CustomerKey]      [int] NOT NULL,
        [ProductKey]       [int] NOT NULL,
        [OrderID]          [int] NULL,
        [SizeKey]          [int] NOT NULL,
        [BoxKey]           [int] NOT NULL,
        [LocalCurrencyKey] [int] NOT NULL,
        [QuantityOrdered]  [int] NULL,
        [UnitPriceLocal]   [int] NULL,
        [DiscountLocal]    [int] NULL,
        [TotalAmountLocal] [int] NULL,
        CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED
        (
            [DateKey] ASC,
            [ShippingKey] ASC,
            [SiteKey] ASC,
            [CustomerKey] ASC,
            [ProductKey] ASC,
            [SizeKey] ASC,
            [BoxKey] ASC,
            [LocalCurrencyKey] ASC
        )
    );
END
