# Challenge 12: Same-Day Customer Order Sequence

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Order operations needs to see customers who placed multiple orders on the same day and the sequence of those orders.

## Task

Return all orders from customer-days containing at least two orders, with a daily sequence number and daily order count.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `OrderDate`
3. `OrderNumber`
4. `DailyOrderSequence`
5. `DailyOrderCount`

## Business rules and constraints

- Include every order status.
- Sequence by OrderID within the day.
- Use both `ROW_NUMBER` and `COUNT OVER`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CustomerNumber, OrderDate, DailyOrderSequence
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
