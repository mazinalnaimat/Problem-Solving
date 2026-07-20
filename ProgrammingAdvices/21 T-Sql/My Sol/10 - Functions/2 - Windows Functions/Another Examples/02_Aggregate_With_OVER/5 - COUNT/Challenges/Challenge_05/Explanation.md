# Explanation: Remaining paid payments from the current row forward

## Approach

- The frame begins at the current payment and ends at the final payment for that customer.
- The `CASE` returns a value only for paid rows, so other statuses are ignored by `COUNT`.

## Main ideas

- A forward-looking window frame
- Conditional counting with `CASE`

Review `Solution.sql` only after attempting the challenge yourself.
