// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.15;

contract SumBytes {
    function sumBytes(
        bytes memory input1,
        bytes memory input2
    ) public pure returns (bytes memory) {
        uint256 length1 = input1.length;
        uint256 length2 = input2.length;
        uint256 maxInputLength = length1 > length2 ? length1 : length2;

        bytes memory result = new bytes(maxInputLength);

        uint8 overflow = 0;
        assembly {
            let i := 0
            for {

            } lt(i, maxInputLength) {

            } {
                let byte1 := 0
                let byte2 := 0

                if lt(i, length1) {
                    byte1 := byte(
                        0,
                        mload(add(add(input1, 32), sub(sub(length1, i), 1)))
                    )
                }
                if lt(i, length2) {
                    byte2 := byte(
                        0,
                        mload(add(add(input2, 32), sub(sub(length2, i), 1)))
                    )
                }

                let sum := add(add(byte1, byte2), overflow)
                mstore8(
                    add(add(result, 32), sub(sub(maxInputLength, i), 1)),
                    sum
                )

                overflow := gt(sum, 0xff)

                i := add(i, 1)
            }
        }
        /// @notice This function extends the result byte array in the case of an overflow.
        /// If there's an overflow value, a new byte array is created with an extra slot,
        /// the overflow value is inserted at the beginning of the new array, and the rest
        /// of the original result is copied into the new array starting from the second slot.

        if (overflow > 0) {
            bytes memory extendedResult = new bytes(maxInputLength + 1);
            extendedResult[0] = bytes1(overflow);
            for (uint256 i = 0; i < maxInputLength; ) {
                extendedResult[i + 1] = result[i];
                unchecked {
                    ++i;
                }
            }
            return extendedResult;
        }

        return result;
    }
}
