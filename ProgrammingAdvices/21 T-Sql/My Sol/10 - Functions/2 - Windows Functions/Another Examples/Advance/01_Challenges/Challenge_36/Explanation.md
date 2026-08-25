# Explanation — Challenge 36

## Goal

Calculate the duration from each status event to the next event and return the longest-duration stage for each order.

## Main approach

`LEAD` transforms status events into measurable intervals. Ranking those intervals inside each order identifies the process bottleneck.

## Window functions used

- `ROW_NUMBER`
- `LEAD`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
