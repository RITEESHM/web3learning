// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BasicAttentionToken is ERC20, Ownable {
    // Set the total supply and assign it to the deployer
    constructor(uint256 initialSupply) ERC20("Basic Attention Token", "BAT") {
        _mint(msg.sender, initialSupply);
    }

    // Allow owner to mint new tokens
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Allow owner to burn tokens
    function burn(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }
}
