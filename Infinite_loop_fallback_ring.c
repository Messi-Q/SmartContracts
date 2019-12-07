#include "vntlib.h"

typedef struct {
  uint256 name;        // name
  uint256 balance;     // deposit
} Account;

KEY mapping(address, Account) accounts;

constructor $Infinite_loop_call_ring(){
  owner = GetSender();
  totalGameCount = 0;
}

// check if the amount is enough
void checkAmount(uint256 amount) {
  Require(U256_Cmp(amount, U256(0) == 1), "amount must > 0");
  address from = GetSender();
  accounts.key = from;
  uint256 balance = accounts.value.balance;
  PrintAddress("get sender:", from);
  PrintUint256T("get balance:", balance);
  Require(U256_Cmp(U256SafeSub(balance, amount), 0) != -1,
          "No enough money to bet");
}

// check contract owner
void checkOwner() {
  address sender = GetSender();
  Require(Equal(sender, owner) == true, "Only the owner can operate");
}

// withdraw asset
void withdraw(uint256 amount) {
  checkAmount(); // input error
  address addr = GetSender();
  uint256 balance = accounts.value.balance;
  if (balance >= amount) {
    TransferFromContract(addr, amount);
  }
}

$_(){ // fallback function
  withdraw(amount);
}
