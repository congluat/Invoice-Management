<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
.timeline>li>.timeline-panel {
	padding: 5px 5px;
}

.btn {
	padding: 2px;
}
</style>

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
		$('.timeline > li:even').addClass();
		$('.timeline > li:odd').addClass('timeline-inverted');
	});
</script>

<div style="margin-top: 10px; margin-left: 5px; margin-right: 5px">
	<div ng-controller="InvoiceController">


		<h1>{{month}}</h1>

		<ul class="timeline">

			<li ng-repeat="i in invoices"><img class="timeline-badge"
				height="50px" width="50px" alt="not found"
				ng-src="<c:url value='/resources/logo/'/>{{i.category.logo}}"
				onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">

				<%-- <c:if test="{{i.isWarning}">
					<div class="timeline-panel" style="background-color: #ffecb3">
					</c:if> <c:if test="{{!invoice.isWarning}}">	
					</c:if> --%>
				<div class="timeline-panel">
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
						<a href="Invoice/edit/{{i.id}" class="btn btn-success">Edit</a>
					</div>
					<div class="col-md-2">
						<a href="Invoice/edit/{{i.id}" class="btn btn-danger">Delete</a>
					</div>
					<div class="col-md-12 more-info">{{i.comment}}</div></li>

		</ul>

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