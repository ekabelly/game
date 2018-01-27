const express = require('express');
const Router = express.Router();

const {
	fetchAllCharacters,
	fetchAllCharactersDetails,
	fetchChar,
	fetchCharStats,
	fetchCharItems,
	findCharByName
} = require('../db/mysql.game');

const {responseMiddleware} = require('../services');

Router.get('/chars', fetchAllCharacters, responseMiddleware);

Router.get('/:id/char', fetchChar, fetchCharStats, fetchCharItems, responseMiddleware);

Router.get('/:name/findChar', findCharByName, responseMiddleware);

module.exports = Router;