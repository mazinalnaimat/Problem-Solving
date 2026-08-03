# Explanation: Department salary total beside each employee

`PARTITION BY e.DepartmentID` creates a separate window for every department.

The `SUM` is calculated only from employees in the current employee's department. The numbering or calculation restarts automatically when the partition changes.

Unlike `GROUP BY`, no employee row is removed.
