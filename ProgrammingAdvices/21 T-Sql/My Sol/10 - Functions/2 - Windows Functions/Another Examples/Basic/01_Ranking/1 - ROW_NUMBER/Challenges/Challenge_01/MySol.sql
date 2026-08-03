USE WindowFunctionsTrainingDB;
GO


select DepartmentName,
        FullName,
        Salary
from
(
    select 
        DepartmentName,
        Employees.FullName,
        Employees.Salary,
        ROW_NUMBER() 
        over
        (
            partition by Employees.DepartmentId
            order by Salary desc
        )  as rn
    from Employees join Departments on
    Employees.DepartmentID = Departments.DepartmentID
) as x
where x.rn = 1