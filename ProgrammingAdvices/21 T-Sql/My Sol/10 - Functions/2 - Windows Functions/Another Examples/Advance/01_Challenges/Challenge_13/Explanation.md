# Explanation — Challenge 13

## Goal

Collapse multiple shipments per order and report first ship time, final delivery time, shipment count, fulfillment hours, and delay days.

## Main approach

Window functions collapse shipment facts without grouping away the representative row. The row-number filter returns one order-level result after all partition metrics are available.

## Window functions used

- `ROW_NUMBER`
- `COUNT`
- `MIN`
- `MAX`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
