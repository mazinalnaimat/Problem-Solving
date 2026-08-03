# Explanation: Three-ticket moving count of resolved tickets

## Approach

- `COUNT(ResolutionMinutes)` ignores tickets whose resolution value is `NULL`.
- The frame can contain at most three rows: two previous rows plus the current row.

## Main ideas

- A fixed-size moving window
- Difference between `COUNT(column)` and `COUNT(*)`

Review `Solution.sql` only after attempting the challenge yourself.
