// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract token is ERC20Capped,ERC20Burnable {
    address payable owner;
    uint public blockReward;
    constructor(uint cap, uint reward) ERC20("Arman", "ARM") ERC20Capped(cap *(10 ** decimals())){
        owner = payable(msg.sender);
        _mint(owner, 70000000 * (10**decimals()));
        reward = reward * (10**decimals());
    }

    // function _mint(address account, uint256 amount) internal virtual override(ERC20Capped, ERC20) {
    //     require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
    //     super._mint(account, amount);
    // }


    function _mintMinerReward() internal{
         _mint(block.coinbase, blockReward);
    }

    function _update(address from, address to, uint256 value) internal virtual override(ERC20Capped,ERC20) {
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0) && ERC20.totalSupply() + blockReward <= cap()) {
            _mintMinerReward();
        }
        super._update(from, to, value);
    }

    function setBlockReward(uint reward) public onlyOwner{
        blockReward = reward * (10**decimals());
    }

    // function destroy() public onlyOwner{
    //     selfdestruct(owner);
    // }

    modifier onlyOwner{
        require(msg.sender == owner, "Only Ownder allowed");
        _;
    }
}


//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol