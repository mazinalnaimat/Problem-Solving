# Explanation

## Main ideas

- `LEAD` reads a value from a different row without a self-join.
- `PARTITION BY SiteName, Channel` prevents values from crossing group boundaries.
- `ORDER BY VisitDate, TrafficID` defines what next means.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
