<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript"
	src="<c:url value='/resources/nicEditor/nicEdit.js'/>"></script>

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
		bkLib.onDomLoaded(function() {
			new nicEditor({
				iconsPath : '<c:url value='/resources/nicEditor/nicEditorIcons.gif'/>',
				uploadURI: 'nic-editor/upload'
			}).panelInstance('description');
		});
		var link = '<%=request.getContextPath()%>'						
			+ "/resources/logo/${category.logo}";
		
		var link = '<%=request.getContextPath()%>'
								+ "/resources/logo/${category.logo}";
						$("#imagePreview").css("background-image",
								"url(" + link + ")");

						$(function() {
							$("#inputFile")
									.on(
											"change",
											function() {
												var files = !!this.files ? this.files
														: [];
												if (!files.length
														|| !window.FileReader)
													return; // no file selected, or no FileReader support

												if (/^image/
														.test(files[0].type)) { // only image file
													var reader = new FileReader(); // instance of the FileReader
													reader
															.readAsDataURL(files[0]); // read the local file

													reader.onloadend = function() { // set image data as background of div
														$("#imagePreview")
																.css(
																		"background-image",
																		"url("
																				+ this.result
																				+ ")");
													}
												}
											});

						});

					});
</script>
<c:if test="${edit}">
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$("#buttonclick")
									.on(
											"click",
											function() {
												var catename = $.trim($(
														"#cateName").val());
												var show = '';
												if (catename == "") {
													show += '<label style="color: red">Type the name!</label>';
													$("#errorname").html(show);
													setTimeout(function() {
														$("#errorname")
																.html('');
													}, 3000);
													return;
												}
												var cateid = $
														.trim($("#cateId")
																.val());

												$
														.ajax({
															url : "Category/checkCateAndId/"
																	+ catename
																	+ "/"
																	+ cateid,
															type : 'get',
															success : function(
																	data) {
																if (data == false) {
																	show += '<label style="color: red">Name existed!</label>';
																	$(
																			"#errorname")
																			.html(
																					show);
																	setTimeout(
																			function() {
																				$(
																						"#errorname")
																						.html(
																								'');
																			},
																			3000);
																} else {
																	$(
																			"#NewCategoryForm")
																			.submit();
																}

															},
															error : function(
																	XMLHttpRequest,
																	textStatus,
																	errorThrown) {

															}
														});
											});
						});
	</script>
</c:if>
<c:if test="${!edit}">
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#buttonclick")
									.on(
											"click",
											function() {
												var catename = $.trim($(
														"#cateName").val());
												var show = '';
												if (catename == "") {
													show += '<label style="color: red">Type the name!</label>';
													$("#errorname").html(show);
													setTimeout(function() {
														$("#errorname")
																.html('');
													}, 3000);
													return;
												}

												$
														.ajax({
															url : "Category/checkCate/"
																	+ catename,
															type : 'get',
															success : function(
																	data) {
																if (data == true) {
																	show += '<label style="color: red">Name existed!</label>';
																	$(
																			"#errorname")
																			.html(
																					show);
																	setTimeout(
																			function() {
																				$(
																						"#errorname")
																						.html(
																								'');
																			},
																			3000);
																} else {
																	$(
																			"#NewCategoryForm")
																			.submit();
																}

															},
															error : function(
																	XMLHttpRequest,
																	textStatus,
																	errorThrown) {

															}
														});
											});
						});
	</script>
</c:if>

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
					<form:input type="hidden" path="id" id="cateId" />
					<div class="form-group">
						<label path="name" class="col-md-2 control-label">Name</label>
						<div class="col-md-10">
							<form:input class="form-control" path="name" required="required"
								maxlength="100" placeholder="name" type="text" id="cateName" />
							<div id="errorname"></div>
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
								id="inputFile" multiple="" name="file" type="file"
								accept="image/*">
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
							<form:textarea name="description" path="description"
								class="form-control" rows="3" maxlength="200" />
							<span class="help-block">description</span>
						</div>
					</div>


				</fieldset>
			</form:form>
			<div class="form-group">

				<div class="col-md-2"></div>

				<div class="col-md-5">
					<a href="Category/listCategories"
						class="btn  btn-raised btn-warning"">Cancel</a>
				</div>

				<div class="col-md-5">
					<button type="submit" id="buttonclick"
						class="btn btn-raised btn-success">Submit</button>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>

	</div>
</div>
<script>
	/* bkLib
			.onDomLoaded(function() {
				new nicEditor(
						{
							iconsPath : '<c:url value='/resources/nicEditor/nicEditorIcons.gif'/>',
							uploadURI : 'nic-editor/upload'
						}).panelInstance('description');
			}); */
</script>
