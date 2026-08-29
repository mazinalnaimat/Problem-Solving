# Explanation — Challenge 49

## Goal

Return one row per customer with first and latest order date and value.

## Main approach

The full-partition frame is essential for `LAST_VALUE`; without it, the default frame often returns the current row. `DISTINCT` reduces repeated boundary values to one customer row.

## Window functions used

- `FIRST_VALUE`
- `LAST_VALUE`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
