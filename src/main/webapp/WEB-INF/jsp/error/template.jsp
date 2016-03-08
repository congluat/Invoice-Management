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


<!--
<script type="text/javascript">
	$.material.init()
</script>
-->


<!-- ---------------------------My CSS----------- -->
<link
	href="<c:url value='/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet'/>"
	type="text/css">



<!-- --------------------AngularJS-------------------- -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-cookies.js"></script>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/angular_app.js' />"></script>

</head>

<body ng-app="app">

	<div id="page-wrapper" style="padding-left: 0px; padding-right: 5px">

		<tiles:insertAttribute name="body">

		</tiles:insertAttribute>

	</div>

</body>

</html>