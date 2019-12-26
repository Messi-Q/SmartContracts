#include "vntlib.h"

typedef struct
{
  uint256 balance;     
  string nickName;     
  bool freeAddress;    
  uint64 winCount;     
  uint64 loseCount;    
  uint64 chickenCount; 
  uint256 winReward;   
  uint256 loseAmount;  
} Account;

KEY mapping(address, Account) accounts;

KEY uint64 totalGameCount;

KEY uint256 deposit;

KEY uint256 fee = U256(10);

KEY address owner;

KEY uint256 freeAmount = U256(100000000000000000000); // 100*10**18;

EVENT EVENT_WITHDRAW(indexed address from, string nickname, uint256 amount);
EVENT EVENT_DEPOSIT(indexed address from, string nickname, uint256 amount);
EVENT EVENT_GETFREEVNT(indexed address from, bool got);

constructor $Dice() {
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
  GetAmount(amount);
}

// withdraw money
MUTABLE
void Withdraw(uint256 amount) {
  checkAmount(amount);
  address from = GetSender();
  if (TransferFromContract(from, amount) == true) {
    accounts.key = from;
    accounts.value.balance = U256SafeSub(accounts.value.balance, amount);
    deposit = U256SafeSub(deposit, amount);
    EVENT_WITHDRAW(from, accounts.value.nickName, amount);
  }
}

// withdraw all money
MUTABLE
void WithdrawAll() {
  accounts.key = GetSender();
  uint256 amount = accounts.value.balance;
  Withdraw(amount);
}

// deposit money
MUTABLE
void $Deposit() {
  uint256 amount = GetValue();
  address from = GetSender();
  accounts.key = from;
  accounts.value.balance = U256SafeAdd(accounts.value.balance, amount);
  deposit = U256SafeAdd(deposit, amount);
  EVENT_DEPOSIT(from, accounts.value.balance, amount);
}

// get money from certain address
UNMUTABLE
uint256 GetAmountFromAddress(address addr) {
  accounts.key = addr;
  return accounts.value.balance;
}

// get money
UNMUTABLE
uint256 GetAmount(uint256 amount) {
  checkAmount(amount);
  return GetAmountFromAddress(GetSender()); 
}

$_() { $Deposit(); }  // fallback function
