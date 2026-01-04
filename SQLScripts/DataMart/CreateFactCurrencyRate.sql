IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'FactCurrencyRate')
BEGIN
    CREATE TABLE [dbo].[FactCurrencyRate](
        [ConversionDateKey]             [int]           NOT NULL,
        [SourceCurrencyKey]             [int]           NOT NULL,
        [DestinationCurrencyKey]        [int]           NOT NULL,
        [SourceDestinationExchangeRate]    [decimal](10,4) NULL,
        [DestinationSourceExchangeRate] [decimal](10,4) NULL,
        CONSTRAINT [PK_FactCurrencyRate] PRIMARY KEY CLUSTERED
        (
            [ConversionDateKey] ASC,
            [SourceCurrencyKey] ASC,
            [DestinationCurrencyKey] ASC
        )
    );
END
