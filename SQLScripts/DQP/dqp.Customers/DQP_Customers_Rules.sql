USE PlusOrders_StagingArea;
GO

TRUNCATE TABLE dqp.Customers;
GO

INSERT INTO dqp.Customers
(
    CustomerID, CountryID, DateOfBirth, Gender, GeographicRegion, [Language],
    VipCustomer, CreateDate, LastUpdateDate, DQP_Error
)
SELECT
    c.CustomerID,
    c.CountryID,

    /* converter DateOfBirth no formato dd/mm/yyyy */
    TRY_CONVERT(DATETIME, c.DateOfBirth, 103) AS DateOfBirth,

    /* normalizar Gender */
    CASE
        WHEN c.Gender IS NULL THEN NULL
        WHEN UPPER(LTRIM(RTRIM(c.Gender))) IN ('M','MALE') THEN 'M'
        WHEN UPPER(LTRIM(RTRIM(c.Gender))) IN ('F','FEMALE') THEN 'F'
        ELSE UPPER(LTRIM(RTRIM(c.Gender)))
    END AS Gender,

    c.GeographicRegion,

    /* normalizar Language */
    CASE
        WHEN c.[Language] IS NULL THEN NULL
        ELSE UPPER(LTRIM(RTRIM(c.[Language])))
    END AS [Language],

    /* normalizar VipCustomer (0/1) */
    CASE
        WHEN c.VipCustomer IN (0,1) THEN c.VipCustomer
        ELSE NULL
    END AS VipCustomer,

    c.CreateDate,
    c.LastUpdateDate,

    /* Validação */
    CASE
        WHEN c.CustomerID IS NULL THEN 'CustomerID em falta'
        WHEN c.CountryID  IS NULL THEN 'CountryID em falta'

        WHEN c.DateOfBirth IS NULL THEN 'DateOfBirth em falta'
        WHEN TRY_CONVERT(DATETIME, c.DateOfBirth, 103) IS NULL THEN 'DateOfBirth inválida (formato/valor)'
        WHEN CONVERT(DATE, TRY_CONVERT(DATETIME, c.DateOfBirth, 103)) > CONVERT(DATE, GETDATE()) THEN 'DateOfBirth no futuro'
        WHEN CONVERT(DATE, TRY_CONVERT(DATETIME, c.DateOfBirth, 103)) < CONVERT(DATE, '19000101') THEN 'DateOfBirth inválida (muito antiga)'

        WHEN c.Gender IS NULL THEN 'Gender em falta'
        WHEN UPPER(LTRIM(RTRIM(c.Gender))) NOT IN ('M','F','MALE','FEMALE') THEN 'Gender inválido'

        WHEN c.[Language] IS NULL THEN 'Language em falta'
        WHEN LEN(UPPER(LTRIM(RTRIM(c.[Language])))) <> 2 THEN 'Language inválida (esperado 2 letras)'

        WHEN c.VipCustomer IS NULL THEN 'VipCustomer em falta'
        WHEN c.VipCustomer NOT IN (0,1) THEN 'VipCustomer inválido (esperado 0/1)'

        ELSE NULL
    END AS DQP_Error
FROM dbo.Customers c;
GO
