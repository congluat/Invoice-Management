<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0; z-index: 100">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard"><i
			class="glyphicon glyphicon-home"></i> Invoice Management</a>
	</div>
<script>
  $(document).ready(function () {
    $('.selectpicker').selectpicker({
    	style: 'btn-primary',
        size: false,
        mobile : true,
        style : "background: inherit"
    });
  });
</script>
	<script>
		$(document).ready(function() {
							$(function() {
								$("#invoice")
										.autocomplete(

												{
													source : function(request,
															response) {
														//alert($("#select").val());
														$
																.ajax({
																	url : "/InvoiceManagement/getSearchValue/"
																			+ $(
																					"#select")
																					.val(),
																	type : "POST",
																	data : {
																		term : request.term
																	},
																	dataType : "json",
																	success : function(
																			data) {
																		response($
																				.map(
																						data,
																						function(
																								item,
																								i) {
																							if (i < 10) {
																								if ($(
																										"#select")
																										.val() == "Name") {
																									return {
																										value : item.name,
																										desc : item.name
																									}
																								}
																								if ($(
																										"#select")
																										.val() == "Place") {
																									return {
																										value : item.place,
																										desc : item.place
																									}
																								}
																							}
																						}));
																	}
																});
													},
													focus : function(event, ui) {
														$(this).val(
																ui.item.name);
														return false;
													},
													select : function(event, ui) {
														var name = ui.item.value;
														var attribute = document
																.getElementById('select').value;
														window.location = "Invoice/search/"
																+ name
																+ "/"
																+ attribute;
													}
												}).data("uiAutocomplete")._renderItem = function(
										ul, item) {
									var str = item.desc;
									var page = document
											.getElementById('invoice').value;
									var reg = new RegExp(page, "gi");
									var res = str.replace(reg, page.fontcolor(
											"blue").bold().fontsize(4));
									return $("<li></li>").data(
											"item.autocomplete", item).append(
											res).appendTo(ul);
								};
							});
						});
	</script>

<style>
.searchForm {
	background: inherit;
	color: #ddd;
	border-bottom: 1px solid #ccc;
	font-size: 18px;
	height: 38px;
	background-size: 0 2px, 100% 1px;
}

