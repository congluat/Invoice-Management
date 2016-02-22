
(function() {
	var app = angular.module('app', []);

	app.controller('CategoryController', function($scope, $http) {

		$http.get("getAllCategories").success(function(response) {
			$scope.categories = response;
			console.log(response);
		});

	});
	

})();