# Explanation: Checksum only paid payment IDs while keeping all rows

## Approach

- The `CASE` contributes an ID only for paid rows.
- Other payment rows remain visible but contribute `NULL`, which the aggregate ignores.

## Main ideas

- Conditional checksum input with `CASE`
- Ignoring values by returning `NULL`

Review `Solution.sql` only after attempting the challenge yourself.
