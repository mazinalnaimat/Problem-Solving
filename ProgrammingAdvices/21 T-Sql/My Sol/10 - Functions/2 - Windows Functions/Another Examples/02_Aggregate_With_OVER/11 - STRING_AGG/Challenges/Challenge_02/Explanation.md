# Explanation: Distinct route codes listed per depot

## Approach

- Distinct depot-route pairs are prepared first.
- The outer query creates one ordered route list for each depot.

## Main ideas

- Grouped `STRING_AGG`
- Ordering values with `WITHIN GROUP`

Review `Solution.sql` only after attempting the challenge yourself.
