const express = require('express');
const app = express();
const BP = require('body-parser');
const ItemsRoute = require('./route/route.items');
const CharsRoute = require('./route/route.chars');
const SkillsRoute = require('./route/route.skills');
const con = require('./db/connection');

const startServer = () => app.listen(4001, ()=>console.log('server up on port 4001'));

app.use(BP.json());
app.use(BP.urlencoded({extended:true}));

app.use('/node_modules', express.static('node_modules'));

app.use('/client', express.static('client'));

app.use('/game', express.static('game'));

app.use('/chars', CharsRoute);

app.use('/skills', SkillsRoute);

app.use('/items', ItemsRoute);

con.connect((err) => {
  if (err){
  	con.end();
  	throw err;
  }
  startServer();
});