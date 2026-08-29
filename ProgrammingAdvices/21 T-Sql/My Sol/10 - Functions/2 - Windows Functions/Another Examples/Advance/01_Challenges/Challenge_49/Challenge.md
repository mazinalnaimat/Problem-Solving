# Challenge 49: Customer First and Latest Order Values

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Account managers need a compact summary of how each customer's first valid order compares with the latest valid order.

## Task

Return one row per customer with first and latest order date and value.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `FirstOrderDate`
3. `FirstOrderValue`
4. `LatestOrderDate`
5. `LatestOrderValue`
6. `ValueChange`

## Business rules and constraints

- Exclude cancelled orders.
- Use `FIRST_VALUE` and `LAST_VALUE`.
- For `LAST_VALUE`, explicitly define the full partition frame.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
