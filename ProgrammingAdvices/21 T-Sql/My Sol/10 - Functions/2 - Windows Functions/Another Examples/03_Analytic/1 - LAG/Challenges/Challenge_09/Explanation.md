# Explanation

## Main ideas

- `LAG` reads a value from a different row without a self-join.
- `PARTITION BY MachineCode` prevents values from crossing group boundaries.
- `ORDER BY ReadingTime, ReadingID` defines what previous means.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
