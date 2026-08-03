USE WindowFunctionsTrainingDB;
GO



select
      Dp.DepartmentName,
      Em.FullName,
      Em.Salary,
      CUME_DIST()
      OVER
      (
        partition by Em.DepartmentID
        order by Em.Salary
      )AS SalaryPerDempartmentCumeDist
from Employees as Em
join Departments as Dp
on Em.DepartmentID = Dp.DepartmentID
order by  Dp.DepartmentName, Em.Salary;
