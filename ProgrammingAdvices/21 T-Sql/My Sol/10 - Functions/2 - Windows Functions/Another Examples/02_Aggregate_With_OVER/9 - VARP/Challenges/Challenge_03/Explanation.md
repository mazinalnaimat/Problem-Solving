# Explanation: Running population variance of satisfaction by team and priority

## Approach

- A multi-column partition creates a separate statistical history for each unique combination.
- The outer `ORDER BY` mirrors the calculation grouping for easier checking.

## Main ideas

- Ordered `VARP()` with a multi-column partition
- Composite grouping inside `OVER()`

Review `Solution.sql` only after attempting the challenge yourself.
