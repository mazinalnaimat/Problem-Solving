# Challenge 42: Reopened Support Ticket Events

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Quality assurance wants to audit every transition where a resolved or closed ticket became reopened.

## Task

Return each `Reopened` history event and the status immediately before it.

## Input tables

- `dbo.SupportTickets`
- `dbo.SupportTicketStatuses`
- `dbo.TicketStatusHistory`

## Output columns

Return the columns in this exact order:

1. `TicketNumber`
2. `PreviousStatus`
3. `ReopenedAt`
4. `HoursSincePreviousStatus`

## Business rules and constraints

- Sequence history by ChangedAt, then TicketStatusHistoryID.
- Use `LAG` for both status and timestamp.
- Only return events where current status is `Reopened`.

## Required SQL techniques

- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Your result must be deterministic when values tie.

## Required ordering

Order the final result by:

```sql
ORDER BY ReopenedAt, TicketNumber
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
