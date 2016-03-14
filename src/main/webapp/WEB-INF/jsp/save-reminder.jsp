<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="panel panel-primary">
	<div id="categoryFromResponse"></div>
	<div class="panel-heading">
		<h1 class="panel-title center">Reminder Form</h1>
	</div>
	<div class="panel-body">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form:form class="form-horizontal" modelAttribute="reminder"
				method="POST">
					<h4>${message}</h4>
					<form:input type="hidden" path="id" />
					<div class="form-group">
						<label path="name" class="col-md-2 control-label">Category</label>
						<div class="col-md-10">
							<form:select path="category.id" items="${categories}"
								itemValue="id" itemLabel="name" class="form-control" id="cateId"/>
						</div>
					</div>
					<div class="form-group">
							<label path="time" class="col-md-2 control-label">Time</label>
							<div class="col-md-10">
								<form:input class="form-control" path="time" type="number"  required="required" min="1" max="30"/>
							</div>
						</div>
					<div class="form-group">
						<label path="comment" class="col-md-2 control-label">Comment</label>

						<div class="col-md-10">
							<form:textarea name="comment" path="comment" class="form-control"
								rows="3" maxlength="200" />
							<span class="help-block">Comment</span>
						</div>
					</div>
					<div class="form-group">

				<div class="col-md-2"></div>

				<div class="col-md-5">
					<a href="Category/listCategories"
						class="btn  btn-raised btn-warning">Cancel</a>
				</div>

				<div class="col-md-5">
					<button type="submit" id="buttonclick"
						class="btn btn-raised btn-success">Submit</button>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
		</form:form>
			
			
	</div>
</div>