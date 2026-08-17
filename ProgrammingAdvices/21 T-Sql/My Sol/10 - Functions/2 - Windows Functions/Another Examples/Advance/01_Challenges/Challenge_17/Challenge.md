# Challenge 17: Churn Warning from Median Purchase Gap

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

CRM wants a behavioral churn signal based on each customer's normal ordering rhythm rather than one global threshold.

## Task

Flag customers whose time since last order is more than twice their median historical gap.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `OrderCount`
3. `LastOrderDate`
4. `MedianGapDays`
5. `DaysSinceLastOrder`
6. `GapMultiple`

## Business rules and constraints

- Exclude cancelled orders.
- Require at least three valid orders and at least two measurable gaps.
- Analysis date is maximum valid OrderDate plus 60 days.
- Use `LAG` and `PERCENTILE_CONT`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY GapMultiple DESC, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
