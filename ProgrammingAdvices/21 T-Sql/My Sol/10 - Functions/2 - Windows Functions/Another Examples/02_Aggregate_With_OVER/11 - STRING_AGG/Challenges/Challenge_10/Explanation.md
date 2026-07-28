# Explanation: Multiline list of distinct delayed drivers per depot

## Approach

- The separator is a Windows-style line break instead of a comma.
- The CTE prevents a driver from appearing repeatedly because of multiple delayed trips.

## Main ideas

- Using line-break separators
- Filtering and deduplicating before `STRING_AGG`

Review `Solution.sql` only after attempting the challenge yourself.
