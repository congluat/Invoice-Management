<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript">
	$(function() {
		$(".timeline-panel").mouseenter(function() {
			$(this).find(".more-info").show("slide", {
				direction : "up"
			}, 200);
			$(this).find(".more-info").css({
				"z-index" : "50"
			});
		}).mouseleave(function() {
			$(this).find(".more-info").hide("slide", {
				direction : "up"
			}, 200);
		});
	});

	$(document).ready(function() {
		$('.timeline li:even').addClass();
		$('.timeline li:odd').addClass('timeline-inverted');
		$(".deleteButton").click(function() {
			var id = $(this).parents("li").attr("id");

			console.log(id);
			//console.log("Delete button clicked");
			//var url = $('#deleteButton').data('href');
			var url = "<c:url value='Invoice/delete/'/>" + id;

			console.log(url);
			$('#confirm-delete .btn-ok').attr('href', url);

		});

	});
</script>

<style>
.timeline>li>.timeline-panel {
	padding: 5px 5px;
}
</style>

<div style="margin-top: 10px; margin-left: 5px; margin-right: 5px">
	<ul class="timeline">

		<c:forEach var="invoice" items="${invoices}">
			<%-- <a href="Invoice/edit/${invoice.id}"> --%>
			<li id="${invoice.id}">
				<!-- <div class="timeline-badge"> --> <!-- <i class="fa fa-check"></i> -->
				<img class="timeline-badge" height="50px" width="50px"
				alt="not found"
				src="<c:url value='/resources/logo/'/>${invoice.category.logo}"
				onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">
				<!-- </div> -->

				<div class="timeline-panel">
					<div class="col-md-10 col-xs-12">
						<div class="timeline-heading">
							<c:if test="${invoice.isWarning}">
								<h4 class="timeline-title isWarning">${invoice.name}</h4>
							</c:if>
							<c:if test="${!invoice.isWarning}">
								<h4 class="timeline-title">${invoice.name}</h4>
							</c:if>
							<p>
								<small class="text-muted"><i class="fa fa-clock-o"></i>
									${invoice.time} at ${invoice.place}</small>
							</p>
						</div>

						<div class="timeline-body ">
							<p>$${invoice.amount}</p>
						</div>
					</div>
					<div class="col-md-2">
						<a href="Invoice/edit/${invoice.id}"
							class="btn btn-success btn-lg"> <span
							class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						</a> <a id="${invoice.id}" class="btn btn-danger deleteButton btn-lg"
							data-toggle="modal" data-target="#confirm-delete"> <span
							class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						</a>
					</div>
				</div>

			</li>
		</c:forEach>
	</ul>
</div>

<!-- MODAL DELETE -->
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="vertical-alignment-helper col-md-4">
		<div class="modal-dialog vertical-align-center">
			<div class="modal-content" style="border-radius: 10px;">
				<div class="modal-header">Confirm</div>
				<div class="modal-body">Do you want to delete</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a class="btn btn-danger btn-ok" style="margin-top: 0px"
						href="Invoice/delete/">Delete</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 col-md-offset-6">
		<ul class="pagination text-xs-right">
			<li><c:forEach begin="${startpage}" end="${endpage}" var="p">
					<a href="Invoice/search/${attribute}/?empname=${empname}&page=${p}">${p}
					</a>
				</c:forEach></li>
		</ul>
	</div>
</div>