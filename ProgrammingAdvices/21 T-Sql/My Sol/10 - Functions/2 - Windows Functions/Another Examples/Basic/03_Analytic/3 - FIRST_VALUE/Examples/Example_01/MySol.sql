USE WindowFunctionsTrainingDB;
GO

select 
      Dp.DepartmentName,
      Em.FullName,
      Em.HireDate,
      Em.Salary,
      FIRST_VALUE(Salary)
      OVER
      (
        partition by Em.DepartmentID
        order by Em.HireDate, Em.EmployeeID
      )AS FirstHiredSalaryInDepartment
from Employees AS Em
join Departments AS Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.HireDate;

