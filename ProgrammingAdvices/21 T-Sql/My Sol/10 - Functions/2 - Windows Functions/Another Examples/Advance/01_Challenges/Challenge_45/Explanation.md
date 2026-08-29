# Explanation — Challenge 45

## Goal

Calculate valid-order revenue per salesperson and month, then rank all salespeople inside that month.

## Main approach

Order totals prevent the header discount from being repeated across lines. The monthly totals are then ranked in a separate CTE.

## Window functions used

- `RANK`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
