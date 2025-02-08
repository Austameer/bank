pragma solidity >=0.8.7 <0.9;
// SPDX-License-Identifier: MIT

contract Bank {
    mapping(address => uint256) public accounts;
    
    constructor() {}

    function createAccount(address accountNumber, uint initialBalance) 
        external returns (bool)
    {
       require(!accounts[accountNumber], "This account number is already in use.");
        
        for(uint i = 0; i < address.length(); ++i){
            while(accounts[msg.sender] == accounts[i])
                accounts[msg.sender]++;
            
           accounts[msg.sender]+=initialBalance;
       }
    
      return true;
    }

   function deposit(address payable _accountNumber, uint256 amount) 
         external returns (bool)
     {
        
        require(  balanceOf(_accountNumber)>=amount,"Sorry! Account number ${_accountNumber} doesn't exist.");
            
           accounts[_accountNumber]+=amount;

       // console.log(`You have deposited $${amount}. Your new balance is: $` + this.accounts[accountNumber].balance);

      return true;
    }

   function withdraw(address payable _accountNumber, uint256 amount) 
         external returns (bool)
     {
        
        require(  accounts[_accountNumber]>=amount,"Sorry! Account number ${_accountNumber} doesn't exist.");
            
           accounts[msg.sender]-=amount;

       // console.log(`Withdrawal successful. Your new balance: $${this.accounts[accountNumber].balance}`);

      return true;
    }

   function checkBalance(address _accountNumber) 
         external view returns (uint256)
     {
        require(accounts[_accountNumber], "Account number doesn't exist");
            
       // console.log(`Your current account balance is: $` + this.accounts[accountNumber].balance);
        
      return accounts[msg.sender];
    }
}
