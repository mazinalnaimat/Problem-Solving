# Challenge 47: Rolling 30-Day Revenue by Sales Channel

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Channel teams need a true calendar-day rolling revenue metric, including days with no orders.

## Task

Build a complete date spine and calculate each channel's revenue over the current day and previous 29 calendar days.

## Input tables

- `dbo.SalesChannels`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CalendarDate`
2. `ChannelName`
3. `DailyRevenue`
4. `Rolling30DayRevenue`

## Business rules and constraints

- Exclude cancelled orders.
- Generate missing calendar dates with a recursive CTE.
- Cross every date with every sales channel before applying the 30-row window.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ChannelName, CalendarDate
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
