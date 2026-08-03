# Explanation

## Main ideas

- `LAST_VALUE` returns the value at the last position in the window frame.
- Ordering by `RaceDate, ResultID` defines the last row.
- An explicit full-partition frame avoids default-frame surprises.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
