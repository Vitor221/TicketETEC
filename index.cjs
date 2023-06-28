// index.js
const express = require('express');
const cors = require('cors');
const app = express();
const db = require('./db.cjs');

app.use(cors());
app.use(express.json());

app.post('/api/login', (req, res) => {
  const { email, senha } = req.body;

  const sqlAtendente = 'SELECT * FROM tb_atendente WHERE cd_email_atendente = ? AND cd_senha_atendente = ?';
  const sqlIntegrante = 'SELECT * FROM tb_integrantes WHERE cd_email_integrante = ? AND cd_senha_integrante = ?';

  db.query(sqlAtendente, [email, senha], (error, resultsAtendente) => {
    if (error) {
      console.log(error);
      res.json({ success: false, message: 'Erro no servidor' });
    } else {
      if (resultsAtendente.length > 0) {
        res.json({ success: true, tipoUsuario: 'atendente', message: 'Autenticação bem-sucedida' });
      } else {
        db.query(sqlIntegrante, [email, senha], (error, resultsIntegrante) => {
          if (error) {
            console.log(error);
            res.json({ success: false, message: 'Erro no servidor' });
          } else {
            if (resultsIntegrante.length > 0) {
              res.json({ success: true, tipoUsuario: 'integrante', message: 'Autenticação bem-sucedida' });
            } else {
              res.json({ success: false, message: 'Credenciais inválidas' });
            }
          }
        });
      }
    }
  });
});

app.post('/api/ticket', (req, res) => {
  const {
    descricao,
    dataInicio,
    dataTermino,
    horaInicio,
    horaTermino,
    gravidade,
    status
  } = req.body;

  const sql = 'INSERT INTO tb_ticket (ds_descricao_ticket, dt_data_inicio, dt_data_fim, hr_data_inicio, hr_data_fim, ds_gravidade_ticket, ds_status_ticket) VALUES (?, ?, ?, ?, ?, ?, ?)';

  db.query(sql, [descricao, dataInicio, dataTermino, horaInicio, horaTermino, gravidade, status], (error, results) => {
    if(error) {
      console.log(error);
      res.json({ success: false, message: 'Erro no servidor'});
    } else {
      res.json({ success: true, message: 'Ticket criado com sucesso'});
    }
  })
})


app.listen(3000, () => {
  console.log('Servidor backend em execução na porta localhost:3000/');
});

// Execute o comando "node index.cjs" no terminal para rodar o servidor backend