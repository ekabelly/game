const express = require('express');
const app = express();
const ItemsRoute = require('./route/route.items');
const CharsRoute = require('./route/route.chars');
const SkillsRoute = require('./route/route.skills');
const con = require('./db/connection');

con.connect((err) => {
  if (err){
  	con.end();
  	throw err;
  } 
  console.log('Connected!');
  startServer();
});

const startServer = () => app.listen(4001, ()=>console.log('server up on port 4001'));

app.use('/chars', CharsRoute);

app.use('/skills', SkillsRoute);

app.use('/items', ItemsRoute);