<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Losses -->
<section>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<button id="prior" type="button" class="filter active" onclick="priorView()">In primo piano</button>
			<button id="all" type="button" class="filter" onclick="allView()">Tutti</button>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-01.png');"></a>
				<h2><a href="#dashboard/detail">Costi Diretti/Indiretti per Reparto</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-02.png');"></a>
				<h2><a href="#dashboard/detail">Costo Orario per Reparto</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-03.png');"></a>
				<h2><a href="#dashboard/detail">Costi Consuntivi/Budget</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-04.png');"></a>
				<h2><a href="#dashboard/detail">Costi Progressivi</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-05.png');"></a>
				<h2><a href="#dashboard/detail">Costi Mensili per Reparto</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-06.png');"></a>
				<h2><a href="#dashboard/detail">Costo Energie</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-07.png');"></a>
				<h2><a href="#dashboard/detail">Costo Telefonia</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-3 cats">
			<article>
				<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-08.png');"></a>
				<h2><a href="#dashboard/detail">Investimenti</a></h2>
				<div class="detail">
					<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
					<span>Costi</span>
				</div>
			</article>
		</div>
	</div>
</div>
</section>
<a id="add-item" href="#dashboard/detail"><img src="${pageContext.request.contextPath}/dashboard/images/miscicon/add-item.svg" alt="icon"></a>