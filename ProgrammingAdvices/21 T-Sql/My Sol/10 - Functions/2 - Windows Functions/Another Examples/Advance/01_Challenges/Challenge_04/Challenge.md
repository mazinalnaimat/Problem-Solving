# Challenge 04: Regional Pareto Customers

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Regional directors want the customers that collectively generate the first 80% of valid-order revenue in each region.

## Task

Calculate customer revenue by region and return all customers needed to cross the regional 80% threshold.

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
2. `CustomerNumber`
3. `CustomerRevenue`
4. `CumulativeRevenuePercent`
5. `RevenuePosition`

## Business rules and constraints

- Exclude cancelled orders.
- Use customer location to determine region.
- Include the customer that crosses 80%.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY RegionName, RevenuePosition, CustomerNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
