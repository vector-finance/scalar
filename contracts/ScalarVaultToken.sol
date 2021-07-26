// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import {AffiliateToken} from "./AffiliateToken.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ScalarVaultToken is AffiliateToken {
    using SafeERC20 for IERC20;

    address public feeDistributor;

    event Harvest(uint256 amount);

    constructor(
        address _token,
        address _registry,
        address _feeDistributor,
        string memory name,
        string memory symbol
    ) AffiliateToken(_token, _registry, name, symbol) {
        feeDistributor = _feeDistributor;
    }

    function deposit(uint256 amount)
        public
        override
        returns (uint256 deposited)
    {
        deposited = deposit(amount, msg.sender);
    }

    /**
     * @dev Scalar's own MasterChef would call this function
     */
    function deposit(uint256 amount, address account)
        public
        returns (uint256 deposited)
    {
        deposited = _deposit(msg.sender, address(this), amount, true); // `true` = pull from `msg.sender`
        _mint(account, deposited);
    }

    function withdraw(uint256 amount)
        public
        override
        returns (uint256 withdrawn)
    {
        withdrawn = withdraw(amount, msg.sender);
    }

    /**
     * @dev Scalar's own MasterChef would call this function
     */
    function withdraw(uint256 amount, address account)
        public
        returns (uint256 withdrawn)
    {
        withdrawn = _withdraw(address(this), account, amount, true); // `true` = withdraw from `bestVault`
        _burn(account, withdrawn);
    }

    function harvest() external {
        uint256 yield = totalVaultBalance(address(this)) - totalSupply();
        _withdraw(address(this), feeDistributor, yield, true);
        emit Harvest(yield);
    }

    /**
     * @dev Scalar Vault Token does not use pricePerShare
     */
    function pricePerShare() external pure override returns (uint256) {
        return 0;
    }
}
