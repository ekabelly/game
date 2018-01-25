const express = require('express');
const Router = express.Router();

const {
	fetchAllCharacters,
	fetchChar,
	fetchItems
} = require('../db/gamedb');

const {responseMiddleware, arrangeData} = require('../services');

Router.get('/chars', fetchAllCharacters, responseMiddleware);

Router.get('/:id/char', fetchChar, responseMiddleware);

Router.get('/items', fetchItems, arrangeData, responseMiddleware);

module.exports = Router;