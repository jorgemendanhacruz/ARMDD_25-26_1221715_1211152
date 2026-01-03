USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Customers','U') IS NOT NULL
    DROP TABLE dqp.Customers;
GO

CREATE TABLE dqp.Customers (
    CustomerID        INT           NULL,
    CountryID         INT           NULL,
    DateOfBirth       DATETIME      NULL,
    Gender            NVARCHAR(50)  NULL,
    GeographicRegion  INT           NULL,
    [Language]        NVARCHAR(50)  NULL,
    VipCustomer       INT           NULL,
    CreateDate        DATE          NULL,
    LastUpdateDate    DATE          NULL,

    -- campos DQP (é aqui que guardas o "rejeitado" sem outra tabela)
    DQP_Error         NVARCHAR(200) NULL
);
GO

