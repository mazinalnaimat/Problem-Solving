# Explanation: Conditional population variance of positive unit costs

## Approach

- The `CASE` expression decides which numeric values enter the aggregate.
- Rows that fail the condition remain visible because the condition is not placed in `WHERE`.

## Main ideas

- Conditional input to `VARP()` using `CASE`
- Keeping excluded detail rows while excluding their values from the statistic

Review `Solution.sql` only after attempting the challenge yourself.
