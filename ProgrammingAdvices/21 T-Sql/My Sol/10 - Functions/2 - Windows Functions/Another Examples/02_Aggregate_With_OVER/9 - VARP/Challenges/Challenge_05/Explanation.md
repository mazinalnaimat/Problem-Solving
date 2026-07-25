# Explanation: Reverse-running population variance of seats by country

## Approach

- The `ORDER BY` inside `OVER()` runs newest-to-oldest.
- The final `ORDER BY` can still display oldest-to-newest, proving that the two orders have different jobs.

## Main ideas

- Descending analytic `VARP()` order
- Separating calculation order from display order

Review `Solution.sql` only after attempting the challenge yourself.
