<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
.errorbox {
	margin-top: 25%;
	-moz-box-shadow: 10px 10px 5px #888;
	-webkit-box-shadow: 10px 10px 5px #888;
	box-shadow: 10px 10px 5px #888;
	-moz-box-shadow: 10px 10px 5px #888;
}

.panel-danger>.panel-heading {
	background-color: rgb(232, 23, 93);
	color: #FFF;
}
</style>
<div style="height: 100vh; background-color: #363636;">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-danger errorbox">
			<div class="panel-heading">
				<h2 class="panel-title">Server Error</h2>
			</div>
			<div class="panel-body">
				<c:if test="${not empty url}">
					<h4>URL: ${url}</h4>
				</c:if>
				<c:if test="${not empty exception}">
					<h4>ERROR: ${exception}</h4>
				</c:if>
			</div>
		</div>
	</div>
</div>