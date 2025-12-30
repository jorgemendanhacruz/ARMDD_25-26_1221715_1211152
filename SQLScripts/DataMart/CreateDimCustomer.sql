IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimCustomer')
BEGIN
    CREATE TABLE [dbo].[DimCustomer](
        [CustomerKey]      [int]         NOT NULL,
        [CustomerID]       [int]         NOT NULL,
        [CustomerBirthday] [date]        NULL,
        [Gender]           [char](1)     NULL,
        [IsVipCustomer]    [char](1)     NULL,
        [Country]          [varchar](50) NULL,
        [EffectiveDate]    [date]        NULL,
        [ExpiredDate]      [date]        NULL,
        [IsCurrent]        [tinyint]     NULL,
        CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
    );
END