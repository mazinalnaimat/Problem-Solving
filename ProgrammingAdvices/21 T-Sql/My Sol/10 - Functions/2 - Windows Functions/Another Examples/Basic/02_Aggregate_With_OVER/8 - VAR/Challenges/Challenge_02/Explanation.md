# Explanation: Running sample variance of fuel by driver

## Approach

- `PARTITION BY DriverName` creates an independent running calculation for each group.
- The unique ID breaks ties when multiple rows share the same date.

## Main ideas

- Ordered `VAR()` with one partition column
- A deterministic calculation order

Review `Solution.sql` only after attempting the challenge yourself.
