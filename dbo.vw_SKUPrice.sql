IF OBJECT_ID('dbo.vw_SKUPrice') IS NOT NULL
DROP VIEW dbo.vw_SKUPrice
GO
CREATE VIEW dbo.vw_SKUPrice
AS
SELECT 
*
,dbo.udf_GetSKUPrice(ID) AS CalculatedPrice
FROM 
	dbo.SKU;
GO
