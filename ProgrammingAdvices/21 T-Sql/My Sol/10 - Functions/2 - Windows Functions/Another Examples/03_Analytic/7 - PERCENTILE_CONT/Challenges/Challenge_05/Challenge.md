# Challenge 5: PERCENTILE_CONT challenge 5: 80th percentile payment amount

## Task

Show each detail row and calculate the 80th percentile payment amount for its partition.

## Requirements

- Use `PERCENTILE_CONT(0.80)`.
- Order the percentile by `Amount`.
- Partition by `PlanName, Country`.

## Tables

- `dbo.SubscriptionPayments`

## Setup

Run these files first:

1. `00_Database_Setup/01_AllInOne_Create_Database.sql`
2. `00_Database_Setup/03_Extended_Challenge_Data.sql`

## Try first

Write your query in `MySol.sql` before opening `Solution.sql`.
