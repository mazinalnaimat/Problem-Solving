# Challenge 36: Order Lifecycle Bottleneck Stage

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Process improvement wants the status stage that consumed the most time for each completed lifecycle.

## Task

Calculate the duration from each status event to the next event and return the longest-duration stage for each order.

## Input tables

- `dbo.SalesOrders`
- `dbo.OrderStatuses`
- `dbo.OrderStatusHistory`

## Output columns

Return the columns in this exact order:

1. `OrderNumber`
2. `BottleneckStatus`
3. `StageStartedAt`
4. `NextStatusAt`
5. `StageHours`

## Business rules and constraints

- Ignore the final history row because it has no next event.
- Sequence by ChangedAt and OrderStatusHistoryID.
- Use `LEAD` and `ROW_NUMBER`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY StageHours DESC, OrderNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
