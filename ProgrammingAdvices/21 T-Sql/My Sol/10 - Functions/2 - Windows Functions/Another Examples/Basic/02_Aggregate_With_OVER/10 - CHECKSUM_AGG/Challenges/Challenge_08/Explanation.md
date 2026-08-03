# Explanation: Distinct driver-name checksum per depot using grouped rows

## Approach

- This challenge intentionally returns grouped rows rather than detail rows.
- `DISTINCT` is applied to the integer checksum values before aggregation.

## Main ideas

- Regular grouped `CHECKSUM_AGG`
- `DISTINCT` inside an aggregate without `OVER()`

Review `Solution.sql` only after attempting the challenge yourself.
