# Explanation — Challenge 26

## Goal

Build a date spine, calculate rolling seven-day revenue, then flag values above 150% of the average of the previous four rolling-seven-day values.

## Main approach

This uses two window layers: one creates rolling weekly revenue, and the next compares that metric with its own prior four values. The date spine keeps every frame calendar-correct.

## Window functions used

- `SUM`
- `AVG`
- `COUNT`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
