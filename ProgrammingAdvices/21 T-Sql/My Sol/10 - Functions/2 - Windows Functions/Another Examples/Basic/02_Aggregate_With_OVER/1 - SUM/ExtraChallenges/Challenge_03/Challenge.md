# Challenge 03: Show every order with the grand total

## Required result

Return `OrderID`, `OrderDate`, `CustomerName`, `Amount`, and `GrandTotal` from `dbo.SalesOrders`, with `GrandTotal` showing the total of `Amount` across all returned rows as one calculation group.
Sort the final result by `OrderDate` and `OrderID` in ascending order.

## Table(s)

- `dbo.SalesOrders`

## Columns to show

- `OrderID`
- `OrderDate`
- `CustomerName`
- `Amount`
- `GrandTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
