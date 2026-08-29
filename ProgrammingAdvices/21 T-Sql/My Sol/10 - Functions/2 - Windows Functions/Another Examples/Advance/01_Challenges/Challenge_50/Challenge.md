# Challenge 50: Long Customer Inactivity Gaps

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

CRM staff want to identify customers who returned after a long period without ordering.

## Task

Return every non-cancelled order whose gap from the customer's previous non-cancelled order is more than 45 days.

## Input tables

- `dbo.Customers`
- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `CustomerNumber`
2. `OrderNumber`
3. `OrderDate`
4. `PreviousOrderDate`
5. `GapDays`

## Business rules and constraints

- Previous means earlier by OrderDate, then OrderID.
- Ignore cancelled orders before calculating the sequence.
- Use `LAG`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY GapDays DESC, CustomerNumber, OrderDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
