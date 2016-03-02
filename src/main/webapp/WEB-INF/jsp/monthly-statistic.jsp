<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		// Define the chart to be drawn.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Element');
		data.addColumn('number', 'Percentage');
		data.addRows([ [ 'Nitrogen', 0.78 ], [ 'Oxygen', 0.21 ],
				[ 'Other', 0.01 ] ]);

		// Instantiate and draw the chart.
		var chart = new google.visualization.PieChart(document
				.getElementById('myPieChart'));
		chart.draw(data, null);
	}
</script>
<script type="text/javascript">
	
</script>
<div>
	<div id="myPieChart" />
</div>