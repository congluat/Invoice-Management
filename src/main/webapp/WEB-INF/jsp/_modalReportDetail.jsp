<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<style>
.modal.modal-wide .modal-dialog {
	width: 90%;
	z-index: 12000;
}

.modal-wide .modal-body {
	max-height: calc(100vh - 210px);
	overflow-y: auto;
}

/* irrelevant styling */
body p {
	max-width: 400px;
	margin: 20px auto;
}

#tallModal .modal-body p {
	margin-bottom: 900px
}
</style>

<script type="text/javascript">
	$(".modal-wide").on("show.bs.modal", function() {
		var height = $(window).height() - 200;
		$(this).find(".modal-body").css("max-height", height);
	});
</script>

<div ng-controller="reportCtrl">

	<!-- Modal -->
	<div id="tallModal" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title">Invoice List</h3>
					<ul style="list-style-type: none;">
						<h4>Selecting:</h4>
						<li><h4>Category Name: {{cateName}}</h4></li>
						<li><h4>Time: {{month}}</h4></li>
					</ul>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Time</th>
									<th>Place</th>
									<th>Comment</th>
									<th>Amount</th>

								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="invoice in invoicedetails"
									ng-class='{red : invoice.isWarning ,black: !invoice.isWarning}'>
									<td>{{$index+1}}</td>
									<td>{{invoice.name}}</td>
									<td>{{invoice.time | date:"dd/MM/yyyy | h:mma"}}</td>
									<td>{{invoice.place}}</td>
									<td ng-bind-html="invoice.comment | unsafe"></td>
									<td>{{invoice.amount | currency}}</td>


								</tr>
								<tr>
									<td colspan=4></td>
									<td><strong>Count: </strong></td>
									<td><strong>{{countDetail}}</strong></td>
								</tr>
								<tr>
									<td style="border-top: 1px solid #FFF" colspan=4></td>
									<td><strong>SUM: </strong></td>
									<td><strong>{{sumDetail | currency}}</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

</div>