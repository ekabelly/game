app.factory('services', ($http) =>{

	var data = {};

	const login = (email, password)=>$http.post('/login', {email, password})

	const isAuthenticated = () =>$http.get('/user');

	const fetchUserChars = () =>$http.get('/chars/userChars');

	const fetchAllChars = () =>$http.get('/chars/chars');

	const fetchChar = id =>$http.get('/chars/'+id+'/char');

	return {
		login,
		isAuthenticated,
		fetchUserChars,
		fetchAllChars,
		fetchChar
	};
});