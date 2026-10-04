# Explanation — Challenge 53

## Goal

For every customer, find the most-used successful payment method using `OUTER APPLY`, then rank customers inside their segment by the number of successful payments made with that method.

## Recommended approach

1. Build one or more CTEs that reduce the base tables to the correct business grain.
2. Apply the requested set-based SQL technique(s) before using the window function.
3. Use the window function only after the data is at the intended grain.
4. Apply the business filters and deterministic final ordering last.

## Important review points

- Check whether cancelled orders, failed payments, rejected returns, or incomplete rows should be excluded.
- Protect divisions with `NULLIF` where a zero denominator is possible.
- Keep date boundaries explicit; do not rely on implicit datetime conversions.
- Add a stable tie-breaker to ranking/sequence logic when the business value can tie.
