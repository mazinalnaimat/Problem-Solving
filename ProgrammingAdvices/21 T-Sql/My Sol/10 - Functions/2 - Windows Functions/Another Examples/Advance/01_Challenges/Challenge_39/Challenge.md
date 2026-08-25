# Challenge 39: First and Second Order Comparison

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Customer success wants a simple onboarding metric: how quickly and how strongly a customer returned after the first purchase.

## Task

Return one row per customer showing the first and second non-cancelled order date, values, gap in days, and value change.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `FirstOrderDate`
3. `FirstOrderValue`
4. `SecondOrderDate`
5. `SecondOrderValue`
6. `DaysToSecondOrder`
7. `ValueChange`

## Business rules and constraints

- Exclude cancelled orders.
- Only customers with at least two valid orders should appear.
- Use `ROW_NUMBER` and `LEAD`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY DaysToSecondOrder, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
