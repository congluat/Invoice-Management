<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script
	src="http://bouil.github.io/angular-google-chart/ng-google-chart.js"></script>
<script type="text/javascript">
	/* 	google.charts.load('current', {
	 packages : [ 'corechart' ]
	 });
	 google.charts.setOnLoadCallback(drawChart); */
</script>

<script type="text/javascript">
	/* 	$(window).resize(function() {
	 drawChart();
	 }); */
</script>

<style>
.drawChartDiv {
	min-height: 500px;
	height: 100%;
	width: 100%;
	margin: auto;
	background: #fff;
	text-align: center
}

.chartWrapper {
	min-height: 500px;
	height: 100%;
	width: 100%;
	margin: auto;
	background: #fff;
	text-align: center
}
</style>
<div class="chartWrapper" ng-controller=ChartController>
	<div google-chart chart="chartObject"
		style="height: 600px; width: 100%;"></div>
</div>