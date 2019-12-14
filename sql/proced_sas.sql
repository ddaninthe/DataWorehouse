USE [TPAdventureWorks2017]
GO


/****** Object:  StoredProcedure [staging].[SP_AlimSasSalesOrderHeader]    Script Date: 15/11/2019 16:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [staging].[SP_AlimSasSalesOrderHeader]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        MONTH(OrderDate) AS OrderMonth
        ,YEAR(OrderDate) AS OrderYear
        ,SalesPersonID
        ,SUM(CAST(SubTotal as money)+CAST(TaxAmt as money)+CAST(Freight as money)) AS TotalDue
    FROM staging.SrcSalesOrderHeader
    GROUP BY
        MONTH(OrderDate)
        ,YEAR(OrderDate)
        ,SalesPersonID
    ORDER BY YEAR(OrderDate) DESC
		,MONTH(OrderDate) DESC
END
GO


/****** Object:  StoredProcedure [staging].[SP_AlimSasPerson]    Script Date: 15/11/2019 16:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [staging].[SP_AlimSasEmployee]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.SrcBusinessEntityID
        ,JobTitle
        ,FirstName
        ,MiddleName
        ,LastName
        ,BirthDate
        ,Gender
        ,HireDate
        ,SalariedFlag
    FROM staging.SrcEmployee e
    JOIN staging.SrcPerson p ON (e.SrcBusinessEntityID = p.SrcBusinessEntityID) 
    ORDER BY LastName
END
GO
