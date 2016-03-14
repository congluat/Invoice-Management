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

<style type="text/css">
h1, h2, h3, h4 {
	margin: 0;
	margin-bottom: 10px;
	margin-top: 10px;
}

h1 {
	font-size: 3em;
}

.menu {
	-webkit-filter: url("#shadowed-goo");
	filter: url("#shadowed-goo");
}

.menu-item, .menu-open-button {
	background: #23AE89;
	border-radius: 100%;
	width: 60px;
	height: 60px;
	margin-left: 0px;
	position: absolute;
	top: 20px;
	color: white;
	text-align: center;
	line-height: 60px;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: -webkit-transform ease-out 200ms;
	transition: -webkit-transform ease-out 200ms;
	transition: transform ease-out 200ms;
	transition: transform ease-out 200ms, -webkit-transform ease-out 200ms;
	font-size: 20px;
}

.menu-open {
	display: none;
}

.hamburger {
	width: 25px;
	height: 3px;
	background: white;
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-left: -12.5px;
	margin-top: -1.5px;
	-webkit-transition: -webkit-transform 200ms;
	transition: -webkit-transform 200ms;
	transition: transform 200ms;
	transition: transform 200ms, -webkit-transform 200ms;
}

.hamburger-1 {
	-webkit-transform: translate3d(0, -8px, 0);
	transform: translate3d(0, -8px, 0);
}

.hamburger-2 {
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.hamburger-3 {
	-webkit-transform: translate3d(0, 8px, 0);
	transform: translate3d(0, 8px, 0);
}

.menu-open:checked+.menu-open-button .hamburger-1 {
	-webkit-transform: translate3d(0, 0, 0) rotate(45deg);
	transform: translate3d(0, 0, 0) rotate(45deg);
}

.menu-open:checked+.menu-open-button .hamburger-2 {
	-webkit-transform: translate3d(0, 0, 0) scale(0.1, 1);
	transform: translate3d(0, 0, 0) scale(0.1, 1);
}

.menu-open:checked+.menu-open-button .hamburger-3 {
	-webkit-transform: translate3d(0, 0, 0) rotate(-45deg);
	transform: translate3d(0, 0, 0) rotate(-45deg);
}

.menu {
	position: absolute;
	left: 50%;
	margin-left: -190px;
	padding-top: 20px;
	padding-left: 190px;
	width: 380px;
	height: 250px;
	box-sizing: border-box;
	font-size: 20px;
	text-align: left;
}

.menu-item:hover {
	color: #23AE89;
	background: white;
}

.menu-item i:hover {
	color: #23AE89;
	background: white;
}

.menu-item:nth-child(3) {
	-webkit-transition-duration: 70ms;
	transition-duration: 70ms;
}

.menu-item:nth-child(4) {
	-webkit-transition-duration: 130ms;
	transition-duration: 130ms;
}

.menu-item:nth-child(5) {
	-webkit-transition-duration: 190ms;
	transition-duration: 190ms;
}

.menu-item:nth-child(6) {
	-webkit-transition-duration: 250ms;
	transition-duration: 250ms;
}

.menu-item:nth-child(7) {
	-webkit-transition-duration: 310ms;
	transition-duration: 310ms;
}

.menu-open-button {
	z-index: 2;
	-webkit-transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
	transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
	-webkit-transition-duration: 400ms;
	transition-duration: 400ms;
	-webkit-transform: scale(1.1, 1.1) translate3d(0, 0, 0);
	transform: scale(1.1, 1.1) translate3d(0, 0, 0);
	cursor: pointer;
}

.menu-open-button:hover {
	-webkit-transform: scale(1.2, 1.2) translate3d(0, 0, 0);
	transform: scale(1.2, 1.2) translate3d(0, 0, 0);
}

.menu-open:checked+.menu-open-button {
	-webkit-transition-timing-function: linear;
	transition-timing-function: linear;
	-webkit-transition-duration: 200ms;
	transition-duration: 200ms;
	-webkit-transform: scale(0.8, 0.8) translate3d(0, 0, 0);
	transform: scale(0.8, 0.8) translate3d(0, 0, 0);
}

.menu-open:checked ~ .menu-item {
	-webkit-transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
	transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
}

.menu-open:checked ~ .menu-item:nth-child(3) {
	-webkit-transition-duration: 160ms;
	transition-duration: 160ms;
	-webkit-transform: translate3d(114.42548px, 11.48084px, 0);
	transform: translate3d(-80px, -20px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(4) {
	-webkit-transition-duration: 240ms;
	transition-duration: 240ms;
	-webkit-transform: translate3d(77.18543px, 85.2491px, 0);
	transform: translate3d(-20px, -80px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(5) {
	-webkit-transition-duration: 320ms;
	transition-duration: 320ms;
	-webkit-transform: translate3d(0.09158px, 114.99996px, 0);
	transform: translate3d(0.09158px, 114.99996px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(6) {
	-webkit-transition-duration: 400ms;
	transition-duration: 400ms;
	-webkit-transform: translate3d(-77.04956px, 85.37192px, 0);
	transform: translate3d(-77.04956px, 85.37192px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(7) {
	-webkit-transition-duration: 480ms;
	transition-duration: 480ms;
	-webkit-transform: translate3d(114.40705px, 11.66307px, 0);
	transform: translate3d(114.40705px, 11.66307px, 0);
}
</style>

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


	<!-- 
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
	</div> -->
	
	<div class="add-button-area">
		<input type="checkbox" href="#" class="menu-open" name="menu-open"
			id="menu-open" /> <label class="menu-open-button" for="menu-open">
			<span class="hamburger hamburger-1"></span> <span
			class="hamburger hamburger-2"></span> <span
			class="hamburger hamburger-3"></span>
		</label> 
		<a href="Category/save"
			class="menu-item"
			data-toggle="tooltip" data-placement="left" title="Add
				Category">
			<i class="glyphicon glyphicon-tasks"></i>
		</a>
		
		<a href="Invoice/save"
			class="menu-item"
			data-toggle="tooltip" data-placement="left" title="Add Invoice">
			<i class="glyphicon glyphicon-tags"></i></a>
			
			
	<!-- 	<a href="#" class="menu-item"> <i class="fa fa-bar-chart"></i></a> 
		<a href="#" class="menu-item"> <i class="fa fa-plus"></i></a> -->
		
		
	</div>

	<!-- filters -->
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
    <defs>
      <filter id="shadowed-goo">
          
          <feGaussianBlur in="SourceGraphic" result="blur"
			stdDeviation="10" />
          <feColorMatrix in="blur" mode="matrix"
			values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
          <feGaussianBlur in="goo" stdDeviation="3" result="shadow" />
          <feColorMatrix in="shadow" mode="matrix"
			values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2"
			result="shadow" />
          <feOffset in="shadow" dx="1" dy="1" result="shadow" />
          <feBlend in2="shadow" in="goo" result="goo" />
          <feBlend in2="goo" in="SourceGraphic" result="mix" />
      </filter>
      <filter id="goo">
          <feGaussianBlur in="SourceGraphic" result="blur"
			stdDeviation="10" />
          <feColorMatrix in="blur" mode="matrix"
			values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
          <feBlend in2="goo" in="SourceGraphic" result="mix" />
      </filter>
    </defs>
</svg>



</body>
</html>
