# Challenge 4: Compare all snapshots with snapshots that contain quantity

## Required result

- Keep each snapshot row.
- Calculate both counts for each warehouse-and-category combination.
- `AllSnapshotCount` must count every row; `QuantityValueCount` must ignore `NULL` quantities.
- Sort by `WarehouseName`, `Category`, `SnapshotDate`, and `SnapshotID`.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `SnapshotID`
- `WarehouseName`
- `Category`
- `ProductName`
- `SnapshotDate`
- `AllSnapshotCount`
- `QuantityValueCount`

## Skills practiced

- Multiple window aggregates in one query
- Comparing `COUNT(*)` with `COUNT(expression)`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
