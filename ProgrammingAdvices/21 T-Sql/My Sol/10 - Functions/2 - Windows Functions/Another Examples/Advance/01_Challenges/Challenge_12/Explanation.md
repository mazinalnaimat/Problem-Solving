# Explanation — Challenge 12

## Goal

Return all orders from customer-days containing at least two orders, with a daily sequence number and daily order count.

## Main approach

Both windows use the same customer-day partition. `COUNT` identifies qualifying days, while `ROW_NUMBER` provides the stable operational sequence.

## Window functions used

- `ROW_NUMBER`
- `COUNT`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
