# Challenge 38: Orders Above the Previous Three-Order Average

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Fraud and sales teams want to flag unusually large purchases relative to a customer's recent behavior.

## Task

Find orders whose value is at least 50% greater than the average value of the customer's previous three valid orders.

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
5. `PreviousThreeAverage`
6. `PercentAboveAverage`

## Business rules and constraints

- Exclude cancelled orders.
- The current order must not be included in the average.
- Require three previous orders.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY PercentAboveAverage DESC, CustomerNumber, OrderDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
