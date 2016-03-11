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
											}, 3000);
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
													success : function(data) {
														response($.map(data,
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
