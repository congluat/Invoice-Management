
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker-standalone.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
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
	width: 100%;
	margin: auto;
	background: #fff;
	text-align: center;
}

.chartWrapper {
	min-height: 300px;
	height: 100%;
	width: 100%;
	margin: auto;
	background: #fff;
	text-align: center;
	vertical-align: middle;
}
</style>
<div class="chartWrapper" ng-controller="ChartController"
	ng-init="drawChart()">

	<div class="container row">
		<div class="col-md-6" style="height: 130px;">
			<div class="form-group">
				<div class='input-group date' id='datetimepicker10'>
					<input id="inputDateTime" type='text' class="form-control"
						ng-model="timeInput" value=""
						ng-change="timeChanged()" /> <span class="input-group-addon">
						<span class="glyphicon glyphicon-calendar"> </span>
					</span>
				</div>

			</div>
		</div>
		<div class="col-md-6">
			<div class="form-group">

				<a ng-click="timeChanged()" class="btn">Update</a>


			</div>

		</div>
	</div>
	<div google-chart chart="chart" class="drawChartDiv"></div>
</div>