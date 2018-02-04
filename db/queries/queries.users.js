const queries = {
	fechById:"select * from users where id = ?",
	fetchByEmail:"select email from users where email = ?",
	signup:"INSERT INTO users ( email, pass, picture, role) values (?, ?, ?, 'player')",
	login:"select * from users where email = ?"
}

module.exports = queries;