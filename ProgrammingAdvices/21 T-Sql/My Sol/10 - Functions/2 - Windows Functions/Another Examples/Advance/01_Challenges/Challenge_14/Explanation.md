# Explanation — Challenge 14

## Goal

Group consecutive negative transactions and return the longest negative streak per warehouse-product.

## Main approach

A cumulative count of non-negative rows increments the island key whenever a streak ends. Negative rows sharing the same key form one streak, which is then ranked per ledger.

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
