const express = require('express');
const Router = express.Router();

const {
	fetchAllCharacters,
	findCharByName
} = require('../db/mysql.chars');

const {responseMiddleware} = require('../services');

Router.get('/', fetchAllCharacters, responseMiddleware);

Router.get('/:name/findChar', findCharByName, responseMiddleware);

module.exports = Router;