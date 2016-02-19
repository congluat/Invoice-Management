<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>{title}</title>

<!-- -------------Jquery------------- -->
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>

<!-- -----------------Bootstrap--------------------------  -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<!-- AngularJS -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>

<!-- ---------------------------My CSS----------- -->

<link href="<c:url value='/resources/css/mycss.css' />" rel="stylesheet"></link>

<script type="text/javascript"
	src="<c:url value='/resources/js/category.js' />"></script>
<!--  
<link href="<c:url value='/resources/css/custom.css' />" rel="stylesheet"></link>
-->

<%-- 
<tiles:insertAttribute name="head" ignore="true">
</tiles:insertAttribute> --%>

</head>

<body>
	<jsp:include page="nav.jsp"></jsp:include>


</body>

</html>