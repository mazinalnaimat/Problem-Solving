# Explanation — Challenge 15

## Goal

Calculate every valid order's percentage share of its customer's lifetime order value.

## Main approach

Order-level values are calculated first. A partition-only `SUM OVER` repeats the customer lifetime total beside every order, allowing a direct percentage calculation.

## Window functions used

- `SUM`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
