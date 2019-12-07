#include "vntlib.h"

//...

uint256 while_loop1(uint32 amount) {
   uint256 count = 0;
   
   while (true) { // condition is true
      count++; 
   }
   require(count != 0, "count!=0");
   return count;
}


uint256 while_loop2(uint32 amount) {
   uint256 count = 0;
   
   while (amount > 0) { // condition is true
      count += amount; 
   }
   require(count != 0, "count!=0");
   return count;
}

//...

_(){}
