IF OBJECT_ID('dbo.usp_MakeFamilyPurchase') IS NOT NULL
DROP PROCEDURE dbo.usp_MakeFamilyPurchase
GO
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
AS
	BEGIN
	DECLARE @TotalPurchaseValue INT;
	SELECT @TotalPurchaseValue = SUM(Value)
    FROM dbo.Basket
    WHERE ID_Family IN (SELECT ID FROM dbo.Family WHERE SurName = @FamilySurName);
	IF @FamilySurName IS NOT NULL 
	BEGIN
	UPDATE dbo.Family
    SET BudgetValue = BudgetValue - @TotalPurchaseValue
	WHERE SurName = @FamilySurName;
	END;
	ELSE
	BEGIN
	PRINT 'Такой семьи нет'
	END;
	END;
