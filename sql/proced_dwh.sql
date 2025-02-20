USE [TPAdventureWorks2017]
GO


/****** Object:  StoredProcedure [dwh].[SP_AlimDimTime]    Script Date: 15/11/2019 16:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dwh].[SP_AlimDimTime]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
       OrderMonth
       ,OrderYear
       ,CAST(OrderMonth as nvarchar) + '-' + CAST(OrderYear as nvarchar) AS AlternateKey
    FROM staging.SasSalesOrderHeader
    ORDER BY OrderYear ASC
		,OrderMonth ASC
END
GO


/****** Object:  StoredProcedure [dwh].[SP_AlimDimEmployee]    Script Date: 15/11/2019 16:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dwh].[SP_AlimDimEmployee]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        SasBusinessEntityID
        ,JobTitle
        ,FirstName
        ,MiddleName
        ,LastName
        ,BirthDate
        ,Gender
        ,HireDate
        ,SalariedFlag
    FROM staging.SasEmployee
    ORDER BY LastName
END
GO


/****** Object:  StoredProcedure [dwh].[SP_AlimFactSales]    Script Date: 15/11/2019 16:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dwh].[SP_AlimFactSales]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        e.SasBusinessEntityID
        ,TimeId
        ,SasSalesOrderID
        ,TotalDue
    FROM staging.SasSalesOrderHeader o
        JOIN staging.SasEmployee e ON e.SasBusinessEntityID = o.SalesPersonID
        JOIN dwh.DimTime t on (t.OrderMonth = o.OrderMonth AND t.OrderYear = o.OrderYear)
END
GO
