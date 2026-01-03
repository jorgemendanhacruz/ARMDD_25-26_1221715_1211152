USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.OrdersLines;
GO

;WITH Src AS (
    SELECT
        ol.OrderLineID,
        ol.OrderID,
        ol.ProductID,
        ol.Quantity,
        ol.SizeID,
        ol.LineTotal,
        d.Currency,
        d.Discount,
        d.PromotionDiscount,
        ol.CreateDate,
        ol.LastUpdateDate
    FROM dbo.OrdersLines ol
    LEFT JOIN dbo.OrdersLinesDetails d
        ON ol.OrderLineID = d.OrderLineID
),
Dedup AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY OrderLineID
            ORDER BY
                ISNULL(LastUpdateDate,'19000101') DESC,
                ISNULL(CreateDate,'19000101') DESC
        ) AS rn
    FROM Src
)

INSERT INTO dqp.OrdersLines
(
    OrderLineID, OrderID, ProductID, Quantity, SizeID,
    LineTotal, Currency, Discount, PromotionDiscount,
    CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    OrderLineID,
    OrderID,
    ProductID,
    Quantity,
    SizeID,
    LineTotal,
    Currency,
    Discount,
    PromotionDiscount,
    CreateDate,
    LastUpdateDate,

    CASE
        WHEN OrderLineID IS NULL THEN 'OrderLineID em falta'
        WHEN OrderID IS NULL THEN 'OrderID em falta'
        WHEN ProductID IS NULL THEN 'ProductID em falta'

        WHEN Quantity IS NULL THEN 'Quantity em falta'
        WHEN Quantity < 0 THEN 'Quantity negativa'

        WHEN LineTotal IS NULL THEN 'LineTotal em falta'
        WHEN LineTotal < 0 THEN 'LineTotal negativo'

        WHEN Discount IS NOT NULL AND Discount < 0 THEN 'Discount negativo'
        WHEN PromotionDiscount IS NOT NULL AND PromotionDiscount < 0 THEN 'PromotionDiscount negativo'

        ELSE NULL
    END AS DQP_Error
FROM Dedup
WHERE rn = 1;
GO
