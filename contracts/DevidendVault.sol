// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./interfaces/IDevidendVault.sol";

contract DevidendVault is IDevidendVault {
    
    function accumulativeOf(address token, address owner) override external view returns (uint256) {
        return 0;
    }
    
    function claimedOf(address token, address owner) override external view returns (uint256) {
        return 0;
    }
    
    function claimableOf(address token, address owner) override external view returns (uint256) {
        return 0;
    }

    function claim(address token) override external {}
}
