/* =============================================================================================================
 * =============================================================================================================
 * =============================DRAW CHART===================================================
 * ============================================================================================================
 * ========================================================================================================*/

/* =================MONTHLY Chart===============*/
angular.module('app').controller(
		'MonthlyStatisticController',
		function($scope, $http, $window) {

			var now = new Date();
			var month = parseInt(now.getMonth()) + 1;
			var year = parseInt(now.getYear()) + 1900;

			$scope.timeInput = month + "/" + year;
			console.log("TimInput Init: " + $scope.timeInput);

			$scope.initChart = function() {
				$("#content").hide();
				$("#loading").show();

				$scope.drawPieChart();
				$scope.drawColumnChart();
				$("#content").show();
				$("#loading").hide();
			}

			$scope.drawChart = function() {
				$("#content").hide();
				$("#loading").show();
				console.log($("#inputDateTime").val());
				$scope.timeInput = $("#inputDateTime").val();
				$scope.drawPieChart();
				$scope.drawColumnChart();
				$("#content").show();
				$("#loading").hide();
			};

			$scope.$watch(function() {
				return $window.innerWidth;
			}, function(value) {
				$scope.drawPieChart();
				$scope.drawColumnChart();
			});

			$scope.chartData = [];

			$scope.drawColumnChart = function() {

				var month = parseInt($scope.timeInput.split('/')[0]);
				var year = parseInt($scope.timeInput.split('/')[1]);
				var tempdata = [];
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Day');
				data.addColumn('number', 'Amount');

				$http.get("Revenue/getdialyuse/" + month + "-" + year).success(
						function(response) {

							console.log(response);
							for (var i = 0; i < response.length; i++) {

								tempdata.push(response[i]);

							}

							data.addRows(tempdata);
							var options = {
								hAxis : {
									title : 'Day',
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
							var chart = new google.visualization.ColumnChart(
									document.getElementById('dialyChartDiv'));

							chart.draw(data, options);
						});

			};

			$scope.drawPieChart = function() {

				console.log("time" + $scope.timeInput);
				var month = parseInt($scope.timeInput.split('/')[0]);
				var year = parseInt($scope.timeInput.split('/')[1]);

				console.log("month/year: " + month + "/" + year);

				var chart1 = {};
				chart1.type = "PieChart";
				chart1.data = [ [ 'Category', 'amount' ] ];

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

						});

			};

		});

/* ========================================================YEARLY Chart==-===================================== */
angular.module('app').controller(
		'YearlyStatisticController',
		function($scope, $http, $window) {

			var now = new Date();
			var year = parseInt(now.getYear()) + 1900;
			$("#inputDateTime").val(year);
			$scope.timeInput = year;
			console.log("TimInput Init: " + $scope.timeInput);

/* DRAW CHART WITH THIS YEAR*/
			$scope.initChart = function() {			
		
				$("#content").hide();
				$("#loading").show();

				$scope.drawPieChart();
				$scope.drawColumnChart();
				$("#content").show();
				$("#loading").hide();
			}
/*Draw chart with year get from input */
			$scope.drawChart = function() {
				$("#content").hide();
				$("#loading").show();
				console.log($("#inputDateTime").val());
				$scope.timeInput = $("#inputDateTime").val();
				$scope.drawPieChart();
				$scope.drawColumnChart();
				$("#content").show();
				$("#loading").hide();
			};
			
/* ============re-draw chart when windows resized====*/
			$scope.$watch(function() {
				return $window.innerWidth;
			}, function(value) {
				$scope.drawPieChart();
				$scope.drawColumnChart();
			});

			$scope.chartData = [];
			
/*===========draw column chart using google chart ====*/
			$scope.drawColumnChart = function() {

				var year = parseInt($scope.timeInput);
				var tempdata = [];
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Day');
				data.addColumn('number', 'Amount');

				$http.get("Revenue/get-monthly-use/" + year).success(
						function(response) {

							console.log(response);
							for (var i = 0; i < response.length; i++) {

								tempdata.push(response[i]);

							}

							data.addRows(tempdata);
							var options = {
								hAxis : {
									title : 'Month',
									Discrete : true
								},
								vAxis : {
									title : 'Money'

								},
								title : 'Monthly Amount',

								legend : {
									position : 'top'
								}

							};
							var chart = new google.visualization.ColumnChart(
									document.getElementById("monthlyChartDiv"));

							chart.draw(data, options);
						});

			};
/* =====draw Pie chart using https://github.com/angular-google-chart/angular-google-chart ==*/
			$scope.drawPieChart = function() {

				var year = parseInt($scope.timeInput);

				console.log("year: " + year);

				var chart1 = {};
				chart1.type = "PieChart";
				chart1.data = [ [ 'Category', 'amount' ] ];

				$http.get("Revenue/category-in-year/" + year)
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

						});

			};

		});