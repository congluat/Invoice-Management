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

	});
</script>
<style>
.drawChartDiv {
	min-height: 300px;
	height: 100%;
	/* width: 100%; */
	margin: 0px 0px;
	text-align: center;
}

.chartWrapper {
	min-height: 100%;
	height: 100%;
	/* width: 100%; */
	margin: 0px 0px;
	padding-top: 10px;
	padding-left: 10px;
	text-align: center;
	vertical-align: middle;
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
	background: url('<c:url value='/ resources/ logo/ loading.svg '/>')
		no-repeat center center;
	background-size: 200px 200px;
}
</style>
<div class="chartWrapper" ng-controller="YearlyStatisticController"
	ng-init="initChart()">

	<div class="row">
		<div class=" col-md-12">
			<div class="panel panel-green">
				<div class="panel-heading">Chart</div>
				<div class="panel-body">
					<div class="form-group">
						<label for="inputTime" class="col-sm-2 control-label">Month/Year</label>
						<div class="col-sm-10 input-group date" id='datetimepicker10'>
							<input type="number" id='inputDateTime' class="form-control"
								ng-model="timeInput" value="{{timeInput}}"
								ng-change="drawChart()" /> </span>
						</div>
					</div>
					<div class="form-group">

						<div class="input-group col-md-2">
							<a href="Revenue/yearly-statistics" class="btn btn-success">View
								Chart by Month</a>
						</div>
					</div>
					<div class="form-group">
						<div class="form-group">
							<a ng-click="drawChart()" class="btn btn-success">Update</a>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>

	<div class="col-md-12" id="loading"></div>
	<div class="col-md-12 row panel-body" id="content">

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
					<div google-chart chart="chart" class="drawChartDiv "></div>
				</div>
			</div>
		</div>


		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Monthly
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body">
					<div ng-init="drawDialyChart()" id="monthlyChartDiv"
						class="drawChartDiv"></div>
				</div>
			</div>
		</div>

	</div>
</div>