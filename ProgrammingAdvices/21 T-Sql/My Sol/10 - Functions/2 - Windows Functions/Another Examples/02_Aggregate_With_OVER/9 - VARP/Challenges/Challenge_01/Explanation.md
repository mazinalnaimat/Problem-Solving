# Explanation: Overall running population variance of defect count

## Approach

- All filtered rows form one ordered calculation stream.
- The statistic grows as more rows enter the ordered window.

## Main ideas

- Global ordered `VARP()` window
- An analytic window without `PARTITION BY`

Review `Solution.sql` only after attempting the challenge yourself.
