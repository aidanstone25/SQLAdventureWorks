SELECT YEAR(salesorderdetail.ModifiedDate),SUM(salesorderdetail.LineTotal) FROM salesorderdetail GROUP BY YEAR(salesorderdetail.ModifiedDate);