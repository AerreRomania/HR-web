<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Sub-category -->
<div class="page {{pageClass}}" ui-view>
<section>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<button id="prior" type="button" class="filter active" onclick="priorView()">In primo piano</button>
			<button id="all" type="button" class="filter" onclick="allView()">Tutti</button>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 prior">
			<article>
				<a ui-sref="monthly-balance" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-02.png');"></a>
				<h2><a ui-sref="monthly-balance" ui-sref-active="active">Mensile</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon">
					<span>Dati economici</span>
					<img class="notification pull-right" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
				</div>
			</article>
		</div>
<!-- 		<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
<!-- 			<article> -->
<%-- 				<a ui-sref="progressive-balance" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-01.png');"></a> --%>
<!-- 				<h2><a ui-sref="progressive-balance" ui-sref-active="active">Progressivo</a></h2> -->
<!-- 				<div class="detail"> -->
<%-- 					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> --%>
<!-- 					<span>Dati economici</span> -->
<%-- 					<img class="notification pull-right" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon"> --%>
<!-- 				</div> -->
<!-- 			</article> -->
<!-- 		</div> -->
	</div>
</div>
</section>
</div>