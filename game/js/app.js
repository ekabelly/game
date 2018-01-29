const app = angular.module("game", ["ngRoute", "ngCookies"]);

app.config($routeProvider => {
	$routeProvider.when('/', {
		templateUrl: 'game.html'
	});
});