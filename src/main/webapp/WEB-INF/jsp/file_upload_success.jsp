<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<ol>
		<c:forEach items="${files}" var="file">
			<li>${file}</li>
		</c:forEach>
	</ol>
