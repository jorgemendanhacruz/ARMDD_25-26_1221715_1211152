IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimShipping')
BEGIN
    CREATE TABLE [dbo].[DimShipping](
        [ShippingKey]   [int]         NOT NULL,
        [CountryCode]   [char](3)     NULL,
        [CountryName]   [varchar](20) NULL,
        [IsEuroZone]    [varchar](3)  NULL,
        [VAT]           [tinyint]     NULL,
        [EffectiveDate] [date]        NULL,
        [ExpiredDate]   [date]        NULL,
        [IsCurrent]     [tinyint]     NULL,
        CONSTRAINT [PK_DimShipping] PRIMARY KEY CLUSTERED ([ShippingKey] ASC)
    );
END
