// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-upgradeable@5.0.0/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.0/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.0/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable@5.0.0/proxy/utils/UUPSUpgradeable.sol";

contract MivaToken is Initializable, ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __ERC20_init("MivaToken", "MVT");
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();

        _mint(msg.sender, 1000000 * 10 ** decimals()); // Initial supply: 1,000,000 tokens
    }

    // Function to allow only the owner to mint new tokens
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    // Function to allow users to transfer tokens
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Function to allow users to burn (destroy) their own tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to allow the owner to burn tokens from any account
    function burnFrom(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}
