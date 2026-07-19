# Challenge 4: MAX challenge 4: inventory by warehouse and category

## Required result

Return `SnapshotID`, `WarehouseName`, `Category`, `ProductName`, `SnapshotDate`, `InventoryValue`, and `WarehouseCategoryMaximumValue` from `dbo.InventorySnapshots`, with `WarehouseCategoryMaximumValue` showing the highest value of `QuantityOnHand * UnitCost` for rows that have the same `WarehouseName` and `Category`.
Sort the final result by `WarehouseName` and `Category` in ascending order.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `SnapshotID`
- `WarehouseName`
- `Category`
- `ProductName`
- `SnapshotDate`
- `InventoryValue`
- `WarehouseCategoryMaximumValue`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
