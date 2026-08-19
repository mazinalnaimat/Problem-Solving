# Challenge 25: Three-Month Cancellation Rate Trend

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Channel owners want to compare each month's cancellation rate with its recent three-month average.

## Task

Calculate monthly cancellation percentage per sales channel and a moving average over the current and previous two active months.

## Input tables

- `dbo.SalesChannels`
- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `ChannelName`
2. `MonthStart`
3. `OrderCount`
4. `CancelledCount`
5. `CancellationRate`
6. `ThreeMonthAverageRate`

## Business rules and constraints

- CancellationRate is cancelled orders divided by all orders in the channel-month.
- Use a `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` frame.
- Do not use a correlated subquery.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ChannelName, MonthStart
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
