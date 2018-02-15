const mysql = require('mysql');
const skills = require('./queries/queries.skills');
const con = require('../db/connection');

const {
	successHandler,
	errorHandler
} = require('../services');

const fetchSkill = (req, res, next) =>con.query(skills.fetchSkill, req.params.id, (err, rows)=>
	errorHandler(err, res, ()=>successHandler(req, rows, next)));

const createSkill = (req, res, next) =>con.query(skills.createSkill, [req.body.name, req.body.description, req.body.picture, req.body.level], (err, row)=>
	errorHandler(err, res, ()=>successHandler(req, row, next)));

const updateSkill = (req, res, next) =>con.query(skills.updateSkill+req.query.str, req.query.arr, (err, row)=>
		errorHandler(err, res, ()=>successHandler(req, row, next)));

module.exports = {
	fetchSkill,
	createSkill,
	updateSkill
}