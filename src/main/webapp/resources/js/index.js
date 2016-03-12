$(document)
		.ready(
				function() {
					/*$(".rad-logo-container").addClass("rad-nav-min");
					$(".rad-sidebar").addClass("rad-nav-min");
					$(".rad-body-wrapper").addClass("rad-nav-min");*/

					$(".nav-pull-button").on("click", function(e) {
						e.preventDefault();

					});

					$(document).on("click", function(e) {
						// e.preventDefault();
						var $item = $(".rad-dropmenu-item");
						if ($item.hasClass("active")) {
							$item.removeClass("active");
						}
					});

					$('.rad-chat-body').slimScroll({
						height : '450px',
						color : "#c6c6c6"
					});

					$('.rad-timeline-body').slimScroll({
						height : '450px',
						color : '#c6c6c6'
					});

					$('.rad-activity-body').slimScroll({
						height : '250px',
						color : '#c6c6c6'
					});

					$(".rad-toggle-btn").on('click', function() {
						$(".rad-logo-container").toggleClass("rad-nav-min");
						$(".rad-sidebar").toggleClass("rad-nav-min");
						$(".rad-body-wrapper").toggleClass("rad-nav-min");

					});

					$("li.rad-dropdown > a.rad-menu-item").on(
							'click',
							function(e) {
								e.preventDefault();
								e.stopPropagation();
								$(".rad-dropmenu-item").removeClass("active");
								$(this).next(".rad-dropmenu-item").toggleClass(
										"active");
							});

					$(".fa-chevron-down").on(
							"click",
							function() {
								var $ele = $(this).parents('.panel-heading');
								$ele.siblings('.panel-footer').toggleClass(
										"rad-collapse");
								$ele.siblings('.panel-body').toggleClass(
										"rad-collapse", function() {
											setTimeout(function() {
												initializeCharts();
											}, 200);
										});
							});

					$(".fa-close").on("click", function() {
						var $ele = $(this).parents('.panel');
						$ele.addClass('panel-close');
						setTimeout(function() {
							$ele.parent().remove();
						}, 210);
					});

					$(".fa-rotate-right")
							.on(
									"click",
									function() {
										var $ele = $(this).parents(
												'.panel-heading').siblings(
												'.panel-body');
										$ele
												.append('<div class="overlay"><div class="overlay-content"><i class="fa fa-refresh fa-2x fa-spin"></i></div></div>');
										setTimeout(function() {
											$ele.find('.overlay').remove();
										}, 2000);
									});

					$('.rad-chk-pin input[type=checkbox]').change(function(e) {
						$('body').toggleClass("flat-theme");
						$("#rad-color-opts").toggleClass("hide");
					});

					$('.rad-color-swatch input[type=radio]')
							.change(
									function(e) {
										if ($(
												'.rad-chk-pin input[type=checkbox]')
												.is(":checked")) {
											$('body').removeClass().addClass(
													"flat-theme").addClass(
													this.value);
											$('.rad-color-swatch label')
													.removeClass(
															"rad-option-selected");
											$(this).parent().addClass(
													"rad-option-selected");
											$(window).scrollTop(0);
											world.remove();
											settings.regionStyle.initial.fill = colorMap[this.value];
											settings.series.regions[0].scale = [
													'#A8ECFF', '#FA71D4' ];
											world = new jvm.Map(settings);

										} else {
											return false;
										}
									});

					$(".rad-notification-item").on("click", function(e) {
						e.stopPropagation();
					});
					$("#add-button").mouseenter(function() {
						console.log("mouse hover");
						$(".addCate").show("slide", {
							direction : "down"
						}, 100);
						$(".addInvoice").show("slide", {
							direction : "right"
						}, 100);
					})

					$(".add-button-area").mouseleave(function() {
						$(".addCate").hide("slide", {
							direction : "down"
						}, 100);
						$(".addInvoice").hide("slide", {
							direction : "right"
						}, 100);
					});
					$('[data-toggle="tooltip"]').tooltip()
				});