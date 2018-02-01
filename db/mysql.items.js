const mysql = require('mysql');
const skills = require('./queries/queries.skills');
const con = require('../db/connection');

const {
	successHandler,
	errorHandler
} = require('../services');

const fetchItem = (req, res, next) =>con.query(items.fetchItem, [req.params.id], (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

const fetchItems = (req, res, next) =>con.query(items.fetchItems, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

module.exports = {
	fetchItem,
	fetchItems
}