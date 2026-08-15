# Explanation — Challenge 16

## Goal

Use a recursive employee hierarchy, aggregate descendant sales revenue by manager and month, then rank managers within each month.

## Main approach

The recursive CTE creates manager-to-descendant mappings. Revenue is joined through the descendant employee and then ranked at manager-month grain.

## Window functions used

- `RANK`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
