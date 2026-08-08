# Explanation — Challenge 05

## Goal

Calculate each active product's gross margin percentage and dense rank inside its brand from highest margin to lowest.

## Main approach

The CTE isolates the reusable margin formula. Ranking by brand produces a comparable product position without mixing brands with different pricing strategies.

## Window functions used

- `DENSE_RANK`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
