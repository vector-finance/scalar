// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./FungibleToken.sol";
import "./interfaces/IScalar.sol";

contract Scalar is FungibleToken, IScalar {
    
    address public emitter;
    
    constructor(address _emitter) FungibleToken("Scalar", "SCALAR", "1") {
        emitter = _emitter;
    }

    modifier onlyEmitter() {
        require(msg.sender == emitter);
        _;
    }

    function mint(uint256 amount) onlyEmitter() external override {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) onlyEmitter() external override {
        _burn(msg.sender, amount);
    }
}
