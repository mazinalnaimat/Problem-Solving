# Challenge 07: Running sales total for each salesperson

## Required result

Return `SalesPersonID`, `FullName`, `OrderID`, `OrderDate`, `Amount`, and `SalesPersonRunningTotal` using `dbo.SalesOrders` and `dbo.Employees`, with `SalesPersonRunningTotal` showing the total of `Amount` for rows that have the same `SalesPersonID`.
Calculate `SalesPersonRunningTotal` as a running value after ordering each calculation group by `OrderDate` and `OrderID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `SalesPersonID`, `OrderDate`, and `OrderID` in ascending order.

## Table(s)

- `dbo.SalesOrders`
- `dbo.Employees`

## Columns to show

- `SalesPersonID`
- `FullName`
- `OrderID`
- `OrderDate`
- `Amount`
- `SalesPersonRunningTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
