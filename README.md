# Vulnerabilities of smart contract
This is a repo containing smart contracts from Ethereum and Vntchain.

## Reentrancy Risk of Ethereum Smart Contract

`Reentrancy_cross_function.sol`

Attackers probably produce attacks using two different functions that share the same state. Generally, these attacks are harder to detect. A cross-function reentrancy attack is possible when a vulnerable function shares a state with another function that has a desirable effect on the attacker.
 
`Reentrancy_state_unlocking.sol`

A reentrancy attack also may appear in such a situation, in which a vulnerable function shares interval states with another function that has a desirable effect on the attacker.

## Infinite Loop Risk of Vntchain smart Contract

Regardless of practical significance, we categorize specific infinite loop instances of smart contracts based on Vntchain into four types: For Loop, While Loop, Function Call Ring, and Fallback Call Ring. In what follows, we shortly recapitulate the four representative instances.

`Infinite_loop_for.c`

This is a typical example of "For Loop".

`Infinite_loop_while.c`

This is a typical example of "While Loop".

`Infinite_loop_function_ring.c`

This is a typical example of "Function Call Ring".

`Infinite_loop_fallback_ring.c`

This is a typical example of "Fallback Call Ring".

