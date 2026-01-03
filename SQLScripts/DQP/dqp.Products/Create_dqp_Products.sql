USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Products','U') IS NOT NULL
    DROP TABLE dqp.Products;
GO

CREATE TABLE dqp.Products (
    ProductID        INT          NULL,
    [Description]    NVARCHAR(255) NULL,
    CategoryID       INT          NULL,
    AvailablePortal  BIT          NULL,
    BoxID            INT          NULL,
    Active           BIT          NULL,
    CreateDate       DATE         NULL,
    LastUpdateDate   DATE         NULL,
    DQP_Error        NVARCHAR(200) NULL
);
GO

-- Unicidade lógica (depois do dedup)
CREATE INDEX IX_dqp_Products_ProductID
ON dqp.Products(ProductID);
GO
