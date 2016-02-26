<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div style="margin-top: 10px">
	<script type="text/javascript">
		/* $(function() {
			$(".invoice-tab").mouseenter(function() {
				$(this).find(".more-info").show("slide", {
					direction : "up"
				}, 500);
				$(this).find(".more-info").css({
					"z-index" : "50"
				});
			}).mouseleave(function() {
				$(this).find(".more-info").hide("slide", {
					direction : "up"
				}, 500);
			});
		}); */

		/*$(document).ready(function() {
			$('.invoice-tab').hover(function() {
				$(this).addClass('transition');

			}, function() {
				$(this).removeClass('transition');

			});
		}); */
	</script>

	<h1 class="center">Invoices</h1>
	<div class="col-md-12 list-invoices">


		<c:forEach var="invoice" items="${invoices}">
			<a href="Invoice/edit/${invoice.id}">
				<div class="col-md-5 invoice-tab">


					<c:if test="${invoice.isWarning}">
						<div class="well warning col-md-12 row">
					</c:if>
					<c:if test="${!invoice.isWarning}">
						<div class="well col-md-12 row">
					</c:if>

					<div class="col-md-4">
						<h5>${invoice.name}</h5>
					</div>

					<div class="col-md-4">
						<h5>$${invoice.amount}</h5>
					</div>

					<div class="col-md-4">
						<h5>${invoice.category.name}</h5>
					</div>
					<div class="col-md-12 more-info">
						${invoice.comment}<br> ${invoice.place}<br>
						${invoice.time}<br>
					</div>
				</div>

			</a>
	</div>
	</c:forEach>

</div>

<%-- 	<div class="table-responsive">
		<table class="table table-invoice">
			<tr>
				<th>Name</th>
				<th>Amount</th>
				<th>Time</th>
				<th>Place</th>
				<th>Category</th>
			</tr>

			<c:forEach var="invoice" items="${invoices}">

				<c:if test="${invoice.isWarning}">

					<tr style="background-color: #ffecb3" class='clickable-row'
						data-href='Invoice/edit/${invoice.id}'>
						<td>${invoice.name}</td>
						<td>${invoice.amount}</td>
						<td>${invoice.time}</td>
						<td>${invoice.place}</td>
						<td>${invoice.category.name}</td>
					</tr>

				</c:if>
				<c:if test="${!invoice.isWarning}">
					<tr class='clickable-row' data-href='Invoice/edit/${invoice.id}'>
						<td>${invoice.name}</td>
						<td>${invoice.amount}</td>
						<td>${invoice.time}</td>
						<td>${invoice.place}</td>
						<td>${invoice.category.name}</td>
					</tr>
				</c:if>


			</c:forEach>
		</table>
	</div> --%>


</div>