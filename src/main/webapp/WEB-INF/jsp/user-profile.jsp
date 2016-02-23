<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h1 class="panel-title center">User Profile</h1>
	</div>
	<div class="panel-body">


		<form:form method="post" class="form-horizontal" modelAttribute="user">
			<form:input path="id" type="hidden" id="id" />

			<div class="modal-body">
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name
					</label>
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
				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-6">
						<c:if test="${success==true}">
							<div class="alert alert-dismissible alert-success center">Save
								user success</div>
						</c:if>
						<c:if test="${success==false}">
							<div class="alert alert-dismissible alert-danger center">Save
								user fail</div>
						</c:if>
					</div>
					<div class="col-sm-4"></div>
				</div>



			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-raised btn-success" value="Save"></input>
			</div>
		</form:form>


	</div>
</div>


