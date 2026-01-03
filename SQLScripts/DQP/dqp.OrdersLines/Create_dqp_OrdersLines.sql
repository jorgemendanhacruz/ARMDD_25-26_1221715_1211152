USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.OrdersLines','U') IS NOT NULL
    DROP TABLE dqp.OrdersLines;
GO

CREATE TABLE dqp.OrdersLines (
    OrderLineID        INT           NULL,
    OrderID            INT           NULL,
    ProductID          INT           NULL,
    Quantity           INT           NULL,
    SizeID             INT           NULL,
    LineTotal          MONEY         NULL,
    Currency           NVARCHAR(10)  NULL,
    Discount           MONEY         NULL,
    PromotionDiscount  MONEY         NULL,
    CreateDate         DATE          NULL,
    LastUpdateDate     DATE          NULL,
    DQP_Error          NVARCHAR(200) NULL
);
GO

CREATE INDEX IX_dqp_OrdersLines_OrderLineID
ON dqp.OrdersLines(OrderLineID);
GO
