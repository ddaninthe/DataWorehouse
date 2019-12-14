USE [TPAdventureWorks2017]
GO

/****** Object:  Schema [staging]    Script Date: 04/10/2019 14:31:53 ******/
CREATE SCHEMA [staging]
GO

/****** Object:  Table [staging].[SrcSalesOrderHeader]    Script Date: 14/11/2019 12:07:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[SrcSalesOrderHeader](
	[SrcSalesOrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [nvarchar](255) NULL,
	[SalesPersonID] [nvarchar](255) NULL,
	[SubTotal] [nvarchar](255) NULL,
	[TaxAmt] [nvarchar](255) NULL,
	[Freight] [nvarchar](255) NULL,
CONSTRAINT [PK_staging_SrcSalesOrderHeader_SrcSalesOrderID] PRIMARY KEY CLUSTERED 
(
	[SrcSalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [staging].[SrcEmployee]    Script Date: 14/11/2019 12:21:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[SrcEmployee](
	[SrcBusinessEntityID] [int] NOT NULL,
	[JobTitle] [nvarchar](255) NULL,
	[BirthDate] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[HireDate] [nvarchar](255) NULL,
	[SalariedFlag] [nvarchar](255) NULL,
 CONSTRAINT [PK_staging_SrcEmployee_SrcBusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[SrcBusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [staging].[SrcPerson]    Script Date: 14/11/2019 12:28:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[SrcPerson](
	[SrcBusinessEntityID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[MiddleName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_staging_SrcPerson_SrcBusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[SrcBusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

