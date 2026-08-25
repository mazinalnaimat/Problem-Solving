# Explanation — Challenge 39

## Goal

Return one row per customer showing the first and second non-cancelled order date, values, gap in days, and value change.

## Main approach

At order grain, `ROW_NUMBER` identifies the first order and `LEAD` places second-order facts on the same row. The outer query keeps only sequence 1.

## Window functions used

- `ROW_NUMBER`
- `LEAD`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
