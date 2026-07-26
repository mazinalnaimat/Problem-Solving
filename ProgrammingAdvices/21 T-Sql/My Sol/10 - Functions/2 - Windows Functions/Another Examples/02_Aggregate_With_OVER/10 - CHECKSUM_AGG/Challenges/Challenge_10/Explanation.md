# Explanation: Closed-ticket checksums calculated in a CTE

## Approach

- The `WHERE` clause changes which rows enter each team checksum.
- The CTE makes the filtering stage and final presentation easy to distinguish.

## Main ideas

- Filtering before a window calculation
- CTE organization with `CHECKSUM_AGG`

Review `Solution.sql` only after attempting the challenge yourself.
