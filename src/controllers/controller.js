const smartContractService = require('../services/SmartContractService');


const contract = smartContractService.ContractService();
const getInfo =async () => await smartContractService.getTokenInfo();



        const test = async () => {
            const name = await contract.name();
            console.log(`Nom du jeton: ${name}`);
        }

        test();






console.log(getInfo)


const getInfoAccount = (req, res) => {
    const info = {
        
    }
    res.json(items);
  };