<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="/dashboard/queries/ce_profit_mese_sql.jsp"%> --%>
<!-- Task detail -->

<div class="page {{pageClass}}" ui-view>
	<section class="detail">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1>Conto Economico Riclassificato per Mese - anno ${anno}</h1>
					<a class="link" ui-sref="^" ui-sref-opts="{reload: true}">
						<i class="fa fa-chevron-left"></i> Indietro
					</a>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						Tasso di cambio:
						<input type=text id="change" value="1.0">
						<button type=button class="btn btn-link" onclick="changeBalanceCurrency();">
							<i class="fa fa-money"></i> Cambia VALUTA
						</button>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="table-responsive">
						<table id="monthly-balance" class="table table-bordered table-hover table-condensed">
							<jsp:include page="/ajax-pages/montly-balance.jsp" />
						</table>
					</div>
				</div>

			</div>
		</div>
	</section>
	<div id="dockbar">
		<div class="scroll-container">
			<button uib-tooltip="Marca come importante" type="button" ng-click="vm.colorMarker()">
				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/edit.svg" alt="icon">
			</button>
			<!-- 			<button uib-tooltip="Marca come importante" type="button"> -->
			<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/flag.svg" alt="icon"> --%>
			<!-- 			</button> -->
			<button uib-tooltip="Condividi" type="button" ng-click="vm.openModalShare()">
				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/check.svg" alt="icon">
			</button>
			<button uib-tooltip="Segnala" type="button" ng-click="vm.openModalPriority()">
				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/remind.svg" alt="icon">
			</button>
			<!-- 			<button uib-tooltip="Zoom" type="button"> -->
			<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/zoom.svg" alt="icon"> --%>
			<!-- 			</button> -->
			<!-- 			<button uib-tooltip="Carica" type="button"> -->
			<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/upload.svg" alt="icon"> --%>
			<!-- 			</button> -->
			<button uib-tooltip="Stampa" type="button" ng-click="vm.print()">
				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/print.svg" alt="icon">
			</button>
			<!-- 			<button uib-tooltip="Scarica" type="button"> -->
			<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/download.svg" alt="icon"> --%>
			<!-- 			</button> -->
		</div>
	</div>
</div>
