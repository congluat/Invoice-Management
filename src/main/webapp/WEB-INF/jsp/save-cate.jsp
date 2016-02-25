<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


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
<script type="text/javascript">
	$(document).ready(function() {
		
		var link = '<%=request.getContextPath() %>'+"/resources/logo/${category.logo}";
		$("#imagePreview").css("background-image", "url("+link+")");

	
	$(function() {
		$("#inputFile").on(
				"change",
				function() {
					var files = !!this.files ? this.files : [];
					if (!files.length || !window.FileReader)
						return; // no file selected, or no FileReader support

					if (/^image/.test(files[0].type)) { // only image file
						var reader = new FileReader(); // instance of the FileReader
						reader.readAsDataURL(files[0]); // read the local file

						reader.onloadend = function() { // set image data as background of div
							$("#imagePreview").css("background-image",
									"url(" + this.result + ")");
						}
					}
				});
		
		

	});
	
	});
</script>
<div class="panel panel-primary">
<div id="categoryFromResponse"></div>
	<div class="panel-heading">
		<h1 class="panel-title center">CATEGORY FORM</h1>
	</div>
	<div class="panel-body">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form:form class="form-horizontal" modelAttribute="category"
				method="POST" enctype="multipart/form-data" id="NewCategoryForm">


				<fieldset>

					<h4>${message}</h4>
					<form:input type="hidden" path="id" />

					<div class="form-group">
						<label path="name" class="col-md-2 control-label">Name</label>
							<div class="col-md-10">
								<form:input class="form-control" path="name" required="required" maxlength="100"
									placeholder="name" type="text" />
								
								<c:if test='${not empty "${error}"}'>
									<label style="color: red">${error}</label>
								</c:if>
							</div>
					</div>

					<div class="form-group">
						<label for="inputFile" class="col-md-2 control-label">Logo</label>

							<div class="col-md-10">
								<input readonly="readonly" class="form-control"
									placeholder="Browse..." type="text"> <input
									id="inputFile" multiple="" name="file" type="file" accept="image/*">
								<form:hidden path="logo" />
								<div id="imagePreview"></div>
								<div>
								<c:if test='${not empty "${error_image}"}'>
									<label style="color: red">${error_image}</label>
								</c:if>
								</div>
							</div>
					</div>
					<div class="form-group">
						<label path="description" class="col-md-2 control-label">Description</label>

						<div class="col-md-10">
							<form:textarea path="description" class="form-control" rows="3" maxlength="200"/>
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
		<div class="col-md-2"></div>

	</div>
</div>
<%-- http://spring.io/blog/2010/01/25/ajax-simplifications-in-spring-3-0/--%>
