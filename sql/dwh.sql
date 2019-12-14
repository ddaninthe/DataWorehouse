USE [TPAdventureWorks2017]
GO

/****** Object:  Schema [dwh]    Script Date: 04/10/2019 14:31:53 ******/

CREATE SCHEMA [dwh]
GO

/****** Object:  Table [dwh].[DimTime]    Script Date: 04/10/2019 14:31:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dwh].[DimTime](
       [TimeId] [int] IDENTITY(1,1) NOT NULL,
       [OrderMonth] [int] NOT NULL,
       [OrderYear] [int] NOT NULL,
CONSTRAINT [PK_dwh_DimTime_TimeId] PRIMARY KEY CLUSTERED
(
       [TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dwh].[DimEmployee]    Script Date: 04/10/2019 14:31:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dwh].[DimEmployee](
        [EmployeeId] [int] NOT NULL,
        [FirstName] [nvarchar](50) NOT NULL,
        [MiddleName] [nvarchar](50) NULL,
        [LastName] [nvarchar](50) NOT NULL,
        [JobTitle] [nvarchar](50) NOT NULL,
        [BirthDate] [date] NOT NULL,
        [Gender] [nchar](1) NOT NULL,
        [HireDate] [date] NOT NULL,
        [SalariedFlag] [bit] NOT NULL,
CONSTRAINT [PK_dwh_DimEmployee_EmployeeId] PRIMARY KEY CLUSTERED
(
        [EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dwh].[FactSales]    Script Date: 04/10/2019 14:31:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dwh].[FactSales](
        [OrderId] [int] NOT NULL,
        [EmployeeId] [int] NOT NULL,
        [TimeId] [int] NOT NULL,
        [Price] [money] NOT NULL,
CONSTRAINT [PK_dwh_FactSales_OrderIdEmployeeIdTimeId] PRIMARY KEY CLUSTERED
(
       [OrderId] ASC,
       [EmployeeId],
       [TimeId]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dwh].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_dwh_FactSales_EmployeeId_dwh_DimEmployee_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dwh].[DimEmployee] ([EmployeeId])
GO

ALTER TABLE [dwh].[FactSales] CHECK CONSTRAINT [FK_dwh_FactSales_EmployeeId_dwh_DimEmployee_EmployeeId]
GO

ALTER TABLE [dwh].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_dwh_FactSales_TimeId_dwh_DimTime_TimeId] FOREIGN KEY([TimeId])
REFERENCES [dwh].[DimTime] ([TimeId])
GO

ALTER TABLE [dwh].[FactSales] CHECK CONSTRAINT [FK_dwh_FactSales_TimeId_dwh_DimTime_TimeId]
GO