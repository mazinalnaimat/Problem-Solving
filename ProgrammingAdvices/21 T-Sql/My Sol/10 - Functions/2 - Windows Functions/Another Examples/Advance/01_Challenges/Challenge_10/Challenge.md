# Challenge 10: Longest Positive Monthly Sales-Growth Streak

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

The sales director wants each representative's longest run of consecutive active months with positive month-over-month revenue growth.

## Task

Find the longest positive-growth streak per salesperson.

## Input tables

- `dbo.Employees`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `EmployeeNumber`
2. `StreakStartMonth`
3. `StreakEndMonth`
4. `GrowthMonths`

## Business rules and constraints

- Exclude cancelled orders.
- A month qualifies only when revenue is greater than the immediately previous active month and calendar months are consecutive.
- Use `LAG` and gaps-and-islands.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY GrowthMonths DESC, EmployeeNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
