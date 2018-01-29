const express = require('express');
const session = require('express-session');
const app = express();
const BP = require('body-parser');
const CP = require('cookie-parser');
const {userResponse, validateUser, secret} = require('./config/config');
const passport = require('passport');
const passportConfig = require('./config/passport');
const ItemsRoute = require('./route/route.items');
const CharsRoute = require('./route/route.chars');
const SkillsRoute = require('./route/route.skills');
const con = require('./db/connection');

const startServer = () => app.listen(4001, ()=>console.log('server up on port 4001'));

app.use(BP.json());
app.use(CP());
app.use(BP.urlencoded({extended:true}));

passportConfig(passport);

app.use(session({
	secret, 
	name:'gameCookie', 
	resave: false, 
	saveUninitialized:false,
	cookie:{
		httponly:false,
		maxAge:1000*60*60,
		secure:false
	}
}));
app.use(passport.initialize());
app.use(passport.session());

app.use('/welcome', express.static('welcome'));

app.post('/signup', passport.authenticate('local-signup'), userResponse);

app.post('/login', passport.authenticate('local-login'), userResponse);

app.get('/logout', (req, res)=>{
  req.logout();
  return res.json({status:'success'});
});

app.use('/client', express.static('client'));

app.use('/', express.static('game'));

app.all('*', validateUser);

app.get('/user', userResponse);

app.use('/chars', CharsRoute);

app.use('/skills', SkillsRoute);

app.use('/items', ItemsRoute);

// con.connect((err) => {
//   if (err){
//   	con.end();
//   	throw err;
//   }
  startServer();
// });