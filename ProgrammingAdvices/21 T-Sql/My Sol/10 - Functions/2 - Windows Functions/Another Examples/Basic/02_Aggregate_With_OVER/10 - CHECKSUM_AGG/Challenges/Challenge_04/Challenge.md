# Challenge 4: Composite inventory-row checksum per warehouse and category

## Required result

- Build a row-level integer checksum from `ProductName`, `QuantityOnHand`, and `UnitCost`.
- Aggregate those row checksums for each warehouse-and-category combination.
- Keep each snapshot row.
- Sort by `WarehouseName`, `Category`, and `SnapshotID`.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `SnapshotID`
- `WarehouseName`
- `Category`
- `ProductName`
- `QuantityOnHand`
- `UnitCost`
- `InventoryDataChecksum`

## Skills practiced

- Nested `CHECKSUM(...)` inside `CHECKSUM_AGG(...)`
- Checksum of multiple data columns

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
