# Explanation: Global checksum of all machine-reading IDs

## Approach

- `OVER()` repeats the same checksum beside every returned detail row.
- The checksum is based only on the integer IDs.

## Main ideas

- `CHECKSUM_AGG(...) OVER()` across the complete result
- A checksum window with no partition

Review `Solution.sql` only after attempting the challenge yourself.
