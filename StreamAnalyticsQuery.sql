select * into SQLSales from WBCDev

SELECT
	StoreId,
	CAST(DrinkId as bigint) as DrinkId,
	CAST(TransactionAmount as float) as SaleAmount,
	DateTime AS Time
INTO 
	PowerBISales
FROM 
	WBCDev

SELECT
    StoreId,
    DrinkId,
    sum(TransactionAmount) as Sales,
    System.TimeStamp AS Time
INTO 
    PowerBISalesAgg
FROM 
    WBCDev
GROUP BY 
    StoreId, DrinkId, HoppingWindow(second, 60, 30)