const mysql = require('mysql');
const chars = require('./queries/queries.chars');
const items = require('./queries/queries.items');
const skills = require('./queries/queries.skills');
const con = require('../db/connection');

const {
	moreDataHandler,
	successHandler,
	errorHandler
} = require('../services');

const fetchAllCharacters = (req, res, next) =>con.query(chars.fetchChars, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

const fetchChar = (req, res, next) =>con.query(chars.fetchChar, req.params.id, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows[0], next)));

const findCharByName = (req, res, next) =>con.query(chars.findCharByName+"'%"+req.params.name+"%'", (err, rows)=>errorHandler(err, res, ()=>rows.forEach(id=>{
		req.data = {params:id};
		fetchChar(req.data, res, ()=>fetchCharStats(req.data, res, ()=>fetchCharItems(req.data, res, next)));
	})));

const fetchItems = (req, res, next) =>con.query(items.fetchItems, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

const fetchCharStats = (req, res, next) =>con.query(chars.fetchCharStats, req.params.id, (err, rows)=>errorHandler(err, res, ()=>moreDataHandler(req, 'charStats', rows, next)));

const fetchCharItems = (req, res, next) =>con.query(chars.fetchCharItems, req.params.id, (err, rows)=>errorHandler(err, res, ()=>moreDataHandler(req, 'charItems', rows, next)));

const fetchItem = (req, res, next) =>con.query(items.fetchItem, [req.params.id], (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

const fetchSkill = (req, res, next) =>con.query(skills.fetchSkill, req.params.id, (err, rows)=>errorHandler(err, res, ()=>successHandler(req, rows, next)));

module.exports = {
	fetchAllCharacters,
	fetchChar,
	findCharByName,
	fetchItems,
	fetchCharStats,
	fetchCharItems,
	fetchItem,
	fetchSkill
}




// const fetchItemStats = (req, res, next) =>con.query(items.fetchItemStats, [req.params.id], (err, rows)=>errorHandler(err, res, ()=>moreDataHandler(req, 'itemStats', rows, next)));

// const fetchItemEffects = (req, res, next) =>con.query(items.fetchItemEffects, [req.params.id], (err, rows)=>errorHandler(err, res, ()=>moreDataHandler(req, 'itemEffects', rows, next)));