SELECT * FROM employeepayhistory;
#SELECT * FROM salesorderdetail;
SELECT * FROM salesperson;
SELECT * FROM shift;
SELECT * FROM employeedepartmenthistory;




#SELECT adventureworks.employeepayhistory.Rate, adventureworks.employeepayhistory.RateChangeDate, adventureworks.employeepayhistory.EmployeeID,
#adventureworks.shift.ShiftID,adventureworks.shift.StartTime,adventureworks.shift.EndTime,
#adventureworks.salesperson.SalesPersonID,adventureworks.salesperson.Bonus,adventureworks.salesperson.SalesYTD,adventureworks.salesperson.CommissionPct,
#adventureworks.employeedepartmenthistory.ShiftID,adventureworks.employeedepartmenthistory.StartDate,adventureworks.employeedepartmenthistory.EmployeeID
SELECT adventureworks.employeedepartmenthistory.ShiftID,adventureworks.employeedepartmenthistory.StartDate,adventureworks.employeedepartmenthistory.EmployeeID,
adventureworks.shift.StartTime,adventureworks.shift.EndTime
FROM employeedepartmenthistory
LEFT JOIN shift
ON shift.ShiftID = employeedepartmenthistory.ShiftID
;

SELECT adventureworks.employeepayhistory.Rate,adventureworks.salesperson.SalesPersonID,adventureworks.salesperson.Bonus,adventureworks.salesperson.SalesYTD,adventureworks.salesperson.CommissionPct
FROM salesperson
LEFT JOIN employeepayhistory
ON salesperson.SalesPersonID = employeepayhistory.EmployeeID;


SELECT * FROM shift;
ALTER TABLE shift
ADD hours int;
SET SQL_SAFE_UPDATES = 0;
UPDATE shift
SET hours = abs(shift.EndTime-shift.StartTime)/10000;

SELECT SalesPersonID,  SalesYTD-(SalesYTD*CommissionPct)-(Rate*365*hours)+bonus as "Net_Profit", SalesYTD/((SalesYTD*CommissionPct)+(Rate*365*hours)+bonus) as 'Profit_pay_ratio', (SalesYTD*CommissionPct)+(Rate*365*hours)+bonus as "Company_Payout" FROM 
(SELECT adventureworks.employeepayhistory.Rate,adventureworks.salesperson.SalesPersonID,adventureworks.salesperson.Bonus,adventureworks.salesperson.SalesYTD,adventureworks.salesperson.CommissionPct
FROM salesperson
LEFT JOIN employeepayhistory
ON salesperson.SalesPersonID = employeepayhistory.EmployeeID)
AS one
LEFT JOIN (SELECT adventureworks.employeedepartmenthistory.ShiftID,adventureworks.employeedepartmenthistory.StartDate,adventureworks.employeedepartmenthistory.EmployeeID,shift.hours
FROM employeedepartmenthistory
LEFT JOIN shift
ON shift.ShiftID = employeedepartmenthistory.ShiftID)
AS two
ON one.SalesPersonID = two.EmployeeID
ORDER BY Net_Profit DESC;



