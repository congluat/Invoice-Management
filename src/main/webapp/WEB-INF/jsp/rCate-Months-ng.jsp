<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">
$(function() {
    $( ".datepicker" ).datepicker();
  })
</script>


<div class="container" ng-controller="myCtrl">
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
Input Number of Month: <input type="number" name="month" value="1" ng-model="month">
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
<p>From Date: <input type="text" class="datepicker" ng-model="startdate"></p>
<p>To Date: <input type="text" class="datepicker" ng-model="endate"></p>
<br>
<button type="button" ng-click="getInvoiced2d()" class="btn btn-primary">SEARCH</button>
</div>
</div>

<ul style="align:right;"><h3>Selecting:</h3>
<li>Category: <b> {{cateName}}</b> </li>
	 <li>Number of Month: <b> {{month}} </b> </li>
	 <li>Count: <strong>{{count}}</strong></li>
	 <li>SUM: <b>{{sum | currency}}</b></li>
	</ul>
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
        <th>Amount</th>
        <th>Time</th>
        <th>Place</th>
        <th>comment</th>
      </tr>
    </thead>
    <tbody>
    	<tr ng-repeat="invoice in invoices">
    		<td>{{$index+1}}</td>
    		<td>{{invoice.name}}</td>
    		<td>{{invoice.amount}}</td>
    		<td>{{invoice.time | date:"dd/MM/yyyy | h:mma"}}</td>
    		<td>{{invoice.place}}</td>
    		<td>{{invoice.comment}}</td>
    	</tr>
    	
    </tbody>
  </table>
  </div>
</div>
</div>

