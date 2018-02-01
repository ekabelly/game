app.controller('game', ($scope, $http, services) => {

	const successHandler = (req, res) =>$scope[req] = res;

	const errHnadler = err =>{
		if (err.status === 400) {
			return $scope.err = 'Please Fill All The Fields Correctly';
		}
		if (err.status === 401) {
			return $scope.err = 'Wrong Email Or Password';
		}
		return $scope.err = err;
	} 

	const fetchAllChars = next =>
		services.fetchAllChars().then(res=>next(res.data.data));

	const fetchChar = (id, next) =>
		services.fetchChar(id).then(res=>next(res.data.data));

	$scope.fetchChar = id =>fetchChar(id, data=>$scope.data.showChar = data);

	const fetchUserChars = () =>
		services.fetchUserChars().then(res=>{
			console.log(res.data.data);
			successHandler('data', {
				...$scope.data,
				user:true, 
				chars:res.data.data
			});
		});

	const initPage = () =>services.isAuthenticated().then(res=>{
		successHandler('user', res.data.data);
		fetchUserChars();
	}).catch(err=>{$scope.user = false});

	initPage();

	// fetchAllChars(data=>$scope.data = {chars:data});

});