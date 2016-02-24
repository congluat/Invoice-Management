<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script type="text/javascript">
	

	$(window).resize(function() {
		var width = $(window).width();
		if (width <= 530) {
			$(".category-panel img").css({
				"height" : "40px",
				"width" : "40px",
			});
			$(".category-panel .content").css({
				"font-size" : "1em",
			});
		} else {
			$(".category-panel img").css({
				"height" : "80px",
				"width" : "80px",
			});
			$(".category-panel .content").css({
				"font-size" : "1.6em",
			});
		}
	});

	$(document).ready(function() {

		var cateIds = [];

		/* cateIds = $(".category-panel").map(function(index) {
			// this callback function will be called once for each matching element
			return this.id;
		}); */
		$(".category-panel").each(function(i, e) {
			/* you can use e.id instead of $(e).attr('id') */
			cateIds.push($(e).attr('id'));
		});

		console.log("length: " + cateIds.length);
		for (i = 0; i < cateIds.length; i++) {
			console.log("id: " + cateIds[i]);
			cateIds[i] = parseInt(cateIds[i]);
			/* cateIds[i] += 1; */
			id = cateIds[i];
			console.log(id);
			if ((id % 2) == 0) {
				$("#" + id).css({
					"background-color" : "#009688"
				});
			} else if ((id % 3) == 0) {
				$("#" + id).css({
					"background-color" : "#ff5722"
				});
			} else if (id % 5 == 0) {
				$("#" + id).css({
					"background-color" : "#03a9f4"
				});
			} else if (id % 7 == 0) {
				$("#" + id).css({
					"background-color" : "#3f51b5"
				});
			} else {
				$("#" + id).css({
					"background-color" : "#f0ad4e"
				});
			}
		}

	});
</script>

<div class="col-md-12 col-xs-12" style="text-align: center;">

	<a href="Category/save">
		<div class="panel panel-default col-md-3 col-xs-4 category-panel"
			style="background: black; height: 94px; line-height: 90px">
			<div class="panel-body row">

				<div class="col-md-12 col-xs-12 content">
					Thêm mới<br>...
				</div>

			</div>
		</div>
	</a>

	<c:forEach items="${categories}" var="category">

		<a href="Category/edit/${category.id}">
			<div class="panel panel-default col-md-3 col-xs-4 category-panel"
				id="${category.id}">
				<div class="panel-body row">
					<div class="col-md-6 col-xs-6 image">
						<img height="80px" width="80px" alt="not found"
							src="<c:url value='/resources/logo/'/>${category.logo}"
							onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">
					</div>
					<div class="col-md-6 col-xs-6 content">${category.name}</div>

				</div>
			</div>
		</a>
	</c:forEach>
</div>
<%-- 
<div class="col-md-6">
<form:form class="form-horizontal" modelAttribute="category" method="POST"
					enctype="multipart/form-data">
  <fieldset>
    <legend>CATEGORY FORM</legend>
    ${message}
    <form:input type="hidden" path="id"/>
    <div class="form-group">
      <form:label path="name" class="col-md-2 control-label">Name</label>
      <div class="col-md-10">
        <form:input class="form-control" path="name"  placeholder="name" type="text"/>
      </div>
    </div>

    <div class="form-group">
      <label for="inputFile" class="col-md-2 control-label">Logo</form:label>

      <div class="col-md-10">
        <input readonly="readonly" class="form-control" placeholder="Browse..." type="text">
        <input id="inputFile" multiple="" name ="file" type="file">
        <form:hidden path="logo"/>
      </div>
    </div>
    <div class="form-group">
      <form:label path="description" class="col-md-2 control-label">Description</form:label>

      <div class="col-md-10">
        <form:textarea path="description" class="form-control" rows="3"/>
        <span class="help-block">description</span>
      </div>
    </div>
  
   
    <div class="form-group">
      <div class="col-md-10 col-md-offset-2">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form:form>
</div> --%>