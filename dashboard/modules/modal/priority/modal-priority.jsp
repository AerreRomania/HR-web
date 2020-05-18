<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal-header">
	<button type="button" class="close" aria-label="Close" ng-click="vm.closeModalPriority()">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<div class="modal-body">
	<p class="text-center">{{ vm.priorityMessage }}</p>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary small" ng-click="vm.closeModalPriority()">Chiudi</button>
</div>
