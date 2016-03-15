<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<script src="<c:url value='/resources/js/validate_date.js'/>"></script>

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
						href="#collapseOne">Data Report follow months in current year</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>CateName</th>
							<th>Month</th>
							<th>Number of Invoices</th>
							<th>SUMARY</th>
							<th></th>
						</tr>
						<c:forEach var="array" items="${datalist}">
							<tr>
								<td>${array[0]}</td>
								<td>${array[1]}</td>
								<td>${array[2]}</td>
								<td><fmt:formatNumber value="${array[3]}"
										minFractionDigits="2" maxFractionDigits="2" /></td>
								<td><a href="" ng-click="info('${array[0]}',${array[1]})">
								 <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
								Detail</a></td>
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
						href="#collapseByDate">Search report by Date</a>
				</h4>
			</div>
			<div id="collapseByDate" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Choose Date: </label> <input type="text" id="selectdate"
								class="form-control datepicker" ng-model="selectdate" onchange="ValidateDate(this.value,this.id)" required>
								<div id="error-selectdate"></div>
						</div>
						
						<div class="form-group">
							<button type="button" id="selectdate" disabled ng-click="getReportByDate()"
								class="btn btn-primary">SEARCH</button>
						</div>
						
					</div>
					<div id="empty-invoice-date"></div>
					<div class="row" ng-show="showtableReportByDate">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>AVEGARE</th>
										<th>SUMARY</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReportByDate">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[3] | currency}}</td>
										<td>{{data[2] | currency}}</td>
										<td><a href="" ng-click="detailByDate(data[0])">
										<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Detail</a></td>
									</tr>
									<tr>
										<td colspan=3></td>
										<td><strong>Number of Category: </strong></td>
										<td><strong>{{countRpByDate}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=3></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumRpByDate | currency}}</strong></td>
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
						href="#collapseByMonth">Search report by month</a>
				</h4>
			</div>
			<div id="collapseByMonth" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Choose Month: </label> <input type="text"
								class="form-control datepicker_select" ng-model="selectmonth"
								id="selectMonth" onchange="ValidateMonth(this.value,this.id)">
								<div id="error-selectMonth"></div>
						</div>
						<div class="form-group">
							<button type="button" disabled id="selectMonth" ng-click="getReportByMonth()"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div id="empty-invoice-month"></div>
					<div class="row" ng-show="showtableReportByMonth">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>AVEGARE</th>
										<th>SUMARY</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReportByMonth">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[3] | currency}}</td>
										<td>{{data[2] | currency}}</td>
										<td><a href="" ng-click="detail(data[0])">
										<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Detail</a></td>
									</tr>
									<tr>
										<td colspan=3></td>
										<td><strong>Number of Category: </strong></td>
										<td><strong>{{countRpByMonth}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=3></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumRpByMonth | currency}}</strong></td>
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
						href="#collapse_y">Search report by year</a>
				</h4>
			</div>
			<div id="collapse_y" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Choose time: </label> <input type="text"
								class="form-control datepicker_selectyear" ng-model="selectyear"
								id="selectYear" onchange="ValidateYear(this.value, this.id)">
								<div id="error-selectYear"></div>
						</div>
						<div class="form-group">
							<button type="button" ng-click="getReportByYear()"  disabled
								id="selectYear" class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div id="empty-invoice-year"></div>
					<div class="row" ng-show="showtableReportbyYear">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>AVEGARE</th>
										<th>SUMARY</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReportbyYear">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[3] | currency}}</td>
										<td>{{data[2] | currency}}</td>
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
						href="#collapsed2d">Get Report from date to date</a>
				</h4>
			</div>
			<div id="collapsed2d" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label>Start Date: </label> <input type="text" id="startdate"
								class="form-control datepicker" ng-model="startdate" onchange="ValidateDate(this.value,this.id)" required>
							<div id="error-startdate"></div>
						</div>

						<div class="form-group">
							<label>End Date: </label> <input type="text" id="enddate"
								class="form-control datepicker" ng-model="enddate" onchange="ValidateDate(this.value,this.id)" required>
						<div id="error-enddate"></div>
						</div>
						<div class="form-group">
							<button type="button" ng-click="getReportd2d()" id="d2d"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div id="empty-invoice-d2d"></div>
					<div class="row" ng-show="showtableReportd2d">
						<h2>TABLE REPORT</h2>
						<div class="table-responsive" style="border-left: 1px solid #ddd">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>CateName</th>
										<th>Number of invoice</th>
										<th>AVEGARE</th>
										<th>SUMARY</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="data in dataReportd2d">
										<td>{{$index+1}}</td>
										<td>{{data[0]}}</td>
										<td>{{data[1]}}</td>
										<td>{{data[3] | currency}}</td>
										<td>{{data[2] | currency}}</td>
										<td><a href="" ng-click="detaild2d(data[0])">
										<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Detail</a></td>
									</tr>
									<tr>
										<td colspan=3></td>
										<td><strong>Number of Category: </strong></td>
										<td><strong>{{countRpd2d}}</strong></td>
									</tr>
									<tr>
										<td style="border-top: 1px solid #FFF" colspan=3></td>
										<td><strong>SUM: </strong></td>
										<td><strong>{{sumRpd2d | currency}}</strong></td>
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
							<label for="sel1">Select Category:</label> <select
								class="form-control" ng-model="categoryM2M">
								<c:forEach var="c" items="${categories}">
									<option value="${c.id}" ng-value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Start Date: </label> <input type="text" id="fromdate"
								class="form-control datepicker" ng-model="fromdate" onchange="ValidateDate(this.value, this.id)">
							<div id="error-fromdate"></div>
						</div>

						<div class="form-group">
							<label>End Date: </label> <input type="text" id ="endate"
								class="form-control datepicker" ng-model="endate" onchange="ValidateDate(this.value,this.id)">
							<div id="error-endate"></div>
						</div>
						<div class="form-group">
							<button type="button" ng-click="getInvoiced2d()"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div id="empty-invoice-CatD2D"></div>
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
										<td ng-bind-html="invoice.comment | unsafe"></td>
										<td>{{invoice.amount | currency}}</td>


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

		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseThree">Report follow Category and number of
						Month before</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-3">
						<div class="form-group">
							<label for="sel1">Select Category:</label> <select
								class="form-control" ng-model="categoryCM">
								<c:forEach var="c" items="${categories}">
									<option value="${c.id}" ng-value="${c.id}">${c.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="sel1">Input Number of Month before: </label> <input
								type="number" name="month" value="1" min="1" ng-model="month">
						</div>
						<div class="form-group">
							<button type="button" ng-click="getInvoice()"
								class="btn btn-primary">SEARCH</button>
						</div>
					</div>
					<div id="empty-invoice-CatM"></div>
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
										<td ng-bind-html="invoice.comment | unsafe"></td>
										<td>{{invoice.amount | currency}}</td>


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
	</div>
	<jsp:include page="_modalReportDetail.jsp"></jsp:include>

</div>







