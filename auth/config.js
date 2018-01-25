module.exports = {
	dburl:'mongodb://localhost:27017',
	secret: '1234alluneedislove',
	cookieName:'ougia',
	userResponse:(req, res)=>res.json({success:true, data:{fName:req.user.fName, lName:req.user.fName, id:req.user._id}})
}