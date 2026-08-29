# Explanation — Challenge 47

## Goal

Build a complete date spine and calculate each channel's revenue over the current day and previous 29 calendar days.

## Main approach

A date spine is necessary because `ROWS 29 PRECEDING` counts rows, not elapsed time. Filling zero-order dates turns 30 rows into 30 calendar days.

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
