USE [TPAdventureWorks2017]
GO

/****** Object:  Table [staging].[SasEmployee]    Script Date: 14/11/2019 12:52:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[SasEmployee](
	[SasBusinessEntityID] [int] NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [bit] NOT NULL,
 CONSTRAINT [PK_staging_SasEmployee_SasBusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[SasBusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [staging].[SasSalesOrderHeader]    Script Date: 15/11/2019 10:47:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[SasSalesOrderHeader](
	[SasSalesOrderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OrderMonth] [int] NOT NULL,
	[OrderYear] [int] NOT NULL,
	[SalesPersonID] [int] NULL,
	[TotalDue] [money] NOT NULL,
 CONSTRAINT [PK_SasSalesOrderHeader_SasSalesOrderID] PRIMARY KEY CLUSTERED 
(
	[SasSalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
