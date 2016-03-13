<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/libs/bootstrap-dialog/css/bootstrap-dialog.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/style.css"/>'>
<script type="text/javascript"
	src="<c:url value='/resources/nicEditor/nicEdit.js'/>"></script>
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
$(document).ready(function() {

	bkLib.onDomLoaded(function() {
		new nicEditor({
			iconsPath : '<c:url value='/resources/nicEditor/nicEditorIcons.gif'/>',
			uploadURI: 'nic-editor/upload'
		}).panelInstance('comment');
	});
	
	$(".file-dropzone").on('dragover', handleDragEnter);
	$(".file-dropzone").on('dragleave', handleDragLeave);
	$(".file-dropzone").on('drop', handleDragLeave);

	function handleDragEnter(e) {

		this.classList.add('drag-over');
	}

	function handleDragLeave(e) {

		this.classList.remove('drag-over');
	}

	// "dropzoneForm" is the camel-case version of the form id "dropzone-form"
	
	Dropzone.options.dropzoneForm = {
		acceptedFiles: "image/jpeg,image/png,image/gif",
		autoProcessQueue : false,
		uploadMultiple : true,
		maxFilesize : 256, // MB
		parallelUploads : 100,
		maxFiles : 100,
		addRemoveLinks : true,
		previewsContainer : ".dropzone-previews",

		// The setting up of the dropzone
		init : function() {

			var myDropzone = this;
			
			// first set autoProcessQueue = false
			$('#upload-button').on("click", function(e) {
				
				myDropzone.processQueue();
			});
						
			// customizing the default progress bar
			this.on("uploadprogress", function(file, progress) {

				progress = parseFloat(progress).toFixed(0);

				var progressBar = file.previewElement.getElementsByClassName("dz-upload")[0];
				progressBar.innerHTML = progress + "%";
			});

			// displaying the uploaded files information in a Bootstrap dialog		
			this.on("complete", function(files) {	
				$('#myModalEditPhoto').modal('hide');
				var invoiceid = $(".abc").attr("id");
				var show='';
				$('#showimages').html(show);
			
				$.ajax({
					url : "Upload/getPhoto",
					type : 'post',
					data : {
						id : invoiceid
					},
					dataType : 'json',
					success : function(data) {
						 $.each(data,function (index) {																													         	
						 	show+='<div class="col-md-2"> <div class="col-md-12"> <img alt="not found" height="80px" width="80px" src="<%= request.getContextPath()%>/resources/images/'+data[index].photo+'" /></div> <div style="text-align: center;" class="col-md-12" id ='+data[index].id+'> <a class="onclickdelete" data-toggle="modal" data-target="#confirm-delete">Delete</a></div></div> ';						 	
						 }); 
						 $('#showimages').html(show);
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
				        alert("some error");
				    }
				}); 
			});		
		}
	}
});
</script>

<script type="text/javascript">
	function isValid(evt) {
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode >= 32 && charCode <= 254) {
			return false;
		}
		return true;
	}
</script>

<script type="text/javascript">
	$(document).on("click",".onclickdelete",function() {
		var divid = $(this).parents("div").attr("id");
		$("#confirm button").attr('id',divid);
	});
</script>

<script type="text/javascript">
$(document).on("click","#delete",function() {
	$('#confirm-delete').modal('hide');
	var photoid = $("#confirm button").attr("id");
	$.ajax({
		url : "Upload/delete",
		type : 'post',
		data : {
			id : photoid
		},
		success : function(result) {
			$('#' + photoid).parents(".col-md-2").remove();
		}
	});		
});
</script>
	
<script type="text/javascript">
function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if ((charCode >= 48 && charCode <= 57) || charCode == 32 || charCode == 46 || charCode == 8) {
		return true;
	}
	return false;
}

