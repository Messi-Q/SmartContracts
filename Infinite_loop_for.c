#include "vntlib.h"

// ...

uint256 for_loop1() {
   uint256 count1 = 0;
   // ...
   for(uint8 i = 0; i < 1000; i++) {
     count++;
   }
   require(count1 != 0, "count1 != 0");
   return count1;
}

uint256 for_loop2() {
   uint256 count2 = 0;
   // ...
   for(uint16 i = 0; i < 1000000; i++) {
     count2++;
   }
   require(count2 != 0, "count2 != 0");
   return count2;
}

// ...

_() {}
