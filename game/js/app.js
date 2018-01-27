const app = angular.module("game", ["ngRoute", "ngCookies"]);

app.config($routeProvider => {
	$routeProvider.when('/game', {
		templateUrl: 'game.html'
	});
});