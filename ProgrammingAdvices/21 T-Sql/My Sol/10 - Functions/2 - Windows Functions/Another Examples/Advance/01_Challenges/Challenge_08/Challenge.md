# Challenge 08: Failed Payments Followed by Recovery

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Finance wants to measure successful payment recovery after a failed attempt.

## Task

Return every completed payment whose immediately previous payment attempt for the same order was failed.

## Input tables

- `dbo.SalesOrders`
- `dbo.PaymentStatuses`
- `dbo.Payments`

## Output columns

Return the columns in this exact order:

1. `OrderNumber`
2. `FailedPaymentDate`
3. `RecoveredPaymentDate`
4. `RecoveredAmount`
5. `RecoveryHours`

## Business rules and constraints

- Payment sequence is PaymentDate, then PaymentID.
- The previous attempt must be exactly `Failed`.
- Use `LAG`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY RecoveryHours, OrderNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
