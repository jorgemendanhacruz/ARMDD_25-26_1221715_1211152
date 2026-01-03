USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Sites','U') IS NOT NULL
    DROP TABLE dqp.Sites;
GO

CREATE TABLE dqp.Sites (
    SiteID        INT            NULL,
    [Name]        NVARCHAR(510)  NULL,
    IsSite        BIT            NULL,
    SiteURL       NVARCHAR(510)  NULL,
    SiteName      NVARCHAR(510)  NULL,
    Initials      NVARCHAR(6)    NULL,
    Currency      NVARCHAR(6)    NULL,
    CreateDate    DATE           NULL,
    LastUpdateDate DATE          NULL,
    DQP_Error     NVARCHAR(200)  NULL
);
GO

CREATE INDEX IX_dqp_Sites_SiteID ON dqp.Sites(SiteID);
GO
