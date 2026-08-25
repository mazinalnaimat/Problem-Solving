# Challenge 34: Support Agent Monthly Workload Rank

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Support management wants a monthly workload board that shows ties fairly.

## Task

Count tickets assigned to each support agent per month and rank agents by ticket count in that month.

## Input tables

- `dbo.Employees`
- `dbo.SupportTickets`

## Output columns

Return the columns in this exact order:

1. `MonthStart`
2. `EmployeeNumber`
3. `FullName`
4. `TicketCount`
5. `WorkloadRank`

## Business rules and constraints

- Use ticket CreatedAt for the month.
- Use `RANK`, not `ROW_NUMBER`.
- Include only agents who received at least one ticket.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY MonthStart, WorkloadRank, EmployeeNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
