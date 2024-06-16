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
        owner = msg.sender;
        _mint(owner, 70000000 * (10**decimals()));
        reward = reward * (10**decimals());
    }

    function setReward(uint reward) public onlyOwner{
        blockReward = reward * (10**decimals());
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Only Ownder allowed");
        _;
    }
}


//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol