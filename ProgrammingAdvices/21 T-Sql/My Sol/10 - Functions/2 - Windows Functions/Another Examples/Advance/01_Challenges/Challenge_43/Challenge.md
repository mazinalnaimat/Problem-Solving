# Challenge 43: Products Forming the First 80 Percent of Category Revenue

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Merchandising wants a Pareto list of products that collectively generate the first 80% of each category's revenue.

## Task

Order products by revenue inside category and return every product needed to cross the 80% cumulative threshold.

## Input tables

- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CategoryName`
2. `SKU`
3. `ProductRevenue`
4. `CumulativeRevenuePercent`
5. `RevenuePosition`

## Business rules and constraints

- Exclude cancelled orders.
- Use a running sum ordered by revenue descending.
- Include the product that crosses 80%.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CategoryName, RevenuePosition, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
