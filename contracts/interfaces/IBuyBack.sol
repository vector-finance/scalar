// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

interface IBuyBack {

    event WithdrawProfit(address indexed operator, uint256 profit);
    event DepositScalar(address indexed operator, uint256 scalar);

    function withdrawProfit() external;
    function depositScalar() external;
}
