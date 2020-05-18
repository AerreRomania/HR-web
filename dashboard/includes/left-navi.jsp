<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Left navigation -->
<nav class="main-nav">
	<ul>
		<li>
			<a ui-sref="all" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/all.svg" alt="icon">
				<span>Tutti</span>
				<span class="pull-right">3</span>
			</a>
		</li>
		<li>
			<a ui-sref="dashboard" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img class="notification" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/dashboard.svg" alt="icon">
				<span>Dashboard</span>
				<span class="pull-right">1</span>
			</a>
		</li>
		<li>
			<a ui-sref="sells" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img class="notification" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/sells.svg" alt="icon">
				<span>Vendite</span>
				<span class="pull-right">1</span>
			</a>
		</li>
		<li>
			<a ui-sref="market" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img class="notification" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon">
				<span>Dati economici</span>
				<span class="pull-right">2</span>
			</a>
		</li>
		<li>
			<a ui-sref="losses" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon">
				<span>Costi</span>
			</a>
		</li>
		<li>
			<a ui-sref="production" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/production.svg" alt="icon">
				<span>Produzione</span>
			</a>
		</li>
		<li>
			<a ui-sref="human-resources" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/human-res.svg" alt="icon">
				<span>Personale</span>
			</a>
		</li>
		<li>
			<a ui-sref="warehouse" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/warehouse.svg" alt="icon">
				<span>Magazzini</span>
			</a>
		</li>
		<li>
			<a ui-sref="investment" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/investment.svg" alt="icon">
				<span>Investimenti</span>
			</a>
		</li>
		<li>
			<a ui-sref="miscelanny" ui-sref-active="active" ui-sref-opts="{reload: true}">
				<img src="${pageContext.request.contextPath}/dashboard/images/navicon/misc.svg" alt="icon">
				<span>Varie</span>
			</a>
		</li>
	</ul>
</nav>
<div class="search">
	<form action="" role="form" method="GET">
		<div class="form-group">
			<input class="form-control" type="search" placeholder="Cerca">
			<button class="search-button" type="submit">
				<i class="fa fa-search" aria-hidden="true"></i>
			</button>
		</div>
	</form>
</div>


