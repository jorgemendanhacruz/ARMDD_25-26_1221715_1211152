IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimSize')
BEGIN
    CREATE TABLE [dbo].[DimSize](
        [SizeKey]       [int]         NOT NULL,
        [SizeID]        [int]         NOT NULL,
        [SizeName]      [varchar](50) NULL,
        [Min]           [tinyint]     NULL,
        [Max]           [tinyint]     NULL,
        [EffectiveDate] [date]        NULL,
        [ExpiredDate]   [date]        NULL,
        [IsCurrent]     [tinyint]     NULL,
        CONSTRAINT [PK_DimSize] PRIMARY KEY CLUSTERED ([SizeKey] ASC)
    );
END
