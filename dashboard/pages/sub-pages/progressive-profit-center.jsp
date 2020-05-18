<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="/dashboard/queries/progressive_profit_center_sql.jsp"%> --%>
<fmt:setLocale value="it_IT" />
<!-- Task detail -->
<section class="detail" id="profit-center">
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<h1>
					<button type="button" class="btn btn-balance" onclick="changeYear(-1,${anno});">
						<i class="fa fa-arrow-left"></i>
					</button>
				</h1>
			</div>
			<div class="col-sm-8">
				<h1>Conto Economico per Centro Profitto - anno ${anno}</h1>
				<a class="link" ui-sref="^" ui-sref-opts="{reload: true}">
					<i class="fa fa-chevron-left"></i> Indietro
				</a>
			</div>
			<div class="col-sm-2">
				<h1>
					<button type="button" class="btn btn-balance" onclick="changeYear(1,${anno});">
						<i class="fa fa-arrow-right"></i>
					</button>
				</h1>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					Tasso di cambio:
					<input type=text id="change" value="1.0">
					<c:if test="${empty month}">
						<c:set var="month" value="1"></c:set>
					</c:if>
					<input type=hidden id="month-id" value="${month}">
					<button type="button" class="btn btn-link" onclick="changeProgressiveBalanceCurrency(${anno});">
						<i class="fa fa-money"></i> Cambia VALUTA
					</button>
					<div class="pull-right">
						<c:if test="${maxMonth > 0}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('1',${anno});">Gennaio</button>
						</c:if>
						<c:if test="${maxMonth > 1}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('2',${anno});">Febbraio</button>
						</c:if>
						<c:if test="${maxMonth > 2}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('3',${anno});">Marzo</button>
						</c:if>
						<c:if test="${maxMonth > 3}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('4',${anno});">Aprile</button>
						</c:if>
						<c:if test="${maxMonth > 4}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('5',${anno});">Maggio</button>
						</c:if>
						<c:if test="${maxMonth > 5}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('6',${anno});">Giugno</button>
						</c:if>
						<c:if test="${maxMonth > 6}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('7',${anno});">Luglio</button>
						</c:if>
						<c:if test="${maxMonth > 7}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('8',${anno});">Agosto</button>
						</c:if>
						<c:if test="${maxMonth > 8}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('9',${anno});">Settembre</button>
						</c:if>
						<c:if test="${maxMonth > 9}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('10',${anno});">Ottobre</button>
						</c:if>
						<c:if test="${maxMonth > 10}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('11',${anno});">Novembre</button>
						</c:if>
						<c:if test="${maxMonth > 11}">
							<button type="button" class="btn btn-balance" onclick="changeProgressiveMonth('12',${anno});">Dicembre</button>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="table-responsive">
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th><span class="sr-only">Seleziona</span></th>
								<th rowspan="2">${chiusura}<br> C.E. per linea<br>${valuta} valori migliaia
								</th>
								<th colspan="2">Tessitura</th>
								<th colspan="2">Confezione</th>
								<th colspan="2">Stiro</th>
								<th colspan="2">Residuo</th>
								<th colspan="2">Totale</th>
							</tr>
							<tr>
								<th></th>
								<th>VAL</th>
								<th>%</th>
								<th>VAL</th>
								<th>%</th>
								<th>VAL</th>
								<th>%</th>
								<th>VAL</th>
								<th>%</th>
								<th>VAL</th>
								<th>%</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${progressiveList}">
								<tr <c:if test="${result.strong eq 1}">class="global-row"</c:if>>
									<td><input type="checkbox"></td>
									<td>${result.codice}-${result.descrizione}</td>
									<td><fmt:formatNumber value="${result.tessitura/1000}" type="currency" maxFractionDigits="1" currencySymbol="" /></td>
									<td><fmt:formatNumber value="${(result.tessitura)/tessitura_perc}" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									<%-- 									<td>${result.perc_tessitura}%</td> --%>
									<td><fmt:formatNumber value="${result.confezione/1000}" type="currency" maxFractionDigits="1" currencySymbol="" /></td>
									<td><fmt:formatNumber value="${(result.confezione)/confezione_perc}" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									<%-- 									<td>${result.perc_confezione}%</td> --%>
									<td><fmt:formatNumber value="${result.stiro/1000}" type="currency" maxFractionDigits="1" currencySymbol="" /></td>
									<td><fmt:formatNumber value="${(result.stiro)/stiro_perc}" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									<%-- 									<td>${result.perc_stiro}%</td> --%>
									<td><fmt:formatNumber value="${result.residuo/1000}" type="currency" maxFractionDigits="1" currencySymbol="" /></td>
									<c:if test="${residuo_perc ne 0.0}">
										<td><fmt:formatNumber value="${(result.residuo)/residuo_perc}" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									</c:if>
									<c:if test="${residuo_perc eq 0.0}">
										<td><fmt:formatNumber value="0" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									</c:if>
									<%-- 									<td>${result.perc_residuo}%</td> --%>
									<td><fmt:formatNumber value="${result.totale/1000}" type="currency" maxFractionDigits="1" currencySymbol="" /></td>
									<td><fmt:formatNumber value="${(result.totale)/totale_perc}" type="percent" maxFractionDigits="1" currencySymbol="" /></td>
									<%-- 									<td>${result.perc_totale}%</td> --%>
								</tr>
							</c:forEach>
						</tbody>
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