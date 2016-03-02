(function() {
	var app = angular.module('app', []);

	// Create the instant search filter

	app.filter('searchFor', function($filter) {

		// All filters must return a function. The first parameter
		// is the data that is to be filtered, and the second is an
		// argument that may be passed with a colon (searchFor:searchString)

		return function(arr, searchString) {

			if (!searchString) {
				return arr;
			}

			var result = [];

			searchString = searchString.toLowerCase();

			// Using the forEach helper method to loop through the array
			angular.forEach(arr, function(item) {

				if ((item.name.toLowerCase().indexOf(searchString) != -1)) {
					result.push(item);
				}
				
				var time = new Date(item.time);
				time = time;
				time = $filter('date')(time, "dd/MM/yyyy");
				time = time.toLowerCase();
				//console.log(time);
				if((time.indexOf(searchString) != -1)){
					
					//console.log(searchString);
					result.push(item);
				}
				if ((item.comment.toLowerCase().indexOf(searchString) != -1)) {
					result.push(item);
				}
				if ((item.place.toLowerCase().indexOf(searchString) != -1)) {
					result.push(item);
				}

			});

			return result;
		};

	});
	app.directive('showonhoverparent', function() {
		return {
			link : function(scope, element, attrs) {
				element.parent().bind('mouseenter', function() {
					element.show();
				});
				element.parent().bind('mouseleave', function() {
					element.hide();
				});
			}
		};
	});
	app.controller('InvoiceController', function($scope, $http) {

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;
		console.log("month " + month);
		console.log("year " + year);

		$scope.invoices = [];
		$scope.month = month + "/" + year;

		$http.get("Invoice/getByMonth/" + month + "-" + year).success(
				function(response) {

					// $scope.invoices.push(response);
					$scope.invoices = response;
					console.log("invoice ");
					console.log($scope.invoices[0]);

				});

		this.getInvoiceByMonth = function() {

			$http.get("Invoice/getByMonth/").success(function(response) {
				console.log(response);

			});

		};

		

		// Search Invoice

	});

	app.controller('DashboardController', function($http) {

		this.getTotalInvoices = function($http) {

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

		$http.get("Category/getAllCategories").success(function(response) {

			console.log(response);
		});

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

			$http.get("Category/checkCate/" + this.name).success(
					function(response) {
						console.log(response);
						this.isDuplicate = response;
					});

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