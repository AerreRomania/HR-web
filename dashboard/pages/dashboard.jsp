<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Dashboard -->
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
				<a ui-sref="treasury-plan({start: 1})" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/dashboard-cat-01.png');"></a>
				<h2><a ui-sref="treasury-plan({start: 1})" ui-sref-active="active">Piano di Tesoreria</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/dashboard.svg" alt="icon">
					<span>Dashboard</span>
					<img class="notification pull-right" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
				</div>
			</article>
		</div>
	</div>
</div>
</section>
</div>