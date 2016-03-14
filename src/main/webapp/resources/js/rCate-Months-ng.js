
	$(function() {
		$(".datepicker").datepicker();
		$(".datepicker_select").datepicker({
			dateFormat : 'mm/yy'
		});
		$(".datepicker_selectyear").datepicker({
			dateFormat : 'yy'
		});
	})

						
	function ValidateDate(dtValue, dtId) {

		var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
		if (dtRegex.test(dtValue)) {
			$("button[id='" + dtId + "']").removeAttr("disabled");
			$('#error-'+dtId).html('');
		} else {
			$('#error-'+dtId).html("Format of date must be dd/mm/yyyy!");
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
		}

	}
