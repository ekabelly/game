// load all the things we need
const users = require('../db/queries/queries.users');
const LocalStrategy   = require('passport-local').Strategy;
const mysql = require('mysql');
const crypto = require('crypto');
const {secret} = require('./config');
const connection = require('../db/connection');

connection.query('USE game');
const passToCrypto = pass =>crypto.createHmac('sha256', secret).update(pass).digest('hex');


// expose this function to our app using module.exports
module.exports = function(passport) {

	// =========================================================================
    // passport session setup ==================================================
    // =========================================================================
    // required for persistent login sessions
    // passport needs ability to serialize and unserialize users out of session

    // used to serialize the user for the session
    passport.serializeUser((user, done)=> {
		done(null, user.id);
    });

    // used to deserialize the user
    passport.deserializeUser((id, done)=> {
		connection.query(users.fechById,id,function(err,rows){	
			done(err, rows[0]);
		});
    });
	

 	// =========================================================================
    // LOCAL SIGNUP ============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
	// by default, if there was no name, it would just be called 'local'

    passport.use('local-signup', new LocalStrategy({
        // by default, local strategy uses username and password, we will override with email
        usernameField : 'email',
        passwordField : 'pass',
        passReqToCallback : true // allows us to pass back the entire request to the callback
    },
    function(req, email, password, done) {
		// find a user whose email is the same as the forms email
		// we are checking to see if the user trying to login already exists
        connection.query(users.fetchByEmail, email,function(err,rows){
            // console.log(rows);
			if (err) return done(err);
			if (rows.length) {
                return done(null, false, {signupMessage:'That email is already taken.'});
            }
			connection.query(users.signup, [email, passToCrypto(password), req.body.picture],function(err,rows){
                const user = {id:rows.insertId, email:email, picture:req.body.picture};
			     return done(null, user);
			});	
		});
    }));

    // =========================================================================
    // LOCAL LOGIN =============================================================
    // =========================================================================
    // we are using named strategies since we have one for login and one for signup
    // by default, if there was no name, it would just be called 'local'

    passport.use('local-login', new LocalStrategy({
        // by default, local strategy uses username and password, we will override with email
        usernameField : 'email',
        passwordField : 'password',
        passReqToCallback : true // allows us to pass back the entire request to the callback
    },
    function(req, email, password, done) { // callback with email and password from our form

         connection.query(users.login, [email, password],function(err,rows){
			if (err)
                return done(err);
			 if (!rows.length) {
                return done(null, false, {loginMessage:'No user found.'}); // req.flash is the way to set flashdata using connect-flash
            } 
			
			// if the user is found but the password is wrong
            if (rows[0].pass !== passToCrypto(password)) return done(null, false, {loginMessage:'Oops! Wrong password.'}); // create the loginMessage and save it to session as flashdata
			
            // all is well, return successful user
            return done(null, rows[0]);			
		
		});
		


    }));


};