<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form role="form" action="${pageContext.request.contextPath}/" method="POST">
	<div class="modal-header">
		<button type="button" class="close" aria-label="Close" ng-click="vm.closeModalShare()">
			<span aria-hidden="true">&times;</span>
		</button>
		<p class="modal-tab">Condividi con</p>
	</div>
	<div id="share">
		<div class="modal-body">
			<div class="clearfix">
				<!-- Add users -->
				<div id="added">
					<div class="share-container">
						<img class="img-circle" src="${pageContext.request.contextPath}/dashboard/images/user-demo.png">
						<button type="button" class="removal" ng-click="vm.deleteUser(this)">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<button type="button" id="adder" ng-click="showDetails = true">
					<i class="fa fa-plus"></i>
				</button>
			</div>
			<div class="form-group select custom animate-show-hide " ng-show="showDetails">
				<select class="form-control">
					<option value="">Seleziona utente</option>
					<option value="1" ng-selected="vm.selectUser(this)">Giorgio Pancrazio</option>
					<option value="2" ng-selected="vm.selectUser(this)">Clarabella Visconti</option>
				</select>
			</div>
			<div class="form-group">
				<label>Scrivi un messaggio</label>
				<textarea class="form-control" rows="3"></textarea>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary small">Condividi</button>
		</div>
	</div>
</form>
