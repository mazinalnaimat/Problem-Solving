# Explanation: Running total of all sales

`ORDER BY OrderDate, OrderID` defines the sequence used by the window calculation.

`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` means:

- Start at the first ordered row.
- Include every row through the current row.

The window grows by one row at a time, producing a running total. `OrderID` breaks ties when multiple orders have the same date.
