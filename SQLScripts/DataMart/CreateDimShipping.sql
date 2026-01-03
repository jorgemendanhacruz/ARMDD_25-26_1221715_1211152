IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimShipping')
BEGIN
    CREATE TABLE [dbo].[DimShipping](
        [ShippingKey]   [int] IDENTITY(1,1)    NOT NULL,
        [CountryCode]   [nvarchar](10)     NULL,
        [CountryName]   [nvarchar](255) NULL,
        [IsEuroZone]    [nvarchar](10)  NULL,
        [VAT]           [float]     NULL,
        CONSTRAINT [PK_DimShipping] PRIMARY KEY CLUSTERED ([ShippingKey] ASC)
    );
END
