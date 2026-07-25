# Explanation: Running population variance of packages by route

## Approach

- `PARTITION BY RouteCode` creates an independent running calculation for each group.
- The unique ID breaks ties when multiple rows share the same date.

## Main ideas

- Ordered `VARP()` with one partition column
- A deterministic calculation order

Review `Solution.sql` only after attempting the challenge yourself.
