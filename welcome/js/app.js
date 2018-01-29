const app = angular.module("game", ["ngRoute", "ngCookies"]);

app.config($routeProvider => {
	$routeProvider.when('/login', {
		templateUrl: 'login.html'
	}).when('/', {
		templateUrl: 'login.html'
	}).when('/signup', {
		templateUrl: 'signup.html'
	});
});