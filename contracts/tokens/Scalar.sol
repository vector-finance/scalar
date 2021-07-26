// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./FungibleToken.sol";
import "./interfaces/IScalar.sol";

contract Scalar is FungibleToken("Scalar", "SCALAR", "1"), IScalar {

    function mint(uint256 amount) external override {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) external override {
        _burn(msg.sender, amount);
    }
}
