# Explanation — Challenge 21

## Goal

Reconstruct running stock, group consecutive out-of-stock transaction intervals, and return the longest period for each warehouse-product pair.

## Main approach

The query builds an event-level stock ledger, converts events into time intervals, detects transitions into the out-of-stock state, groups consecutive intervals, and ranks the resulting periods.

## Window functions used

- `ROW_NUMBER`
- `LAG`
- `LEAD`
- `SUM`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
