# Challenge 15: Order Share of Customer Lifetime Value

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Account managers want to understand how much each order contributes to the customer's total valid-order value.

## Task

Calculate every valid order's percentage share of its customer's lifetime order value.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `OrderNumber`
3. `OrderDate`
4. `OrderValue`
5. `CustomerLifetimeValue`
6. `OrderSharePercent`

## Business rules and constraints

- Exclude cancelled orders.
- Calculate order value before the lifetime total.
- Use `SUM OVER`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CustomerNumber, OrderDate, OrderNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
