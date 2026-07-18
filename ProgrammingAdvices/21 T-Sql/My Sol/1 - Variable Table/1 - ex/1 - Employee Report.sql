
use C21_DB1;

-- Example: Employee Report Generation in T-SQL
-- This script demonstrates the declaration, initialization, and use of variables in T-SQL.
-- It generates a report for a specific department, including the department name, reporting period, and total employees hired within that period.
-- This comprehensive script gives a practical insight into how variables can be effectively used in T-SQL to create dynamic and flexible SQL scripts.


-- Step 1: Declare variables
DECLARE @DepartmentID INT; -- Variable for department ID
DECLARE @StartDate DATE; -- Variable for start date
DECLARE @EndDate DATE; -- Variable for end date
DECLARE @TotalEmployees INT; -- Variable to hold the total number of employees
DECLARE @DepartmentName VARCHAR(50); -- Variable for department name

SET @DepartmentName = 'Sales';
SET @StartDate = '2023-01-01';
SET @EndDate = '2023-12-31';


Select @DepartmentID = Departments.DepartmentID from Departments 
where Departments.Name = @DepartmentName;

SELECT @TotalEmployees = Count(*) From Employees
WHERE Employees.DepartmentID = @DepartmentID AND Employees.HireDate >= @StartDate AND Employees.HireDate <= @EndDate;

print ('Departnemt Report');
print ('Departnemt Name: ' + @DepartmentName);
print ('Reporting Period: ' + CAST(@StartDate as varchar) + ' to ' + CAST(@EndDate as varchar) );
print ('Total Employees Hired in 2023: ' + CAST(@TotalEmployees as varchar));

