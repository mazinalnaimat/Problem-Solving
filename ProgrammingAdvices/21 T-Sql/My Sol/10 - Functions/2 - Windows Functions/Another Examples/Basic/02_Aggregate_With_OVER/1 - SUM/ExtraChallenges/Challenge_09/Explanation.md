# Explanation: Current transaction plus the next two branch transactions

`ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING` looks forward instead of backward.

For each row, the frame contains:

1. the current row;
2. the next physical row;
3. the second next physical row.

The frame never crosses the branch boundary because of `PARTITION BY Branch`. At the end of a partition, fewer than three rows may be available.
