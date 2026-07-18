# Explanation: Moving total of the latest three cashier transactions

`ROWS BETWEEN 2 PRECEDING AND CURRENT ROW` creates a maximum three-row moving window.

The frame contains two earlier physical rows plus the current row. Because the partition uses both `Branch` and `Cashier`, rows belonging to another branch or cashier are never included.

Near the beginning of a partition, SQL Server simply uses the available rows.
