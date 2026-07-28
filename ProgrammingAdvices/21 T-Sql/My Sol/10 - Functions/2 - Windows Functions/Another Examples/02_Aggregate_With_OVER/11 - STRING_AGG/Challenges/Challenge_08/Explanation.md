# Explanation: Buildings with multiple meter types only

## Approach

- The CTE ensures each meter type is counted once per building.
- `HAVING` filters after grouping, unlike `WHERE`, which filters source rows.

## Main ideas

- `HAVING` after grouped string aggregation
- Filtering grouped results

Review `Solution.sql` only after attempting the challenge yourself.
