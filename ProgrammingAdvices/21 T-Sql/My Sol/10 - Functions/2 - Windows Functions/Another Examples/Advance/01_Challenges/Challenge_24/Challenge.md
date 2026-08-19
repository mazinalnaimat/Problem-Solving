# Challenge 24: Monthly Category Revenue Share

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Merchandising wants to see how much each category contributes to total monthly product revenue.

## Task

Calculate category revenue and its percentage share of all category revenue in the same month.

## Input tables

- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `MonthStart`
2. `CategoryName`
3. `CategoryRevenue`
4. `MonthRevenue`
5. `RevenueSharePercent`

## Business rules and constraints

- Exclude cancelled orders.
- Calculate category-month revenue before applying the window total.
- Use `SUM OVER (PARTITION BY MonthStart)`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY MonthStart, RevenueSharePercent DESC, CategoryName
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
