# Explanation — Challenge 01

## Goal

Count valid orders per customer and calculate `PERCENT_RANK` inside each customer segment.

## Main approach

The left join retains customers with no orders. `PERCENT_RANK` then positions each customer's count relative to others in the same segment.

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
