# Challenge 51: Order Margin Band and Channel Revenue Share

**Difficulty:** Medium  
**Database:** `RetailOperations3NFDB`

## Business scenario

Commercial analysts want to see which margin bands contribute most to each sales channel.

## Task

Calculate net merchandise revenue and estimated gross margin for every non-cancelled order, classify each order into a margin band, then show each band's share of channel revenue.

## Input tables

- `dbo.SalesOrders`
- `dbo.OrderItems`
- `dbo.Products`
- `dbo.SalesChannels`

## Output columns

Return the columns in this exact order:

1. `ChannelName`
2. `MarginBand`
3. `OrderCount`
4. `NetRevenue`
5. `GrossMargin`
6. `ChannelRevenueSharePct`
7. `RevenueRank`

## Business rules and constraints

- Net line revenue = Quantity * UnitPrice * (1 - DiscountPercent / 100).
- Estimated cost = Quantity * Products.StandardCost.
- Subtract SalesOrders.OrderDiscount once per order before calculating margin.
- Exclude cancelled orders.
- Margin bands: Loss < 0%; Low 0-14.99%; Healthy 15-29.99%; High >= 30%.

## Required SQL techniques

- Use `CASE` for margin-band classification.
- Use windowed `SUM` for channel share.
- Use `DENSE_RANK` to rank margin bands inside a channel.
- Use at least one Common Table Expression (`WITH ... AS`).
- Use one or more SQL Server window functions.
- Do not solve the challenge with procedural loops or cursors.
- Make the final result deterministic when values tie.

## Required ordering

```sql
ORDER BY ChannelName, RevenueRank, MarginBand
```

## Setup

Run:

```text
00_Database_Setup/00_All_In_One.sql
```

Then write your answer in `MySolution.sql`.

Do not open `Solution.sql` until you finish your first attempt.
