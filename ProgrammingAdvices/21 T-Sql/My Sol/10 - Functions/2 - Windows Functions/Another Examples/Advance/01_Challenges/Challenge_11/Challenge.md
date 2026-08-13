# Challenge 11: Customer Average Order Value versus Segment Median

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Marketing wants customers whose average valid-order value is above the median customer average for their segment.

## Task

Calculate customer average order value, segment median of those customer averages, difference, and segment percentile rank.

## Input tables

- `dbo.CustomerSegments`
- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `SegmentName`
2. `CustomerNumber`
3. `AverageOrderValue`
4. `SegmentMedianAOV`
5. `AmountAboveMedian`
6. `SegmentPercentRank`

## Business rules and constraints

- Exclude cancelled orders.
- The median population is one average value per customer.
- Use `PERCENTILE_CONT` and `PERCENT_RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SegmentName, AmountAboveMedian DESC, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
