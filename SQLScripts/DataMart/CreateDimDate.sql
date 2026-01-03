IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimDate')
BEGIN
    CREATE TABLE [dbo].[DimDate](
        [DateKey] [int] IDENTITY(1,1)    NOT NULL,
        [FullDate]         [date]        NULL,
        [Year]             [int]         NULL,
        [Month]            [tinyint]     NULL,
        [DayNumberOfYear]  [int]         NULL,
        [DayNumberOfMonth] [tinyint]     NULL,
        [DayNumberOfWeek]  [tinyint]     NULL,
        [Week]             [tinyint]     NULL,
        [DayOfWeek]        [nvarchar](10)        NULL,
        [Weekend]          [nvarchar](10)  NULL,
        [MonthName]        [nvarchar](10) NULL,
        [Quarter]          [tinyint]     NULL,
        [Semester]         [tinyint]     NULL,
        [Trimester]        [tinyint]     NULL,
        [Season]           [nvarchar](10)     NULL,
        CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateKey] ASC)
    );
END
