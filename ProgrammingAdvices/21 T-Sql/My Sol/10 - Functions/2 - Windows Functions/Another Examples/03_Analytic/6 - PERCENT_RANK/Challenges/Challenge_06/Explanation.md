# Explanation

## Main ideas

- `PERCENT_RANK` returns a decimal between 0 and 1.
- Rows are compared only inside `EventName`.
- Ties share the same ordering position according to `FinishSeconds`.

## Suggested process

1. Start with the source table and select the detail columns.
2. Add the required window or aggregate function.
3. Verify the partition, ordering, and frame against the task.
4. Compare your result with `Solution.sql` only after trying it yourself.
