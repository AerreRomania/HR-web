<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="chiusure" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://${initParam.dbURL}/${initParam.dbinitcat}" user="${initParam.dbuserid}" password="${initParam.dbuserpwd}" />
<sql:query dataSource="${chiusure}" var="ch">
SELECT * FROM month_number
</sql:query>

<div class="page {{pageClass}}" ui-view>
	<section class="detail" id="load-data">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<!--                 <h1> -->
					<%--                     <button type="button" class="btn btn-balance" onclick="changeYear(-1,${anno});"> --%>
					<!--                         <i class="fa fa-arrow-left"></i> -->
					<!--                     </button> -->
					<!--                 </h1> -->
				</div>
				<div class="col-md-8">
					<h1>Caricamento file</h1>
					<!--                 <a class="link" ui-sref="^" ui-sref-opts="{reload: true}"> -->
					<!--                     <i class="fa fa-chevron-left"></i> Indietro -->
					<!--                 </a> -->
				</div>
				<div class="col-md-2">
					<!--                 <h1> -->
					<%--                     <button type="button" class="btn btn-balance" onclick="changeYear(1,${anno});"> --%>
					<!--                         <i class="fa fa-arrow-right"></i> -->
					<!--                     </button> -->
					<!--                 </h1> -->
				</div>
				<div class="col-md-12 form-group">
					<div class="col-md-4 form-group">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>Numero Mesi</th>
										<th>Mese</th>
										<th>Anno</th>
										<th>Elimina</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${ch.rows}">
										<tr>
											<td>${result.number}</td>
											<td>${result.month}</td>
											<td>${result.year}</td>
											<td><a href="${pageContext.request.contextPath}/DeleteMonth?month=${result.month}&year=${result.year}">
													<i class="fa fa-trash-o" aria-hidden="true"></i>
												</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<c:if test="${errorMsg ne null }">
							<div class="col-md-12">
								<div class="alert alert-danger">
									<button class="close" data-close="alert"></button>
									${errorMsg}
								</div>
							</div>
						</c:if>
						<c:if test="${resultMsg ne null }">
							<div class="col-md-12 ">
								<div class="alert alert-success">
									<button class="close" data-close="alert"></button>
									${resultMsg}
								</div>
							</div>
						</c:if>
					</div>
					<div class="col-md-8">
						<div class="col-md-12 form-group">
							<form action="${pageContext.request.contextPath}/ChiusuraDataLoader" method="post" enctype="multipart/form-data" id="loadfiles">
								<div class="col-md-6 form-group">
									<p>
										File chiusure:
										<input type="text" name="description" />
										<input type="file" name="file" id="file" onchange="showButton('1');" />
									</p>
									<p>
										Mese di caricamento:
										<select name="month" id="month" style="max-width: 100px; display: inline-block; height: 34px;" class="form-control" onchange="showButton('1');">
											<option value="0">Mese</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
									</p>
									<p>
										Anno di caricamento:
										<select name="year" id="year" style="max-width: 100px; display: inline-block; height: 34px;" class="form-control" onchange="showButton('1');">
											<option value="0">Anno</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
										</select>
									</p>
								</div>
								<div class="col-md-3 form-group">
									<input type="submit" onclick="checkLoad();" class="btn btn-balance" id="chButton" disabled />
								</div>
								<div class="col-md-3 form-group">
									Righe caricate: ${param.rows} <br> Errori: ${param.error}
								</div>
							</form>
						</div>
						<div class="col-md-12 form-group">
							<!-- 					</div> -->
							<!-- 					<div class="clearfix"></div> -->
							<!-- 					<div class="col-md-12 form-group"> -->
							<form action="${pageContext.request.contextPath}/PartitaDataLoader" method="post" enctype="multipart/form-data">

								<div class="col-md-6 form-group">
									File Partite:
									<input type="text" name="description" />
									<input type="file" name="file" id="parFile" onchange="showButton(2);" />
								</div>
								<div class="col-md-6 form-group">
									<input type="submit" class="btn btn-balance" id="parButton" disabled />

								</div>
							</form>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%-- <a href="TesoreriaWeekDataLoader?start=${param.start-1}"><</a> --%>
<%-- <a href="TesoreriaWeekDataLoader?start=${param.start+1}">></a> --%>

