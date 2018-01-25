const BP = require('body-parser');
const express = require('express');
const app = express();
const GameRoute = require('./route/game');
const con = require('./db/connection');

con.connect((err) => {
  if (err) throw err;
  console.log('Connected!');
  startServer();
});

const startServer = () => app.listen(4001, ()=>console.log('server up on port 4001'));

app.use('/game', GameRoute);