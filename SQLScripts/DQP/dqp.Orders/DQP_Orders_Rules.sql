USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Orders;
GO

;WITH Dedup AS (
    SELECT
        o.OrderID,
        o.OrderDate,
        o.SiteID,
        o.CustomerID,
        o.TotalQuantity,
        o.ShippingCost,
        o.TotalWithoutShipping,
        o.TotalWithShipping,
        LTRIM(RTRIM(o.Address)) AS AddressNorm,
        o.CountryID,
        LTRIM(RTRIM(o.City))  AS CityNorm,
        LTRIM(RTRIM(o.State)) AS StateNorm,
        o.Zip,
        o.CurrencyID,
        o.CreateDate,
        o.LastUpdateDate,

        ROW_NUMBER() OVER (
            PARTITION BY o.OrderID
            ORDER BY
                ISNULL(o.LastUpdateDate,'19000101') DESC,
                ISNULL(o.CreateDate,'19000101') DESC
        ) AS rn
    FROM dbo.Orders o
)

INSERT INTO dqp.Orders
(
    OrderID, OrderDate, SiteID, CustomerID, TotalQuantity,
    ShippingCost, TotalWithoutShipping, TotalWithShipping,
    Address, CountryID, City, State, Zip, CurrencyID,
    CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    OrderID,
    OrderDate,
    SiteID,
    CustomerID,
    TotalQuantity,
    ShippingCost,
    TotalWithoutShipping,
    TotalWithShipping,
    AddressNorm,
    CountryID,
    CityNorm,
    StateNorm,
    Zip,
    CurrencyID,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN OrderID IS NULL THEN 'OrderID em falta'
        WHEN CustomerID IS NULL THEN 'CustomerID em falta'
        WHEN SiteID IS NULL THEN 'SiteID em falta'
        WHEN OrderDate IS NULL THEN 'OrderDate em falta'
        WHEN OrderDate > CONVERT(DATE, GETDATE()) THEN 'OrderDate no futuro'

        WHEN TotalQuantity IS NULL THEN 'TotalQuantity em falta'
        WHEN TotalQuantity < 0 THEN 'TotalQuantity negativa'

        WHEN ShippingCost IS NOT NULL AND ShippingCost < 0 THEN 'ShippingCost negativo'
        WHEN TotalWithoutShipping IS NOT NULL AND TotalWithoutShipping < 0 THEN 'TotalWithoutShipping negativo'
        WHEN TotalWithShipping IS NOT NULL AND TotalWithShipping < 0 THEN 'TotalWithShipping negativo'

        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
