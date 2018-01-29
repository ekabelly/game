app.controller('Login', ($scope, $http, services) => {

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

	const initPage = () =>{
		services.isAuthenticated().then(res=>{
			successHandler('user', res.data.data);
			location.href = '/game';
		}).catch(err=>{
			$scope.user = false;
		});
	}

	$scope.initLogin = () =>$http.post('/login', {email:$scope.login.email, password:$scope.login.pass}).then(response=>{
		successHandler('user', response.data.data);
		location.href = '/game';
	}).catch(err=>errHnadler(err));

	initPage();
	
});