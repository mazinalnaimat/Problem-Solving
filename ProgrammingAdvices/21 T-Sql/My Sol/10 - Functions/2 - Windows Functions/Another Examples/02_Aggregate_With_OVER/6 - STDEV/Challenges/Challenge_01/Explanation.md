# Explanation: Overall running sample deviation of machine temperature

## Approach

- All filtered rows form one ordered calculation stream.
- The first row returns `NULL` for sample statistics when the function requires more than one value.

## Main ideas

- Global ordered `STDEV()` window
- An analytic window without `PARTITION BY`

Review `Solution.sql` only after attempting the challenge yourself.
