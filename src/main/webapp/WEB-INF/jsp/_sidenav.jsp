
<div id="wrapper">

	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#">Invoice Management</a></li>
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Shortcuts</a></li>
			<li><a href="#">Overview</a></li>
			<li><a href="#">Events</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->

	<!-- Page Content -->
	<div id="page-content-wrapper">
		<div class="container-fluid">

			<a href="#menu-toggle" class="btn btn-default" id="menu-toggle"
				style="margin: 0px 0px">Toggle Menu</a>
			<script type="text/javascript">
				$("#menu-toggle").click(function(e) {
					e.preventDefault();
					$("#wrapper").toggleClass("toggled");
				});
			</script>
			<div class="row">
				<div class="col-lg-12">
					<!-- BODYYYYYYYYYYYYYYYYYY -->

					<div class="container">
						<div ng-controller="CategoryController as cateC">
							<div ng-repeat="cate in categories">
								<p>{{cate.name}} - {{cate.description}} - {{}}</p>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->

</div>
l>
