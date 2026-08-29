# Explanation — Challenge 50

## Goal

Return every non-cancelled order whose gap from the customer's previous non-cancelled order is more than 45 days.

## Main approach

Filtering cancelled orders inside the CTE ensures they never affect the customer timeline. `LAG` gives the prior valid order date, and the outer query applies the 45-day business rule.

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
