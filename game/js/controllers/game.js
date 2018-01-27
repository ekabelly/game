app.controller('game', ($scope, $http) => {

	const fetchAllChars = next =>
		$http.get('/chars/chars').then(res=>next(res.data.data));

	const fetchChar = (id, next) =>
		$http.get('/chars/'+id+'/char').then(res=>next(res.data.data));

	$scope.fetchChar = id =>fetchChar(id, data=>$scope.data.showChar = data);

	fetchAllChars(data=>$scope.data = {chars:data})

});