
# MivaToken (MVT)

MivaToken (MVT) is an ERC-20 token built on the Ethereum blockchain and provides a flexible and upgradeable solution for managing digital assets within decentralized applications (DApps) and token ecosystems.

## Features

1. ERC-20 Compliance: Its ERC-20 compliant, ensuring compatibility with various decentralized exchanges (DEX), wallets, and other Ethereum-based applications.
2. Upgradeability: The contract is designed to be upgradeable, allowing for future enhancements and improvements while preserving the existing state and functionality.
3. Owner Control: The contract owner has special privileges, with ability to mint new tokens, burn tokens from any account, and authorize contract upgrades.

## Token Details

Token Name: MivaToken
Symbol: MVT
Decimals: 10

## Deployment

The MivaToken contract is deployed on the Ethereum blockchain. You can find the contract address and transaction details on [Etherscan](https://etherscan.io/) or other blockchain explorers.

## Usage

### Minting Tokens

Only the owner of the contract can mint new tokens. To mint tokens, call the `mint` function with the recipient's address and the desired amount.

```solidity
function mint(address account, uint256 amount) public onlyOwner {
    _mint(account, amount);
}
```

### Transferring Tokens

Users can transfer MVT tokens to other addresses using the standard ERC-20 `transfer` function.

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool) {
    _transfer(_msgSender(), recipient, amount);
    return true;
}
```

### Burning Tokens
Token holders can burn their own tokens using the `burn` function.

```solidity
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}
```

### Owner-controlled Burning
The contract owner can burn tokens from any account using the `burnFrom` function.

```solidity
function burnFrom(address account, uint256 amount) public onlyOwner {
    _burn(account, amount);
}
```

### Upgradeability
The contract is designed to be upgradeable. The contract owner can authorize an upgrade to a new implementation by calling the `_authorizeUpgrade` function.

```solidity
function _authorizeUpgrade(address newImplementation) internal onlyOwner override {}
```

## Author
Jeremiah Samuel

## License

This contract is open-source and released under the MIT License.
