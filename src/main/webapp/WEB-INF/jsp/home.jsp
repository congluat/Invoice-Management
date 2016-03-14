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
	<header class="rad-page-title">
		<span>Dashboard</span>

	</header>
	<div class="row">

		<div class="col-lg-4  col-md-4 col-xs-12">
			<a href="Revenue/monthly-statistic">
				<div class="rad-info-box rad-txt-success" ng-init="getTotalAmount()">
					<i class="fa fa-usd"></i> <span class="heading">Money</span> <span
						class="value"><span>{{amount}}</span></span>
				</div>
			</a>
		</div>


		<div class="col-lg-4 col-md-4 col-xs-12">
			<a href="Invoice/">
				<div class="rad-info-box rad-txt-primary"
					ng-init="getToltalInvoiceThisMonth()">
					<i class="fa fa-italic"></i> <span class="heading">Invoices</span>
					<span class="value"><span>{{month}}</span></span>
				</div>
			</a>
		</div>

		<div class="col-lg-4 col-md-4 col-xs-12">
			<a href="Invoice/warning">
				<div class="rad-info-box rad-txt-danger"
					ng-init="getToltalDangerInvoiceThisMonth()">
					<i class="fa fa-bell"></i> <span class="heading">Danger
						Invoices</span> <span class="value"><span>{{danger}}</span></span>
				</div>
			</a>

		</div>
	</div>

	<div class="row">
		<div class="col-md-7 col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Reminders
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body" ng-init="">aaaaaa</div>
			</div>

		</div>
		<div class="col-md-5 col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Reminders
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body" ng-init="">aaaaaa</div>
			</div>

		</div>
	</div>

	<div class="row" style="" ng-init="drawChart()">

		<!-- <div class="col-md-7" google-chart chart="chart" style="min-width: 300px"></div> -->

		<div class="col-md-5 col-xs-12">

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
				<div>
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

		<div class="col-md-7 col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						Bar Chart
						<ul class="rad-panel-action">
							<li><i class="fa fa-chevron-down"></i></li>
							<li><i class="fa fa-rotate-right"></i></li>
							<!-- <li><i class="fa fa-cog"></i> -->
							<li><i class="fa fa-close"></i></li>
						</ul>
					</h3>
				</div>
				<div class="panel-body chartWrapper" ng-init="drawDialyChart()"
					id="dialyChartDiv">
					<div id="barChart3" class="rad-chart drawChartDiv"></div>
				</div>
			</div>

		</div>

	</div>
</div>
</div>