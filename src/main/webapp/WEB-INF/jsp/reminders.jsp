<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<table>
	<tr>
		<th>Category</th>
		<th>Day</th>
		<th>Comment</th>

	</tr>
	
	<c:forEach items="reminders" var="reminder">
		<tr>
			<td>${reminder.category.name}</td>
			<td>${reminder.time}</td>
			<td>${reminder.comment}</td>
		</tr>
	</c:forEach>
	
</table>