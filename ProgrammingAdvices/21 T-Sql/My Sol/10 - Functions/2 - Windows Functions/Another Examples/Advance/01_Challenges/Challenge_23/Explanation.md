# Explanation — Challenge 23

## Goal

Calculate sold quantity, completed-return quantity, return rate, and percentile position by category.

## Main approach

Sales and returns are aggregated independently to avoid fan-out. The return ratio is then positioned relative to products in the same category.

## Window functions used

- `PERCENT_RANK`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
