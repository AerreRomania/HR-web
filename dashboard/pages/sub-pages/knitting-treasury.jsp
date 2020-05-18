<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="plans" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://${initParam.dbURL}/${initParam.dbinitcat}" user="${initParam.dbuserid}" password="${initParam.dbuserpwd}" />
<sql:query dataSource="${plans}" var="treasury_plans">
SELECT * FROM plans
</sql:query>
<!-- Task detail -->
<div class="page {{pageClass}}" ui-view>
	<section class="detail">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1>Piano Tesoreria</h1>
					<a class="link" ui-sref="^" ui-sref-opts="{reload: true}">
						<i class="fa fa-chevron-left"></i> Indietro
					</a>
					<h2 class="knitting-title">Olimpias Knitting - anno 2017</h2>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						Tasso di cambio:
						<input type=text id="change" value="1.0">
						<button type="button" class="btn btn-link" onclick="changeValuta();">
							<i class="fa fa-money"></i> Cambia VALUTA
						</button>
						<span id=valutaEuroRsd>RSD</span> valori migliaia
					</div>
				</div>
				<div class="col-sm-12">
					<div class="col-sm-4 form-group">
						Seleziona piano:
						<select style="max-width: 200px; display: inline-block; height: 34px;" id="piano" class="form-control" onchange="nuovoPiano();">
							<option value="">Seleziona Piano...</option>
							<c:forEach var="result" items="${treasury_plans.rows}">
								<option value="${result.id_plan}">${result.plan_desc}</option>
							</c:forEach>
							<option value="0">Nuovo Piano</option>
						</select>
					</div>
					<div class="col-sm-4 form-group" style="background-color: #f4f4f4;" id="new_piano_name"></div>
					<div class="col-sm-4 form-group" style="background-color: #f4f4f4;" id="new_periodo"></div>
					<div class="col-sm-2 form-group" style="background-color: #f4f4f4;" id="save_button" hidden></div>
					<div class="col-sm-12" id="new_piano" hidden style="margin-top: 10px; margin-bottom: 10px; background-color: #f4f4f4;">
						<div style="background-color: #f4f4f4; margin-top: 10px; margin-bottom: 10px;" class="form-group col-sm-3">
							<input class="form-control" type="text" maxlength="50" name="plan_desc" id="plan_desc" style="display: inline-block; height: 34px;" placeholder="Nome Piano" value="">
						</div>

						<div class="col-sm-4" style="margin-top: 10px; margin-bottom: 10px; background-color: #f4f4f4;">
							Partenza:
							<select style="width: 80px; display: inline-block; height: 34px;" id="week_start" class="form-control">
								<c:forEach var="i" begin="1" end="54">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							Fine:
							<select style="width: 80px; display: inline-block; height: 34px;" id="week_end" class="form-control">
								<c:forEach var="i" begin="1" end="54">
									<option value="${i}" <c:if test="${i == 8}"> selected</c:if>>${i}</option>
								</c:forEach>
							</select>
						</div>
						<div style="background-color: #f4f4f4; margin-top: 10px; margin-bottom: 10px;" class="form-group col-sm-2">
							<input class="form-control" type="text" maxlength="50" name="saldo_banche" id="saldo_banche" style="display: inline-block; height: 34px;" placeholder="Saldo banche iniziale" value="">
						</div>
						<div class="col-sm-3" style="margin-top: 10px; margin-bottom: 10px; background-color: #f4f4f4;">
							<button class="btn btn-balance" type="button" onclick="update(1);">Cambia Settimane</button>
							<button class="btn btn-danger" type="button" onclick="salvaPlan();">Salva</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-12">
				<div id="treasury-plan-table">
				<table id="tp-table" class="compact">
					<jsp:include page="/ajax-pages/treasury.jsp" />
				</table>
				</div>
			</div>
		</div>
	</section>
</div>

<div id="dockbar">
	<div class="scroll-container">
		<!-- 			<button uib-tooltip="Marca come importante" type="button"> -->
		<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/edit.svg" alt="icon"> --%>
		<!-- 			</button> -->
		<!-- 			<button uib-tooltip="Marca come importante" type="button"> -->
		<%-- 				<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/flag.svg" alt="icon"> --%>
		<!-- 			</button> -->
		<button uib-tooltip="Condividi" type="button" ng-click="vm.openModalShare()">
			<img src="${pageContext.request.contextPath}/dashboard/images/dockicon/check.svg" alt="icon">
		</button>
		<button uib-tooltip="Imposta come prioritario" type="button" ng-click="vm.openModalPriority()">
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
<input type="hidden" value="${param.start}" id="param-start">