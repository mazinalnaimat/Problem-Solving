# Explanation

## Main ideas

- `MAX` is evaluated over a window, so detail rows are preserved.
- `PARTITION BY WarehouseName, Category` restarts the calculation for each logical group.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
