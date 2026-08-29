# Challenge 45: Salesperson Monthly Revenue Rank

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

The sales director publishes a monthly leaderboard for individual sales representatives.

## Task

Calculate valid-order revenue per salesperson and month, then rank all salespeople inside that month.

## Input tables

- `dbo.Employees`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `MonthStart`
2. `EmployeeNumber`
3. `FullName`
4. `MonthlyRevenue`
5. `RevenueRank`

## Business rules and constraints

- Exclude cancelled orders.
- Subtract order-level discounts once per order before monthly aggregation.
- Use `RANK`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY MonthStart, RevenueRank, EmployeeNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
