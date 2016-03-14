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

