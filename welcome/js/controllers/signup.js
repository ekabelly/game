app.controller('Signup', ($scope, $http, services) => {

	$scope.initSignup = () =>{
		if($scope.signup.password !== $scope.signup.pass2){
			$scope.err = "Passwords Don't Match";
			return;
		}
		const {email, password} = $scope.signup;
		$http.post('/signup', {email, password}).then(response=>
			successHandler('newUser', response.data.user)).catch(err=>errHnadler(err));
	}

});