<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



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
</style>

<div ng-controller="HomeController">


	<!--====================CONTENT=============== -->
	<h1 style="margin-left: 10px">Dashboard</h1>
	<div class="col-md-12">
		<div class="col-lg-4 col-md-6">
			<div class="panel panel-total" ng-init="getTotalAmount()">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<span style="font-size: 70px" class="glyphicon glyphicon-usd"></span>
						</div>
						<div class="col-xs-9 text-right">
							<div style="font-size: 20px">{{amount}}</div>
							<div style="position: absolute; bottom: -50px; right: 6px">Money</div>
						</div>
					</div>
				</div>
				<a href="Revenue/monthly-statistic">
					<div class="panel-footer">
						<span class="pull-left">View Details</span> <span
							class="pull-right"><i
							class="glyphicon glyphicon-triangle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>


		<div class="col-lg-4 col-md-6">
			<div class="panel panel-invoice"
				ng-init="getToltalInvoiceThisMonth()">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<span style="font-size: 70px"
								class="glyphicon glyphicon-list-alt"></span>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">{{month}}</div>
							<div>Invoices</div>
						</div>
					</div>
				</div>
				<a href="Invoice/">
					<div class="panel-footer">
						<span class="pull-left">View Details</span> <span
							class="pull-right"><i
							class="glyphicon glyphicon-triangle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-4 col-md-6">
			<div class="panel panel-red" ng-init="getToltalDangerInvoiceThisMonth()">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<span style="font-size: 70px"
								class="glyphicon glyphicon-list-alt"></span>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">{{danger}}</div>
							<div>Danger Invoices</div>
						</div>
					</div>
				</div>
				<a href="Invoice/">
					<div class="panel-footer">
						<span class="pull-left">View Details</span> <span
							class="pull-right"><i
							class="glyphicon glyphicon-triangle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="col-md-12" style="margin-top: 50px; background-color: #FFF"
		ng-init="drawChart()">

		<!-- <div class="col-md-7" google-chart chart="chart" style="min-width: 300px"></div> -->
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
		<div class="col-md-7">
			<div ng-init="drawDialyChart()" id="dialyChartDiv"
				class="drawChartDiv"></div>
		</div>
	</div>
</div>