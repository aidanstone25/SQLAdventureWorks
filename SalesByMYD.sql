SELECT * FROM salesorderdetail;
SELECT * FROM salesorderheader;


SELECT salesorderdetail.ModifiedDate,SUM(salesorderdetail.LineTotal) FROM salesorderdetail GROUP BY YEAR(salesorderdetail.ModifiedDate);
SELECT salesorderdetail.ModifiedDate,SUM(salesorderdetail.LineTotal) FROM salesorderdetail GROUP BY DAY(salesorderdetail.ModifiedDate);
SELECT salesorderdetail.ModifiedDate,SUM(salesorderdetail.LineTotal) FROM salesorderdetail GROUP BY MONTH(salesorderdetail.ModifiedDate);

