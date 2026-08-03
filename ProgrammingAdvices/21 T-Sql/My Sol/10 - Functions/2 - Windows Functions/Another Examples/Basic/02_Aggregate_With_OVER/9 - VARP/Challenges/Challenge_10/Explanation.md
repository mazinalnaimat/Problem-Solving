# Explanation: Compare full-team and running population variance of points

## Approach

- The CTE produces one statistic per group.
- The outer query keeps the detail grain and adds both the full-group and running values.

## Main ideas

- Comparing grouped aggregation with analytic aggregation
- Joining group-level statistics back to detail rows

Review `Solution.sql` only after attempting the challenge yourself.
