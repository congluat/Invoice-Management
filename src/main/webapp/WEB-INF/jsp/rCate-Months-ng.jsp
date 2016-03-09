<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();
		$(".datepicker_select").datepicker({
			dateFormat: 'mm/yy'
		});
		$(".datepicker_selectyear").datepicker({
			dateFormat: 'yy'
		});	
		datepicker_selectyear
	})
</script>
<style type="text/css">
.red {
	color: red;
}

.black {
	color: black;
}

#select {
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
						href="#collapseOne">Report current</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
				<table class="table">
					<tr>
						<th>CateName</th>
						<th>Month</th>
						<th>Count</th>
						<th>SUM</th>
					</tr>
					<c:forEach var="array" items="${datalist}">
						<tr>
							<td>${array[0]}</td>
							<td>${array[1]}</td>
							<td>${array[2]}</td>
							<td><fmt:formatNumber value="${array[3]}"
									minFractionDigits="2" maxFractionDigits="2" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapse_y">Search report by year</a>
				</h4>
			</div>
			<div id="collapse_y" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Choose time: </label> <input type="text"
								class="form-control datepicker_selectyear" ng-model="selectyear">
						</div>
						<div class="form-group">
							<button type="button" ng-click="getReportByYear()"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div class="row" ng-show="showtableReportbyYear">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>SUMARY</th>
										<th>AVEGARE</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReportbyYear">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[2]}}</td>
										<td>{{data[3]}}</td>
									</tr>
									<tr>
										<td colspan=3></td>
										<td><strong>Number of Category: </strong></td>
										<td><strong>{{countRpbyYear}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=3></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumRpbyYear | currency}}</strong></td>
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
						href="#collapse">Search report by month</a>
				</h4>
			</div>
			<div id="collapse" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Choose time: </label> <input type="text"
								class="form-control datepicker_select" ng-model="selectdate">
						</div>
						<div class="form-group">
							<button type="button" ng-click="getReportByMonth()"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div class="row" ng-show="showtableReport">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>SUMARY</th>
										<th>AVEGARE</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReport">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[2]}}</td>
										<td>{{data[3]}}</td>
									</tr>
									<tr>
										<td colspan=3></td>
										<td><strong>Number of Category: </strong></td>
										<td><strong>{{countRp}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=3></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumRp | currency}}</strong></td>
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
					href="#collapseThree">Report follow Category and number of Month
						before</a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
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
							<label for="sel1">Input Number of Month before: </label> <input
								type="number" name="month" value="1" ng-model="month">
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

</div>





