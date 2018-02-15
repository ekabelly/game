const express = require('express');
const Router = express.Router();

const {
	createSkill,
	updateSkill
} = require('../db/mysql.skills');

const {
	responseMiddleware, 
	createUpdateQuery, 
	createUpdateQueryArr
} = require('../services');

Router.put('/skill', createSkill, responseMiddleware);

Router.patch('/:id/skill', createUpdateQuery, createUpdateQueryArr, updateSkill, responseMiddleware);

module.exports = Router;