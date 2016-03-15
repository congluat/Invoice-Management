<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script>
	$(document).ready(function() {
		$(".deleteButton").click(function() {
			var id = $(this).parents("td").attr("id");

			console.log(id);
			//console.log("Delete button clicked");
			//var url = $('#deleteButton').data('href');
			var url = "<c:url value='Reminder/delete/'/>" + id;

			console.log(url);
			$('#confirm-delete .btn-ok').attr('href', url);
		});

	});
</script>

<div class="panel panel-green">
	<div class="panel-heading">Ramainders</div>
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
						<td><a class="btn btn-info"><span
								class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td>
						<td id="${reminder.id}"><a
							class="btn btn-danger deleteButton" data-toggle="modal"
							data-target="#confirm-delete"><span
								class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6"
						style="text-align: center; font-size: 42px; color: #23AE89; vertical-align: middle;">
						<a href="Reminder/save-reminder"> <span
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
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a class="btn btn-danger btn-ok" style="margin-top: 0px" href="">Delete</a>
				</div>
			</div>
		</div>
	</div>
</div>