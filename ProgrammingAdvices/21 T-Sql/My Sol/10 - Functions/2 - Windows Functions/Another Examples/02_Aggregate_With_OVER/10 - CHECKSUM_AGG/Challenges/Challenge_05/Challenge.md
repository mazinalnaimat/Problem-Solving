# Challenge 5: Checksum only paid payment IDs while keeping all rows

## Required result

- Keep all payment rows, including unpaid rows.
- For each plan, include only paid payment IDs in the checksum.
- Sort by `PlanName`, `PaymentDate`, and `PaymentID`.

## Table(s)

- `dbo.SubscriptionPayments`

## Columns to show

- `PaymentID`
- `PlanName`
- `PaymentStatus`
- `PaidPaymentIDChecksum`

## Skills practiced

- Conditional checksum input with `CASE`
- Ignoring values by returning `NULL`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
