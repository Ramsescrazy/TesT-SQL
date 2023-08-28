IF OBJECT_ID('dbo.TR_Basket_insert_update') IS NOT NULL
	DROP TRIGGER dbo.TR_Basket_insert_update
GO
CREATE TRIGGER dbo.TR_Basket_insert_update ON dbo.Basket 
	AFTER INSERT, UPDATE
		AS
			BEGIN
	UPDATE DiscountValue 
	SET DiscountValue = CASE
		WHEN (SELECT Quantity FROM INSERTED) >= 2 THEN (SELECT Value FROM INSERTED) * 0.05 
    ELSE 0
		END
	WHERE ID_SKU = (SELECT ID_SKU FROM inserted);
		END;
GO
	