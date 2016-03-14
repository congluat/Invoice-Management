<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="<c:url value='/resources/js/rCate-Months.js'/>"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script>

<div class="container">
<div class="row">
<div class="col-md-4">
<div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" id="category">
  	<c:forEach var="c" items="${categories}">
    <option value="${c.id}">${c.name}</option>
    </c:forEach>
  </select>
</div>
Input Number of Month: <input type="number" id="month" value="1">
<br>
<button type="button" onclick="getInvoice()" class="btn btn-primary">SEARCH</button>
</div>
</div>


<div class="row col-md-10">
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
    </tbody>
  </table>
  </div>
</div>
</div>
