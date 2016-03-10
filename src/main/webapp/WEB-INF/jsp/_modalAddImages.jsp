<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/libs/bootstrap-dialog/css/bootstrap-dialog.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/style.css"/>'>
	
	<!-- Modal -->
	<div class="modal-fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Upload Images</h4>
				</div>
				
		<div class="panel panel-default">
			<div class="panel-heading text-center"></div>
			<div class="panel-body">
				<div>				
					<form:form id="dropzone-form" action="Upload/upload/${invoice.id}" class="dropzone" enctype="multipart/form-data">
						<div
							class="dz-default dz-message file-dropzone text-center ">

							<span class="glyphicon glyphicon-paperclip"></span> <span>
								Drag and drop images here</span><br> <span>OR</span><br>
							<span>Browse</span>
						</div>
						<!-- this is were the previews should be shown. -->
						<div class="dropzone-previews"></div>
					</form:form>
					<hr>
					<button id="upload-button" class="btn btn-primary">
						<span class="glyphicon glyphicon-upload"></span> Upload
					</button>
					<a class="btn btn-warning pull-right" href="Invoice/get-all-invoices">Done
					</a>
				</div>
			</div>
		</div>

			</div>
		</div>
	</div>

	<script type="text/javascript"
		src='<c:url value="/resources/libs/bootstrap-dialog/js/bootstrap-dialog.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/libs/dropzone.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/app.js"/>'></script>