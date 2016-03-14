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
