# Challenge 22: Customer Monthly Spend Change

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

A commercial manager wants to see whether each customer's monthly purchasing value is growing or shrinking.

## Task

Calculate each customer's monthly net order value and compare it with that customer's previous active month.

## Input tables
- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `FullName`
3. `MonthStart`
4. `MonthlySpend`
5. `PreviousMonthSpend`
6. `SpendChange`

## Business rules and constraints

- Exclude cancelled orders.
- Net line value is Quantity × UnitPrice × (1 - DiscountPercent / 100), minus the order-level discount.
- Use `LAG` inside a CTE; do not use a self-join to fetch the previous month.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CustomerNumber, MonthStart
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
