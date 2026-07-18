# Explanation: Total salary of all employees

`SUM(Salary)` adds the salary values from all rows that reach the aggregate.

Because there is no `GROUP BY`, SQL Server treats all employee rows as one group and returns one result row.

This is different from `SUM(Salary) OVER()`: the window version would keep every employee row and repeat the grand total beside each employee.
