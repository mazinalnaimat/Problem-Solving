# Explanation — Challenge 09

## Goal

Find each customer's longest consecutive active-month streak and return its start month, end month, and length.

## Main approach

Distinct active months are numbered per customer. Subtracting the sequence from the month creates a constant key for consecutive months. A second window selects the longest island per customer.

## Window functions used

- `ROW_NUMBER`

## Why the CTE matters

The CTE separates the business grain needed for the calculation from the final filtering and presentation. This avoids applying a window function at the wrong grain and keeps the query testable in stages.

## Common mistakes

- Calculating the window before grouping to the required business grain.
- Omitting a deterministic tie-breaker such as an identity key.
- Filtering rows too early and accidentally changing the window population.
- Using the default frame when an explicit `ROWS` frame is required.
- Repeating header-level values, such as an order discount, once for every line.
