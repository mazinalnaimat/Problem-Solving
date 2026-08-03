# Explanation: Route-and-trip-count summaries per depot

## Approach

- The first aggregation creates one row per route with its trip count.
- The second aggregation converts route summaries into one depot string.

## Main ideas

- Two-stage aggregation
- Aggregating pre-grouped summary rows

Review `Solution.sql` only after attempting the challenge yourself.
