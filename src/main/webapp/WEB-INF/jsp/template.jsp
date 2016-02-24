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

<!-- -------------Jquery------------- -->
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>

<!-- -----------------Bootstrap--------------------------  -->

<!-- Material Design fonts -->
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/icon?family=Material+Icons">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- Bootstrap Material Design -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/dist/css/bootstrap-material-design.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/dist/css/ripples.min.css'/>">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="<c:url value='/resources/dist/js/material.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/dist/js/ripples.min.js'/>"></script>

<script type="text/javascript">
	$.material.init()
</script>




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
<script type="text/javascript">
	$(document).ready(function() {

		$('.modal').modal({
			backdrop : 'static',
			keyboard : false
		})
	});
</script>


</head>

<body ng-app="app">

	<jsp:include page="_navbar.jsp"></jsp:include>

	<jsp:include page="_modalAddUser.jsp"></jsp:include>

	<div id="page-wrapper" style="padding-left : 0px;padding-right: 5px">

		<tiles:insertAttribute name="body">

		</tiles:insertAttribute>
		<button type="button"
			class="btn btn-primary btn-circle btn-xl add-button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
	</div>

</body>

</html>