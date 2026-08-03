# Explanation: Overall machine-reading count without partitioning

## Approach

- `OVER()` treats every row returned by the `FROM` and `WHERE` clauses as one window.
- Because there is no calculation `ORDER BY`, the same total is repeated beside every detail row.

## Main ideas

- `COUNT(*) OVER()` across the complete result set
- A window with no partition and no calculation order

Review `Solution.sql` only after attempting the challenge yourself.
