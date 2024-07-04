// Importer la librairie Ethers.js
const { ethers, Contract } = require('ethers');


// ABI minimale pour interagir avec un jeton ERC-20
const tokenABI = require('../share/ABI.json');
const tokenAddress = '0x3a4A5C65037e94Dff3400c71C86A34AA7C40Aa52';
const address = '0xA060516D160CCA5Aa71E71843584C4D6e044790e';

//
const provider = new ethers.JsonRpcProvider('https://sepolia.infura.io/v3/3fc0261065b34274b175bf0279a89d52');
// Créez une instance de contrat
const contract = new Contract(tokenAddress, tokenABI, provider);

function ContractService() {
    return contract;
}

const getTokenInfo = async () => {
    try {

        // Récupérer le nom du jeton
        const name = await contract.name();
        console.log(`Nom du jeton: ${name}`);

        // Récupérer le symbole du jeton
        const symbol = await contract.symbol();
        console.log(`Symbole du jeton: ${symbol}`);

        // Récupérer le nombre de décimales du jeton
        const decimals = await contract.decimals();
        console.log(`Décimales du jeton: ${decimals}`);

        // Récupérer le solde de l'adresse spécifiée
        const balance = await contract.balanceOf(address);
        console.log(`Solde : ${balance}`);

        const adjustedBalance = ethers.formatUnits(balance, decimals);
        console.log(`Le solde de l'adresse ${address} est: ${adjustedBalance} ${symbol}`);

        const info = {
            name,
            symbol,
            decimals,
            balance,
            solde: adjustedBalance
        };

        // console.log(info);
        return info;
    } catch (error) {
        console.error('Erreur lors de la récupération des informations du jeton:', error);
    }
}



// Appel de la fonction pour récupérer les informations du jeton
// getTokenInfo();


module.exports = {
    ContractService,
    getTokenInfo
  };