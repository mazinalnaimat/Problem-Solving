# Challenge 41: Year-over-Year Regional Monthly Growth

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Finance wants monthly revenue growth against the same month one year earlier for every customer region.

## Task

Calculate regional monthly revenue and year-over-year percentage growth using a 12-row lag.

## Input tables

- `dbo.Regions`
- `dbo.Countries`
- `dbo.Cities`
- `dbo.Customers`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `RegionName`
2. `MonthStart`
3. `MonthlyRevenue`
4. `PreviousYearRevenue`
5. `YoYGrowthPercent`

## Business rules and constraints

- Exclude cancelled orders.
- Build a complete region-month calendar, including months with zero revenue.
- Use `LAG(..., 12)` only after the complete calendar is built.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY RegionName, MonthStart
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
