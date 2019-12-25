# Smart contracts based on Ethereum and Vntchain (v1.0.0)
This is a repository containing smart contracts based on Ethereum and Vntchain.

## Reentrancy Risk of Ethereum Smart Contract

`Cross-function reentrancy.sol`

Attackers probably produce attacks using two different functions that share the same state. Generally, these attacks are harder to detect. A cross-function reentrancy attack is possible when a vulnerable function shares a state with another function that has a desirable effect on the attacker.
 
`Sharing-variable reentrancy.sol`

A reentrancy attack also may appear in such a situation, in which a vulnerable function shares interval states with another function that has a desirable effect on the attacker.

## Infinite Loop Risk of Vntchain smart Contract

Regardless of practical significance, we categorize specific infinite loop instances of smart contracts based on Vntchain into four types: For Loop, While Loop, Function Call cycle, and Fallback Call cycle. In what follows, we shortly recapitulate the four representative instances.

`For_cycle.c`

This is a typical example of "For cycle".

`While_cycle.c`

This is a typical example of "While cycle".

`Function_call_cycle.c`

This is a typical example of "Function Call cycle".

`Fallback_call_cycle.c`

This is a typical example of "Fallback Call cycle".

