SELECT * FROM product;
SELECT * FROM productcosthistory;
SELECT * FROM productlistpricehistory;
SELECT * FROM productvendor;
SELECT * FROM transactionhistory;
SELECT * FROM transactionhistoryarchive;
SELECT * FROM billofmaterials;

SELECT * FROM productlistpricehistory
WHERE ProductID = 1;

SELECT  transactionhistoryarchive.ProductID,COUNT(*) as "instances" FROM transactionhistoryarchive GROUP BY(productID) ORDER BY instances DESC;

INSERT INTO transactionhistoryarchive
SELECT * FROM transactionhistory;

SELECT transactionhistoryarchive.ProductID,COUNT(*) as "SalesNumber" FROM 
(SELECT productcosthistory.ProductID,productcosthistory.StandardCost,productpricehistory.ProductID,productpricehistory.ListPrice
FROM transactionhistoryarchive
JOIN productcosthistory2 ON productcosthistory.ProductID = transactionhistoryarchive.ProductID 
JOIN productpricehistory2 ON productpricehistory.ProductID = transactionhistoryarchive.ProductID 
);

SELECT  transactionhistoryarchive.ProductID,COUNT(*) as "QuantitySold", ROUND(productlistpricehistory.ListPrice) AS "SalePrice",round(productcosthistory.StandardCost) AS "ProductionCost", ROUND(COUNT(*)*(ListPrice-StandardCost)) AS "TotalProfit" FROM transactionhistoryarchive
JOIN productlistpricehistory ON productlistpricehistory.ProductID = transactionhistoryarchive.ProductID
JOIN productcosthistory ON productcosthistory.ProductID =  transactionhistoryarchive.ProductID
GROUP BY(ProductID) ORDER BY TotalProfit desc;

