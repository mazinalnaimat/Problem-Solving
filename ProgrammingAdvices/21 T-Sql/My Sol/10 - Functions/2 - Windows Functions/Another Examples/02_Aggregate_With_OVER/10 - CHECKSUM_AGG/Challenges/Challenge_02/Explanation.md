# Explanation: Reading-ID checksum per production line

## Approach

- Each production line receives its own aggregate checksum.
- All rows in the same line show the same calculated value.

## Main ideas

- Partitioned `CHECKSUM_AGG`
- Checksum per business group

Review `Solution.sql` only after attempting the challenge yourself.
