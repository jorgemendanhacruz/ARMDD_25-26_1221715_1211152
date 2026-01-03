USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Currencies','U') IS NOT NULL
    DROP TABLE dqp.Currencies;
GO

CREATE TABLE dqp.Currencies (
    CurrencyID      NVARCHAR(6)   NULL,
    CurrencyName    NVARCHAR(40)  NULL,
    CurrencySymbol  NVARCHAR(6)   NULL,
    CreateDate      DATE          NULL,
    LastUpdateDate  DATE          NULL,
    DQP_Error       NVARCHAR(200) NULL
);
GO

CREATE INDEX IX_dqp_Currencies_CurrencyID ON dqp.Currencies(CurrencyID);
GO
