USE WindowFunctionsTrainingDB;
GO

select 
        DepartmentName,
        FullName,
        Salary,
        DENSE_RANK() OVER
        (
            partition by Employees.DepartmentID
            order by Salary desc
        )
        
        AS SalaryDenseRank

from Employees 
join Departments
on Employees.DepartmentID = Departments.DepartmentID
ORDER BY DepartmentName, SalaryDenseRank, FullName;















