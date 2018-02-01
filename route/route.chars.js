const express = require('express');
const Router = express.Router();

const {
	fetchAllCharacters,
	fetchChar,
	fetchCharStats,
	fetchCharItems,
	findCharByName,
	fetchUserChars
} = require('../db/mysql.chars');

const {responseMiddleware, passCurrentUserId} = require('../services');

Router.get('/chars', fetchAllCharacters, responseMiddleware);

Router.get('/:id/char', fetchChar, fetchCharStats, fetchCharItems, responseMiddleware);

Router.get('/:name/findChar', findCharByName, responseMiddleware);

Router.get('/userChars', passCurrentUserId, fetchUserChars, responseMiddleware);

module.exports = Router;