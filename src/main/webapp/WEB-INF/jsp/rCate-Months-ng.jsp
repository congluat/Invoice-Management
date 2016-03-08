<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
$(function() {
    $(".datepicker").datepicker();
  })
</script>


<div class="container" ng-controller="myCtrl" id="reportCM">
<div class="row">
<div class="col-md-4">
<div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" ng-model="category">
  	<c:forEach var="c" items="${categories}">
    <option value="${c.id}" ng-value="${c.id}">${c.name}</option>
    </c:forEach>
  </select>
</div>
Input Number of Month before: <input type="number" name="month" value="1" ng-model="month">
<br>
<button type="button" ng-click="getInvoice()" class="btn btn-primary">SEARCH</button>
</div>


<div class="col-md-4">
<div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" ng-model="category">
  	<c:forEach var="c" items="${categories}">
    <option value="${c.id}" ng-value="${c.id}">${c.name}</option>
    </c:forEach>
  </select>
</div>
<div class="form-group">
    <label>From Date: </label>
	<input type="text" class="form-control datepicker" ng-model="startdate">
</div>

<div class="form-group">
    <label>To Date: </label>
	<input type="text" class="form-control datepicker" ng-model="endate">
</div>
<br>
<button type="button" ng-click="getInvoiced2d()" class="btn btn-primary">SEARCH</button>
</div>
</div>


<h3>Selecting:</h3>
<h5>Category: {{cateName}}</h5>
<h5 ng-hide="d2d">Number of Month: {{month}}</h5>
<h5 ng-show="d2d">From date: {{startdate}}</h5>
<h5 ng-show="d2d">To date: {{endate}}</h5>

<div class="row col-md-10" ng-show="showtable">
  <h2>Invoice Infomation</h2>
  <div id="select"></div>
  <div id="count"></div>
  <div id="sum"></div>                                                                                      
  <div class="table-responsive">          
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
    	<tr ng-repeat="invoice in invoices">
    		<td>{{$index+1}}</td>
    		<td>{{invoice.name}}</td>
    		<td>{{invoice.time | date:"dd/MM/yyyy | h:mma"}}</td>
    		<td>{{invoice.place}}</td>
    		<td>{{invoice.comment}}</td>
    		<td>{{invoice.amount}}</td>
    	</tr>
    	<tr>
    		<td colspan=4 ></td>
    		<td><strong>Count: </strong> </td>
    		<td><strong>{{count}}</strong></td>
    	</tr>
    	<tr>
    		<td style="border-top:1px solid #FFF" colspan=4></td>
    		<td><strong>SUM: </strong> </td>
    		<td><strong>{{sum | currency}}</strong></td>
    	</tr>
    </tbody>
  </table>
  </div>
</div>
</div>

