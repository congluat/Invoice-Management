<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script>
<script>

function getInvoice() {
	var category = $('#category').val();
	var month = $('#month').val();
	$.ajax({
		url: "${pageContext.request.contextPath}/Report/cateM",
		type: 'GET',
		data: {category:category, month:month},
		dataType: 'json',
		success: function(response) {
			var content = '';
			$(response).each(function(index,item){
				content += '<tr><td>'+(index+1)+'</td>'
								+'<td>'+item.name+'</td>'
								+'<td>'+item.amount+'</td>'
								+'<td>'+item.time+'</td>'
								+'<td>'+item.place+'</td>'
								+'<td>'+item.comment+'</td></tr>';
			})
			
			$('.table tbody').html(content);
		},
		error:function (xhr, ajaxOptions, thrownError){
		    if(xhr.status==400) {
		        alert(thrownError);
		    }
		}
	})
}	
		
</script>

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
Input Before of Month: <input type="text" id="month">
<br>
<button type="button" onclick="getInvoice()" class="btn btn-primary">SEARCH</button>
</div>
</div>


<div class="row col-md-10">
  <h2>Table</h2>                                                                                      
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
