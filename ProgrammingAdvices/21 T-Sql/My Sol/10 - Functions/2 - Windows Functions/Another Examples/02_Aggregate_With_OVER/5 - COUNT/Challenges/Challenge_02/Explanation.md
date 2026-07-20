# Explanation: Running trip count for each driver

## Approach

- The partition restarts the running count for every driver.
- The explicit `ROWS` frame starts at the first trip in the driver partition and ends at the current row.

## Main ideas

- `PARTITION BY` with a running frame
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

Review `Solution.sql` only after attempting the challenge yourself.
