$(document).ready(function() {
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

				    }
				}); 
			});		
		}
	}
});

	function isValid(evt) {
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode >= 32 && charCode <= 254) {
			return false;
		}
		return true;
	}

	$(document).on("click",".onclickdelete",function() {
		var divid = $(this).parents("div").attr("id");
		$("#confirm button").attr('id',divid);
	});

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
		
			}
		});
	});
});

