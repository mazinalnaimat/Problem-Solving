# Explanation — Challenge 22

## Goal

Calculate each customer's monthly net order value and compare it with that customer's previous active month.

## Main approach

`OrderTotals` creates one business value per order. `MonthlySpend` then aggregates at customer-month grain. `LAG` reads the immediately previous active month within each customer without collapsing the current row.

## Window functions used

- `LAG`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
