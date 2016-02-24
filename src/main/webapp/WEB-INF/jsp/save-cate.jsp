<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript">
$(function() {
    $("#inputFile").on("change", function()
    {
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
 
        if (/^image/.test( files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
 
            reader.onloadend = function(){ // set image data as background of div
                $("#imagePreview").css("background-image", "url("+this.result+")");
            }
        }
    });
});
</script>
<div id="categoryFromResponse"></div>
<form:form class="form-horizontal" modelAttribute="category"
	method="POST" enctype="multipart/form-data" id="NewCategoryForm">
	<div class="col-md-6">

		<fieldset>
			<legend>CATEGORY FORM</legend>
			${message}
			<form:input type="hidden" path="id" />
			<div class="form-group">
				<form:label path="name" class="col-md-2 control-label">Name</label>
					<div class="col-md-10">
						<form:input class="form-control" path="name" required="required"
							placeholder="name" type="text" />
					</div>
			</div>

			<div class="form-group">
				<label for="inputFile" class="col-md-2 control-label">Logo</form:label>

					<div class="col-md-10">
						<input readonly="readonly" class="form-control"
							placeholder="Browse..." type="text"> <input
							id="inputFile" multiple="" name="file" type="file">
						<form:input readonly="true" path="logo" />
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

	</div>

	<div class="col-md-6">
	<div id="imagePreview"></div>
	</div>
</form:form>