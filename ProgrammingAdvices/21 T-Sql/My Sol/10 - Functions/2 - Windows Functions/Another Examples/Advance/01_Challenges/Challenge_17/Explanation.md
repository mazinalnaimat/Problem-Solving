# Explanation — Challenge 17

## Goal

Flag customers whose time since last order is more than twice their median historical gap.

## Main approach

Historical gaps are created with `LAG`, and each customer's median is calculated with an ordered-set window function. The final comparison adapts the churn threshold to individual cadence.

## Window functions used

- `LAG`
- `PERCENTILE_CONT`
- `COUNT`
- `MAX`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
