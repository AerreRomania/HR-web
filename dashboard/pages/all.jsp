<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- All categories -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<button id="prior" type="button" class="filter active" onclick="priorView()">In primo piano</button>
				<button id="all" type="button" class="filter" onclick="allView()">Tutti</button>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a ui-sref="ricavi-conto-lavoro" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/dashboard-cat-01.png');"></a>
					<h2>
						<a ui-sref="ricavi-conto-lavoro" ui-sref-active="active">Ricavi Conto Lavoro</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/dashboard.svg" alt="icon"> <span>Dashboard</span> <img class="notification pull-right"
							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
					</div>
				</article>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a ui-sref="load-data" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/misc-cat-03.png');"></a>
					<h2>
						<a ui-sref="load-data" ui-sref-active="active">Caricamento Dati</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/misc.svg" alt="icon"> <span>Varie</span>
					</div>
				</article>
			</div>

			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a ui-sref="treasury-plan({start: 1})" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/dashboard-cat-01.png');"></a>
					<h2>
						<a ui-sref="treasury-plan({start: 1})" ui-sref-active="active">Piano di Tesoreria</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/dashboard.svg" alt="icon"> <span>Dashboard</span> <img class="notification pull-right"
							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a ui-sref="reclass-balance" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-02.png');"></a>
					<h2>
						<a ui-sref="reclass-balance" ui-sref-active="active">Conto Economico Riclassificato</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span> <img class="notification pull-right"
							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a ui-sref="profit-center" ui-sref-active="active" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-03.png');"></a>
					<h2>
						<a ui-sref="profit-center" ui-sref-active="active">Conto Economico per Centro di Profitto</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span> <img class="notification pull-right"
							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 prior">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/dashboard-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Grafici dei Report Mensili</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/dashboard.svg" alt="icon"> <span>Dashboard</span> <img class="notification pull-right"
							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon">
					</div>
				</article>
			</div>
<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
<!-- 				<article> -->
<%-- 					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/sells-cat-01.png');"></a> --%>
<!-- 					<h2> -->
<!-- 						<a href="#dashboard/detail">Ricavi Conto Lavoro</a> -->
<!-- 					</h2> -->
<!-- 					<div class="detail"> -->
<%-- 						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/sells.svg" alt="icon"> <span>Vendite</span> <img class="notification pull-right" src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" --%>
<!-- 							alt="icon"> -->
<!-- 					</div> -->
<!-- 				</article>  -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
<!-- 				<article> -->
<%-- 					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-03.png');"></a> --%>
<!-- 					<h2> -->
<!-- 						<a href="#dashboard/detail">Conto Economico per Centro di Profitto</a> -->
<!-- 					</h2> -->
<!-- 					<div class="detail"> -->
<%-- 						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span> <img class="notification pull-right" --%>
<%-- 							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon"> --%>
<!-- 					</div> -->
<!-- 				</article> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
<!-- 				<article> -->
<%-- 					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-04.png');"></a> --%>
<!-- 					<h2> -->
<!-- 						<a href="#dashboard/detail">Conto Economico Mensilizzato</a> -->
<!-- 					</h2> -->
<!-- 					<div class="detail"> -->
<%-- 						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span> <img class="notification pull-right" --%>
<%-- 							src="${pageContext.request.contextPath}/dashboard/images/miscicon/notify.svg" alt="icon"> --%>
<!-- 					</div> -->
<!-- 				</article> -->
<!-- 			</div> -->
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Conto Economico Mensilizzato</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/market-cat-03.png');"></a>
					<h2>
						<a href="#dashboard/detail">Conto Economico per uso Interno</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/market.svg" alt="icon"> <span>Dati economici</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costi Diretti/Indiretti per Reparto</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costo Orario per Reparto</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-03.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costi Consuntivi/Budget</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-04.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costi Progressivi</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-05.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costi Mensili per Reparto</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-06.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costo Energie</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-07.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costo Telefonia</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/losses-cat-08.png');"></a>
					<h2>
						<a href="#dashboard/detail">Investimenti</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/losses.svg" alt="icon"> <span>Costi</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/production-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Produzione Mensile</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/production.svg" alt="icon"> <span>Produzione</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/production-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Efficienze per Linea di Confezione</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/production.svg" alt="icon"> <span>Produzione</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/human-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Organico per Reparto/Mansione</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/human-res.svg" alt="icon"> <span>Personale</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/human-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Assenteismo</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/human-res.svg" alt="icon"> <span>Personale</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/human-cat-03.png');"></a>
					<h2>
						<a href="#dashboard/detail">Costo del Lavoro</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/human-res.svg" alt="icon"> <span>Personale</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/warehouse-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Situazione Magazzini</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/warehouse.svg" alt="icon"> <span>Magazzini</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/warehouse-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Rammendo</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/warehouse.svg" alt="icon"> <span>Magazzini</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/investment-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Investimenti</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/investment.svg" alt="icon"> <span>Investimenti</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/investment-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Manutenzioni Ordinarie</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/investment.svg" alt="icon"> <span>Investimenti</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/misc-cat-01.png');"></a>
					<h2>
						<a href="#dashboard/detail">Tabella Addebiti</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/misc.svg" alt="icon"> <span>Varie</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/misc-cat-02.png');"></a>
					<h2>
						<a href="#dashboard/detail">Situazione Finanziaria</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/misc.svg" alt="icon"> <span>Varie</span>
					</div>
				</article>
			</div>
			<div class="col-sm-6 col-md-4 col-lg-3 cats">
				<article>
					<a href="#dashboard/detail" class="img-container" style="background-image: url('${pageContext.request.contextPath}/dashboard/images/misc-cat-03.png');"></a>
					<h2>
						<a href="#dashboard/detail">Tempi Tessitura Fuori Standard</a>
					</h2>
					<div class="detail">
						<img src="${pageContext.request.contextPath}/dashboard/images/navicon/misc.svg" alt="icon"> <span>Varie</span>
					</div>
				</article>
			</div>
		</div>
	</div>
</section>
<%-- <a id="add-item" href="#dashboard/detail"><img src="${pageContext.request.contextPath}/dashboard/images/miscicon/add-item.svg" alt="icon"></a> --%>