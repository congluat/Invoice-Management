(function() {
	var app = angular.module('app', []);

	app
			.controller(
					'AddUserController',
					function($scope, $http) {
						$scope.user = {
							name : '',
							age : '',
						};

						this.addUser = function() {
							// alert(this.user.name);
							var url = 'addUser';
							var data = $.param({
								name : this.user.name,
								age : this.user.age,
							});

							var config = {
								headers : {
									'Content-Type' : 'application/x-www-form-urlencoded;charset=utf-8;'
								}
							}
							
							console.log(data);

							$http.post(url, data, config).success(
									function(data, status, headers, config) {
										$scope.PostDataResponse = data;
									}).error(
									function(data, status, header, config) {
										$scope.ResponseDetails = "Data: "
												+ data + "<hr />status: "
												+ status + "<hr />headers: "
												+ header + "<hr />config: "
												+ config;
									});
						};
					});

	app.controller('CategoryController', function($scope, $http) {

		$http.get("getAllCategories").success(function(response) {
			$scope.categories = response;
			console.log(response);
		});

	});

	app.controller('UserController', function($scope, $http) {

		$http.get("checkUser").success(function(response) {

			$scope.user = response;

			if (response == true) {
				$('#myModal').modal('hide');
			} else {
				$('#myModal').modal('show');
			}
			console.log(response);

		});

	});

})();