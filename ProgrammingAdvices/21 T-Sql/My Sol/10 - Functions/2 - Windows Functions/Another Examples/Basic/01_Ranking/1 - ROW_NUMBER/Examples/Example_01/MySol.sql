use WindowFunctionsTrainingDB;
go 


Select DepartmentName, FullName,Salary, 
    ROW_NUMBER()over (partition by Employees.DepartmentID order by Salary  desc) as RowNumberInDepartment
from Employees join Departments  on Employees.DepartmentID = Departments.DepartmentID
order by Departments.DepartmentName, RowNumberInDepartment;