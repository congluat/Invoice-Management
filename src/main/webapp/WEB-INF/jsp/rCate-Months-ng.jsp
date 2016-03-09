<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript">
$(function() {
    $(".datepicker").datepicker();
  })
</script>
<style type="text/css">
.red {
	color: red;
}

.black {
	color: black;
}
#select{
	font-weight: bold;
}
</style>


<!-- .panel-heading -->
<div class="panel-body" ng-controller="reportCtrl">
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne">Report follow Category and number of Month
						before</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label for="sel1">Select list:</label> <select
								class="form-control" ng-model="categoryCM">
								<c:forEach var="c" items="${categories}">
									<option value="${c.id}" ng-value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="sel1">Input Number of Month before: </label>
						<input type="number" name="month"
							value="1" ng-model="month">
						</div>
						<div class="form-group">
						<button type="button" ng-click="getInvoice()"
							class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div class="row" ng-show="showtableCM">
						<h2>Invoice Infomation</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Time</th>
										<th>Place</th>
										<th>Comment</th>
										<th>Amount</th>

									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="invoice in invoicesCM"
										ng-class='{red : invoice.isWarning ,black: !invoice.isWarning}'>
										<td>{{$index+1}}</td>
										<td>{{invoice.name}}</td>
										<td>{{invoice.time | date:"dd/MM/yyyy | h:mma"}}</td>
										<td>{{invoice.place}}</td>
										<td>{{invoice.comment}}</td>
										<td>{{invoice.amount}}</td>


									</tr>
									<tr>
										<td colspan=4></td>
										<td><strong>Count: </strong></td>
										<td><strong>{{countCM}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=4></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumCM | currency}}</strong></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseTwo">Report follow Category and From date to
						date</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label for="sel1">Select list:</label> <select
								class="form-control" ng-model="categoryM2M">
								<c:forEach var="c" items="${categories}">
									<option value="${c.id}" ng-value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>From Date: </label> <input type="text"
								class="form-control datepicker" ng-model="startdate">
						</div>

						<div class="form-group">
							<label>To Date: </label> <input type="text"
								class="form-control datepicker" ng-model="endate">
						</div>
						<div class="form-group">
						<button type="button" ng-click="getInvoiced2d()"
							class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div class="row" ng-show="showtableM2M">
						<h2>Invoice Infomation</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Time</th>
										<th>Place</th>
										<th>Comment</th>
										<th>Amount</th>

									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="invoice in invoicesM2M"
										ng-class='{red : invoice.isWarning ,black: !invoice.isWarning}'>
										<td>{{$index+1}}</td>
										<td>{{invoice.name}}</td>
										<td>{{invoice.time | date:"dd/MM/yyyy | h:mma"}}</td>
										<td>{{invoice.place}}</td>
										<td>{{invoice.comment}}</td>
										<td>{{invoice.amount}}</td>


									</tr>
									<tr>
										<td colspan=4></td>
										<td><strong>Count: </strong></td>
										<td><strong>{{countM2M}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=4></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumM2M | currency}}</strong></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseThree">Collapsible Group Item #3</a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body">Lorem ipsum dolor sit amet, consectetur
				adipisicing elit, sed do eiusmod tempor incididunt ut labore et
				dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
				exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat. Duis aute irure dolor in reprehenderit in voluptate velit
				esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt mollit
				anim id est laborum.</div>
		</div>
	</div>
	
</div>





