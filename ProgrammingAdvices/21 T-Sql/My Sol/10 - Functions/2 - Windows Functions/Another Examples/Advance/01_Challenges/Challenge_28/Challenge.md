# Challenge 28: RFM Customer Scoring

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Marketing wants a five-band Recency, Frequency, Monetary score for every customer with valid orders.

## Task

Calculate R, F, and M quintile scores and a three-digit RFM code.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `DaysSinceLastOrder`
3. `OrderCount`
4. `LifetimeValue`
5. `RecencyScore`
6. `FrequencyScore`
7. `MonetaryScore`
8. `RFMCode`

## Business rules and constraints

- Use one analysis date equal to maximum valid OrderDate plus one day.
- Higher score is always better.
- Use `NTILE(5)` for all three metrics.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY RFMCode DESC, LifetimeValue DESC, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
