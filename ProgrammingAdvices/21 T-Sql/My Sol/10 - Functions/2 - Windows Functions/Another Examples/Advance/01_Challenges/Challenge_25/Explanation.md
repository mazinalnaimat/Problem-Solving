# Explanation — Challenge 25

## Goal

Calculate monthly cancellation percentage per sales channel and a moving average over the current and previous two active months.

## Main approach

Monthly counts are converted to a rate before the moving window is applied. The explicit frame gives a three-row active-month trend.

## Window functions used

- `AVG`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
