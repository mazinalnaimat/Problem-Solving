# Challenge 29: Top Three Products per Category by Revenue

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Category managers need a leaderboard that keeps ties instead of arbitrarily dropping equally performing products.

## Task

Rank products by net sales revenue inside each category and return all products whose dense rank is 1, 2, or 3.

## Input tables

- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CategoryName`
2. `ProductID`
3. `ProductName`
4. `ProductRevenue`
5. `RevenueRank`

## Business rules and constraints

- Exclude cancelled orders.
- Use `DENSE_RANK`, so tied products share a rank and no rank numbers are skipped.
- Calculate revenue before ranking.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CategoryName, RevenueRank, ProductName
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
