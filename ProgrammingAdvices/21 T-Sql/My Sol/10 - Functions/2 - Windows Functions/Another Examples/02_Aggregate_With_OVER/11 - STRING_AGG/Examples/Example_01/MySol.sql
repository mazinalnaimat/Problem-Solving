USE WindowFunctionsTrainingDB;
GO

select
    Dp.DepartmentName,
    STRING_AGG(Em.FullName, ', ')
    within group
    (order by Em.FullName) AS Employees
from Employees AS Em
join Departments As Dp
on Dp.DepartmentID = Em.DepartmentID
group by Dp.DepartmentName
order by Dp.DepartmentName;
