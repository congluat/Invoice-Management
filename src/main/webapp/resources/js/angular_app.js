(function() {

	var app = angular.module('app', [ 'googlechart' ]);

	app.controller('ChartController', function($scope, $http) {

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;

		$scope.timeInput = month + "/" + year;
		console.log("TimInput Init: " + $scope.timeInput);
		$scope.timeChanged = function() {
			console.log($("#inputDateTime").val());
			$scope.timeInput = $("#inputDateTime").val();
			$scope.drawChart();
		};

		$scope.$watch('timeInput', function() {
			console.log($scope.timeInput);
			$scope.drawChart();
		});

		$scope.drawChart = function() {

			// var time = console.log($("#inputDateTime").val());
			console.log("time" + $scope.timeInput);
			var month = parseInt($scope.timeInput.split('/')[0]);
			var year = parseInt($scope.timeInput.split('/')[1]);

			console.log("month/year: " + month + "/" + year);

			var chart1 = {};
			chart1.type = "PieChart";
			chart1.data = [ [ 'Component', 'amount' ] ];
			// [ 'Component', 'amount' ]
			$http.get("Revenue/category-in-month/" + month + "-" + year)
					.success(function(response) {

						// chart1.data = response;
						for (var i = 0; i < response.length; i++) {
							chart1.data.push(response[i]);
						}

						// console.log(response);
						console.log(chart1);
						chart1.options = {
							displayExactValues : true,
							/*
							 * width : 600, height : 600,
							 */
							is3D : false,
							chartArea : {
								left : 10,
								top : 10,
								bottom : 0,
								height : "100%"
							}
						};

						chart1.formatters = {
							number : [ {
								columnNum : 1,
								pattern : "$ #,##0.00"
							} ]
						};

						$scope.chart = chart1;
						console.log("Chart drawed");
					});

		};

	});

	app.controller("HomeController", function($scope, $http) {

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;

		$scope.getTotalAmount = function() {

			$http.get("getAmountThisMonth/" + month + "-" + year).success(
					function(response) {
						console.log(response);
						response = response + '';
						console.log("length: " + response.length);
						if (response.length >= 9) {
							response = response.substring(0,
									response.length - 9);
							response = response + " billions";
						} else if (response.length >= 6) {
							response = response.substring(0,
									response.length - 6);
							response = response + " milions";
						} else if (response.length >= 3) {
							response = response.substring(0,
									response.length - 3);
							response = response + " thousands";
						}

						$scope.amount = response;

					});

		};

		$scope.getToltalInvoiceThisMonth = function() {

			$http.get("Invoice/getByMonth/" + month + "-" + year).success(
					function(response) {

						$scope.month = response.length;
					});
		};

	});
	// Create the instant search filter
	app.filter('searchFor', function($filter, $http) {

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
			angular
					.forEach(arr,
							function(item) {

								if ((item.name.toLowerCase().indexOf(
										searchString) != -1)) {
									result.push(item);
								}

								var time = new Date(item.time);
								time = time;
								time = $filter('date')(time, "dd/MM/yyyy");
								time = time.toLowerCase();
								// console.log(time);
								if ((time.indexOf(searchString) != -1)) {

									// console.log(searchString);
									result.push(item);
								}
								if ((item.comment.toLowerCase().indexOf(
										searchString) != -1)) {
									result.push(item);
								}
								if ((item.place.toLowerCase().indexOf(
										searchString) != -1)) {
									result.push(item);
								}
								if ((item.category.name.toLowerCase().indexOf(
										searchString) != -1)) {
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

		$scope.deleteFunc = function(id) {
			$scope.deleteId = id;

		};

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;
		console.log("month " + month);
		console.log("year " + year);

		$scope.invoices = [];
		$scope.listByMonth = false;
		$scope.month = month + "/" + year;

		$http.get("Invoice/getByMonth/" + month + "-" + year).success(
				function(response) {
					$scope.listByMonth = true;
					// $scope.invoices.push(response);
					$scope.invoices = response;
					console.log("invoice ");
					console.log($scope.invoices[0]);

				});

		$scope.onSearchChange = function(searchString) {

			console.log("search: " + searchString);
			console.log("list by month: " + $scope.listByMonth);
			if ($scope.listByMonth == true && searchString.length != 0) {
				$scope.month = "Search";
				$http.get("Invoice/getAllInvoices").success(function(response) {
					$scope.listByMonth = false;
					// $scope.invoices.push(response);
					$scope.invoices = response;
					console.log("on change ");
					console.log($scope.invoices);

				});
			} else {
				if (searchString.length == 0) {
					$scope.month = month + "/" + year;
					$http.get("Invoice/getByMonth/" + month + "-" + year)
							.success(function(response) {
								$scope.listByMonth = true;
								// $scope.invoices.push(response);
								$scope.invoices = response;
								console.log("invoice ");
								console.log($scope.invoices[0]);

							});
				}

			}

		};

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