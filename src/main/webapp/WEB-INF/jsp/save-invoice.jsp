<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
.has-error {
	color: red;
}
</style>
<style>
#imagePreview {
	width: 180px;
	height: 180px;
	background-position: center center;
	background-size: cover;
	-webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
	display: inline-block;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker-standalone.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


<script type="text/javascript">
	function isNumber(evt) {
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode >= 32 && charCode <= 254) {
			return false;
		}
		return true;
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$("#select-time").datetimepicker({
				defaultDate : new Date()
			});
		});
	});
</script>





<div class="panel panel-primary">
	<div class="panel-heading">
		<h1 class="panel-title center">INVOICE FORM</h1>
	</div>
	<div class="panel-body">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form:form class="form-horizontal" modelAttribute="invoice"
				method="POST" enctype="multipart/form-data" id="#">
				<fieldset>
					<h4>${message}</h4>
					<form:input type="hidden" path="id" />
					<form:input type="hidden" path="user.id" />
					<div class="form-group">
						<label path="name" class="col-md-2 control-label">Category</label>
						<div class="col-md-10">
							<form:select path="category.id" items="${categories}"
								itemValue="id" itemLabel="name" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label path="name" class="col-md-2 control-label">Name</label>
						<div class="col-md-10">
							<form:input class="form-control" path="name" required="required"
								maxlength="100" placeholder="name" type="text" />
							<div class="has-error">
								<form:errors path="name" class="help-inline" />
							</div>
						</div>
						<div class="form-group">
							<label path="time" class="col-md-2 control-label">Time</label>
							<div class="col-md-10">
								<div class='input-group date' id='select-time'>
									<form:input required="required" path="time" type='text'
										class="form-control" onkeypress="return isNumber(event)" />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label path="place" class="col-md-2 control-label">Place</label>
							<div class="col-md-10">
								<form:input class="form-control" path="place" type="text" />
								<div class="has-error">
									<form:errors path="place" class="help-inline" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label path="amount" class="col-md-2 control-label">Amount</label>
							<div class="col-md-10">
								<form:input class="form-control" path="amount" />
								<div class="has-error">
									<form:errors path="amount" class="help-inline" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label path="comment" class="col-md-2 control-label">Comment</label>

							<div class="col-md-10">
								<form:textarea path="comment" class="form-control" rows="3"
									maxlength="200" />
								<span class="help-block">comment</span>
								<div class="has-error">
									<form:errors path="comment" class="help-inline" />
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">

						<div class="col-md-2"></div>

						<div class="col-md-5">
							<a href="#" class="btn  btn-raised btn-warning"">Cancel</a>
						</div>

						<div class="col-md-5">
							<button type="submit" class="btn btn-raised btn-success">Submit</button>
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>
		<div class="col-md-2"></div>

	</div>
</div>

<%-- http://spring.io/blog/2010/01/25/ajax-simplifications-in-spring-3-0/--%>