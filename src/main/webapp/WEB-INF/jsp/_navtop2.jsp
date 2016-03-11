<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- =================SELECT PICKER===================== -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script>
	$(document).ready(function() {
		$('.selectpicker').selectpicker({
			size : false,
			mobile : true,
			style:""
		});
	});
</script>

<style>
.btn {
	margin-top: 0px
}

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

<section>
	<header>
		<nav class="rad-navigation">
			<div class="rad-logo-container">
				<a href="dashboard" class="rad-logo"><i class=" fa fa-recycle"></i>
					Invoice</a> <a href="#" class="rad-toggle-btn pull-right nav-pull-button"><i
					class="fa fa-bars"></i></a>
			</div>
			<a href="dashboard" class="rad-logo-hidden">Invoice Management</a>
			<div class="rad-top-nav-container">
				<a href="" class="brand-icon"><i class="fa fa-recycle"></i></a>
				<ul class="pull-right links">
					<li class="rad-dropdown"><a class="rad-menu-item" href="#">
							<img class="rad-list-img sm-img"
							src="<c:url value='/resources/logo/man.png'/>" alt="me" />
							<h4 style="color: #000">
								<c:choose>
									<c:when test="${empty sessionScope['user']}">
						${sessionScope['user'].name}
					</c:when>
								</c:choose>
							</h4>
					</a>
						<ul class="rad-dropmenu-item sm-menu">
							<li class="rad-notification-item"><a
								class="rad-notification-content lg-text" href="user/profile"><i
									class="fa fa-edit"></i> My Profile</a></li>
							<!-- <li class="rad-notification-item"><a
								class="rad-notification-content lg-text" href="#"><i
									class="fa fa-power-off"></i> Sign out</a></li> -->
						</ul></li>
					<li class="rad-dropdown"><a class="rad-menu-item" href="#"><i
							class="fa fa-cog"></i></a>
						<ul class="rad-dropmenu-item rad-settings">
							<li class="rad-dropmenu-header"><a href="#">Settings</a></li>
							<li class="rad-notification-item text-left">
								<div class="pull-left">
									<i class="fa fa-link"></i>
								</div>
								<div class="pull-right">
									<label class="rad-chk-pin pull-right"> <input
										type="checkbox" /><span></span></label>
								</div>
								<div class="rad-notification-body">
									<div class="lg-text">Change to Flat Theme</div>
									<div class="sm-text">Flattify it</div>
								</div>
							</li>
							<li id="rad-color-opts"
								class="rad-notification-item text-left hide">
								<div class="pull-left">
									<i class="fa fa-puzzle-piece"></i>
								</div>
								<div class="pull-right">
									<div class="rad-color-swatch">
										<label class="colors rad-bg-crimson rad-option-selected">
											<input type="radio" checked name="color" value="crimson" />
										</label> <label class="colors rad-bg-teal"> <input
											type="radio" name="color" value="teal" />
										</label> <label class="colors rad-bg-purple"> <input
											type="radio" name="color" value="purple">
										</label> <label class="colors rad-bg-orange"> <input
											type="radio" name="color" value="orange" />
										</label> <label class="colors rad-bg-twitter"> <input
											type="radio" name="color" value="twitter" />
										</label>
									</div>
								</div>
								<div class="rad-notification-body">
									<div class="lg-text">Choose a color</div>
									<div class="sm-text">Make it colorful</div>
								</div>
							</li>
						</ul></li>
				</ul>


				<ul class="pull-right links">
					<li class="rad-dropdown"><a class="rad-menu-item" href="#"><i
							class="fa fa-search "></i></a>
						<ul class="rad-dropmenu-item" style="float: left; ">
							<li class="rad-notification-item text-left"><select
								id="select" style="color: black"
								class="selectpicker form-control" data-style="btn-primary">
									<option data-icon="glyphicon glyphicon-search">Name</option>
									<option data-icon="glyphicon glyphicon-search">Place</option>
									<option data-icon="glyphicon glyphicon-search">Amount</option>
									<option data-icon="glyphicon glyphicon-search">Time</option>
							</select></li>

							<li class="rad-notification-item text-left"><input
								class="form-control ng-pristine ng-untouched ng-valid ng-empty"
								id="invoice" placeholder="Search Invoice(s) ..." /></li>

						</ul></li>
				</ul>

			</div>
		</nav>
	</header>
</section>