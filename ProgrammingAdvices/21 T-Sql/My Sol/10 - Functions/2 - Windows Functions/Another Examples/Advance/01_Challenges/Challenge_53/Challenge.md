# Challenge 53: Customer Dominant Payment Method with APPLY

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Finance wants to know the payment method each customer relies on most.

## Task

For every customer, find the most-used successful payment method using `OUTER APPLY`, then rank customers inside their segment by the number of successful payments made with that method.

## Input tables

- `dbo.Customers`
- `dbo.CustomerSegments`
- `dbo.SalesOrders`
- `dbo.Payments`
- `dbo.PaymentMethods`
- `dbo.PaymentStatuses`

## Output columns

Return the columns in this exact order:

1. `SegmentName`
2. `CustomerNumber`
3. `DominantPaymentMethod`
4. `SuccessfulPaymentCount`
5. `SuccessfulAmount`
6. `SegmentUsageRank`

## Business rules and constraints

- A successful payment has status `Completed`.
- Include customers with no completed payments.
- Choose the dominant method by payment count, then amount, then method name.
- Customers with no completed payments should show `No completed payment` and zero values.

## Required SQL techniques

- Use `OUTER APPLY` with `TOP (1)`.
- Use grouped aggregation inside the APPLY.
- Use `DENSE_RANK` within customer segment.
- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Make the final result deterministic when values tie.

## Required ordering

```sql
ORDER BY SegmentName, SegmentUsageRank, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
