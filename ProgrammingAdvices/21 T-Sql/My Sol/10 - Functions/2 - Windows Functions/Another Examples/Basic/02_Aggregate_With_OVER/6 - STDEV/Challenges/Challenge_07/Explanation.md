# Explanation: Running average and sample deviation of website revenue

## Approach

- The CTE computes reusable running statistics.
- The outer query measures how far the current value sits above or below its running average.

## Main ideas

- Combining `AVG()` with `STDEV()`
- Using a CTE for calculations based on window aliases

Review `Solution.sql` only after attempting the challenge yourself.
