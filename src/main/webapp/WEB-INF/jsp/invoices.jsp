<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.timeline>li>.timeline-panel {
	padding: 5px 5px;
}
</style>


<div class="row"
	style="margin-top: 10px; margin-left: 5px; margin-right: 5px">
	<div ng-controller="InvoiceController" ng-init="init()">
		<div class="col-md-6 col-md-offset-6">
			<div class="input-group input-group-lg">

				<span class="input-group-addon" id="sizing-addon1"><i
					class="glyphicon glyphicon-search"></i></span> <input id="search"
					type="text" class="form-control" name="searchFor"
					ng-model="searchString"
					placeholder="Search by Name, Place, Comment and Time(mm-dd-yyyy)..."
					ng-change="onSearchChange(searchString)"
					ng-model-options="{debounce: 500}">

			</div>
		</div>

		<div class="col-md-12">
			<div class="modal fade" id="confirm-delete" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="vertical-alignment-helper col-md-4">
					<div class="modal-dialog vertical-align-center">
						<div class="modal-content" style="border-radius: 10px;">
							<div class="modal-header">Confirm</div>
							<div class="modal-body">Do you want to delete</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<a class="btn btn-danger btn-ok" style="margin-top: 0px"
									href="Invoice/delete/{{deleteId}}">Delete</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<h1>{{month}}</h1>

			
				<ul class="timeline">
					<li ng-repeat="i in invoices | limitTo:totalDisplayed" ng-class-odd="'timeline-inverted'"><img
						class="timeline-badge" height="50px" width="50px" alt="not found"
						ng-src="<c:url value='/resources/logo/'/>{{i.category.logo}}"
						onError="this.onerror=null;this.src='<c:url value='/resources/logo/abc.png'/>';">

						<div class="timeline-panel" ng-mouseenter="hover(i)"
							ng-mouseleave="hover(i)">
							<div class="col-md-10 col-xs-12">
								<div class="timeline-heading">
									<h4 class="timeline-title"
										ng-class="{'isWarning': i.isWarning}">{{i.name}}</h4>
									<p>
										<small class="text-muted"><i class="fa fa-clock-o"></i>
											{{i.time | date:"dd/MM/yyyy 'at' h:mma"}} at {{i.place}}</small>
									</p>
								</div>

								<div class="timeline-body ">
									<p>{{i.amount|currency}}</p>
								</div>
							</div>
							<div class="col-md-2">
								<a href="Invoice/edit/{{i.id}}" class="btn btn-success btn-lg">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								</a> <a class="btn btn-danger deleteButton btn-lg"
									data-toggle="modal" data-target="#confirm-delete"
									ng-click="deleteFunc(i.id)"> <span
									class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
							</div>

							<div class="col-md-12 more-info" showonhoverparent>

								<p ng-bind-html="i.comment | unsafe"></p>
								<div ng-repeat="img in i.photos">
									<img class="col-md-4 col-xs-4" alt="not found"
										ng-src="<c:url value='/resources/images/'/>{{img.photo}}">
								</div>
							</div>
						</div></li>

				</ul>
			<div class="row">
				<div class="col-md-4"></div>
				<btn class="col-md-4 btn btn-primary" ng-click="loadMore()" ng-disabled="isDisabled" ng-model="isDisabled">
				<strong>{{MoreInvoices}}</strong></btn>
				<div class="col-md-1 text-primary">
					<strong>Per Load:</strong>
				</div>
				<label class="col-md-1"> <input type="number" name="input"
					ng-model="itemPerLoad" min="0" max="99" required>
				</label>
			</div>

		</div>
	</div>
</div>
