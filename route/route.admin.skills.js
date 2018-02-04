const express = require('express');
const Router = express.Router();

const {
	createSkill
} = require('../db/mysql.skills');

const {responseMiddleware} = require('../services');

Router.put('/skill', createSkill, responseMiddleware);

module.exports = Router;