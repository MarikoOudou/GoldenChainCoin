// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact oudoumariko@gmail.com
contract GoldenChainCoin is ERC20, ERC20Burnable, ERC20Pausable, Ownable {
    mapping(address => bool) public registeredUsers;

    constructor(address initialOwner)
        ERC20("Golden Chain Coin", "GCC")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 3000000 * 10 ** decimals());
        registeredUsers[initialOwner] = true;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }

        // Fonction pour enregistrer un utilisateur
    function registerUser(address userAddress) external {
        registeredUsers[userAddress] = true;
    }

    // Fonction pour désenregistrer un utilisateur
    function unregisterUser(address userAddress) external {
        registeredUsers[userAddress] = false;
    }

    // Fonction pour vérifier si une adresse est enregistrée
    function isRegisteredUser(address userAddress) public view returns (bool) {
        return registeredUsers[userAddress];
    }

    // Surcharge de la fonction de transfert pour vérifier si l'utilisateur est enregistré
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(registeredUsers[msg.sender], "Sender must be a registered user");
        require(registeredUsers[recipient], "Recipient must be a registered user");

        return super.transfer(recipient, amount);
    }
}
