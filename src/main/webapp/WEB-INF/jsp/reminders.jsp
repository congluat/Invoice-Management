<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script>
	$(document).on("click", ".deleteButton", function() {
		var divid = $(this).parents("td").attr("id");
		$("#confirm button").attr('id', divid);
	});
	
	$(document).on("click", "#buttonclick", function() {
		var id = $.trim($("#cateId").val());
		var time = $("#time").val();
		var comment = $("#comment").val();
		var show ='';
			 	$.ajax({
				type:"post",
			    data:{
			    	id : id,
			    	time : time,
			    	comment : comment
			    },
			    url:"Reminder/save-reminder",
			    dataType: "json",
			    success: function(data){
			       if(data==true){
			    	   show+='<h4>Success</h4>';
			    	   $("#message").html(show);
			    	   setTimeout(function() {
			    		   $("#message").html('');
								},3000);
			       }
			       else{
			    	   show+='<h4>Failed</h4>';
			    	   $("#message").html(show);
			    	   setTimeout(function() {
			    		   $("#message").html('');
								},3000);
			       }
			    	   
			    }
			});  
	});
	
	$(document).ready(function() {
		$("#btDelete").click(function() {
			var id = $("#confirm button").attr("id");
			var a = document.getElementById("" + id);
			$('#confirm-delete').modal('hide');

			/* console.log(id);
			//console.log("Delete button clicked");
			//var url = $('#deleteButton').data('href');
			var url = "<c:url value='Reminder/delete/'/>" + id;
			console.log(url);
			$('#confirm-delete .btn-ok').attr('href', url); */

			$.ajax({
				url : "Reminder/delete/" + id,
				type : 'get',
				success : function(data) {
					a.parentNode.remove();
				}
			});
		});
	});
</script>

<div class="panel panel-green">
	<div class="panel-heading">Reminders</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-hover">
				<tr>
					<th class="col-md-1">#</th>
					<th class="col-md-3">Category</th>
					<th class="col-md-1">Day</th>
					<th class="col-md-5">Comment</th>
					<th class="col-md-1">Edit</th>
					<th class="col-md-1">Delete</th>
				</tr>
				<c:forEach items="${reminders}" var="reminder" varStatus="loop">
					<tr>
						<td>${loop.index+1}</td>
						<td>${reminder.category.name}</td>
						<td>${reminder.time}</td>
						<td>${reminder.comment}</td>
						<td><a
							href="${pageContext.request.contextPath}/Reminder/edit/${reminder.id}"
							class="btn btn-info"><span class="glyphicon glyphicon-pencil"
								aria-hidden="true"></span></a></td>
						<td id="${reminder.id}"><a
							class="btn btn-danger deleteButton" data-toggle="modal"
							data-target="#confirm-delete"><span
								class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6"
						style="text-align: center; font-size: 42px; color: #23AE89; vertical-align: middle;">
						<a data-toggle="modal" data-target="#myReminder"> <span
							class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="vertical-alignment-helper col-md-4">
		<div class="modal-dialog vertical-align-center">
			<div class="modal-content" style="border-radius: 10px;">
				<div class="modal-header">Confirm</div>
				<div class="modal-body">Do you want to delete</div>
				<div class="modal-footer" id="confirm">
					<button id="" type="button" class="btn btn-default"
						data-dismiss="modal">Cancel</button>
					<a id="btDelete" class="btn btn-danger btn-ok"
						style="margin-top: 0px" href="">Delete</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myReminder" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Upload Images</h4>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading text-center"></div>
				<div class="panel-body">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form:form id="myForm" class="form-horizontal" modelAttribute="reminder"
							method="POST">
							<div id ="message">
							</div>
							<form:input type="hidden" path="id" /> 
							<c:choose>
								<c:when test="${edit}">
									<form:input type="hidden" path="category.id" id ="cateId"/>
									<div class="form-group">
										<label path="name" class="col-md-2 control-label">Category</label>
										<div class="col-md-10">
											<input readonly="true" value="${cateName}">
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-group">
										<label path="name" class="col-md-2 control-label">Category</label>
										<div class="col-md-10">
											<form:select path="category.id" items="${categories}" 
												itemValue="id" itemLabel="name" class="form-control"
												id="cateId" />
										</div>
									</div>
								</c:otherwise>
							</c:choose>

							<div class="form-group">
								<label path="time" class="col-md-2 control-label">Time</label>
								<div class="col-md-10">
									<form:input class="form-control" path="time" type="number" id ="time"
										required="required" min="1" max="30" />
								</div>
							</div>
							<div class="form-group">
								<label path="comment" class="col-md-2 control-label">Comment</label>
								<div class="col-md-10">
									<form:textarea name="comment" path="comment" id ="comment"
										class="form-control" rows="3" maxlength="200" />
									<span class="help-block">Comment</span>
								</div>
							</div>
							
							<div class="col-md-2"></div>
						</form:form>
						<div class="form-group">

								<div class="col-md-2"></div>

								<div class="col-md-5">
									<a href="${pageContext.request.contextPath}/Reminder/"
										class="btn  btn-raised btn-warning">Cancel</a>
								</div>

								<div class="col-md-5">
									<button id="buttonclick"
										class="btn btn-raised btn-success">Submit</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>