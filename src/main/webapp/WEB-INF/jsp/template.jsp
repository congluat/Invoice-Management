<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/">

<meta charset="UTF-8">
<title>${title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- -------------Jquery------------- -->
<script src="<c:url value='/resources/js/jquery-1.12.0.min.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/>">
<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/js/jquery.ui.datepicker.validation.js'/>"></script>


<!-- -----------------Bootstrap--------------------------  -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">

<!-- Latest compiled and minified JavaScript -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<!-- Material Design fonts -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/icon?family=Material+Icons">


<!-- Bootstrap -->

<!-- Bootstrap Material Design -->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/dist/css/ripples.min.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/dist/css/bootstrap-material-design.css'/>">

<script type="text/javascript"
	src="<c:url value='/resources/dist/js/material.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/dist/js/ripples.min.js'/>"></script>

<!--
<script type="text/javascript">
	$.material.init()
</script>
-->



<!---------------------------- MY JS--------------- -->


<script type="text/javascript"
	src="<c:url value='/resources/js/sb-admin-2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/metisMenu.js' />"></script>


<!-- ---------------------------My CSS----------- -->

<link href="<c:url value='/resources/css/sb-admin-2.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/resources/css/metisMenu.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/resources/css/timeline.css' />"
	rel="stylesheet"></link>
<link
	href="<c:url value='/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet'/>"
	type="text/css">
<link href="<c:url value='/resources/css/mycss.css' />" rel="stylesheet"></link>

<!-- --------------------AngularJS-------------------- -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/ngInfiniteScroll/1.2.2/ng-infinite-scroll.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-cookies.js"></script>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/angular_app.js' />"></script>

<script
	src="http://bouil.github.io/angular-google-chart/ng-google-chart.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		<!--$.material.init();
		-->
		/* 
		 $('.modal').modal({
		 backdrop : 'static',
		 keyboard : false
		 }) */
	});
</script>

<script type="text/javascript">
	$(function() {
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
	});
</script>
</head>

<body ng-app="app">

	<jsp:include page="_navbar.jsp"></jsp:include>

	<jsp:include page="_modalAddUser.jsp"></jsp:include>



	<div id="page-wrapper" style="padding-left: 0px; overflow-x: hidden;">

		<tiles:insertAttribute name="body">

		</tiles:insertAttribute>
		
		<script type="text/javascript">
			$(function() {
				$('[data-toggle="tooltip"]').tooltip()
			})
		</script>


		<div class="add-button-area">
			<a href="Invoice/save" id="add-button"
				class="btn btn-primary btn-circle btn-lg"> <i
				class="glyphicon glyphicon-plus"></i>
			</a> <a href="Category/save"
				class="btn btn-primary btn-circle btn-lg addCate"
				data-toggle="tooltip" data-placement="left"
				title="Add
				Category"> <i class="glyphicon glyphicon-tasks"></i>
			</a> <a href="Invoice/save"
				class="btn btn-primary btn-circle btn-lg addInvoice"
				data-toggle="tooltip" data-placement="left" title="Add Invoice">
				<i class="glyphicon glyphicon-tags"></i>
			</a>
		</div>


	</div>

</body>

</html>