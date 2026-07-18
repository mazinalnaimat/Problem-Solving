USE WindowFunctionsTrainingDB;
GO




select 
      EmployeeID,
      FullName,
      Salary,
      NTILE(4) OVER
      (
        order by  Salary desc
      )
      AS SalaryGroup

from Employees
