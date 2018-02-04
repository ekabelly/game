const express = require('express');
const session = require('express-session');
const app = express();
const BP = require('body-parser');
const CP = require('cookie-parser');
const passport = require('passport');

const passportConfig = require('./config/passport');
const con = require('./db/connection');

const {userResponse, validateUser, validateAdmin, secret} = require('./config/config');

//general routes
const ItemsRoute = require('./route/route.items');
const CharsRoute = require('./route/route.chars');
const SkillsRoute = require('./route/route.skills');

//admin routes
const adminCharsRoute = require('./route/route.admin.chars');
const adminSkillsRoute = require('./route/route.admin.skills');



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

app.all('*', validateAdmin);

app.use('/admin/chars', adminCharsRoute);

app.use('/admin/skills', adminSkillsRoute);

startServer();