# Explanation

## Main ideas

- `PERCENTILE_CONT` returns a continuous, interpolated percentile.
- The percentile fraction is `0.70`.
- `PARTITION BY ProductionLine` calculates a separate percentile for each group.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
