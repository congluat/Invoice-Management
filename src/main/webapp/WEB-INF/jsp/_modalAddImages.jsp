<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/libs/bootstrap-dialog/css/bootstrap-dialog.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/style.css"/>'>
	
<div ng-controller="UserController as userCtrl">

	<!-- Modal -->
	<div class="modal-fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">New User</h4>
				</div>
				
		<div class="panel panel-default">
			<div class="panel-heading text-center"></div>
			<div class="panel-body">
				<div>				
					<form:form modelAttribute="invoice" id="dropzone-form" action="Upload/upload" class="dropzone" enctype="multipart/form-data">
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
					<a class="btn btn-warning pull-right" href="dashboard">Cancel
					</a>
				</div>
			</div>
		</div>

			</div>
		</div>
	</div>
</div>

	<script type="text/javascript"
		src='<c:url value="/resources/libs/jquery/jquery-2.1.1.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/libs/bootstrap-3.1.1/js/bootstrap.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/libs/bootstrap-dialog/js/bootstrap-dialog.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/libs/dropzone.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/app.js"/>'></script>