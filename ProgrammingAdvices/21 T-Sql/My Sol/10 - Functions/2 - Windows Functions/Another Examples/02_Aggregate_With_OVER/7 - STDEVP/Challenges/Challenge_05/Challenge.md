# Challenge 5: Reverse-running population deviation of seats by country

## Required result

- Calculate the population standard deviation in reverse chronological order for each `Country`.
- The newest row starts the calculation and older rows include values from later dates.
- Ignore rows where `Seats` is `NULL`.
- Display rows chronologically by `Country`, `PaymentDate`, and `PaymentID` even though the calculation order is descending.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PaymentID`
- `Country`
- `PaymentDate`
- `Seats`
- `ReverseRunningSeatPopulationDeviation`

## Skills practiced

- Descending analytic `STDEVP()` order
- Separating calculation order from display order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
