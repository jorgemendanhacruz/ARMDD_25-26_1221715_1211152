IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactOrders')
BEGIN
    CREATE TABLE [dbo].[FactOrders](
        [DateKey]          [int] NOT NULL,
        [ProductKey]       [int] NOT NULL,
        [CustomerKey]      [int] NOT NULL,
        [SiteKey]          [int] NOT NULL,
        [SizeKey]          [int] NOT NULL,
        [ShippingKey]      [int] NOT NULL,
        [OrderID]          [int] NOT NULL,
        [OrderLineID]          [int] NOT NULL,
        [LocalCurrencyKey] [int] NOT NULL,
        [QuantityOrdered]  [int] NOT NULL,
        [UnitPriceLocal]   [decimal](12,4) NOT NULL,
        [DiscountLocal]    [decimal](12,4) NOT NULL,
        [PromotionDiscountLocal]    [decimal](12,4) NOT NULL,
        [ShippingCostLocal]    [decimal](12,4) NOT NULL,
        [TotalAmountLocal] [decimal](12,4) NOT NULL,
        [UnitPriceStandard]   [decimal](12,4) NOT NULL,
        [DiscountStandard]    [decimal](12,4) NOT NULL,
        [PromotionDiscountStandard]    [decimal](12,4) NOT NULL,
        [ShippingCostStandard]    [decimal](12,4) NOT NULL,
        [TotalAmountStandard] [decimal](12,4) NOT NULL,
        CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED
        (
            [DateKey] ASC,
            [SiteKey] ASC,
            [CustomerKey] ASC,
            [ProductKey] ASC,
            [SizeKey] ASC
        )
    );
END
