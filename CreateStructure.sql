IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL
	DROP TABLE dbo.SKU;
CREATE TABLE 
	dbo.SKU (
		ID INT IDENTITY PRIMARY KEY
		,Code VARCHAR(50) UNIQUE
		,Name VARCHAR(50)
		,CONSTRAINT CHK_Code_Unique 
CHECK (Code = ('s' + CAST(ID AS VARCHAR(10))))
);  
GO
IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL
	DROP TABLE dbo.Family;
CREATE TABLE 
	dbo.Family(
		ID INT IDENTITY PRIMARY KEY
		,SurName VARCHAR(20)
		,BudgetValue INT
);
GO
IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL
	DROP TABLE dbo.Basket;
CREATE TABLE 
	dbo.Basket(
		ID INT IDENTITY PRIMARY KEY
		,ID_SKU INT
		,ID_Family INT
		,Quantity INT CHECK(Quantity>=0)
		,Value INT CHECK(Value>=0)
		,PurchaseDate DATE DEFAULT GETDATE()
		,DiscoutValue INT
,FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU
,FOREIGN KEY (ID_Family) REFERENCES dbo.Family
);
GO