# Explanation: Utility costs farther than one running population deviation

## Approach

- The CTE must calculate the two window columns before the filter can use them.
- The absolute distance is compared with the running standard deviation.

## Main ideas

- Filtering calculated window statistics
- Dynamic outlier-style condition using `ABS`

Review `Solution.sql` only after attempting the challenge yourself.
