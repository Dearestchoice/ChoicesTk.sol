SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ChoiceToken is ERC20 {
    address public owner;

    contructor(uint256 initialSupply) ERC20("choicetoken", "CTK") {
      _mint(msg.sender,initialSupply *10**uint256(decimals()));
      owner = msg.sender;
      }

      mapping(address => uint256) public balances;

      function mint(address account, uint256 value) public {
      require(msg.sender == owner, 'only owner can mint");
      _mint(account,value);
      balances[account] += value;
      }

      function burn(address account, uint256 value) public {
      require(msg.sender == owner, "only owner can burn");\
      require(balances[account] >= value, "Insufficient balance to burn");
      _burn(account, value);
      balances[account] -= value;
      }
   }
