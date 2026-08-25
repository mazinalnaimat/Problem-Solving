# Challenge 40: Most Stable Product Demand

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Demand planning wants the products with the most stable monthly sales quantities inside each category.

## Task

Calculate monthly demand, coefficient of variation, and rank products from most stable to least stable by category.

## Input tables

- `dbo.Categories`
- `dbo.Products`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `CategoryName`
2. `SKU`
3. `ActiveMonths`
4. `AverageMonthlyUnits`
5. `MonthlyStdDev`
6. `CoefficientOfVariation`
7. `StabilityRank`

## Business rules and constraints

- Exclude cancelled orders.
- Require at least six active months.
- Coefficient of variation = STDEV / AVG.
- Use `DENSE_RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CategoryName, StabilityRank, SKU
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
