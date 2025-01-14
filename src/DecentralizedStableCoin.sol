// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @author  Iftequar Ahmed
 * @title   DecntralizedStableCoin contract
 * @dev     Iftequar Ahmed
 * Collateral: Exogenous (ETH and BTC)
 * Minting: Algorithmic(Decentalized)
 * Relative Stability: Pegged (to USD)
 * @notice  This is a contract meant to be governed by DSCEngine.
 This is just an ERC20 implementation of the stable coin.
 */
contract DecentralizedStableCoin is ERC20Burnable, Ownable {

    error DecentralizedStableCoin__MustBeMoreThanZero();
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__NotZeroAddress();


    constructor() ERC20("DecentralizedStableCoin", "DSC") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if(_amount <= 0){
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        if(_amount >= balance){
            revert DecentralizedStableCoin__BurnAmountExceedsBalance();
        }

        super.burn(_amount);
    }

    function mint(uint256 _amount, address _to) external returns(bool) {

        if(_to == address(0)) {
            revert DecentralizedStableCoin__NotZeroAddress();
        }

        if(_amount <= 0){
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }

        _mint(_to, _amount);
        return true;

    } 


}