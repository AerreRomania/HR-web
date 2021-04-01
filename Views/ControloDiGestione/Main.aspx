<!DOCTYPE html>





<html lang="it">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<link rel="shortcut icon" type="image/png" href="/Onlyou/favicon.png" />
<link rel="apple-touch-icon" href="/Onlyou/onlyou-60.png">
<link rel="apple-touch-icon" sizes="76x76" href="/Onlyou/onlyou-76.png">
<link rel="apple-touch-icon" sizes="120x120" href="/Onlyou/onlyou-120.png">
<link rel="apple-touch-icon" sizes="152x152" href="/Onlyou/onlyou-152.png">
<title>Onlyou</title>
<!-- CSS  -->
<link rel="stylesheet" href="../../css/font-awesome.min.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/animate.min.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="../../css/datatable/datatables.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> -->
<link rel="stylesheet" type="text/css" href="../../css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="../../css/dataTables.bootstrap.min.css"/>
<script src="./js/jquery-2.1.0.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script> -->
<script src="./new/js/jquery.dataTables.min.js"></script>
<!-- CHART JS -->

<script src="./js/chart.bundle.min.js"></script>
	<!-- CHART JS END -->
<!-- CORE -->
<script src="./js/angular.min.js"></script>
<!-- CORE END -->
<!-- THIRD PARTY MODULES -->
<script src="./js/angular-ui-router.min.js"></script>
<script src="./js/angular-animate.min.js"></script>
<script src="./js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script> -->
<!-- THIRD PARTY MODULES END -->
<!-- MAIN APP -->
<script src="./dashboard/js/app.js"></script>
<!-- MAIN APP END -->
<!-- MODULES -->

<script src="./dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="./dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="./dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body>
	<!-- LEFT NAVIGATION -->


	<div class="container">

		<div class="">
			

<!-- Left navigation -->

<script>

    function openClose() {

        var e = document.getElementById('left-navi');
        if (e.className == 'ng-scope hover') {
            e.className = 'ng-scope';
        } else {
            e.className = 'ng-scope hover';
        }
    }

    var $li = $('#menu li a').click(function () {
        $li.removeClass('active');
        $(this).addClass('active');
    });

</script>


<div id = "left-navi" onmouseover = "openClose()" onmouseout = "openClose()">
<nav class="main-nav">

