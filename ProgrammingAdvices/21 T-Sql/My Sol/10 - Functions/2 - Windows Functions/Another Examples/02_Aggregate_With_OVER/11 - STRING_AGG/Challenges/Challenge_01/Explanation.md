# Explanation: One alphabetic list of all distinct machine codes

## Approach

- The CTE removes duplicates because `STRING_AGG` itself has no `DISTINCT` keyword in SQL Server.
- Without `GROUP BY`, all CTE rows become one string.

## Main ideas

- Global `STRING_AGG` without `GROUP BY`
- Distinct preprocessing with a CTE

Review `Solution.sql` only after attempting the challenge yourself.
