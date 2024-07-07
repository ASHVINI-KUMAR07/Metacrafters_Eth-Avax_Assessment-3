// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Spectacular_Token is ERC20 {

    address private account_holder;
    constructor() ERC20("Speculator's Token", "SPT"){
        account_holder = msg.sender;
    }

    modifier onlyaccount_holder{
        require(msg.sender == account_holder,"Unauthorized access: You are not the owner of the account");
        _;
    }
//Creatd a mint function
    function mint(address to, uint256 amount) external onlyaccount_holder{
        _mint(to, amount);
    }
//created a reedem function
    function redeem(uint256 amount) external {
        //_burn(msg.sender, amount);
        require(balanceOf(msg.sender) >= amount, "Funds unavailable for withdrawal.");
        _transfer(msg.sender, account_holder, amount);
       
    }
//create a function named as burn
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
//this function will transfer token
    function transferToken(address _reciever , uint256 amount) external {
        require(balanceOf(msg.sender) >= amount , "You don'thave enough tokens to transfer");
        approve(msg.sender, amount);
        transferFrom(msg.sender , _reciever , amount);
    }
    function getBalance() external view returns(uint256) {
        return this.balanceOf(msg.sender);
    }
 }
