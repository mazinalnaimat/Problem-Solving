# Explanation — Challenge 35

## Goal

Rank supplier quotations by unit cost within each product and return dense ranks 1 through 3.

## Main approach

The supplier filter is applied before ranking. `DENSE_RANK` keeps all equal-price quotations and does not arbitrarily remove a tied supplier.

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
