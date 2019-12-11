# Vulnerabilities of smart contract
This is a repo that contains the smart contract vulnerabilities, such as reenrtancy and infinite loop.

## Reentrancy Risk of Ethereum Smart Contract

`Reentrancy_cross_function.sol`

An attacker may also be able to do a similar attack using two different functions that share the same state. These attacks are harder to detect. A cross-function reentrancy attack is possible when a vulnerable function shares state with another function that has a desirable effect for the attacker.

 
`Reentrancy_state_unlocking.sol`

A reentrancy attack probably appears in such situation, which a vulnerable function shares interval states with another function that has a desirable effect for the attacker.


## Infinite Loop Risk of Vntchain smart Contract

   Regardless of practical significance, we categorize specific infinite loop instances of smart contracts based on vntchain into four types: For Loop, While Loop, Functions Call Ring, and Fallback Call Ring. In what follows, we shortly recapitulate the four representative instances.
   

`Infinite_loop_for.c`

This is an example of "For Loop".


`Infinite_loop_while.c`

This is an example of "While Loop".


`Infinite_loop_function_ring.c`

This is an example of "Functions Call Ring".


`Infinite_loop_fallback_ring.c`

This is an example of "Fallback Call Ring".


