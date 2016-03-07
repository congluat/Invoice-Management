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


<!-- -----------------Bootstrap--------------------------  -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- 

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
 -->
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
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


<!-- ---------------------------My CSS----------- -->

<%-- 
<link href="<c:url value='/resources/css/simple-sidebar.css' />"
	rel="stylesheet"></link>
	 --%>

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

<!---------------------------- MY JS--------------- -->


<script type="text/javascript"
	src="<c:url value='/resources/js/sb-admin-2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/metisMenu.js' />"></script>


<!-- --------------------AngularJS-------------------- -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-cookies.js"></script>
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
		$(".add-button-area").mouseenter(function() {
			console.log("mouse hover");
			$(this).find(".addCate").show("slide", {
				direction : "down"
			}, 100);
			$(this).find(".addInvoice").show("slide", {
				direction : "right"
			}, 100);
		}).mouseleave(function() {
			$(this).find(".addCate").hide("slide", {
				direction : "down"
			}, 100);
			$(this).find(".addInvoice").hide("slide", {
				direction : "right"
			}, 100);
		});
	});
</script>
</head>

<body ng-app="app">

	<jsp:include page="_navbar.jsp"></jsp:include>

	<jsp:include page="_modalAddUser.jsp"></jsp:include>

	<div id="page-wrapper" style="padding-left: 0px; padding-right: 5px">

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