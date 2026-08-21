# Explanation — Challenge 28

## Goal

Calculate R, F, and M quintile scores and a three-digit RFM code.

## Main approach

The analysis date is data-driven and reproducible. Ordering recency descending means the most recent customers receive the highest tile, matching the direction of frequency and monetary scores.

## Window functions used

- `NTILE`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
