<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.contextPath}/">
<title>${title}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<c:url value='/resources/js/jquery-1.12.0.min.js'/>"></script>


<!-- ========================RADAR CSS================================= -->
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style2.css'/>">


<!-- ==================================BOOTSTRAP========================== -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>">
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

<!-- =========================JAVASCRIPT===================================== -->
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js'></script>

<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.3/jquery.slimscroll.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.8.0/lodash.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js'></script>




<!-- ====================NAVBAR SEARCH========================== -->
<script src="<c:url value='/resources/js/search_navbar.js'/>"></script>

<!-- ========================JQUERY UI============================ -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/>">
<script src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/index.js'/>"></script>

<!-- ============================BOOTSTRAP MATERIAL==================================== -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/dist/css/bootstrap-material-design.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/dist/js/material.min.js'/>"></script>

<!-- ======================TIMELINE======================= -->
<link href="<c:url value='/resources/css/timeline.css' />"
	rel="stylesheet"></link>

<!-- ==========================SB-ADMIN-2=========================== -->
<link href="<c:url value='/resources/css/sb-admin-2.css' />"
	rel="stylesheet"></link>
<!-- ===============================MY CSS=========================== -->
<link href="<c:url value='/resources/css/mycss2.css' />"
	rel="stylesheet"></link>



<!-- --------------------AngularJS-------------------- -->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-cookies.js"></script>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/angular_app.js' />"></script>

<script
	src="http://bouil.github.io/angular-google-chart/ng-google-chart.js"></script>

</head>

<body>
	<jsp:include page="_navtop2.jsp"></jsp:include>
	<jsp:include page="_navside2.jsp"></jsp:include>
	<jsp:include page="_main2.jsp"></jsp:include>
	<jsp:include page="_modalAddUser.jsp"></jsp:include>



	<div class="add-button-area">
		<a href="Invoice/save" id="add-button"
			class="btn btn-primary btn-circle btn-lg"> <i
			class="glyphicon glyphicon-plus"></i>
		</a> <a href="Category/save"
			class="btn btn-primary btn-circle btn-lg addCate"
			data-toggle="tooltip" data-placement="left" title="Add
				Category">
			<i class="glyphicon glyphicon-tasks"></i>
		</a> <a href="Invoice/save"
			class="btn btn-primary btn-circle btn-lg addInvoice"
			data-toggle="tooltip" data-placement="left" title="Add Invoice">
			<i class="glyphicon glyphicon-tags"></i>
		</a>
	</div>



</body>
</html>
