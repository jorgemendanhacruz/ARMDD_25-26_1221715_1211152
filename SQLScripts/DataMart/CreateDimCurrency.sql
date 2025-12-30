IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCurrency')
BEGIN
    CREATE TABLE [dbo].[DimCurrency](
        [CurrencyKey]  [int]         NOT NULL,
        [CurrencyCode] [char](3)     NULL,
        [CurrencyName] [varchar](50) NULL,
        CONSTRAINT [PK_DimCurrency] PRIMARY KEY CLUSTERED ([CurrencyKey] ASC)
    );
END
