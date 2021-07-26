// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

interface IDevidendVault {

    event Distribute(address indexed token, address indexed by, uint256 distributed);
    event Claim(address indexed token, address indexed to, uint256 claimed);
    
    function accumulativeOf(address token, address owner) external view returns (uint256);
    function claimedOf(address token, address owner) external view returns (uint256);
    function claimableOf(address token, address owner) external view returns (uint256);
    function claim(address token) external;
}
