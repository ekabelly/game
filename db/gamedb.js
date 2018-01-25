const mysql = require('mysql');
const queries = require('./queries/queries');
const con = require('../db/connection');

const errorHandler = (err,res,cb) => {
	if (err) res.json(err);
	if (cb) cb();
}

const successHandler = (req, rows, next) => {
	req.data = rows;
	return next();
}

const fetchAllCharacters = (req, res, next) =>con.query(queries.fetchChars, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

const fetchChar = (req, res, next) =>con.query(queries.fetchChar, [req.params.id], (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows[0], next)));

const fetchItems = (req, res, next) =>con.query(queries.fetchItems, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

module.exports = {
	fetchAllCharacters,
	fetchChar,
	fetchItems
}