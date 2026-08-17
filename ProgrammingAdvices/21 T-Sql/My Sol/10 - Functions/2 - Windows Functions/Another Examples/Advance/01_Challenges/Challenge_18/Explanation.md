# Explanation — Challenge 18

## Goal

Calculate each purchase order's quantity fill percentage and rank purchase orders within each supplier.

## Main approach

Line quantities are summed at purchase-order grain. The resulting fill percentage is ranked separately for each supplier.

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
