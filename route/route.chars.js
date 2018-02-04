const express = require('express');
const Router = express.Router();

const {
	fetchChar,
	fetchCharStats,
	fetchCharItems,
	fetchUserChars,
	createChar
} = require('../db/mysql.chars');

const {responseMiddleware, passCurrentUserId} = require('../services');

Router.get('/:id/char', fetchChar, fetchCharStats, fetchCharItems, responseMiddleware);

Router.get('/userChars', passCurrentUserId, fetchUserChars, responseMiddleware);

Router.put('/char', createChar, responseMiddleware);

module.exports = Router;