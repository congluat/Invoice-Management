<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="col-md-6">
<form:form class="form-horizontal" modelAtribute="category"/>
  <fieldset>
    <legend>CATEGORY FORM</legend>
    <form:input type="hidden" path="id" id="id"/>
    <div class="form-group">
      <label for="name" class="col-md-2 control-label">Name</label>
      <div class="col-md-10">
        <form:input class="form-control" path="name" id="name" placeholder="name" type="text"/>
      </div>
    </div>

    <div class="form-group">
      <label for="inputFile" class="col-md-2 control-label">Logo</label>

      <div class="col-md-10">
        <input readonly="readonly" class="form-control" placeholder="Browse..." type="text">
        <input id="inputFile" multiple="" type="file">
      </div>
    </div>
    <div class="form-group">
      <label for="textArea" class="col-md-2 control-label">Comment</label>

      <div class="col-md-10">
        <form:textarea path="comment" class="form-control" rows="3" id="textArea"/>
        <span class="help-block">comment</span>
      </div>
    </div>
  
   
    <div class="form-group">
      <div class="col-md-10 col-md-offset-2">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form>
</div>