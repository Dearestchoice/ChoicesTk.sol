# Overview
This repository contains the source code for a custom Ethereum token smart contract named `ChoiceToken`. The contract is developed in Solidity and is based on the ERC-20 standard with additional functionalities for minting and burning tokens.

# Features
ERC-20 Standard Compliance

The `ChoiceToken` contract inherits from the OpenZeppelin ERC20 contract, ensuring compliance with the ERC-20 token standard. This means it supports standard token operations such as transfers, approvals, and balance inquiries.

# Minting Function
The contract includes a `mint` function that allows the owner to create and distribute new tokens to a specified address. This function can be used to increase the total supply of the token.

# Burning Function
The contract includes a `burn` function that enables the owner to destroy existing tokens from a specified address. This function helps reduce the total supply of the token.

# Access Control
Both the `mint` and `burn` functions have access control checks to ensure that only the owner of the contract can execute these operations. This helps secure the token against unauthorized minting or burning.

# Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ChoicesToken is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("choicestoken", "CTK") {
        _mint(msg.sender, initialSupply * 10**uint256(decimals()));
        owner = msg.sender;
    }

    mapping(address => uint256) public balances;

    function mint(address account, uint256 value) public {
        require(msg.sender == owner, "Only the owner can mint");
        _mint(account, value);
        balances[account] += value;
    }

    function burn(address account, uint256 value) public {
        require(msg.sender == owner, "Only the owner can burn");
        require(balances[account] >= value, "Insufficient balance to burn");
        _burn(account, value);
        balances[account] -= value;
    }
}

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile ChoiceToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ChoiceToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the various functions.

# License
This project is licensed under the MIT License - see the LICENSE.md file for details
