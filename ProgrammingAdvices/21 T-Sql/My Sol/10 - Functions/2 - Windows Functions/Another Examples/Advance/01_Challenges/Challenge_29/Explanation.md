# Explanation — Challenge 29

## Goal

Rank products by net sales revenue inside each category and return all products whose dense rank is 1, 2, or 3.

## Main approach

Revenue must first be grouped to one row per product. `DENSE_RANK` is then partitioned by category, which preserves ties and produces a business-friendly top-three result.

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
