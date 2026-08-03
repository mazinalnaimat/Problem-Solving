# Challenge 3: LAST_VALUE challenge 3: last ticket resolution time

## Task

Show every row and return the last ticket resolution time according to the requested ordering.

## Requirements

- Use `LAST_VALUE`.
- Partition by `AgentName`.
- Use `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`.

## Tables

- `dbo.SupportTickets`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
