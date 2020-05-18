<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Investment -->
<section>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<button id="prior" type="button" class="filter active" onclick="priorView()">In primo piano</button>
			<button id="all" type="button" class="filter" onclick="allView()">Tutti</button>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/investment-cat-01.png');"></a>
				<h2><a href="#dashboard/detail">Investimenti</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/investment.svg" alt="icon">
					<span>Investimenti</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/investment-cat-02.png');"></a>
				<h2><a href="#dashboard/detail">Manutenzioni Ordinarie</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/investment.svg" alt="icon">
					<span>Investimenti</span>
				</div>
			</article>
		</div>
	</div>
</div>
</section>
<a id="add-item" href="#dashboard/detail"><img src="${pageContext.request.contextPath}/dashboard/images/miscicon/add-item.svg" alt="icon"></a>