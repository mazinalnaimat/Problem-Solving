# Challenge 4: MIN challenge 4: inventory by warehouse and category

## Required result

Return `SnapshotID`, `WarehouseName`, `Category`, `ProductName`, `SnapshotDate`, `QuantityOnHand`, and `WarehouseCategoryMinimumQuantity` from `dbo.InventorySnapshots`, with `WarehouseCategoryMinimumQuantity` showing the lowest value of `QuantityOnHand` for rows that have the same `WarehouseName` and `Category`.
Sort the final result by `WarehouseName` and `Category` in ascending order.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `SnapshotID`
- `WarehouseName`
- `Category`
- `ProductName`
- `SnapshotDate`
- `QuantityOnHand`
- `WarehouseCategoryMinimumQuantity`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
