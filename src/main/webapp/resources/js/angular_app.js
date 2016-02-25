(function() {
	var app = angular.module('app', []);

	app.controller('DashboardController',function($http){
		
		this.getTotalInvoices = function($http){
			
		}
	});
	
	
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
							var url = 'user/addUser';
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
										$(location).attr('href', 'dashboard')

									}).error(
									function(data, status, header, config) {
										$scope.error = "Can not save user";
										$scope.ResponseDetails = "Data: "
												+ data + "<hr />status: "
												+ status + "<hr />headers: "
												+ header + "<hr />config: "
												+ config;
									});
						};
					});

	app.controller('CategoryController', function($scope, $http) {

		// $http.get("Category/getAllCategories").success(function(response) {
		// $scope.categories = response;
		// console.log(response);
		// });

		$scope.cateName = "";
		$scope.error = "";

		$scope.submit = function($event) {
			console.log($scopecateName);
			$http.get("Category/checkCate/" + $scope.cateName).success(
					function(response) {
						console.log(response);
						if (response == true) {
							this.error = "This name is duplicate";

						}
					});
			$event.preventDefault();
		}

		this.checkCate = function() {

			// console.log(this.name);
			/*
			 * $http.get("Category/checkCate/" + this.name).success(
			 * function(response) { console.log(response); this.isDuplicate =
			 * response; });
			 */
		}

	});

	app.controller('UserController', function($scope, $http) {

		$http.get("user/checkUser").success(function(response) {

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