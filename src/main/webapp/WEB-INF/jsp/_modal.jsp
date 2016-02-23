<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div ng-controller="UserController as userCtrl">

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">New User</h4>
				</div>
				<form method="post" name="userForm" class="form-horizontal"
					ng-controller="AddUserController as addUserCtrl"
					ng-submit="userForm.$valid && addUserCtrl.addUser()">
					<div class="modal-body">
						{{addUserCtrl.user.name}}
						<div class="form-group">
							<label for="inputName" class="col-sm-2 control-label">Name
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required="required" id="name"
									ng-model="addUserCtrl.user.name" />

							</div>
						</div>
						<div class="form-group">
							<label for="inputAge" class="col-sm-2 control-label">Age
							</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" required="required" id="age"
									ng-model="addUserCtrl.user.age" />

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Save"></input>
					</div>
				</form>

			</div>
		</div>
	</div>


</div>