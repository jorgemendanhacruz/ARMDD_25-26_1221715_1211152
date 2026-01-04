IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCurrency')
BEGIN
    CREATE TABLE [dbo].[DimCurrency](
        [CurrencyKey]  [int] IDENTITY(1,1)    NOT NULL,
        [CurrencyCode] [nvarchar](3)              NULL,
        [CurrencyName] [nvarchar](50)          NULL,
        CONSTRAINT [PK_DimCurrency] PRIMARY KEY CLUSTERED ([CurrencyKey] ASC)
    );
END
