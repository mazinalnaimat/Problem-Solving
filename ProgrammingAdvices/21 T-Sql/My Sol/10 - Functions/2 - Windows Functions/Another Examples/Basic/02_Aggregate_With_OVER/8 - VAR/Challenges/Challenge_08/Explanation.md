# Explanation: Utility rows whose squared deviation exceeds running sample variance

## Approach

- The CTE must calculate the two window columns before the filter can use them.
- Squaring the distance keeps the comparison in the same units as variance.

## Main ideas

- Filtering calculated window statistics
- Squared-deviation comparison for variance

Review `Solution.sql` only after attempting the challenge yourself.
