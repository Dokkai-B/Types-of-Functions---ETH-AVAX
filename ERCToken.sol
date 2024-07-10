/*
For this project, you will write a smart contract to create your own ERC20 token and deploy it using 
HardHat or Remix. Once deployed, you should be able to interact with it for your walk-through video. 
From your chosen tool, the contract owner should be able to mint tokens to a provided address and 
any user should be able to burn and transfer tokens.

- Only contract owner should be able to mint tokens
- Any user can transfer tokens
- Any user can burn tokens
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    constructor(address user1, address user2) ERC20("CarlToken", "CTK") Ownable(msg.sender) {
        // Mint 5000 tokens to owner, user1, and user2
        uint256 initialSupply = 5 * 10 ** decimals();
        _mint(msg.sender, initialSupply);
        _mint(user1, initialSupply);
        _mint(user2, initialSupply);
        emit OwnerSet(address(0), msg.sender);
    }

    // Custom modifier to ensure only the owner can call the function
    modifier onlyContractOwner() {
        require(owner() == msg.sender, "Caller is not the owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyContractOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
