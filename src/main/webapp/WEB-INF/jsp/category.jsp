<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
</style>

<script type="text/javascript">
	$(function() {
		$(".category-panel").mouseenter(function() {
			$(this).find(".description").show("slide", {
				direction : "right"
			}, 100);

		}).mouseleave(function() {
			$(this).find(".description").hide("slide", {
				direction : "right"
			}, 100);
		});
	});

	$(window).resize(function() {
		var width = $(window).width();
		if (width <= 530) {
			$(".category-panel img").css({
				"height" : "40px",
				"width" : "40px",
			});
			$(".category-panel .content").css({
				"font-size" : "1em",
			});
		} else {
			$(".category-panel img").css({
				"height" : "80px",
				"width" : "80px",
			});
			$(".category-panel .content").css({
				"font-size" : "1.6em",
			});
		}
	});

	$(document).ready(function() {

		var cateIds = [];

		/* cateIds = $(".category-panel").map(function(index) {
			// this callback function will be called once for each matching element
			return this.id;
		}); */
		$(".panel-body").each(function(i, e) {
			/* you can use e.id instead of $(e).attr('id') */
			cateIds.push($(e).attr('id'));
		});

		console.log("length: " + cateIds.length);
		for (i = 0; i < cateIds.length; i++) {
			console.log("id: " + cateIds[i]);
			cateIds[i] = parseInt(cateIds[i]);
			/* cateIds[i] += 1; */
			id = cateIds[i];
			console.log(id);
			if ((id % 2) == 0) {
				$("#" + id).css({
					"background-color" : "#009688"
				});
			} else if ((id % 3) == 0) {
				$("#" + id).css({
					"background-color" : "#ff5722"
				});
			} else if (id % 5 == 0) {
				$("#" + id).css({
					"background-color" : "#03a9f4"
				});
			} else if (id % 7 == 0) {
				$("#" + id).css({
					"background-color" : "#3f51b5"
				});
			} else {
				$("#" + id).css({
					"background-color" : "#f0ad4e"
				});
			}
		}

	});
</script>

<div class="row"
	style="text-align: center; margin-top: 2em; margin-left: 10%"
	ng-controller="CategoryController as cateCtrl">

	<a href="Category/save">
		<div class="panel panel-default col-md-3 col-xs-10 category-panel"
			style="background: white;">
			<div class="panel-body row">
				<div class="col-md-12 col-xs-12 content">
					<span class="glyphicon glyphicon-plus"
						style="font-size: 3em; color: #009688" aria-hidden="true"></span>
				</div>

			</div>
		</div>
	</a>

	<c:forEach items="${categories}" var="category">

		<a href="Category/edit/${category.id}">
			<div class="panel panel-default col-md-3 col-xs-10 category-panel">
				<div id="${category.id}" class="panel-body row"; position:relative;">
					<div class="col-md-6 col-xs-6 image">
						<img height="80px" width="80px" alt="not found"
							src="<c:url value='/resources/logo/'/>${category.logo}"
							onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">
					</div>
					<div class="col-md-6 col-xs-6 content">${category.name}</div>
					<div class="description">${category.description}</div>
				</div>

			</div>
		</a>
	</c:forEach>
</div>


<%-- http://spring.io/blog/2010/01/25/ajax-simplifications-in-spring-3-0/--%>