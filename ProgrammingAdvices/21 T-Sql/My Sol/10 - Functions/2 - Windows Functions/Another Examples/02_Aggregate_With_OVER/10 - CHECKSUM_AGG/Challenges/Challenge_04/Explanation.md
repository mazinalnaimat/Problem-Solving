# Explanation: Composite inventory-row checksum per warehouse and category

## Approach

- `CHECKSUM` converts several row values into one integer.
- `CHECKSUM_AGG` then combines those integers for the partition.

## Main ideas

- Nested `CHECKSUM(...)` inside `CHECKSUM_AGG(...)`
- Checksum of multiple data columns

Review `Solution.sql` only after attempting the challenge yourself.
