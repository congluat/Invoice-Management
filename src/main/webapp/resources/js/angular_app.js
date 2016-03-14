(function() {
	"use strict";

	google.setOnLoadCallback(function() {
		angular.bootstrap(document.body, [ 'app' ]);
	});
	google.load('visualization', '1', {
		packages : [ 'corechart' ]
	});
	var app = angular.module('app', [ 'googlechart' ]);

	app.controller("HomeController", function($scope, $http, $window) {
		$scope.$watch(function() {
			return $window.innerWidth;
		}, function(value) {
			$scope.drawPieChart();
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
							title : 'Daily Amount',

							legend : {
								position : 'top'
							}

						};
						var chart = new google.visualization.LineChart(document
								.getElementById('dialyChartDiv'));

						chart.draw(data, options);
					});

		};

		$scope.drawPieChart = function() {

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

			$http.get("Invoice/getDangerByMonth/" + month + "-" + year)
					.success(function(response) {
						$scope.danger = response.length;
					});
		};

	});
	// Create the instant search filter
	/*
	 * app.filter('searchFor', function($filter, $http) { // All filters must
	 * return a function. The first parameter // is the data that is to be
	 * filtered, and the second is an // argument that may be passed with a
	 * colon (searchFor:searchString)
	 * 
	 * return function(arr, searchString) { if (!searchString) { return arr; }
	 * 
	 * var result = [];
	 * 
	 * searchString = searchString.toLowerCase(); // Using the forEach helper
	 * method to loop through the array angular .forEach(arr, function(item) {
	 * 
	 * if ((item.name.toLowerCase().indexOf( searchString) != -1)) {
	 * result.push(item); }
	 * 
	 * var time = new Date(item.time); time = time; time = $filter('date')(time,
	 * "dd/MM/yyyy"); time = time.toLowerCase(); // console.log(time); if
	 * ((time.indexOf(searchString) != -1)) { // console.log(searchString);
	 * result.push(item); } if ((item.comment.toLowerCase().indexOf(
	 * searchString) != -1)) { result.push(item); } if
	 * ((item.place.toLowerCase().indexOf( searchString) != -1)) {
	 * result.push(item); } if ((item.category.name.toLowerCase().indexOf(
	 * searchString) != -1)) { result.push(item); }
	 * 
	 * });
	 * 
	 * return result; };
	 * 
	 * });
	 */
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

	app.filter('unsafe', function($sce) {

		return function(val) {

			return $sce.trustAsHtml(val);

		};

	});

	app
			.controller(
					'InvoiceController',
					function($scope, $http) {

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

						$http
								.get("Invoice/getByMonth/" + month + "-" + year)
								.success(
										function(response) {
											$scope.listByMonth = true;					
											$scope.invoices = response;											
											console.log("invoice ");
											console.log($scope.invoices[0]);

										});


						$scope.itemPerLoad = 10;
						$scope.totalDisplayed = $scope.itemPerLoad;
						$scope.MoreInvoices = "More Invoice...";  
					    $scope.loadMore = function () {
					      $scope.totalDisplayed += $scope.itemPerLoad;
					      if($scope.totalDisplayed >= $scope.invoices.length)
					    	  $scope.MoreInvoices = "No More Invoice";
					      else
					    	  $scope.MoreInvoices = "More Invoice...";
					    }

						$scope.onSearchChange = function(searchString) {
							console.log("search: " + searchString);
							console.log("list by month: " + $scope.listByMonth);

							if (searchString.length != 0) {
								$http.get(
										"Invoice/searchAnyString/"
												+ searchString).success(
										function(response) {
											$scope.listByMonth = false;
											// $scope.invoices.push(response);
											$scope.month = searchString;
											$scope.invoices = response;
											console.log("invoice ");
											console.log(response);
										}).error(function(error) {
									$scope.invoices = error;
								});

							}

							else {
								if (searchString.length == 0) {
									$scope.month = month + "/" + year;
									$http
											.get(
													"Invoice/getByMonth/"
															+ month + "-"
															+ year)
											.success(
													function(response) {
														$scope.listByMonth = true;
														// $scope.invoices.push(response);
														$scope.invoices = response;
														console.log("invoice ");
														console
																.log($scope.invoices[0]);
													});
								}
							}
						};
						this.getInvoiceByMonth = function() {

							$http.get("Invoice/getByMonth/").success(
									function(response) {
										console.log(response);
									});
						};
						// Search Invoice
					});

	app.controller('InvoiceDangerController', function($scope, $http) {

		$scope.deleteFunc = function(id) {
			$scope.deleteId = id;

		};

		var now = new Date();
		var month = parseInt(now.getMonth()) + 1;
		var year = parseInt(now.getYear()) + 1900;
		console.log("month " + month);
		console.log("year " + year);

		$scope.invoices_danger = [];
		$scope.listByMonth = false;
		$scope.month = month + "/" + year;

		$http.get("Invoice/getDangerByMonth/" + month + "-" + year).success(
				function(response) {
					$scope.listByMonth = true;
					// $scope.invoices.push(response);
					$scope.invoices_danger = response;
					console.log(response);
				});
		
		$scope.itemPerLoad = 10;
		$scope.totalDisplayed = $scope.itemPerLoad;
		$scope.MoreInvoices = "More Invoice...";  
	    $scope.loadMore = function () {
	      $scope.totalDisplayed += $scope.itemPerLoad;
	      if($scope.totalDisplayed >= $scope.invoices_danger.length)
	    	  $scope.MoreInvoices = "No More Invoice";
	      else
	    	  $scope.MoreInvoices = "More Invoice...";
	    };

		this.getInvoiceByMonth = function() {

			$http.get("Invoice/getDangerByMonth/").success(function(response) {
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

	app.controller('reportCtrl', function($scope, $http) {

		$scope.showtableCM = false;
		$scope.showtableM2M = false;
		$scope.showtableReport = false;
		$scope.showtableReportbyYear = false;
		$scope.getInvoice = function() {
			if ($scope.categoryCM == null || $scope.month == null
					|| $scope.categoryCM == '' || $scope.month == '') {
				alert("Please select Category and month");
			} else if ($scope.month < 1) {
				alert("Number of month great than 1!");
			} else {
				$http.get(
						"Report/cateM?category=" + $scope.categoryCM
								+ "&month=" + $scope.month).then(
						function(response) {
							$scope.sumCM = 0;
							var data = response.data;
							if (data.length > 0) {
								$scope.showtableCM = true;
								$scope.invoicesCM = data;
								$scope.countCM = data.length;
								$(data).each(function(i, item) {
									$scope.sumCM += item.amount;
								})
							} else {
								$scope.showtableCM = false;
								$scope.countCM = 0;
								$scope.sumCM = 0;
							}
						});
			}
			;
		};

		$scope.getInvoiced2d = function() {
			if ($scope.categoryM2M == null || $scope.startdate == null
					|| $scope.endate == null || $scope.categoryM2M == ''
					|| $scope.startdate == '' || $scope.endate == '') {
				alert("Please select Category and startdate and endate!");
			} else {
				$http.get(
						"Report/cateMd2d?cateId=" + $scope.categoryM2M
								+ "&startdate=" + $scope.startdate + "&endate="
								+ $scope.endate).then(function(response) {
					$scope.sumM2M = 0;
					var data = response.data;
					if (data.length > 0) {
						$scope.showtableM2M = true;
						$scope.invoicesM2M = data;
						$scope.countM2M = data.length;
						$(data).each(function(i, item) {
							$scope.sumM2M += item.amount;
						})
					} else {
						$scope.showtableM2M = false;
						$scope.countM2M = 0;
						$scope.sumM2M = 0;
					}
				});
			}
		};

		$scope.getReportByDate = function() {
			if ($scope.selectdate == null || $scope.selectdate == '') {
				alert("Please select date!");
			} else {
				$http.get(
						"Report/getReportByDate?selectdate="
								+ $scope.selectdate).then(function(response) {
					$scope.sumRpByDate = 0;
					var data = response.data;
					if (data.length > 0) {
						$scope.showtableReportByDate = true;
						$scope.dataReportByDate = data;
						$scope.countRpByDate = data.length;
						$(data).each(function(i, item) {
							$scope.sumRpByDate += item[2];
						})
					} else {
						$scope.showtableReportByDate = false;
						$scope.countRpByDate = 0;
						$scope.sumRpByDate = 0;
					}
				});
			}
		};

		$scope.getReportByMonth = function() {
			if ($scope.selectmonth == null || $scope.selectmonth == '') {
				alert("Please select month!");
			} else {
				$http.get(
						"Report/getReportByMonth?selectmonth="
								+ $scope.selectmonth).then(function(response) {
					$scope.sumRp = 0;
					var data = response.data;
					if (data.length > 0) {
						$scope.showtableReportByMonth = true;
						$scope.dataReportByMonth = data;
						$scope.countRpByMonth = data.length;
						$(data).each(function(i, item) {
							$scope.sumRpByMonth += item[2];
						})
					} else {
						$scope.showtableReportByMonth = false;
						$scope.countRpByMonth = 0;
						$scope.sumRpByMonth = 0;
					}
				});
			}
		};

		$scope.getReportByYear = function() {
			if ($scope.selectyear == null || $scope.selectyear == '') {
				alert("Please select year!");
			} else {
				$http.get(
						"Report/getReportByYear?selectyear="
								+ $scope.selectyear).then(function(response) {
					$scope.sumRpbyYear = 0;
					var data = response.data;
					if (data.length > 0) {
						$scope.showtableReportbyYear = true;
						$scope.dataReportbyYear = data;
						$scope.countRpbyYear = data.length;
						$(data).each(function(i, item) {
							$scope.sumRpbyYear += item[2];
						})
					} else {
						$scope.showtableReportbyYear = false;
						$scope.countRpbyYear = 0;
						$scope.sumRpbyYear = 0;
					}
				});
			}
		};
		$scope.getReportd2d = function() {
			if ($scope.fromdate == null || $scope.fromdate == ''
					|| $scope.todate == null || $scope.todate == '') {
				alert("Please select date!");
			} else {
				$http.get(
						"Report/getReportd2d?fromdate=" + $scope.fromdate
								+ "&todate=" + $scope.todate).then(
						function(response) {
							$scope.sumRpd2d = 0;
							var data = response.data;
							if (data.length > 0) {
								$scope.showtableReportd2d = true;
								$scope.dataReportd2d = data;
								$scope.countRpd2d = data.length;
								$(data).each(function(i, item) {
									$scope.sumRpd2d += item[2];
								})
							} else {
								$scope.showtableReportd2d = false;
								$scope.countRpd2d = 0;
								$scope.sumRpd2d = 0;
							}
						});
			}
		};
		$scope.detailByDate = function(cateName) {
			$scope.cateName = cateName;
			$scope.month = $scope.selectdate;
			$scope.countDetail = 0;
			$http.get(
					"Report/getInvoiceDetailByDate?cateName=" + cateName
							+ "&selectdate=" + $scope.selectdate).then(
					function(response) {
						$scope.sumDetail = 0;
						var data = response.data;
						$scope.countDetail = data.length;
						$scope.invoicedetails = data;
						$(data).each(function(i, item) {
							$scope.sumDetail += item.amount;
						})
						$('#tallModal').modal('show');
					});

		};

		$scope.detail = function(cateName) {
			$scope.cateName = cateName;
			$scope.month = $scope.selectmonth;
			$scope.countDetail = 0;
			$http.get(
					"Report/getInvoiceDetail?cateName=" + cateName + "&time="
							+ $scope.selectmonth).then(function(response) {
				$scope.sumDetail = 0;
				var data = response.data;
				$scope.countDetail = data.length;
				$scope.invoicedetails = data;
				$(data).each(function(i, item) {
					$scope.sumDetail += item.amount;
				})
				$('#tallModal').modal('show');
			});

		};
		$scope.detaild2d = function(cateName) {
			$scope.cateName = cateName;
			$scope.month = $scope.fromdate + ' - ' + $scope.todate;
			$scope.countDetail = 0;
			$http.get(
					"Report/getInvoiceDetaild2d?cateName=" + cateName
							+ "&fromdate=" + $scope.fromdate + "&todate="
							+ $scope.todate).then(function(response) {
				$scope.sumDetail = 0;
				var data = response.data;
				$scope.countDetail = data.length;
				$scope.invoicedetails = data;
				$(data).each(function(i, item) {
					$scope.sumDetail += item.amount;
				})
				$('#tallModal').modal('show');
			});

		};
		$scope.info = function(cateName, month) {
			$scope.cateName = cateName;
			$scope.month = month;
			$scope.countDetail = 0;
			$http
					.get(
							"Report/getInfo?cateName=" + cateName + "&month="
									+ month).then(function(response) {
						$scope.sumDetail = 0;
						var data = response.data;
						$scope.countDetail = data.length;
						$scope.invoicedetails = data;
						$(data).each(function(i, item) {
							$scope.sumDetail += item.amount;
						})
						$('#tallModal').modal('show');
					});
		};

	});

})();