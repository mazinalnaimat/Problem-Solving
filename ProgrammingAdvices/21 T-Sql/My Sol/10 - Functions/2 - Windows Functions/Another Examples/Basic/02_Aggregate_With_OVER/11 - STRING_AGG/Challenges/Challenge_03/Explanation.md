# Explanation: Inventory snapshot descriptions per warehouse and category

## Approach

- `CONCAT` builds a readable string for each source row.
- `STRING_AGG` joins those descriptions in snapshot order.

## Main ideas

- Aggregating formatted expressions
- Multi-column grouping and ordered concatenation

Review `Solution.sql` only after attempting the challenge yourself.
