USE WindowFunctionsTrainingDB;
GO



select 
      Dp.DepartmentName,
      Em.FullName,
      Em.HireDate,
      Em.Salary,
      LEAD(Em.Salary)
      OVER
      (
        partition by Em.DepartmentID
        order by HireDate
      ) AS NextSalaryInDepartment
from Employees AS Em
join Departments AS Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.HireDate;



