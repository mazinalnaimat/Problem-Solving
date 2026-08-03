# Explanation: Sample deviation of daily average defects by production line

## Approach

- The first query level changes the grain from detail rows to daily rows.
- The outer query applies the analytic statistic to the daily averages.

## Main ideas

- Aggregate first, then apply a window function
- CTE with grouped rows feeding an analytic statistic

Review `Solution.sql` only after attempting the challenge yourself.
