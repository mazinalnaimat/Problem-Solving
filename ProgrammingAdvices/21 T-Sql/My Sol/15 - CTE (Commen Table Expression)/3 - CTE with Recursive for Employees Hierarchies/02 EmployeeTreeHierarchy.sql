
use C21_DB1;
go


With EmployeeTreeHierarchy AS
(
    SELECT EmployeeID, 
	ManagerID, Name, 
	CAST(Name AS VARCHAR(MAX)) AS 'Hierarchy', 0 AS Level
    FROM Employees7
    WHERE ManagerID IS NULL

    
    union  all

    select Employees7.EmployeeID,
           Employees7.ManagerID,
           Employees7.Name,
           Hierarchy +  ' -> ' +CAST(Employees7.Name AS VARCHAR(MAX))    AS 'Hierarchy',
           Level +1   from Employees7 
      join EmployeeTreeHierarchy
      on Employees7.ManagerID  = EmployeeTreeHierarchy.EmployeeID


)

select * from EmployeeTreeHierarchy

ORDER BY Hierarchy;
