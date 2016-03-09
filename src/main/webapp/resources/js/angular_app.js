(function() {
	"use strict";

	google.setOnLoadCallback(function() {
		angular.bootstrap(document.body, [ 'app' ]);
	});
	google.load('visualization', '1', {
		packages : [ 'corechart' ]
	});
	var app = angular.module('app', [ 'googlechart' ]);

	// https://github.com/angular-google-chart/angular-google-chart

	app.controller('ChartController', function($scope, $http, $window) {

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;

		$scope.timeInput = month + "/" + year;
		console.log("TimInput Init: " + $scope.timeInput);
		$scope.timeChanged = function() {
			$("#content").hide();
			$("#loading").show();
			console.log($("#inputDateTime").val());
			$scope.timeInput = $("#inputDateTime").val();
			$scope.drawChart();
			$scope.drawDialyChart();
			$("#content").show();
			$("#loading").hide();
		};

		$scope.$watch(function() {
			return $window.innerWidth;
		}, function(value) {
			$scope.drawChart();
			$scope.drawDialyChart();
		});

		$scope.$watch('timeInput', function() {
			console.log($scope.timeInput);
			$scope.drawChart();
		});
		$scope.chartData = [];

		$scope.drawDialyChart = function() {

			var month = parseInt($scope.timeInput.split('/')[0]);
			var year = parseInt($scope.timeInput.split('/')[1]);
			var tempdata = [];
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Day');
			data.addColumn('number', 'Amount');

			// google.visualization
			// .arrayToDataTable([ [ 'Day', 'Amount' ] ]);
			$http.get("Revenue/getdialyuse/" + month + "-" + year).success(
					function(response) {

						console.log(response);
						for (var i = 0; i < response.length; i++) {

							tempdata.push(response[i]);

						}
						// data.addColumn('string','day');

						// data =
						// google.visualization.arrayToDataTable(tempdata);
						data.addRows(tempdata);
						var options = {
							hAxis : {
								title : 'Day',
								Discrete : true
							},
							vAxis : {
								title : 'Money'

							},
							title : 'Dialy Amount',

							legend : {
								position : 'top'
							}

						};
						var chart = new google.visualization.ColumnChart(
								document.getElementById('dialyChartDiv'));

						chart.draw(data, options);
						$("#content").show();
						$("#loading").hide();
					});

		};

		$scope.drawChart = function() {
			// var time = console.log($("#inputDateTime").val());
			console.log("time" + $scope.timeInput);
			var month = parseInt($scope.timeInput.split('/')[0]);
			var year = parseInt($scope.timeInput.split('/')[1]);

			console.log("month/year: " + month + "/" + year);

			var chart1 = {};
			chart1.type = "PieChart";
			chart1.data = [ [ 'Category', 'amount' ] ];
			// [ 'Component', 'amount' ]
			$http.get("Revenue/category-in-month/" + month + "-" + year)
					.success(function(response) {

						$scope.Total = 0;
						// chart1.data = response;
						for (var i = 0; i < response.length; i++) {
							chart1.data.push(response[i]);
							$scope.Total += response[i][1];
						}

						console.log($scope.Total);
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
								height : "100%",
								width : "100%"
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

						$("#content").show();
						$("#loading").hide();
					});

		};

	});

	app.controller("HomeController", function($scope, $http, $window) {
		$scope.$watch(function() {
			return $window.innerWidth;
		}, function(value) {
			$scope.drawChart();
			$scope.drawDialyChart();
		});
		$scope.drawDialyChart = function() {
			var now = new Date();
			var month = parseInt(now.getMonth()) + 1;
			var year = parseInt(now.getYear()) + 1900;
			var tempdata = [];
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Day');
			data.addColumn('number', 'Amount');
			// google.visualization
			// .arrayToDataTable([ [ 'Day', 'Amount' ] ]);
			$http.get("Revenue/getdialyuse/" + month + "-" + year).success(
					function(response) {
						console.log(response);
						for (var i = 0; i < response.length; i++) {

							tempdata.push(response[i]);

						}
						// data.addColumn('string','day');

						// data =
						// google.visualization.arrayToDataTable(tempdata);
						data.addRows(tempdata);
						var options = {
							hAxis : {
								title : 'Day',
								dataType : 'string',
								Discrete : true
							},
							vAxis : {
								title : 'Money'

							},
							title : 'Dialy Amount',

							legend : {
								position : 'top'
							}

						};
						var chart = new google.visualization.LineChart(document
								.getElementById('dialyChartDiv'));

						chart.draw(data, options);
					});

		};

		$scope.drawChart = function() {

			$("#content").hide();
			$("#loading").show();
			// var time = console.log($("#inputDateTime").val());
			var now = new Date();
			var month = parseInt(now.getMonth()) + 1;
			var year = parseInt(now.getYear()) + 1900;

			console.log("month/year: " + month + "/" + year);

			var chart1 = {};
			chart1.type = "PieChart";
			chart1.data = [ [ 'Category', 'amount' ] ];
			// [ 'Component', 'amount' ]
			$http.get("Revenue/category-in-month/" + month + "-" + year)
					.success(function(response) {
						$("#loading").hide();
						$scope.Total = 0;

						for (var i = 0; i < response.length; i++) {
							chart1.data.push(response[i]);
							$scope.Total += response[i][1];
						}
						$scope.chart = chart1;

					});

		};

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;

		$scope.getTotalAmount = function() {

			$http.get("getAmountThisMonth/" + month + "-" + year).success(
					function(response) {
						console.log(response);
						response = response + '';
						console.log("length: " + response.length);
						if (response.length > 9) {
							response = response.substring(0,
									response.length - 9);
							response = response + " billions";
						} else if (response.length > 6) {
							response = response.substring(0,
									response.length - 6);
							response = response + " milions";
						} else if (response.length > 3) {
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
		
		$scope.getToltalDangerInvoiceThisMonth = function() {

			$http.get("Invoice/getDangerByMonth/" + month + "-" + year).success(
					function(response) {
						$scope.danger = response.length;
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

	app.controller(
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

	app.controller('myCtrl', function($scope, $http) {
		$scope.showtable = false;
		$scope.getInvoice = function() {
			$http.get(
					"Report/cateM?category=" + $scope.category + "&month="
							+ $scope.month).then(function(response) {
				$scope.sum = 0;
				data = response.data;
				if (data.length > 0) {
					$scope.cateName = data[0].category.name;
					$scope.showtable = true;
					$scope.invoices = data;
					$scope.count = data.length;
					$(data).each(function(i, item) {
						$scope.sum += item.amount;
					})
				} else {
					$scope.showtable = false;
					$scope.count = 0;
					$scope.sum = 0;
				}
			});
		}

		$scope.getInvoiced2d = function() {
			$http.get(
					"Report/cateMd2d?cateId=" + $scope.category + "&startdate="
							+ $scope.startdate + "&endate=" + $scope.endate)
					.then(function(response) {
						$scope.sum = 0;
						data = response.data;
						if (data.length > 0) {
							$scope.cateName = data[0].category.name;
							$scope.showtable = true;
							$scope.invoices = data;
							$scope.count = data.length;
							$(data).each(function(i, item) {
								$scope.sum += item.amount;
							})
						} else {
							$scope.showtable = false;
							$scope.count = 0;
							$scope.sum = 0;
						}
					})
		}
	});

})();