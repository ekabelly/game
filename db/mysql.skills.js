const mysql = require('mysql');
const skills = require('./queries/queries.skills');
const con = require('../db/connection');

const {
	successHandler,
	errorHandler
} = require('../services');

const fetchSkill = (req, res, next) =>con.query(skills.fetchSkill, req.params.id, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

module.exports = {
	fetchSkill
}