<div id = "menu">
	<ul>
		<li>
			<a href="./new/index.jsp?m=main">
				<img src="/Images/C.Gestione/navicon/all.svg" alt="icon">
				<span>Tutti</span>
				<span class="pull-right">7</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=vendite_cat">
				<img class="notification" src="/Images/miscicon/notify.svg" alt="icon">
				<img src="/Images/C.Gestione/navicon/sells.svg" alt="icon">
				<span>Vendite</span>
				<span class="pull-right">2</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=situazioni_economiche_cat">
				<img class="notification" src="/Images/miscicon/notify.svg" alt="icon">
				<img src="/Images/C.Gestione/navicon/market.svg" alt="icon">
				<span>Situazioni Economiche</span>
				<span class="pull-right">6</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=costi_cat">
				<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon">
				<span>Costi</span>
				<span class="pull-right">8</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=produzione_cat">
				<img src="/Images/C.Gestione/navicon/production.svg" alt="icon">
				<span>Produzione</span>
				<span class="pull-right">2</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=personale_cat">
				<img src="/Images/C.Gestione/navicon/human-res.svg" alt="icon">
				<span>Personale</span>
				<span class="pull-right">3</span>
			</a>
		</li>
		<li>
			<a href="./new/index.jsp?m=finanza_cat">
				<img src="/Images/C.Gestione/navicon/warehouse.svg" alt="icon">
				<span>Finanza</span>
				<span class="pull-right">2</span>
			</a>
		</li>
				<li>
			<a href="./index.jsp?m=varie_cat">
				<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon">
				<span>Varie</span>
				<span class="pull-right">6</span>
			</a>
		</li>
	</ul>
	</div>
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
</div>



		</div>
		<div class="">
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<button id="prior" type="button" class="filter active" onclick="priorView()">In primo piano</button>
				<button id="all" type="button" class="filter" onclick="allView()">Tutti</button>
			</div>
		</div>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <button  onclick="venditeView()" runat="server"  class="img-container" style="background-image: url('/Images/C.Gestione/navicon/sells-article.png');"></button>
		<h2>
			<a onclick="venditeView()">Vendite</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/sells.svg" alt="icon"> <span>Vendite</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=situazioni_economiche_cat" class="img-container"
			style="background-image: url('/Images/C.Gestione/navicon/market-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=situazioni_economiche_cat">Situazioni Economiche</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazioni Economiche</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=costi_cat" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/losses-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=costi_cat">Costi</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>
	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=produzione_cat" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/production-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=produzione_cat">Produzione</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/production.svg" alt="icon"> <span>Dati economici</span>
		</div>
		</article>
	</div>
	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=personale_cat" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/human-res-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=personale_cat">Personale</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/human-res.svg" alt="icon"> <span>Personale</span>
		</div>
		</article>
	</div>
	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=finanza_cat" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/warehouse-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=finanza_cat">Finanza</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/warehouse.svg" alt="icon"> <span>Finanza</span>
		</div>
		</article>
	</div>
	<div class="col-sm-6 col-md-4 col-lg-3 prior">
		<article> <a href="./new/index.jsp?m=varie_cat" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/misc-article.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=varie_cat">Varie</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span>
		</div>
		</article>
	</div>
	<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
	<!-- 				<article> -->
	
	<!-- 					<h2> -->
	<!-- 						<a href="#dashboard/detail">Conto Economico per Centro di Profitto</a> -->
	<!-- 					</h2> -->
	<!-- 					<div class="detail"> -->
	
	
	<!-- 					</div> -->
	<!-- 				</article> -->
	<!-- 			</div> -->
	<!-- 			<div class="col-sm-6 col-md-4 col-lg-3 prior"> -->
	<!-- 				<article> -->
	
	<!-- 					<h2> -->
	<!-- 						<a href="#dashboard/detail">Conto Economico Mensilizzato</a> -->
	<!-- 					</h2> -->
	<!-- 					<div class="detail"> -->
	
	
	<!-- 					</div> -->
	<!-- 				</article> -->
	<!-- 			</div> -->



	<div class="col-sm-6 col-md-4 col-lg-3 cats vendite">
		<article> <a href="./GetRCL?year=2017&month=8" class="img-container" style="background-image: url('/Images/C.Gestione/sells-cat-01.png');"></a>
		<h2>
			<a href="./GetRCL?anno=2017&month=8">Ricavi - Forecast dinamico</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/sells.svg" alt="icon"> <span>Vendite</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats vendite">
		<article> <a href="./GetRCLDinamico?anno=2017&month=8" class="img-container" style="background-image: url('/Images/C.Gestione/navicon/sells-article.png');"></a>
		<h2>
			<a href="./GetRCLDinamico?anno=2017&month=8">Ricavi - con Bdg</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/sells.svg" alt="icon"> <span>Vendite</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./GetCER" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-01.png');"></a>
		<h2>
			<a href="./GetCER">Conto Economico riclassificato</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./montly-balance" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-02.png');"></a>
		<h2>
			<a href="./montly-balance">Conto Economico mensile</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./progressive-balance" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-03.png');"></a>
		<h2>
			<a href="./progressive-balance">Conto Economico per Centro di Profitto</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="/Onlyou/GetCERtxtAreaPrg" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-04.png');"></a>
		<h2>
			<a href="./GetCERtxtAreaPrg">Conto Economico Budget</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
		</div>
		</article>
	</div>
	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=cinquepuntosei" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-04.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=cinquepuntosei">Conto economico a costo del venduto</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="/Onlyou/new/index.jsp?m=cinquepuntosei" class="img-container" style="background-image: url('/Images/C.Gestione/market-cat-04.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=cinquepuntosei">Contabilitŕ generale</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/market.svg" alt="icon"> <span>Situazione Economiche</span>
			<!-- 			<img class="notification pull-right" -->
			
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="/Onlyou/new/index.jsp?m=seipuntouno" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-01.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntouno">Calcolo costo industriale</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntodue" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-02.png');"></a>
		<h2>
			<a href="./index.jsp?m=seipuntodue">Grafico costo orario</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntotre" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-03.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntotre">Costi consuntivi / budget</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntoquattro" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-04.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntoquattro">Costi / ricavi progressivi</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntocinque" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-05.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntocinque">Costi mensili per Reparto</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntosei" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-06.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntosei">Costi mensili delle energie</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=seipuntosette" class="img-container" style="background-image: url('/Images/C.Gestione/losses-cat-07.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=seipuntosette">Costo Telefonia</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/losses.svg" alt="icon"> <span>Costi</span> 
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/production-cat-01.png');"></a>
		<h2>
			<a href="">Produzione mensile</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/production.svg" alt="icon"> <span>Produzione</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/production-cat-02.png');"></a>
		<h2>
			<a href="">Efficienze Confezione per linea</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/production.svg" alt="icon"> <span>Produzione</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/human-cat-01.png');"></a>
		<h2>
			<a href="">Organico per Reparto / Mansione</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/human-res.svg" alt="icon"> <span>Personale</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/human-cat-02.png');"></a>
		<h2>
			<a href="">Assenteismo</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/human-res.svg" alt="icon"> <span>Personale</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/human-cat-03.png');"></a>
		<h2>
			<a href="">Costo del Lavoro</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/human-res.svg" alt="icon"> <span>Personale</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/warehouse-cat-01.png');"></a>
		<h2>
			<a href="">Situazione Finanziaria</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/warehouse.svg" alt="icon"> <span>Finanza</span> <img class="notification pull-right"
				src="/Images/C.Gestione/miscicon/divieto.svg" alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./treasury" class="img-container" style="background-image: url('/Images/C.Gestione/warehouse-cat-03.png');"></a>
		<h2>
			<a href="./treasury">Piano di Tesoreria</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/warehouse.svg" alt="icon"> <span>Finanza</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-01.png');"></a>
		<h2>
			<a href="">Situazione magazzini</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span> <img class="notification pull-right" src="/Images/C.Gestione/miscicon/divieto.svg"
				alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-03.png');"></a>
		<h2>
			<a href="">Rammendo</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span> <img class="notification pull-right" src="/Images/C.Gestione/miscicon/divieto.svg"
				alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-02.png');"></a>
		<h2>
			<a href="">Investimenti</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span> <img class="notification pull-right" src="/Images/C.Gestione/miscicon/divieto.svg"
				alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-01.png');"></a>
		<h2>
			<a href="">Manutenzioni ordinarie</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span> <img class="notification pull-right" src="/Images/C.Gestione/miscicon/divieto.svg"
				alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-03.png');"></a>
		<h2>
			<a href="">Tabella Addebiti</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span> <img class="notification pull-right" src="/Images/C.Gestione/miscicon/divieto.svg"
				alt="icon">
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=tassi_di_cambio" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-02.png');"></a>
		<h2>
			<a href="./index.jsp?m=tassi_di_cambio">Tassi di Cambio</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span>
		</div>
		</article>
	</div>

	<div class="col-sm-6 col-md-4 col-lg-3 cats">
		<article> <a href="./new/index.jsp?m=caricamenti-file" class="img-container" style="background-image: url('/Images/C.Gestione/misc-cat-03.png');"></a>
		<h2>
			<a href="./new/index.jsp?m=caricamenti-file">Caricamenti file</a>
		</h2>
		<div class="detail">
			<img src="/Images/C.Gestione/navicon/misc.svg" alt="icon"> <span>Varie</span>
		</div>
		</article>
	</div>
</body>
</html>
		</div>
		<div class="">
			

<!-- Right navigation -->


<script>

    function rgtForce() {

        var e = document.getElementById('right-navi');
        if (e.className == 'ng-scope hover') {
            e.className = 'ng-scope';
        } else {
            e.className = 'ng-scope hover';
        }
    }

</script>

<div id = "right-navi">
<button type="button" class="right-toggle" onclick="rgtForce()">
	<span class="bullet one"></span>
	<span class="bullet two"></span>
	<span class="bullet three"></span>
</button>
<div class="user">
	<img src="/dashboard/Images/user-demo.png" alt="icon">
	<span>Carlo Alberto della Siega</span>
	<a href="#" class="btn btn-wire">Logout</a>
</div>
<nav class="user-navi">
	<ul>
		<li>
			<a href="#">Il mio profilo</a>
		</li>
		<li>
			<a href="#">Impostazioni</a>
		</li>
		<li>
			<a href="#">Contatta l'assistenza</a>
		</li>
		<li>
			<a href="#">Preferenze</a>
		</li>
	</ul>
</nav>
<footer>
	<small>© 2017 ONLYOU </small>
	<nav class="footer-navi">
		<ul>
			<li>
				<a href="#">Termini e Condizioni</a>
			</li>
			<li>
				<a href="#">Policy</a>
			</li>
			<li>
				<a href="#">Cookie</a>
			</li>
		</ul>
	</nav>
</footer>
</div>
		</div>
	</div>

	<script>
        var collection_prior = document.getElementsByClassName('prior');
        for (var i = 0, len = collection_prior.length; i < len; i++) {
            // 				collection[i].style.display = 'block';
            collection_prior[i].classList.add("show");
        }
    </script>

	<script>
		

        function priorView() {
            var collection = document.getElementsByClassName('cats');
			var collection_prior = document.getElementsByClassName('prior');
			

            document.getElementById('prior').className = 'filter active';
            document.getElementById('all').className = 'filter';

            for (var i = 0, len = collection.length; i < len; i++) {
                collection[i].classList.remove("show");
                // 				setTimeout(function(){
                // 					collection[i].style.display = 'none';
                // 				}, 400);
            }

            for (var i = 0, len = collection_prior.length; i < len; i++) {
                // 				collection[i].style.display = 'block';
                collection_prior[i].classList.remove("hide");
                collection_prior[i].classList.add("show");
            }

        }
        function allView() {

            var collection = document.getElementsByClassName('cats');
            var collection_vendite = document.getElementsByClassName('prior');

            document.getElementById('prior').className = 'filter';
            document.getElementById('all').className = 'filter active';

            for (var i = 0, len = collection.length; i < len; i++) {
                // 				collection[i].style.display = 'block';
                collection[i].classList.add("show");
            }

            for (var i = 0, len = collection_prior.length; i < len; i++) {
                // collection_prior[i].style.display = 'block';
                collection_prior[i].classList.add("hide");
                collection_prior[i].classList.remove("show");

            }

        }
    </script>

	<script>
        function update(n) {
            /*document.getElementById("month-id").value = n;
            var change = document.getElementById("change").value*/
            var e = document.getElementById("week_start");
            var startWeek = e.options[e.selectedIndex].value;
            var e = document.getElementById("week_end");
            var weekNumber = e.options[e.selectedIndex].value;
            var change = document.getElementById("change").value;
            console.log(startWeek, weekNumber, change);
            if (!isNaN(change) && change != null && change != "") {
                change = change;
            } else {
                change = 1.0;
                document.getElementById("change").value = 1.0;
            }
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/Onlyou/UpTreasuryPageTotal', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                document.getElementById("treasury-plan-table").innerHTML = this.responseText;
                getGraph();
            }
            var valuta = document.getElementById("valutaEuroRsd");
            if (change != '' && change != '1' && change != '1.0') {
                valuta.innerHTML = 'EUR';
            } else {
                valuta.innerHTML = 'RSD';
            }
            xhr.send('week=' + startWeek + '&week_number=' + weekNumber + '&change=' + change);
            // var table = document.getElementById("monthly-balance").innerHTML =
		};

        function venditeView() {

            var collection_prior = document.getElementByClassName('vendite');
            var collection_prior = document.getElementsByClassName('prior');
            for (var i = 0, len = vendite.length; i < len; i++) {
                collection_prior[i].classList.remove("show");
                // 				setTimeout(function(){
                // 					collection[i].style.display = 'none';
                // 				}, 400);
            }

            for (var i = 0, len = collection_vendite.length; i < len; i++) {
                // 				collection[i].style.display = 'block';
                collection_vendite[i].classList.remove("hide");
                collection_vendite[i].classList.add("show");
            }

        }
    </script>
</body>
</html>