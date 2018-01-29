app.factory('services', ($http) =>{

	const isAuthenticated = () =>$http.get('/user');

	return {isAuthenticated};
});