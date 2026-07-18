# Explanation: Apply temporary data changes and calculate cumulative daily totals

The challenge uses two calculation stages.

First, the CTE groups raw transactions by branch and date:

```sql
SUM(Amount) AS DailyTotal
```

This produces one row per branch per date.

Second, window functions operate on the daily rows:

- `SUM(DailyTotal) OVER (PARTITION BY Branch ORDER BY TransactionDate ROWS ...)` produces a cumulative daily total.
- `SUM(DailyTotal) OVER (PARTITION BY Branch)` produces the complete total for the branch and repeats it on every date.

The `INSERT` and `UPDATE` are visible to the query because it runs inside the same transaction. `ROLLBACK` then removes both practice changes.
