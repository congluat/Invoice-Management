$(function() {
		$(".datepicker").datepicker();
		$(".datepicker_select").datepicker({
			dateFormat : 'mm/yy',
			changeMonth: true,
			changeYear: true,
		});
		$(".datepicker_selectyear").datepicker({
			dateFormat : 'yy',
			changeYear: true,
		});
	})

						
	function ValidateDate(dtValue, dtId) {

		var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
		if (dtRegex.test(dtValue)) {
			$("button[id='" + dtId + "']").removeAttr("disabled");
			$('#error-'+dtId).html('');
		} else {
			$('#error-'+dtId).html("Format of date must be dd/mm/yyyy!");
			$('#error-'+dtId).css({"color":"red"});
			$("button[id='" + dtId + "']").attr('disabled', 'disabled');
		}

	}
	function ValidateMonth(dtValue, dtId) {

		var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{4}\b/);
		if (dtRegex.test(dtValue)) {
			$("button[id='" + dtId + "']").removeAttr("disabled");
			$('#error-'+dtId).html('');
		} else {
			$("button[id='" + dtId + "']").attr('disabled', 'disabled');
			$('#error-'+dtId).html('Format of month must be mm/yyyy!');
			$('#error-'+dtId).css("color","red");
		}

	}
	function ValidateYear(dtValue, dtId) {

		var dtRegex = new RegExp(/\b\d{4}\b/);
		if (dtRegex.test(dtValue)) {
			$("button[id='" + dtId + "']").removeAttr("disabled");
			$('#error-'+dtId).html('');
		} else {
			$("button[id='" + dtId + "']").attr('disabled', 'disabled');
			$('#error-'+dtId).html('Format of year must be yyyy!');
			$('#error-'+dtId).css("color","red");
		}

	}
	function ValidateD2D(dtValue, dtId) {
		ValidateDate(dtValue,dtId);
		if ($('#startdate').val() !='' && $('#enddate').val() != null ) {
			var startDate = new Date($('#satrtdate').val());
			var endDate = new Date($('#enddate').val());
			if (startDate > endDate) {
				$("#error-enddate").html('endDate must be greater than startdate!');
				$('#error-enddate').css("color","red");
				$("button[id='d2d']").attr('disabled', 'disabled');
			}
			else {
				$("button[id='d2d']").removeAttr('disabled');
			}
		}
		else {
			alert ('Please input value of fromdate and todate!');
		}
	}