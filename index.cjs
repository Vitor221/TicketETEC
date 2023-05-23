// index.js
const express = require('express');
const cors = require('cors');
const app = express();
const db = require('./db.cjs'); // Importe o arquivo de configuração do banco de dados

app.use(cors());

app.get('/api/contas', (req, res) => { //Nomeando a rota onde retorna os dados e fazendo o método
  const sql = 'SELECT * FROM tb_login';
  db.query(sql, (error, result) => { // Consultando a tabela do banco de dados sql e retornando result ou error
    if (error) {
      console.log(error);
    }
    res.json(result);
  });
});

app.listen(3000, () => {
  console.log('Servidor backend em execução na porta localhost:3000/');
});

// Execute o comando "node index.cjs" no terminal para rodar o servidor backend