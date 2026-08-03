# Challenge 5: Reverse-running sample deviation of payment amounts by plan

## Required result

- Calculate the sample standard deviation in reverse chronological order for each `PlanName`.
- The newest row starts the calculation and older rows include values from later dates.
- Ignore rows where `Amount` is `NULL`.
- Display rows chronologically by `PlanName`, `PaymentDate`, and `PaymentID` even though the calculation order is descending.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PaymentID`
- `PlanName`
- `PaymentDate`
- `Amount`
- `ReverseRunningAmountSampleDeviation`

## Skills practiced

- Descending analytic `STDEV()` order
- Separating calculation order from display order

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
