# Explanation: Running sales total for each salesperson

This window uses all three important parts:

- `PARTITION BY SalesPersonID` creates one independent sequence per salesperson.
- `ORDER BY OrderDate, OrderID` defines the order inside each salesperson's partition.
- `ROWS ... UNBOUNDED PRECEDING ... CURRENT ROW` creates the growing running-total frame.

When SQL Server moves to a different salesperson, the running total starts again.
