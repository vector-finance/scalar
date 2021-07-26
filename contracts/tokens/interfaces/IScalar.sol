// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./IFungibleToken.sol";

interface IScalar is IFungibleToken {
    function mint(uint256 amount) external;
    function burn(uint256 amount) external;
}
