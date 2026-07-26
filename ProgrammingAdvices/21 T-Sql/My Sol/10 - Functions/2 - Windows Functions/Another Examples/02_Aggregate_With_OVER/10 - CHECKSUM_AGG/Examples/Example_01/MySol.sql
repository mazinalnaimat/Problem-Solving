USE WindowFunctionsTrainingDB;
GO



select 
      Dp.DepartmentName,
      Em.EmployeeID,
      Em.FullName,
      CHECKSUM_AGG(Em.EmployeeID)
      OVER
      (
        partition by Em.DepartmentID
      ) AS EmployeesCheckSumPerDepartment
from Employees AS Em
join Departments As Dp
on Em.DepartmentID = Dp.DepartmentID
order by Dp.DepartmentName, Em.EmployeeID;

