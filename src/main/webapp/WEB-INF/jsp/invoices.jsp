<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div>
	<ul>
		<c:forEach var="invoice" items="${invoices}">
			<li>${invoice.name}- ${invoice.amount} - ${invoice.time} -
				${invoice.place} - ${invoice.category.name}</li>
		</c:forEach>
	</ul>
</div>