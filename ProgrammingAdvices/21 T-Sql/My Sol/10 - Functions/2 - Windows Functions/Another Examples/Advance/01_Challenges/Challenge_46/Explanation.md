# Explanation — Challenge 46

## Goal

Calculate the running quantity balance for each warehouse-product pair after every transaction.

## Main approach

The partition isolates each warehouse-product ledger. The deterministic two-column order and explicit `ROWS` frame make the running balance correct even when multiple transactions share a timestamp.

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
