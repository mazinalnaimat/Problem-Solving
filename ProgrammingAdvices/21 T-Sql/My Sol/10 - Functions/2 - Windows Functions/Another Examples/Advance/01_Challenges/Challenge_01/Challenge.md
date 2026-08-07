# Challenge 01: Customer Order-Frequency Percentile

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Marketing wants to know where each customer sits in order frequency relative to others in the same segment.

## Task

Count valid orders per customer and calculate `PERCENT_RANK` inside each customer segment.

## Input tables

- `dbo.CustomerSegments`
- `dbo.Customers`
- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `SegmentName`
2. `CustomerNumber`
3. `OrderCount`
4. `FrequencyPercentRank`

## Business rules and constraints

- Exclude cancelled orders.
- Include customers with zero valid orders.
- Round the displayed percentile to four decimal places.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SegmentName, FrequencyPercentRank DESC, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
