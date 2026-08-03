# Challenge 4: Conditional population variance of positive unit costs

## Required result

- Calculate the running population variance using only rows where `UnitCost` is greater than zero.
- Keep rows that do not satisfy the condition in the final output; they simply contribute `NULL` to the statistic.
- Restart for each WarehouseName-and-Category group.
- Sort by `WarehouseName`, `Category`, `SnapshotDate`, and `SnapshotID`.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `SnapshotID`
- `WarehouseName`
- `Category`
- `SnapshotDate`
- `UnitCost`
- `ConditionalRunningUnitCostPopulationVariance`

## Skills practiced

- Conditional input to `VARP()` using `CASE`
- Keeping excluded detail rows while excluding their values from the statistic

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
