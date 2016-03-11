<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker-standalone.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript"
	src="<c:url value='/resources/js/angular_report.js' />"></script>
<script type="text/javascript">
	$(function() {
		$("#inputDateTime").keydown(false);
		$("#content").hide();
		$("#loading").show();
		$('#datetimepicker10').datetimepicker({
			viewMode : 'months',
			format : 'MM/YYYY',
			defaultDate : new Date()

		});

		$("#datetimepicker10").on("dp.change", function(e) {
			//console.log(e.date._i);
			$("#inputDateTime").value = e.date._i;

			$("#inputDateTime").attr("value", e.date._i);
			$("#inputDateTime").value = " ";
			$("#inputDateTime").value = e.date._i;
		});
	});
</script>
<style>
.drawChartDiv {
	min-height: 300px;
	height: 100%;
	/* width: 100%; */
	margin: 0px 0px;
	background: #fff;
	text-align: center;
}

.chartWrapper {
	min-height: 100%;
	height: 100%;
	/* width: 100%; */
	margin: 0px 0px;
	padding-top: 10px;
	padding-left: 10px;
	background: #fff;
	text-align: center;
	vertical-align: middle;
	background: #fff;
}

th {
	text-align: center;
}

caption {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
}

#loading {
	vertical-align: middle;
	width: 100%;
	height: 100%;
	min-height: 300px;
	min-width: 300px;
	background: url('<c:url value='/ resources/ logo/ loading.gif '/>')
		no-repeat center center;
	background-size: 200px 100px;
}
</style>
<div class="chartWrapper" ng-controller="MonthlyStatisticController"
	ng-init="initChart()">

	<div class="row">
		<div class=" col-md-12">
			<div class="panel panel-green">
				<div class="panel-heading">Green Panel</div>
				<div class="panel-body">
					<div class="form-group">
						<label for="inputTime" class="col-sm-2 control-label">Month/Year</label>
						<div class="col-sm-10 input-group date" id='datetimepicker10'>
							<input id="inputDateTime" type='text' class="form-control"
								ng-model="timeInput" value="" ng-change="drawChart()" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"> </span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<div class='input-group date' id='datetimepicker10'>
							<label></label> </span>
						</div>
						<div class="form-group">
							<a ng-click="drawChart()" class="btn btn-success">Update</a>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<div class="col-md-12" id="loading"></div>
	
	<div class="col-md-12 row" id="content">
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Total: {{Total | currency}}
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-striped">
						<caption>Total: {{Total | currency}}</caption>
						<tr>
							<th>Category</th>
							<th>Amount</th>
						</tr>
						<tr ng-repeat="a in chart.data" ng-if="$index > 0">
							<td>{{a[0]}}</td>
							<td>{{a[1] | currency}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="col-md-7">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Pie Chart
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body">
					<div google-chart chart="chart" class="drawChartDiv"></div>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Daily
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body">
					<div ng-init="drawDialyChart()" id="dialyChartDiv"
						class="drawChartDiv"></div>
				</div>
			</div>
		</div>

	</div>
</div>