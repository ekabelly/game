const express = require('express');
const Router = express.Router();

const {
	createSkill,
	updateSkill
} = require('../db/mysql.skills');

const {responseMiddleware} = require('../services');

Router.put('/skill', createSkill, responseMiddleware);

Router.patch('/:id/skill', updateSkill, responseMiddleware);

module.exports = Router;