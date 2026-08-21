# Challenge 27: Quarterly Category Sales Rank

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Executives review which product categories led each calendar quarter.

## Task

Calculate category revenue by year and quarter and rank categories within each quarter.

## Input tables

- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `SalesYear`
2. `SalesQuarter`
3. `CategoryName`
4. `QuarterRevenue`
5. `CategoryRank`

## Business rules and constraints

- Exclude cancelled orders.
- Use calendar quarters.
- Use `RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY SalesYear, SalesQuarter, CategoryRank, CategoryName
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
