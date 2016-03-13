
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>


<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0; z-index: 100">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard"><i
			class="glyphicon glyphicon-home"></i> Invoice Management</a>
	</div>
<script>
  $(document).ready(function () {
    $('.selectpicker').selectpicker({   	
        size : false,
        mobile : true,
    });
  });
</script>


.alertForm {
	background: inherit;
	font-size: 15px;
	height: 20px;
	background-size: 0 2px, 100% 1px;
	margin-bottom: 0px;
	margin-right: 0px;
	margin-top: -10;
	border-top-width: 10;
	padding-top: 14px;
	padding-bottom: 36px;
}
</style>

	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right notibar row">
		
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-user"></i> <c:choose>
					<c:when test="${empty sessionScope['user']}">
						${sessionScope['user'].name}
					</c:when>
				</c:choose> <i class="glyphicon glyphicon-menu-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="user/profile"><i class="fa fa-user fa-fw"></i>
						User Profile</a></li>
				
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>



	<!-- /.navbar-top-links -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse" style="overflow-x:hidden;">
			<ul class="nav" id="side-menu">			
				<li><select id="select" style="color: black"
					class="selectpicker form-control">
						<option data-icon="glyphicon glyphicon-search">Name</option>
						<option data-icon="glyphicon glyphicon-search">Place</option>
						<option data-icon="glyphicon glyphicon-search">Amount</option>
						<option data-icon="glyphicon glyphicon-search">Time</option>
				</select></li>
				<li id="aaa"><input
					class="form-control"
					id="invoice" placeholder="Search Invoice(s) ..." /></li>
				<li id="MyEdit"></li>
			
				<li><a href="dashboard"><i
						class="glyphicon glyphicon-dashboard"></i>Dashboard</a></li>


				<li><a href="Invoice/"><i class="glyphicon glyphicon-tasks"></i>
						Invoices</a></li>
				<li><a href="Category/listCategories"><i
						class="glyphicon glyphicon-tags"></i> Categories</a></li>
				<li><a href="#"><i class="glyphicon glyphicon-stats"></i>
						Statistical Data<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="Report/"> Report</a></li>
						<li><a href="Revenue/monthly-statistic">Chart</a></li>
					</ul> <!-- nav-second-level --></li>
			</ul>
		
			
		</div>
					
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
