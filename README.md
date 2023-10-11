
# SumBytes Solidity Contract
The SumBytes contract is a simple yet powerful demonstration of handling byte arrays in Solidity combined with inline Assembly for optimized performance.

## Description

The contract contains a single function sumBytes which takes two byte arrays as input, sums them byte-by-byte, and returns the resulting byte array. In case of an overflow, it gracefully handles the situation by extending the result array to accommodate the overflow byte.

### Features

- Byte-by-Byte Addition: Adds corresponding bytes from two input arrays.
- Overflow Handling: Detects and handles overflow, ensuring accuracy of the result.
- Inline Assembly: Utilizes inline Assembly for optimized byte handling and arithmetic operations.
- Pure Function: The sumBytes function is marked as pure, ensuring no state changes.
