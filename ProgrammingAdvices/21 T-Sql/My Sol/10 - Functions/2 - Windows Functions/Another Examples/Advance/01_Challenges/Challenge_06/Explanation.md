# Explanation — Challenge 06

## Goal

Build unique product pairs per order, count pair support, and return the ten highest-ranked pairs.

## Main approach

The self-join creates one canonical unordered pair. Aggregation counts order support, and dense ranking keeps ties at the top-ten rank boundary.

## Window functions used

- `DENSE_RANK`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
