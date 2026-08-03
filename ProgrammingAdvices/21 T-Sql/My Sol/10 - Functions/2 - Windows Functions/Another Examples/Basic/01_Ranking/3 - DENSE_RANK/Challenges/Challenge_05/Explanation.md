# Challenge 5: Dense-rank estimated task hours per project.

## Function

`DENSE_RANK`

## Type

Challenge solution

## Idea

Ranks rows like RANK, but without gaps after ties.

Remember: ties receive the same rank, but the next rank does not skip numbers.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