.alertForm {
	background: inherit;
	font-size: 15px;
	height: 20px;
	background-size: 0 2px, 100% 1px;
	margin-bottom: 0px;
	margin-right: 0px;
	margin-top: -10;
	border-top-width: 10;
	padding-top: 14px;
	padding-bottom: 36px;
}
</style>

	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right notibar row">
		
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-user"></i> <c:choose>
					<c:when test="${empty sessionScope['user']}">
						${sessionScope['user'].name}
					</c:when>
				</c:choose> <i class="glyphicon glyphicon-menu-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="user/profile"><i class="fa fa-user fa-fw"></i>
						User Profile</a></li>
				
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>

	<script>
	$(document).on('keydown', '#form', function(event) {
							if (event.keyCode == 13) {
								var name = document.getElementById('invoice').value;
								var attribute = document
										.getElementById('select').value;
								if (name == "") {
									var html = [
											'<li>',
											'<div class="alert alert-danger alertForm" id="danger-alert">Not empty</div>',
											'</li>', '' ].join('');
									document.getElementById("MyEdit").innerHTML = html;
									$("#danger-alert").show();
									setTimeout(function() {
										$("#danger-alert").hide();
									}, 3000);
								} else {
									if (attribute == "Time") {
										var check = isValidDate(name);
										if (check == true) {
											if (name.indexOf("/") >= 0) {
												name = name
														.replace(/[/]/g, '-');
											}
											window.location = "Invoice/search/"
													+ name + "/" + attribute;
										} else {
											var html = [
													'<li>',
													'<div class="alert alert-danger alertForm" id="danger-alert">day/moth/year or month/year</div>',
													'</li>', '' ].join('');
											document.getElementById("MyEdit").innerHTML = html;
											$("#danger-alert").show();
											setTimeout(function() {
												$("#danger-alert").hide();
											}, 5000);
										}
									}
									if (attribute == "Amount") {
										if (isNaN(name) == false)
											window.location = "Invoice/search/"
													+ name + "/" + attribute;
										else {
											var html = [
													'<li>',
													'<div class="alert alert-danger alertForm" id="danger-alert">Not a number</div>',
													'</li>', '' ].join('');
											document.getElementById("MyEdit").innerHTML = html;
											$("#danger-alert").show();
											setTimeout(function() {
												$("#danger-alert").hide();
											}, 5000);
										}
									}
									if (attribute == "Name"
											|| attribute == "Place") {
										if (name.indexOf("/") < 0
												&& name.indexOf("?") < 0
												&& name.indexOf("%") < 0) {
											window.location = "Invoice/search/"
													+ name + "/" + attribute;
										} else {
											var html = [
													'<li>',
													'<div class="alert alert-danger alertForm" id="danger-alert">Invalid input</div>',
													'</li>', '' ].join('');
											document.getElementById("MyEdit").innerHTML = html;
											$("#danger-alert").show();
											setTimeout(function() {
												$("#danger-alert").hide();
											}, 5000);
										}
									}
									if (attribute == "IsWarning") {
										if (name == 1 || name == 0) {
											window.location = "Invoice/search/"
													+ name + "/" + attribute;
										} else {
											var html = [
													'<li>',
													'<div class="alert alert-danger alertForm" id="danger-alert">1 or 0</div>',
													'</li>', '' ].join('');
											document.getElementById("MyEdit").innerHTML = html;
											$("#danger-alert").show();
											setTimeout(function() {
												$("#danger-alert").hide();
											}, 5000);
										}
									}
								}
							}

						});

		function isValidDate(str) {
			var checkDate;
			var parts = str.split('/');
			if (parts.length != 3 && parts.length != 2) {
				var parts = str.split('-');
				if (parts.length != 3 && parts.length != 2)
					checkDate = false;
				else
					checkDate = true;
			}

			if (checkDate == false)
				return false;
			else {
				if (parts.length == 3) {
					var day = parseInt(parts[0]);
					var month = parseInt(parts[1]);
					var year = parseInt(parts[2]);
					if (isNaN(day) || isNaN(month) || isNaN(year)) {
						return false;
					}
					if (day < 1 || year < 1)
						return false;
					if (month > 12 || month < 1)
						return false;
					if ((month == 1 || month == 3 || month == 5 || month == 7
							|| month == 8 || month == 10 || month == 12)
							&& day > 31)
						return false;
					if ((month == 4 || month == 6 || month == 9 || month == 11)
							&& day > 30)
						return false;
					if (month == 2) {
						if (((year % 4) == 0 && (year % 100) != 0)
								|| ((year % 400) == 0 && (year % 100) == 0)) {
							if (day > 29)
								return false;
						} else {
							if (day > 28)
								return false;
						}
					}
					return true;
				}

				if (parts.length == 2) {
					var month = parseInt(parts[0]);
					var year = parseInt(parts[1]);
					if (isNaN(month) || isNaN(year)) {
						return false;
					}
					if (year < 1)
						return false;
					if (month > 12 || month < 1)
						return false;
					if ((month == 1 || month == 3 || month == 5 || month == 7
							|| month == 8 || month == 10 || month == 12)
							&& day > 31)
						return false;
					if ((month == 4 || month == 6 || month == 9 || month == 11)
							&& day > 30)
						return false;
					return true;
				}
			}

		}
	</script>

	<!-- /.navbar-top-links -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">

				<li><a href="dashboard"><i
						class="glyphicon glyphicon-dashboard"></i> Dashboard</a></li>


				<li><a href="Invoice/"><i class="glyphicon glyphicon-tasks"></i>
						Invoices</a></li>
				<li><a href="Category/listCategories"><i
						class="glyphicon glyphicon-tags"></i> Categories</a></li>
				<li><a href="#"><i class="glyphicon glyphicon-stats"></i>
						Statistical Data<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="Report/by-CateMonths"> Type 1</a></li>
						<li><a href="Revenue/monthly-statistic">Type 2</a></li>
					</ul> <!-- nav-second-level --></li>
			</ul>
		
			<ul class="nav" id="side-menu">			
				<li><select id="select" style="color: black"
					class="selectpicker form-control">
						<option data-icon="glyphicon glyphicon-search">Name</option>
						<option data-icon="glyphicon glyphicon-search">Place</option>
						<option data-icon="glyphicon glyphicon-search">Amount</option>
						<option data-icon="glyphicon glyphicon-search">Time</option>
						<option data-icon="glyphicon glyphicon-search">Warning</option>
				</select></li>
				<li id="form"><input
					class="form-control ng-pristine ng-untouched ng-valid ng-empty"
					id="invoice" placeholder="Search Invoice(s) ..." /></li>
				<li id="MyEdit"></li>
			</ul>
		</div>
					
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
