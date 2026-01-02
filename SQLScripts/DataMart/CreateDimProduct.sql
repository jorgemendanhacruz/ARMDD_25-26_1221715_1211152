IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimProduct')
BEGIN
    CREATE TABLE [dbo].[DimProduct](
        [ProductKey]         [int]          NOT NULL,
        [ProductID]          [int]          NOT NULL,
        [ProductDescription] [varchar](255) NULL,
        [IsActive]           [tinyint]      NULL,
        [AvailablePortal]    [tinyint]      NULL,
        [CategoryName]       [varchar](50)  NULL,
        [BoxName]       [varchar](50)  NULL,
        [Gender]             [char](1)      NULL,
        [EffectiveDate]      [date]         NULL,
        [ExpiredDate]        [date]         NULL,
        [IsCurrent]          [tinyint]      NULL,
        CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
    );
END