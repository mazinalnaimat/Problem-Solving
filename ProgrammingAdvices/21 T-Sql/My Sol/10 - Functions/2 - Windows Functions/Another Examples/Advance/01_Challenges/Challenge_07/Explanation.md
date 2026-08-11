# Explanation — Challenge 07

## Goal

Compare each order line's unit price with the previous sale of the same product and return changes of at least 10%.

## Main approach

Each product receives its own chronological price stream. The outer query compares the current price to the prior price and applies the ten-percent threshold.

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
