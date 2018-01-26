const express = require('express');
const Router = express.Router();

const {
	fetchSkill
} = require('../db/mysql.game');

const {responseMiddleware, arrangeData} = require('../services');

Router.get('/:id/skill', fetchSkill, arrangeData, responseMiddleware);

module.exports = Router;