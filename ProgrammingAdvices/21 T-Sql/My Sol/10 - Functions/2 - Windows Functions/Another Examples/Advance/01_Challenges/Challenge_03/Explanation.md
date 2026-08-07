# Explanation — Challenge 03

## Goal

Count tickets created within 14 days after each valid order and flag orders above twice the average ticket count of the customer's previous five orders.

## Main approach

The first CTE creates one support-count observation per order. A prior-five-order frame builds a customer-specific baseline without including the current order.

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
