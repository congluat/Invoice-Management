<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<style>
.timeline>li>.timeline-panel {
	padding: 5px 5px;
}

.btn {
	padding: 2px;
}
</style>

<div class="col-md-6 col-md-offset-6">
		<div class="input-group input-group-lg">
			<span class="input-group-addon" id="sizing-addon1"><i
				class="glyphicon glyphicon-search"></i></span> 
		    <input id="search"
				type="text" class="form-control" name="searchFor" ng-model="searchString"
				placeholder="Search for invoices..." >
		</div>
	</div>
	<!-- /.col-md-6 -->

<div class="row" style="margin-top: 10px; margin-left: 5px; margin-right: 5px">
	

	<script type="text/javascript">
		$(document).ready(function() {
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
		}).mouseleave(function() {
			$(this).find(".more-info").hide("slide", {
				direction : "up"
			}, 200);
		});

		$(".deleteButton").click(function() {
			var id = $(this).parents("li").attr("id");

			console.log(id);
			//console.log("Delete button clicked");
			//var url = $('#deleteButton').data('href');
			var url = "<c:url value='Invoice/delete/'/>" + id;

			console.log(url);
			$('#confirm-delete .btn-ok').attr('href', url);

		});
	</script>




	<div class="col-md-12">
		<div ng-controller="InvoiceController">


			<h1>{{month}}</h1>


			<ul class="timeline">

				<li ng-repeat="i in invoices | searchFor:searchString" ng-class-odd="'timeline-inverted'" ><img
					class="timeline-badge" height="50px" width="50px" alt="not found"
					ng-src="<c:url value='/resources/logo/'/>{{i.category.logo}}"
					onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">

					<%-- <c:if test="{{i.isWarning}">
					<div class="timeline-panel" style="background-color: #ffecb3">
					</c:if> <c:if test="{{!invoice.isWarning}}">	
					</c:if> --%>
					<div class="timeline-panel" ng-mouseenter="hover(i)" ng-mouseleave="hover(i)">
						<div class="col-md-8">
							<div class="timeline-heading">
								<h4 class="timeline-title">{{i.name}}</h4>
								<p>
									<small class="text-muted"><i class="fa fa-clock-o"></i>
										{{i.time | date:"dd/MM/yyyy 'at' h:mma"}} at {{i.place}}</small>
								</p>
							</div>

							<div class="timeline-body ">
								<p>{{i.amount|currency}}</p>
							</div>
						</div>
						<div class="col-md-2">
							<a href="Invoice/edit/{{i.id}}" class="btn btn-success">Edit</a>
						</div>
						<div class="col-md-2">
							<a class="btn btn-danger deleteButton" data-toggle="modal"
								data-target="#confirm-delete">Delete</a>
						</div>
						<div class="modal fade" id="confirm-delete" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">Confirm</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Cancel</button>
										<a class="btn btn-danger btn-ok"
											href="Invoice/delete/{{i.id}}">Delete</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 more-info" showonhoverparent>
							{{i.comment}}
							<div ng-repeat="img in i.photos">
								<img class="col-md-4" alt="not found"
									ng-src="<c:url value='/resources/images/'/>{{img.photo}}">
							</div>
						</div></li>

			</ul>

		</div>
	</div>

</div>

<%-- 
<div style="margin-top: 10px; margin-left: 5px; margin-right: 5px">

	<ul class="timeline">

		<c:forEach var="invoice" items="${invoices}">

			<li><img class="timeline-badge" height="50px" width="50px"
				alt="not found"
				src="<c:url value='/resources/logo/'/>${invoice.category.logo}"
				onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">

				<c:if test="${invoice.isWarning}">
					<div class="timeline-panel" style="background-color: #ffecb3">
				</c:if> <c:if test="${!invoice.isWarning}">
					<div class="timeline-panel">
				</c:if>

				<div class="col-md-8">
					<div class="timeline-heading">
						<h4 class="timeline-title">${invoice.name}</h4>
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
						class="btn btn-success col-md-4">Edit</a>
				</div>
				<div class="col-md-2">
					<a href="Invoice/edit/${invoice.id}"
						class="btn btn-danger col-md-4">Delete</a>
				</div>
				<div class="col-md-12 more-info">${invoice.comment}</div></li>
		</c:forEach>
	</ul>


</div> --%>