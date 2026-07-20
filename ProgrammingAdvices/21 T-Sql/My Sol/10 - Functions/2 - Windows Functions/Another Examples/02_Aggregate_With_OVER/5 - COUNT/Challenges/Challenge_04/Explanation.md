# Explanation: Compare all snapshots with snapshots that contain quantity

## Approach

- Both calculations use the same partition but count different things.
- This reveals whether a group contains rows whose quantity is missing.

## Main ideas

- Multiple window aggregates in one query
- Comparing `COUNT(*)` with `COUNT(expression)`

Review `Solution.sql` only after attempting the challenge yourself.
