# Explanation — Challenge 33

## Goal

Calculate sale-issue consumption value, sort products by value, and classify A up to 80%, B up to 95%, and C above 95%.

## Main approach

The running value curve is calculated independently per warehouse. Business classes are assigned from the cumulative share of consumption value.

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
