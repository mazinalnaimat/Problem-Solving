# Explanation

## Main ideas

- `MIN` is evaluated over a window, so detail rows are preserved.
- `PARTITION BY Depot, RouteCode` restarts the calculation for each logical group.
- The frame `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` controls which neighboring rows participate.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
