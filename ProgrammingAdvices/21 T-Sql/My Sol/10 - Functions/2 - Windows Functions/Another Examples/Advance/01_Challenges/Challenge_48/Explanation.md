# Explanation — Challenge 48

## Goal

Return each delivered shipment with the previous delivered-shipment timestamp and gap in hours for the same warehouse.

## Main approach

`LAG` creates a delivery timeline independently for every warehouse. The deterministic tie-breaker prevents ambiguous previous rows.

## Window functions used

- `LAG`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
