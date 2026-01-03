USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Countries','U') IS NOT NULL
    DROP TABLE dqp.Countries;
GO

CREATE TABLE dqp.Countries (
    CountryID      INT            NULL,
    [Name]         NVARCHAR(510)  NULL,
    Code           NVARCHAR(4)    NULL,
    VAT            FLOAT          NULL,
    EuroZone       BIT            NULL,
    CreateDate     DATE           NULL,
    LastUpdateDate DATE           NULL,
    DQP_Error      NVARCHAR(200)  NULL
);
GO

CREATE INDEX IX_dqp_Countries_CountryID ON dqp.Countries(CountryID);
GO
