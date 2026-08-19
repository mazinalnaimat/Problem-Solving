# Challenge 26: Seven-Day Channel Revenue Spike

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Channel monitoring wants to detect daily rolling revenue that is unusually high relative to the channel's prior four rolling-week values.

## Task

Build a date spine, calculate rolling seven-day revenue, then flag values above 150% of the average of the previous four rolling-seven-day values.

## Input tables

- `dbo.SalesChannels`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CalendarDate`
2. `ChannelName`
3. `Rolling7DayRevenue`
4. `PreviousFourRollingAverage`
5. `SpikePercent`

## Business rules and constraints

- Exclude cancelled orders.
- Include dates with zero revenue.
- The comparison average must exclude the current rolling value.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SpikePercent DESC, ChannelName, CalendarDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
