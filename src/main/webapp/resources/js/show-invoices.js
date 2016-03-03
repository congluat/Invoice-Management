$(".timeline-panel").mouseenter(function() {
	$(this).find(".more-info").show("slide", {
		direction : "up"
	}, 200);
	$(this).find(".more-info").css({
		"z-index" : "50"
	});
}).mouseleave(function() {
	$(this).find(".more-info").hide("slide", {
		direction : "up"
	}, 200);
});
$('.timeline > li:even').addClass();
$('.timeline > li:odd').addClass('timeline-inverted');