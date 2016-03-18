<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<main>
<section>
	<div class="rad-body-wrapper rad-nav-min" style="over-flow-y:auto">
		<div class="container-fluid">
			
			<tiles:insertAttribute name="body"></tiles:insertAttribute>
		</div>
	</div>
</section>
</main>