# Explanation: Filter machines by a window count using a CTE

## Approach

- Window functions are calculated in the CTE first.
- The outer query can then filter the calculated alias safely.

## Main ideas

- Filtering a window result in an outer query
- CTE-based window-function workflow

Review `Solution.sql` only after attempting the challenge yourself.
