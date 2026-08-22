# Challenge 32: New versus Returning Customer Revenue Mix

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Growth leadership wants the monthly revenue mix from first-time buyers versus customers who have ordered before.

## Task

Classify each valid order as New or Returning based on customer order sequence, then calculate monthly revenue share for both classes.

## Input tables

- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `MonthStart`
2. `CustomerType`
3. `OrderCount`
4. `Revenue`
5. `RevenueSharePercent`

## Business rules and constraints

- Exclude cancelled orders.
- A customer's first valid order is New; all later valid orders are Returning.
- Use `ROW_NUMBER` and a window total.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY MonthStart, CustomerType
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
