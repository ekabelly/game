const express = require('express');
const Router = express.Router();

const {
	fetchItems,
	fetchItem
} = require('../db/mysql.items');

const {responseMiddleware, arrangeData} = require('../services');

Router.get('/items', fetchItems, arrangeData, responseMiddleware);

Router.get('/:id/item', fetchItem, arrangeData, responseMiddleware);

module.exports = Router;