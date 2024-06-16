// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract token is ERC20 {
    address payable owner;
    constructor() ERC20("Gold", "GLD") {
        owner = msg.sender;
        _mint(owner, 70000000 * (10**decimals()));
    }
}


//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol