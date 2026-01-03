USE PlusOrders_StagingArea;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'dqp')
    EXEC ('CREATE SCHEMA dqp');
GO

IF OBJECT_ID('dqp.Boxes','U') IS NOT NULL
    DROP TABLE dqp.Boxes;
GO

CREATE TABLE dqp.Boxes (
    BoxID          INT            NULL,
    BoxName        NVARCHAR(510)  NULL,
    BoxHeight      FLOAT          NULL,
    BoxLength      FLOAT          NULL,
    BoxWidth       FLOAT          NULL,
    BoxVolWeight   FLOAT          NULL,
    Location       NVARCHAR(510)  NULL,
    CreateDate     DATE           NULL,
    LastUpdateDate DATE           NULL,
    DQP_Error      NVARCHAR(200)  NULL
);
GO

CREATE INDEX IX_dqp_Boxes_BoxID ON dqp.Boxes(BoxID);
GO
