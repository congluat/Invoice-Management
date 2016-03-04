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
			var count = 0;
			var sum = 0;
			var cateName ='';
			$(response).each(function(index,item){
				cateName = item.category.name;
				count = index + 1;
				content += '<tr><td>'+count+'</td>'
								+'<td>'+item.name+'</td>'
								+'<td>'+item.amount+'</td>'
								+'<td>'+formatDate(new Date(item.time))+'</td>'
								+'<td>'+item.place+'</td>'
								+'<td>'+item.comment+'</td></tr>';
				sum += item.amount;
			})
			
			$('.table tbody').html(content);
			$('#select').html('Select Category: <b>' + cateName + '</b><br>Number of Month: <b>' + month +'</b>');
			$('#count').html('<strong>COUNT: </strong>'+count);
			$('#sum').html('<strong>SUM: </strong>' + formatCurrency(sum));
		},
		error:function (xhr, ajaxOptions, thrownError){
		    if(xhr.status==400) {
		        alert(thrownError);
		    }
		}
	})
}	
function formatDate(date) {
	  var hours = date.getHours();
	  var minutes = date.getMinutes();
	  var ampm = hours >= 12 ? 'pm' : 'am';
	  hours = hours % 12;
	  hours = hours ? hours : 12; // the hour '0' should be '12'
	  minutes = minutes < 10 ? '0'+minutes : minutes;
	  var strTime = hours + ':' + minutes + ' ' + ampm;
	  return date.getMonth()+1 + "/" + date.getDate() + "/" + date.getFullYear() + "  " + strTime;
	}
function formatCurrency(total) {
    var neg = false;
    if(total < 0) {
        neg = true;
        total = Math.abs(total);
    }
    return (neg ? "-$" : '$') + parseFloat(total, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
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
