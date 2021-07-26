// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./FungibleToken.sol";
import "./interfaces/IVEScalar.sol";

contract VEScalar is FungibleToken, IVEScalar {

    address public locker;
    
    constructor(
        string memory name,
        string memory symbol,
        string memory version,
        address _locker
    ) FungibleToken(name, symbol, version) {
        locker = _locker;
    }

    modifier onlyLocker() {
        require(msg.sender == locker);
        _;
    }

    function transfer(address to, uint256 amount) onlyLocker() public override(ERC20, IERC20) returns (bool success) {
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) onlyLocker() public override(FungibleToken, IERC20) returns (bool success) {
        return super.transferFrom(from, to, amount);
    }

    function mint(uint256 amount) onlyLocker() external override {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) onlyLocker() external override {
        _burn(msg.sender, amount);
    }
}
