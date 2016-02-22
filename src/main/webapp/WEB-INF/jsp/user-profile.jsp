<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<h1 class="center">User Profile</h1>
<form:form method="post" class="form-horizontal" modelAttribute="user">
	<form:input path="id" type="hidden" id="id" />
	<div class="modal-body">
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">Name </label>
			<div class="col-sm-10">
				<form:input type="text" class="form-control" required="required"
					id="name" path="name" />

			</div>
		</div>
		<div class="form-group">
			<label for="inputAge" class="col-sm-2 control-label">Age </label>
			<div class="col-sm-10">
				<form:input type="number" class="form-control" required="required"
					id="age" path="age" />

			</div>
		</div>
	</div>
	<div class="modal-footer">
		<input type="submit" class="btn btn-primary" value="Save"></input>
	</div>
</form:form>