IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimBox')
BEGIN
    CREATE TABLE [dbo].[DimBox](
        [BoxKey]        [int]           NOT NULL,
        [BoxID]         [int]           NOT NULL,
        [BoxName]       [varchar](50)   NULL,
        [Height]        [decimal](2, 2) NULL,
        [Width]         [decimal](2, 2) NULL,
        [Length]        [decimal](2, 2) NULL,
        [VolWeight]     [decimal](2, 2) NULL,
        [LocationCode]  [char](3)       NULL,
        [EffectiveDate] [date]          NULL,
        [ExpiredDate]   [date]          NULL,
        [IsCurrent]     [tinyint]       NULL,
        CONSTRAINT [PK_DimBox] PRIMARY KEY CLUSTERED ([BoxKey] ASC)
    );
END
