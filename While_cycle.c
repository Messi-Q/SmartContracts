#include "vntlib.h"

//...

uint256 while_loop1(uint32 amount) {
   uint256 count = 0;
   
   while (true) { // condition is always true
      count++; 
   }
   require(count != 0, "count!=0");
   return count;
}


uint256 while_loop2(uint32 amount) {
   uint256 count = 0;
   
   while (amount > 0) { // condition is always true
      count += amount; 
   }
   require(count != 0, "count!=0");
   return count;
}

//...

_() {} // fallback function
