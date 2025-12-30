IF NOT EXISTS (SELECT name FROM sys.tables WHERE name = 'DimDate')
BEGIN
    CREATE TABLE [dbo].[DimDate](
        [DateKey]          [int]         NOT NULL,
        [FullDate]         [date]        NULL,
        [Year]             [int]         NULL,
        [Month]            [tinyint]     NULL,
        [Day]              [tinyint]     NULL,
        [DayNumberOfYear]  [int]         NULL,
        [DayNumberOfMonth] [tinyint]     NULL,
        [DayNumberOfWeek]  [tinyint]     NULL,
        [Week]             [tinyint]     NULL,
        [DayOfWeek]        [int]         NULL,
        [Weekend]          [varchar](3)  NULL,
        [MonthName]        [varchar](10) NULL,
        [Quarter]          [tinyint]     NULL,
        [Semester]         [tinyint]     NULL,
        [Trimester]        [tinyint]     NULL,
        [Season]           [tinyint]     NULL,
        CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ([DateKey] ASC)
    );
END
