# Explanation: Show every order with the grand total

The empty window `OVER()` means the window contains every returned row.

`SUM(Amount) OVER()` calculates the grand total but does not collapse the result. Every original sales order remains visible, and the same grand total appears beside each row.

The final `ORDER BY` controls display order. It is separate from the window definition.
