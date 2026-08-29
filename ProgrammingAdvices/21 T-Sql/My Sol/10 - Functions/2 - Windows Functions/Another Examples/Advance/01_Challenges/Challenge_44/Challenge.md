# Challenge 44: Customer Cohort Retention Matrix

**Difficulty:** Hard  
**Database:** `RetailOperations3NFDB`

## Business scenario

Growth analysts want monthly retention by the month of a customer's first valid order.

## Task

Return cohort month, month number since first order, active customer count, cohort size, and retention percentage.

## Input tables

- `dbo.SalesOrders`

## Output columns

Return the columns in this exact order:

1. `CohortMonth`
2. `MonthNumber`
3. `ActiveCustomers`
4. `CohortSize`
5. `RetentionPercent`

## Business rules and constraints

- Exclude cancelled orders.
- A customer is active once per calendar month.
- Month 0 is the first-order month.
- Use a window function to carry cohort size across month numbers.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY CohortMonth, MonthNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
