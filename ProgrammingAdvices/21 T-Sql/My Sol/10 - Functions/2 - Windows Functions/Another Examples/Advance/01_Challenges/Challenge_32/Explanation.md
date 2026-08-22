# Explanation — Challenge 32

## Goal

Classify each valid order as New or Returning based on customer order sequence, then calculate monthly revenue share for both classes.

## Main approach

`ROW_NUMBER` creates the lifecycle classification at order grain. After monthly aggregation, a partition total supplies the denominator for the revenue mix.

## Window functions used

- `ROW_NUMBER`
- `SUM`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
