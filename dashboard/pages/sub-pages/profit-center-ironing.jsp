<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Task detail -->
<div class="page {{pageClass}}" ui-view>
<section class="detail">
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<h1>Conto Economico Riclassificato per Centro di Profitto Mensile</h1>
			<a class="link pull-right" ui-sref="^" ui-sref-opts="{reload: true}"><i class="fa fa-chevron-left"></i> Indietro</a>
			<h2>Stiro</h2>
		</div>
		<div class="col-sm-12">
			<table id="balance" class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th><span class="sr-only">Seleziona</span></th>
						<th><span class="sr-only">Voce</span></th>
						<th>Gennaio</th>
						<th>Febbraio</th>
						<th>Marzo</th>
						<th>Aprile</th>
						<th>Maggio</th>
						<th>Giugno</th>
						<th>Luglio</th>
						<th>Agosto</th>
						<th>Settembre</th>
						<th>Novembre</th>
						<th>Ottobre</th>
						<th>Dicembre</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox"></td>
						<td>F.to <strong>Gruppo</strong> c/lavoro</td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
					</tr>
					<tr class="red">
						<td><input type="checkbox"></td>
						<td>F.to <strong>Gruppo</strong> c/lavoro</td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
					</tr>
					<tr class="orange">
						<td><input type="checkbox"></td>
						<td>F.to <strong>Gruppo</strong> c/lavoro</td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
					</tr>
					<tr class="green">
						<td><input type="checkbox"></td>
						<td>F.to <strong>Gruppo</strong> c/lavoro</td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
					</tr>
					<tr class="global-row">
						<td><input type="checkbox"></td>
						<td>Tot. fatturato</td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
						<td><span class="half">0%</span><span class="half">12%</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</section>
<div id="dockbar">
 	<div class="scroll-container">
		<button uib-tooltip="Modifica" type="button"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/edit.svg" alt="icon"></button>
		<button uib-tooltip="Marca come importante" type="button"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/flag.svg" alt="icon"></button>
		<button uib-tooltip="Condividi" type="button" ng-click="vm.openModalShare()"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/check.svg" alt="icon"></button>
		<button uib-tooltip="Segnala" type="button" ng-click="vm.openModalPriority()"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/remind.svg" alt="icon"></button>
		<button uib-tooltip="Zoom" type="button"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/zoom.svg" alt="icon"></button>
		<button uib-tooltip="Carica" type="button"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/upload.svg" alt="icon"></button>
		<button uib-tooltip="Stampa" type="button" ng-click="vm.print()"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/print.svg" alt="icon"></button>
		<button uib-tooltip="Scarica" type="button"><img src="${pageContext.request.contextPath}/dashboard/images/dockicon/download.svg" alt="icon"></button>
	</div>
</div>
</div>