$(document).ready(function() {
	var cateid = $.trim($("#cateId").val());
	var money = $.trim($("#amountId").val());
	$("#cateId").on("change",function(){
		cateid = $.trim($("#cateId").val());
		money = $.trim($("#amountId").val());	
		var show='';
		$.ajax({
			url : "Invoice/get-all-invoices/" + money+"/"+cateid,
			type : 'get',
			success : function(data) {
				if (data == true) {
					show+='<label style="color: red">Your money is too big!</label>';
					$("#errorname").html(show);
					setTimeout(function() {
						$("#errorname").html('');
					}, 2000);
				}				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("some error");				
			}
		});
	});	
	$("#amountId").on("change",function(){
		money = $.trim($("#amountId").val());	
		var show='';
		$.ajax({
			url : "Invoice/get-all-invoices/" + money+"/"+cateid,
			type : 'get',
			success : function(data) {
				if (data == true) {
					show+='<label style="color: red">Your money is too big!</label>';
					$("#errorname").html(show);
					setTimeout(function() {
						$("#errorname").html('');
					}, 6000);
				}				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("some error");				
			}
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
								itemValue="id" itemLabel="name" class="form-control" id="cateId"/>
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

							<c:if test="${!edit}">
								<script type="text/javascript">
									$(document).ready(function() {
										$(function() {
											$("#select-time").datetimepicker({
												defaultDate : new Date()
											});
										});
									});
								</script>
							</c:if>

							<c:if test="${edit}">
								<script type="text/javascript">
									$(document)
											.ready(
													function() {

														var strTime = '${invoice.time}';
														var time = moment(
																strTime)
																.format(
																		'MM/DD/YYYY hh:mm A');
														console.log("strTime: "
																+ strTime);
														console.log("time: "
																+ time);

														$(function() {
															$("#select-time")
																	.datetimepicker(
																			{

																				defaultDate : time
																			});

														});
														$("#timeInput").val(
																time);
														$("#timeInput").attr(
																"value", time);
													});
								</script>
							</c:if>
							<label path="time" class="col-md-2 control-label">Time</label>
							<div class="col-md-10">

								<div class='input-group date' id='select-time'>
									<form:input id="timeInput" required="required" path="time"
										type='text' class="form-control"
										onkeypress="return isValid(event)" />
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
								<form:input id="amountId" class="form-control" path="amount" onkeypress="return isNumber(event)"/>
								<div id="errorname">
								</div>
								<div class="has-error">
									<form:errors path="amount" class="help-inline" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label path="comment" class="col-md-2 control-label">Comment</label>

							<div class="col-md-10">
								<form:textarea name="comment" path="comment"
									class="form-control" rows="3" maxlength="200" />
								<span class="help-block">comment</span>
								<div class="has-error">
									<form:errors path="comment" class="help-inline" />
								</div>
							</div>
						</div>
						<div class="abc" id="${invoice.id}">
							<c:if test="${edit}">
								<script type="text/javascript">
							$(document).ready(function() {							
									var invoiceid = $(".abc").attr("id");
									var show ='';
									$.ajax({
										url : "Upload/getPhoto",
										type : 'post',
										data : {
											id : invoiceid
										},
										dataType : 'json',
										success : function(data) {
											 $.each(data,function (index) {																													         	
											 	show+='<div class="col-md-2"> <div class="col-md-12"> <img alt="not found" height="80px" width="80px" src="<%= request.getContextPath()%>/resources/images/'+ data[index].photo	+ '" /></div> <div style="text-align: center;" class="col-md-12" id ='+data[index].id+'> <a class="onclickdelete" data-toggle="modal" data-target="#confirm-delete">Delete</a></div></div> ';
																						});
																		$(
																				'#showimages')
																				.html(
																						show);
																	},
																	error : function(
																			XMLHttpRequest,
																			textStatus,
																			errorThrown) {
																		alert("some error");
																	}
																});
													});
								</script>
							</c:if>
						</div>

						<div class="form-group" id="showimages"></div>
						<div>
							<c:if test="${edit}">
								<a data-toggle="modal" data-target="#myModalEditPhoto"
									class="col-md-2" style="padding-top: 14px"><span
									style="font-size: 45px; vertical-align: middle"
									class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2"></div>
						<div class="col-md-5">
							<a href="Invoice/" class="btn  btn-raised btn-warning">Cancel</a>
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

<div class="modal fade" id="myModalEditPhoto" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Upload Images</h4>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading text-center"></div>
				<div class="panel-body">
					<div>
						<form:form modelAttribute="invoice" id="dropzone-form"
							action="Upload/upload/${invoice.id}" class="dropzone"
							enctype="multipart/form-data">
							<div class="dz-default dz-message file-dropzone text-center ">

								<span class="glyphicon glyphicon-paperclip"></span> <span>
									Drag and drop images here</span><br> <span>OR</span><br> <span>Browse</span>
							</div>
							<!-- this is were the previews should be shown. -->
							<div class="dropzone-previews"></div>
						</form:form>
						<hr>
						<button id="upload-button" class="btn btn-primary">
							<span class="glyphicon glyphicon-upload"></span> Upload
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content"
					style="width: 400px; border-radius: 10px;">
					<div class="modal-header">Confirm</div>
					<div class="modal-body">Do you want to delete</div>

					<div class="modal-footer" id="confirm">
						<button id="" type="button" class="btn btn-default"
							data-dismiss="modal">Cancel</button>
						<a id="delete" class="btn btn-danger btn-ok"
							style="margin-top: 0px">Delete</a>
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
