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
<link href="<c:url value='/resources/css/mycss.css' />" rel="stylesheet"></link>

<!---------------------------- MY JS--------------- -->
<script type="text/javascript"
	src="<c:url value='/resources/js/myscript.js' />"></script>

<script type="text/javascript"
	src="<c:url value='/resources/js/sb-admin-2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/metisMenu.js' />"></script>

<%-- 
<tiles:insertAttribute name="head" ignore="true">
</tiles:insertAttribute> --%>

</head>

<body ng-app="category">

	<%-- 	<div class="row">
		<jsp:include page="nav.jsp"></jsp:include>
	</div>
	 --%>
	<%-- 
	
		<jsp:include page="sidenav.jsp"></jsp:include>
 --%>
	<jsp:include page="sidenav2.jsp"></jsp:include>
	<div id="page-wrapper">

		<div class="row">
			<h1>Dashboard</h1>
		</div>

		<div class="row">
		
			<div class="col-lg-3 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<span style="font-size: 70px"
									class="glyphicon glyphicon-list-alt"></span>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">26</div>
								<div>Invoices</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i
								class="glyphicon glyphicon-triangle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>

			<div class="col-lg-3 col-md-6">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<span style="font-size: 70px"
									class="glyphicon glyphicon-list-alt"></span>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">2</div>
								<div>Danger Invoices</div>
							</div>
						</div>
					</div>
					<a href="#">
						<div class="panel-footer">
							<span class="pull-left">View Details</span> <span
								class="pull-right"><i
								class="glyphicon glyphicon-triangle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>


</body>

</html>