# MyToken ERC20 Smart Contract

This repository contains the smart contract code for `MyToken`, an ERC20 token on the Ethereum blockchain. This contract includes functionality for minting, transferring, and burning tokens, with specific access control to ensure that only the contract owner can mint new tokens.

## Table of Contents

- [Introduction](#introduction)
- [Contract Functionality](#contract-functionality)
- [Detailed Steps and Explanation](#detailed-steps-and-explanation)
- [Deployment Instructions](#deployment-instructions)
- [Usage](#usage)
- [Events](#events)
- [Contributing](#contributing)
- [License](#license)
- [Help](#help)

## Introduction

The `MyToken` smart contract is an ERC20 token implementation that provides standard token functionalities along with access control for minting tokens. The contract ensures that only the owner can mint new tokens, while any user can transfer and burn tokens.

## Contract Functionality

1. **Minting Tokens**
   - **Access Control**: Only the contract owner can mint new tokens.
   - **Implementation**: This is enforced using a custom modifier `onlyContractOwner`.

2. **Transferring Tokens**
   - **Access Control**: Any user holding tokens can transfer them to another address.
   - **Implementation**: This uses the standard ERC20 transfer functionality.

3. **Burning Tokens**
   - **Access Control**: Any user holding tokens can burn them.
   - **Implementation**: This uses the standard ERC20 burn functionality.

## Detailed Steps and Explanation

### Import Statements

The contract imports `ERC20` and `Ownable` from the OpenZeppelin library. `ERC20` provides standard token functionality, while `Ownable` includes ownership management.

### Contract Definition

The `MyToken` contract is defined, inheriting from both `ERC20` and `Ownable`. The `Ownable` contract ensures that the contract has an owner and provides basic authorization control functions.

### Constructor Function

The constructor function is called once when the contract is deployed. It initializes the token with the name "CarlToken" and symbol "CTK". The `Ownable` constructor is called with `msg.sender`, setting the deployer as the owner. An initial mint of 1000 tokens is made to the owner. An `OwnerSet` event is emitted to log the setting of the owner.

### Custom Modifier `onlyContractOwner`

This custom modifier ensures that only the owner can call the function it modifies. It uses the `require` statement to check if `msg.sender` is the owner. If not, it reverts with the message "Caller is not the owner".

### Mint Function

This function allows the owner to mint new tokens. It is protected by the `onlyContractOwner` modifier.

### Burn Function

This function allows any user to burn their tokens. It is a public function and does not require any special access control.

## Deployment Instructions

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/mytoken.git
   cd mytoken
   ```

2. Install dependencies (if any):
   ```sh
   npm install
   ```

3. Compile the smart contract using Remix or your preferred development environment.

4. Deploy the contract using Remix, MetaMask, and your preferred Ethereum network.

## Usage

### Mint Tokens

Only the contract owner can mint tokens.

```solidity
function mint(address to, uint256 amount) public onlyContractOwner {
    _mint(to, amount);
}
```

### Transfer Tokens

Any user can transfer tokens.

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool) {
    return super.transfer(recipient, amount);
}
```

### Burn Tokens

Any user can burn their tokens.

```solidity
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}
```

## Events

The contract emits the following events:

- `OwnerSet`: Emitted when the ownership of the contract is transferred.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.


## Help

For more information and documentation, refer to the following resources:

- [OpenZeppelin Contracts](https://docs.openzeppelin.com/)
- [Solidity Documentation](https://docs.soliditylang.org/en/v0.8.26/)
- [Remix IDE Documentation](https://remix-ide.readthedocs.io/en/latest/)
- [MetaMask Documentation](https://docs.metamask.io)
