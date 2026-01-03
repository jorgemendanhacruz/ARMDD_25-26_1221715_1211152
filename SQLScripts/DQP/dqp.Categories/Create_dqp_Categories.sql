USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Categories','U') IS NOT NULL
    DROP TABLE dqp.Categories;
GO

CREATE TABLE dqp.Categories (
    CategoryID      INT            NULL,
    [Name]          NVARCHAR(510)  NULL,
    Gender          NCHAR(2)       NULL,
    CreateDate      DATE           NULL,
    LastUpdateDate  DATE           NULL,
    DQP_Error       NVARCHAR(200)  NULL
);
GO

CREATE INDEX IX_dqp_Categories_CategoryID ON dqp.Categories(CategoryID);
GO
