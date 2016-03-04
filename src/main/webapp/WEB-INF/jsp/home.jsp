<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div ng-controller="HomeController">
	<h1>Dashboard</h1>

	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary" ng-init="getTotalAmount()">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<span style="font-size: 70px" class="glyphicon glyphicon-usd"></span>
					</div>
					<div class="col-xs-9 text-right">
						<div style="font-size: 20px">{{amount}}</div>
						<div style="position: absolute; bottom: -50px; right: 6px " >Money</div>
					</div>
				</div>
			</div>
			<a href="#">
				<div class="panel-footer">
					<span class="pull-left">View Details</span> <span
						class="pull-right"><i
						class="glyphicon glyphicon-triangle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>


	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary" ng-init="getToltalInvoiceThisMonth()">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<span style="font-size: 70px" class="glyphicon glyphicon-list-alt"></span>
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

	<div class="col-lg-3 col-md-6">
		<div class="panel panel-red">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<span style="font-size: 70px" class="glyphicon glyphicon-list-alt"></span>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">2</div>
						<div>Danger Invoices</div>
					</div>
				</div>
			</div>
			<a href="#">
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