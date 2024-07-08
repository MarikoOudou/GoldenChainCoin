const contract = require('./src/services/SmartContractService');

const express = require('express');
// const itemRoutes = require('./src/routes/routes');
const app = express();
const port = 3000;

// Middleware pour parser les corps de requête JSON
app.use(express.json());

//
app.get('/', async (req, res) => {

  // let service = {
  //   name   : await contract.ContractService().name,
  //   symbol : await contract.ContractService().symbol,
  // };
  // console.log(service);

  var info = {};
  
  await contract.getTokenInfo().then(
    value => info = value
  );

  console.log(info)


  res.status(200).json(JSON.parse(JSON.stringify(info, (key, value) =>
    typeof value === 'bigint'
        ? value.toString()
        : value // return everything else unchanged
    )));
});


// Charger les routes
app.post('/info', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.post('/transfert', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.post('/buy', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.post('/send', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.post('/sell', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.post('/profil', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

app.get('/history', (req, res) => {
  let data = req.body;
  let reponse = {};

  res.status(201).json(reponse);
});

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur RESTful en écoute sur le port ${port}`);
});
