const createSuccessResponse = data => ({data, success: true});
const responseMiddleware = (req, res) => res.json(createSuccessResponse(req.data));

const arrangeData = (req,res,next) =>{
	const temp = {};
	req.data.forEach(entity=>{
		if (temp[entity.id]) {
			return Object.keys(entity).forEach(key=>{
				if (entity[key] !== temp[entity.id][key]) {
					temp[entity.id][key] = [temp[entity.id][key], entity[key]];
				}
			});
		}
		temp[entity.id] = entity;
	});
	req.data = temp;
	next();
}

module.exports = {responseMiddleware, arrangeData};