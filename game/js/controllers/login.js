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
		services.isAuthenticated().then(res=>successHandler('user', res.data.data)).catch(err=>{
			$scope.user = false;
			$scope.login = {};
		});
	}

	$scope.initLogin = () =>services.login($scope.login.email, $scope.login.pass).then(response=>
		successHandler('user', response.data.data)).catch(err=>errHnadler(err));

	initPage();
	
});