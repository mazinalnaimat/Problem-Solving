# Challenge 3: FIRST_VALUE challenge 3: first ticket resolution time

## Task

Show every row and return the first ticket resolution time according to the requested ordering.

## Requirements

- Use `FIRST_VALUE`.
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
