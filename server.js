const express = require('express');
const app = express();
const port = 3000;

// Middleware pour parser les corps de requête JSON
app.use(express.json());

// Charger les routes
const itemRoutes = require('./routes/itemRoutes');
app.use('/items', itemRoutes);

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur RESTful en écoute sur le port ${port}`);
});
