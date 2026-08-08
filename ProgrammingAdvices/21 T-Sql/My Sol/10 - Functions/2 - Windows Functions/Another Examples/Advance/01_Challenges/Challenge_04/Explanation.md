# Explanation — Challenge 04

## Goal

Calculate customer revenue by region and return all customers needed to cross the regional 80% threshold.

## Main approach

This is a regional Pareto curve. The previous cumulative percentage is the correct filter when the crossing customer must be included.

## Window functions used

- `ROW_NUMBER`
- `SUM`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
