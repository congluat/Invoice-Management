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
<script type="text/javascript">
	function isNumber(evt) {
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode >= 32 && charCode <= 254) {
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	$(function() {
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
	width: 100px;
	height: 100%;
	min-height: 300px;
	min-width: 500px;
	background: url('<c:url value='/ resources/ logo/ loading.gif '/>')
		no-repeat center center;
	min-height: 300px;
	min-width: 300px;
	background: url('<c:url value='/ resources/ logo/ loading.gif '/>')
		no-repeat center center;
	background-size: 200px 100px;
	width: 100px;
	height: 100%;
	min-height: 300px;
	min-width: 500px;
}
</style>
<div class="chartWrapper" ng-controller="ChartController"
	ng-init="drawChart()">

	<div class="row">
		<div class="col-md-6" style="height: 130px;">
			<div class="form-group">
				<div class='input-group date' id='datetimepicker10'>
					<input id="inputDateTime" type='text' class="form-control"
						ng-model="timeInput" value="" onkeypress="return isNumber(event)"
						ng-change="timeChanged()" /> <span class="input-group-addon">
						<span class="glyphicon glyphicon-calendar"> </span>
					</span>
				</div>

			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">

				<a ng-click="timeChanged()" class="btn btn-success">Update</a>


			</div>

		</div>
	</div>

	<div class="col-md-12" id="loading"></div>
	<div class="col-md-12 row" id="content">
		<div class="col-md-5">
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
		<div google-chart chart="chart" class="drawChartDiv col-md-7"></div>
	</div>
	<div class="col-md-12">
		<div ng-init="drawDialyChart()" id="dialyChartDiv"
			class="drawChartDiv"></div>
	</div>
</div>