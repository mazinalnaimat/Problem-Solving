# Challenge 06: Running total of all sales

## Required result

Return `OrderID`, `OrderDate`, `CustomerName`, `Amount`, and `RunningTotal` from `dbo.SalesOrders`, with `RunningTotal` showing the total of `Amount` across all returned rows as one calculation group.
Calculate `RunningTotal` as a running value after ordering each calculation group by `OrderDate` and `OrderID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `OrderDate` and `OrderID` in ascending order.

## Table(s)

- `dbo.SalesOrders`

## Columns to show

- `OrderID`
- `OrderDate`
- `CustomerName`
- `Amount`
- `RunningTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
