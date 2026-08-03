# Challenge 3: PERCENTILE_DISC challenge 3: 60th percentile ticket resolution

## Task

Show each detail row and calculate the 60th percentile ticket resolution for its partition.

## Requirements

- Use `PERCENTILE_DISC(0.60)`.
- Order the percentile by `ResolutionMinutes`.
- Partition by `TeamName`.

## Tables

- `dbo.SupportTickets`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
