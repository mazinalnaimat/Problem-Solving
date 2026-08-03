# Challenge 3: Inventory snapshot descriptions per warehouse and category

## Required result

- Return one row for each warehouse-and-category combination.
- Format every item as `ProductName [quantity @ cost]`.
- Separate items with `; `.
- Order items by snapshot date and snapshot ID.

## Table(s)

- `dbo.InventorySnapshots`

## Columns to show

- `WarehouseName`
- `Category`
- `SnapshotDescriptions`

## Skills practiced

- Aggregating formatted expressions
- Multi-column grouping and ordered concatenation

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
