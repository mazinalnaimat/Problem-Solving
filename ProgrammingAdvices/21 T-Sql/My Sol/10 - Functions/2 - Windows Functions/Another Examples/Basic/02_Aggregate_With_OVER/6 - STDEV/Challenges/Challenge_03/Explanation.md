# Explanation: Running sample deviation of resolution time by team

## Approach

- A column partition creates a separate statistical history for each column value.
- The outer `ORDER BY` mirrors the calculation grouping for easier checking.

## Main ideas

- Ordered `STDEV()` with a column partition
- Composite grouping inside `OVER()`

Review `Solution.sql` only after attempting the challenge yourself.
