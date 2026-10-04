# Challenge 52: Longest Consecutive Sales-Target Attainment Streak

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Sales leadership wants to reward employees who repeatedly meet or exceed monthly revenue targets.

## Task

For each sales employee, compare actual non-cancelled monthly revenue with the target table and return the employee's longest consecutive target-attainment streak.

## Input tables

- `dbo.EmployeeMonthlyTargets`
- `dbo.Employees`
- `dbo.SalesOrders`
- `dbo.OrderItems`

## Output columns

Return the columns in this exact order:

1. `EmployeeNumber`
2. `FullName`
3. `LongestStreakMonths`
4. `StreakStartMonth`
5. `StreakEndMonth`
6. `AverageAttainmentPct`
7. `StreakRank`

## Business rules and constraints

- Use every target month even if the employee produced zero revenue.
- Actual revenue includes line discounts and order discount.
- A month qualifies when ActualRevenue >= RevenueTarget.
- Only consecutive calendar months belong to the same streak.
- Return one longest streak per employee; break equal-length ties by the most recent ending month.

## Required SQL techniques

- Use a gaps-and-islands technique.
- Use `ROW_NUMBER` and date arithmetic.
- Use `RANK` to rank employees by longest streak.
- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Make the final result deterministic when values tie.

## Required ordering

```sql
ORDER BY StreakRank, EmployeeNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
