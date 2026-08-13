# Explanation — Challenge 11

## Goal

Calculate customer average order value, segment median of those customer averages, difference, and segment percentile rank.

## Main approach

The query first creates one statistically valid observation per customer. Both median and percentile are then calculated within segment.

## Window functions used

- `PERCENT_RANK`
- `PERCENTILE_CONT`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
