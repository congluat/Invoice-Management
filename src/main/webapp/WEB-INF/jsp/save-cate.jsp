<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<div class="col-md-6">
	<form:form class="form-horizontal" modelAttribute="category"
		method="POST" enctype="multipart/form-data">
		<fieldset>
			<legend>CATEGORY FORM</legend>
			${message}
			<form:input type="hidden" path="id" />
			<div class="form-group">
				<form:label path="name" class="col-md-2 control-label">Name</label>
					<div class="col-md-10">
						<form:input class="form-control" path="name" placeholder="name"
							type="text" />
					</div>
			</div>

			<div class="form-group">
				<label for="inputFile" class="col-md-2 control-label">Logo</form:label>

					<div class="col-md-10">
						<input readonly="readonly" class="form-control"
							placeholder="Browse..." type="text"> <input
							id="inputFile" multiple="" name="file" type="file">
						<form:hidden path="logo" />
					</div>
			</div>
			<div class="form-group">
				<form:label path="description" class="col-md-2 control-label">Description</form:label>

				<div class="col-md-10">
					<form:textarea path="description" class="form-control" rows="3" />
					<span class="help-block">description</span>
				</div>
			</div>


			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</fieldset>
	</form:form>
</div>