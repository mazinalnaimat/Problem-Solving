# Explanation — Challenge 38

## Goal

Find orders whose value is at least 50% greater than the average value of the customer's previous three valid orders.

## Main approach

The frame ends at `1 PRECEDING`, so the current order cannot influence its own baseline. A windowed count guarantees that the baseline contains exactly three earlier orders.

## Window functions used

- `AVG`
- `COUNT`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
