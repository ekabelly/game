const createSuccessResponse = data => ({data, success: true});
const responseMiddleware = (req, res) => res.json(createSuccessResponse(req.data));

const errorHandler = (err,res,cb) => {
	if (err) return res.json(err);
	if (cb) cb();
}

const successHandler = (req, rows, next) => {
	req.data = rows;
	return next();
}

const moreDataHandler = (req, more, rows, next) => {
	req.data[more] = rows;
	return next();
}

const arrangeData = (req,res,next) =>{
	const temp = {};
	req.data.forEach(entity=>{
		if (temp[entity.id]) {
			return Object.keys(entity).forEach(key=>{
				if (entity[key] !== temp[entity.id][key]) {
					console.log(key);
					temp[entity.id][key] = [temp[entity.id][key], entity[key]];
				}
			});
		}
		temp[entity.id] = entity;
	});
	req.data = temp;
	next();
}

const passCurrentUserId = (req, res, next) =>{
	req.data = {...req.data, userId:req.user.id};
	next();
}

const createUpdateQueryArr = req =>{
	let query = '';
	Object.keys(req.body).forEach((field, i)=>{
		if (field === 'id') return;
		if (req.body[field]) {
			query+=field+"='"+req.body[field]+"'";
		}	
		if (Object.values(req.body)[i+1]) query+=",";
	});
	query+=" where id = "+req.params.id;
	return query;
}

module.exports = {
	responseMiddleware, 
	arrangeData,
	moreDataHandler,
	successHandler,
	errorHandler,
	passCurrentUserId,
	createUpdateQueryArr
};