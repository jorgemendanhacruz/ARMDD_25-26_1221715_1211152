IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimSize')
BEGIN
    CREATE TABLE [dbo].[DimSize](
        [SizeKey]       [int] IDENTITY(1,1)    NOT NULL,
        [SizeID]        [int]         NOT NULL,
        [SizeName]      [nvarchar](255) NULL,
        [Min]           [int]     NULL,
        [Max]           [int]     NULL,
        CONSTRAINT [PK_DimSize] PRIMARY KEY CLUSTERED ([SizeKey] ASC)
    );
END
