# Challenge 2: SUM

## Required result

Return `FullName`, `OrderDate`, `OrderID`, `Amount`, and `Running_SUM_Amount` using `dbo.SalesOrders` and `dbo.Employees`, with `Running_SUM_Amount` showing the total of `Amount` for rows that have the same `SalesPersonID`.
Calculate `Running_SUM_Amount` as a running value after ordering each calculation group by `OrderDate` and `OrderID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `FullName`, `OrderDate`, and `OrderID` in ascending order.

## Table(s)

- `dbo.SalesOrders`
- `dbo.Employees`

## Columns to show

- `FullName`
- `OrderDate`
- `OrderID`
- `Amount`
- `Running_SUM_Amount`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
