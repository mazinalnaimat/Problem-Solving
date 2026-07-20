# Explanation: Delayed-trip percentage for every route

## Approach

- The CTE calculates both route counts without removing detail rows.
- The outer query converts the two counts into a percentage and protects the division with `NULLIF`.

## Main ideas

- Conditional and unconditional window counts
- Reusing window results through a CTE
- Percentage calculation with `NULLIF`

Review `Solution.sql` only after attempting the challenge yourself.
