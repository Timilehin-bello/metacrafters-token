# Token Contract

This is a smart contract written in Solidity that allows the creation and management of a custom token called "Cryptite" (CPT) on a local HardHat network. The contract supports functionalities such as token transfers, approvals, minting, and burning.

# Link

Github Link: https://github.com/Timilehin-bello/metacrafters-token

# Author

Oluwatimilehin Bello
Github Link: https://github.com/Timilehin-bello

# How to Install and Run the Project

**Clone the repository**

```javascript
git clone https://github.com/Timilehin-bello/metacrafters-token.git
```

**cd into the Client Folder**

```bash
cd metacrafters-token
```

**Delete package-lock.json**

```bash
rm package-lock.json
```

**Install the dependencies**

```javascript
npm install
```

**Start Hardhat node**

```javascript
npx hardhat node
```

**Run the deploy Script**

```javascript
npx hardhat run ./scripts/deploy.js
```

### !!IMPORTANT

- Ensure you're connected to your localhost network provided by hardhat, the network setup is below

## Metamask Setup

### Localhost Network Setup

1. Open metamask and add network.
2. Network name `Localhost`
3. New RPC URL `http://127.0.0.1:8545`
4. Chain ID `31337`
5. Currency symbol `GO`

## Features

- **Token Creation**: The contract deploys with an initial supply of tokens, which is set during contract deployment. The owner of the contract is assigned the total supply of tokens.

- **Token Transfers**: Any token holder can transfer tokens to another address by calling the `transfer` function. The sender must have a sufficient balance to complete the transfer.

- **Approvals**: Token holders can approve another address to spend tokens on their behalf using the `approve` function. This creates an allowance for the approved address to transfer tokens.

- **Token Transfers on Behalf**: An address with an allowance can transfer tokens on behalf of the token holder by calling the `transferFrom` function. The transfer must not exceed the approved allowance and the token holder's balance.

- **Token Minting**: The owner of the contract has the ability to mint new tokens to a specified address by calling the `mint` function. Minting increases the total supply and updates the balance of the recipient.

- **Token Burning**: Token holders can burn their own tokens by calling the `burn` function. Burning reduces the total supply and the balance of the token holder.

## Usage

1. Deploy the contract to a local HardHat network.
2. Use Remix or any other Solidity IDE to interact with the deployed contract.
3. As the contract owner, mint tokens to a specified address using the `mint` function.
4. Users can transfer tokens by calling the `transfer` function and providing the recipient's address and the desired token amount.
5. Users can approve another address to spend tokens on their behalf using the `approve` function.
6. The approved address can then transfer tokens from the user's balance by calling the `transferFrom` function, respecting the approved allowance.
7. Token holders can burn their own tokens by calling the `burn` function and specifying the amount to burn.

## Contract Details

### State Variables

- `name`: A string representing the name of the token.
- `symbol`: A string representing the symbol of the token.
- `decimals`: An unsigned integer representing the number of decimal places for the token.
- `totalSupply`: An unsigned integer representing the total supply of tokens.
- `owner`: The address of the contract owner.

### Functions

- `transfer(address _to, uint256 _value)`: Transfers tokens from the sender's balance to the specified address.
- `approve(address _spender, uint256 _value)`: Approves the specified address to spend tokens on behalf of the sender.
- `transferFrom(address _from, address _to, uint256 _value)`: Transfers tokens from a specified address to another address on behalf of the sender.
- `mint(address _to, uint256 _value)`: Mints new tokens and assigns them to the specified address. Only the contract owner can call this function.
- `burn(uint256 _value)`: Burns tokens from the sender's balance, reducing the total supply. The sender must have sufficient balance to burn.

### Events

- `Transfer(address indexed from, address indexed to, uint256 value)`: Emitted when tokens are transferred between addresses.
- `Approval(address indexed owner, address indexed spender, uint256 value)`: Emitted when an approval is set for an address to spend tokens on behalf of another address.

## Assessment Submission to MetaCrafters

This smart contract serves as my submission for the assessment to MetaCrafters. I have implemented the required functionalities and included explanations for each variable and function in this README. If you have any questions or need further clarification, please let me know.

## License

This Cryptite Token is licensed under the MIT License, allowing anyone to use, modify, and distribute the code. You can find the license text at the beginning of the contract file.
