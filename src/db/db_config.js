const mysql = require('mysql2');
require('dotenv').config();

// Configuration de la connexion à la base de données
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'mydatabase'
});

// Établir la connexion
connection.connect((err) => {
  if (err) {
    console.error('Erreur de connexion à la base de données:', err.stack);
    return;
  }
  console.log('Connecté à la base de données avec l\'ID de connexion:', connection.threadId);
});

module.exports = connection;
