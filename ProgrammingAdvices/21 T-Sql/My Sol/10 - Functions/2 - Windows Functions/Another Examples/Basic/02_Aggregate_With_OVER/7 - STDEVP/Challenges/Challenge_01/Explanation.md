# Explanation: Overall running population deviation of vibration

## Approach

- All filtered rows form one ordered calculation stream.
- The statistic grows as more rows enter the ordered window.

## Main ideas

- Global ordered `STDEVP()` window
- An analytic window without `PARTITION BY`

Review `Solution.sql` only after attempting the challenge yourself.
