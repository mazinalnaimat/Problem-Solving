# Challenge 4: AVG

## Required result

Return `Symbol`, `PriceDate`, `ClosePrice`, and `Running_AVG_ClosePrice` from `dbo.StockPrices`, with `Running_AVG_ClosePrice` showing the average of `ClosePrice` for rows that have the same `Symbol`.
Calculate `Running_AVG_ClosePrice` as a running value after ordering each calculation group by `PriceDate` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `Symbol` and `PriceDate` in ascending order.

## Table(s)

- `dbo.StockPrices`

## Columns to show

- `Symbol`
- `PriceDate`
- `ClosePrice`
- `Running_AVG_ClosePrice`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
