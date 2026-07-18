# Challenge 05: Total by region and product category

## Required result

Return `OrderID`, `Region`, `ProductCategory`, `OrderDate`, `Amount`, and `RegionCategoryTotal` from `dbo.SalesOrders`, with `RegionCategoryTotal` showing the total of `Amount` for rows that have the same `Region` and `ProductCategory`.
Sort the final result by `Region`, `ProductCategory`, `OrderDate`, and `OrderID` in ascending order.

## Table(s)

- `dbo.SalesOrders`

## Columns to show

- `OrderID`
- `Region`
- `ProductCategory`
- `OrderDate`
- `Amount`
- `RegionCategoryTotal`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySolution.sql` before checking `Solution.sql`.
