# Challenge 5: Rank salespeople by total order amount.

## Function

`RANK`

## Type

Challenge solution

## Idea

Ranks rows, but equal values share the same rank and gaps appear after ties.

Remember: ties receive the same rank, and the next rank can skip numbers.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
