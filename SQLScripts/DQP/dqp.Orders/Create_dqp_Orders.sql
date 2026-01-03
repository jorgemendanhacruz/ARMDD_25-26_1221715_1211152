USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Orders','U') IS NOT NULL
    DROP TABLE dqp.Orders;
GO

CREATE TABLE dqp.Orders (
    OrderID              INT           NULL,
    OrderDate            DATE          NULL,
    SiteID               INT           NULL,
    CustomerID           INT           NULL,
    TotalQuantity        INT           NULL,
    ShippingCost         MONEY         NULL,
    TotalWithoutShipping MONEY         NULL,
    TotalWithShipping    MONEY         NULL,
    Address              NVARCHAR(255) NULL,
    CountryID            INT           NULL,
    City                 NVARCHAR(100) NULL,
    State                NVARCHAR(100) NULL,
    Zip                  FLOAT         NULL,
    CurrencyID           NVARCHAR(10)  NULL,
    CreateDate           DATE          NULL,
    LastUpdateDate       DATE          NULL,
    DQP_Error            NVARCHAR(200) NULL
);
GO

CREATE INDEX IX_dqp_Orders_OrderID ON dqp.Orders(OrderID);
GO
