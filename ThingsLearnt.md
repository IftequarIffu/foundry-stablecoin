## Things learnt and to be kept in mind.

- We are making our contract DecntralizedStableCoin inherit from ERC20Burnable and not from ERC20 as we need the burn function from ERC20Burnable.sol. Burn is used to maintain the stability in price.
- 