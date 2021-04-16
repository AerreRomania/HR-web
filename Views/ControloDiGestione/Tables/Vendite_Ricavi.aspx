<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Vendite_Ricavi.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Vendite_Ricavi" %>

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
<link rel="stylesheet" href="../../new/css/style.css">
<link rel="stylesheet" href="../../css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="../../css/datatable/datatables.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> -->
<link rel="stylesheet" type="text/css" href=../../css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="../../css/dataTables.bootstrap.min.css"/>
<script src="./js/jquery-2.1.0.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script> -->
<script src="/Onlyou/new/js/jquery.dataTables.min.js"></script>
<!-- CHART JS -->

<script src="./js/chart.bundle.min.js""></script>
<!-- CHART JS END -->
<!-- CORE -->
<script src=./js/angular.min.js"></script>
<!-- CORE END -->
<!-- THIRD PARTY MODULES -->
<script src="./js/angular-ui-router.min.js"></script>
<script src="./js/angular-animate.min.js"></script>
<script src="./js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src=="./js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script> -->

<!-- THIRD PARTY MODULES END -->
<!-- MAIN APP -->
<script src="/Onlyou/dashboard/js/app.js"></script>
<!-- MAIN APP END -->
<!-- MODULES -->

<script src="./dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="./dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="./dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body bgcolor="#f4f4f4">
	<!-- LEFT NAVIGATION -->


	<div class="container">

		<div class="">
			

<!-- Left navigation -->

<%--<script>

function openClose(){
	
	var e = document.getElementById('left-navi');
	if (e.className == 'ng-scope hover') {
		e.className = 'ng-scope';
	} else {
		e.className = 'ng-scope hover';
	}
}

var $li = $('#menu li a').click(function() {
    $li.removeClass('active');
    $(this).addClass('active');
});

</script>--%>


<%--<div id = "left-navi" onmouseover = "openClose()" onmouseout = "openClose()">
<nav class="main-nav">

<div id = "menu">
	<ul>
		<li>
			<a href="/Onlyou/new/index.jsp?m=main">
				<img src="/Onlyou/dashboard/images/navicon/all.svg" alt="icon">
				<span>Tutti</span>
				<span class="pull-right">7</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=vendite_cat">
				<img class="notification" src="/Onlyou/dashboard/images/miscicon/notify.svg" alt="icon">
				<img src="/Onlyou/dashboard/images/navicon/sells.svg" alt="icon">
				<span>Vendite</span>
				<span class="pull-right">2</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=situazioni_economiche_cat">
				<img class="notification" src="/Onlyou/dashboard/images/miscicon/notify.svg" alt="icon">
				<img src="/Onlyou/dashboard/images/navicon/market.svg" alt="icon">
				<span>Situazioni Economiche</span>
				<span class="pull-right">6</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=costi_cat">
				<img src="/Onlyou/dashboard/images/navicon/losses.svg" alt="icon">
				<span>Costi</span>
				<span class="pull-right">8</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=produzione_cat">
				<img src="/Onlyou/dashboard/images/navicon/production.svg" alt="icon">
				<span>Produzione</span>
				<span class="pull-right">2</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=personale_cat">
				<img src="/Onlyou/dashboard/images/navicon/human-res.svg" alt="icon">
				<span>Personale</span>
				<span class="pull-right">3</span>
			</a>
		</li>
		<li>
			<a href="/Onlyou/new/index.jsp?m=finanza_cat">
				<img src="/Onlyou/dashboard/images/navicon/warehouse.svg" alt="icon">
				<span>Finanza</span>
				<span class="pull-right">2</span>
			</a>
		</li>
				<li>
			<a href="/Onlyou/new/index.jsp?m=varie_cat">
				<img src="/Onlyou/dashboard/images/navicon/misc.svg" alt="icon">
				<span>Varie</span>
				<span class="pull-right">6</span>
			</a>
		</li>
	</ul>
	</div>--%>
<%--</nav>
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



		</div>--%>
		<div class="">
			


<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Ricavi Forecast dinamico</h1>

					<%--<a class="link" href="/Onlyou/new/index.jsp?m=vendite_cat"> <i class="fa fa-chevron-left"></i> Indietro
					</a>--%>
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno <span id="yearspan">2021</span></b>
					</div>
					<div class="col-sm-5" style="display: inline-block;margin-left:140px; /*float: right;*/">
						<section>
							Mese <select id="month" onchange="getRCL(this);">
								
									<option value="1" >1</option>
								
									<option value="2" >2</option>
								
									<option value="3" >3</option>
								
									<option value="4" selected>4</option>
								
									<option value="5" >5</option>
								
									<option value="6" >6</option>
								
									<option value="7" >7</option>
								
									<option value="8" >8</option>
								
									<option value="9" >9</option>
								
									<option value="10" >10</option>
								
									<option value="11" >11</option>
								
									<option value="12" >12</option>
								
							</select> Anno <select id="year" onchange="getRCL(this);">
								
									<option value="2017" >2017</option>
								
									<option value="2018" >2018</option>
								
									<option value="2019" >2019</option>
								
									<option value="2020" >2020</option>
								
									<option value="2021" selected>2021</option>
								
									<option value="2022" >2022</option>
								
									<option value="2023" >2023</option>
								
									<option value="2024" >2024</option>
								
									<option value="2025" >2025</option>
								
									<option value="2026" >2026</option>
								
									<option value="2027" >2027</option>
								
									<option value="2028" >2028</option>
								
									<option value="2029" >2029</option>
								
									<option value="2030" >2030</option>
								
							</select>
						</section>
						</br>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="table-responsive">
						<table id="rcl-table" class="table table-bordered table-hover table-condensed version" cellSpacing="0">
							


<thead>
	<tr style="padding-top:20px;">
		<th style="border-top:1px solid #D3D3D3;border-left:1px solid #D3D3D3;border-bottom:1px solid #D3D3D3;"></th>
		<th style="border-left:1px solid #D3D3D3;border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">Anno 2021</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Bdg</th>
		<th  style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Bdg</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Bdg</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc1</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc1</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc1</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc1</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc2</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc2</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc2</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc2</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;">cons. Prc2</th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;"></th>
		<th style="border-right:1px solid #D3D3D3;border-top:1px solid #D3D3D3;"></th>

	</tr>
	<tr style="border-bottom:1px solid black;border-bottom:2px solid black;border-top:1px solid #D3D3D3;">
		<th style="border-left:1px solid #DCDCDC;"></th>
		<th style="background-color: #D9E3C0;border-left: 1px solid #D3D3D3;border-right:2px solid black;">Reparti</th>
		<th style="background-color: #D9E3C0;">Gen</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Feb</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Mar</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Apr</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Mag</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Giu</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Lug</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Ago</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Set</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Ott</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;">Nov</th>
		<th style="background-color: #D9E3C0;border-left: 2px solid #D3D3D3;border-right:2px solid black;">Dic</th>
		<th style="background-color: #D9E3C0;border-right:2px solid black;">Totale periodo</th>
		<th style="background-color: #D9E3C0;border-right:2px solid #000000;">Totale anno (c.+p.)</th>
	</tr>
</thead>
<tbody>
	<tr>
	<td style="border-left: 1px solid #D3D3D3;"></td>
		<td  style="border-left: 1px solid #DCDCDC;border-right:2px solid #6495ED;">Giorni Lavoro</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,0,2021)">23.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,1,2021)">26.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,2,2021)">31.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;" class="yellow" onclick="inserisciRicavi(this,0,0,3,2021)">26.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,4,2021)">29.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,5,2021)">30.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,6,2021)">31.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;" class="yellow" onclick="inserisciRicavi(this,0,0,7,2021)">31.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,8,2021)">30.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,9,2021)">31.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,10,2021)">29.0</td>
		
			<td style="border-right:2px solid #000000; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,0,11,2021)">24.0</td>
		
		<td style="border-right:2px solid #000000; text-align:center;">341.0</td>
		<td style="border-right:2px solid #000000;"></td>
	</tr>
	<tr id="tessitura">
		<td style="color: #607D8B; font-size: 13px;border-right: 1px solid #DCDCDC;/*border-top: 1px solid #D3D3D3;*//*border-bottom: 1px solid #D3D3D3;*/">TESSITURA</td>
		<td style="color: black;border-right: 2px solid red;text-align:center;">Consuntivo</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:red;" class="yellow" onclick="inserisciRicavi(this,0,1,0,2021)">284.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,1,2021)">471.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,2,2021)">510.6</td>
		
			<td  style="border-right:1px solid #D3D3D3; text-align:center; color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,3,2021)">331.9</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,4,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,5,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,6,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,7,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,8,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,9,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,10,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,0,1,11,2021)">0.0</td>
		
		<td style="border-right:2px solid #000000;border-left:2px solid #000000; text-align:center;color:red;">1,597.5</td>
		<td style="border-right:2px solid #000000;border-top:2px solid #000000; text-align:center;color:red;">4,782.5</td>
	</tr>
	<tr>
		<td></td>
		<td style="text-align:center;color:#6495ED;border-left:1px solid #DCDCDC;border-right:2px solid #6495ED;">bdg</td>

		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;" class="yellow" onclick="inserisciRicavi(this,0,2,0,2021)">311.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,1,2021)">368.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,2,2021)">459.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,3,2021)">404.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,4,2021)">418.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,5,2021)">431.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,6,2021)">412.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,7,2021)">284.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,8,2021)">451.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,9,2021)">473.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,10,2021)">407.0</td>
		
			<td style="border-right:2px solid #000000; text-align:center; color:#6495ED;"class="yellow" onclick="inserisciRicavi(this,0,2,11,2021)">309.0</td>
		
		<td style=" text-align:center; color:#6495ED;">1,542.0</td>
		<td style="border-right:2px solid #000000;border-top:2px solid #000000; text-align:center;border-left:2px solid #000000; color:#6495ED;">4,727.0</td>
	</tr>
	<tr>
		<td></td>
		<td  style="border-right:2px solid #6495ED; text-align:center;border-left:1px solid #D3D3D3;">delta mese</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(27.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">103.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">51.6</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(72.1)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(418.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(431.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(412.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(284.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(451.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(473.0)</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;">(407.0)</td>
		
			<td style="color:#6495ED; text-align:center;">(309.0)</td>
		
		<td style="color:#6495ED;border-right:2px solid #000000; text-align:center;border-left:2px solid #000000;">55.5</td>
		<td style="border-right:2px solid #000000;"></td>
	</tr>
	<tr id="ap">
		<td></td>
		<td style="text-align:center;border-left:1px solid #D3D3D3;border-right:2px solid#6495ED  ;">a.p.</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,0,2021)">230.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,1,2021)">227.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,2,2021)">368.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,3,2021)">254.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,4,2021)">411.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,5,2021)">301.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,6,2021)">337.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,7,2021)">303.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,8,2021)">368.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,9,2021)">403.0</td>
		
			<td  style="border-right:1px solid #D3D3D3; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,10,2021)">413.0</td>
		
			<td style="border-right:2px solid #000000; text-align:center;"class="yellow" onclick="inserisciRicavi(this,0,3,11,2021)">139.0</td>
		
		<td style="text-align:center;">1,079.0</td>
		<td style="border-bottom:2px solid #000000;border-right:2px solid #000000;border-left:2px solid #000000;text-align:center;">3,754.0</td>
	</tr>
	<tr>
		<td></td>
		<td  style="border-left: 1px solid #DCDCDC;border-right:2px solid #6495ED;text-align:center;">Giorni Lavoro</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;" class="yellow" onclick="inserisciRicavi(this,1,0,0,2021)">18.5</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,1,2021)">19.5</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,2,2021)">23.5</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,3,2021)">19.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,4,2021)">23.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,5,2021)">24.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,6,2021)">23.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,7,2021)">19.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,8,2021)">20.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,9,2021)">23.0</td>
		
			<td style="text-align:center;border-right:1px solid #D3D3D3;"class="yellow" onclick="inserisciRicavi(this,1,0,10,2021)">21.0</td>
		
			<td style="text-align:center;border-right:2px solid #000000;"class="yellow" onclick="inserisciRicavi(this,1,0,11,2021)">19.0</td>
		
		<td style="text-align:center;border-right:2px solid #000000;" >252.5</td>
		<td style="text-align:center;border-right:2px solid #000000;"></td>
	</tr>
	<tr id="confezione">
		<td style="color: #607D8B; font-size: 13px;">CONFEZIONE</td>
		<td style="color: black;border-right: 2px solid red;text-align:center;">Consuntivo</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,0,2021)">116.3</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;" class="yellow" onclick="inserisciRicavi(this,1,1,1,2021)">197.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,2,2021)">223.4</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;" class="yellow" onclick="inserisciRicavi(this,1,1,3,2021)">179.5</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,4,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,5,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,6,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,7,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,8,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;" class="yellow" onclick="inserisciRicavi(this,1,1,9,2021)">0.0</td>
		
			<td style="border-right:1px solid #D3D3D3; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,10,2021)">0.0</td>
		
			<td style="border-right:2px solid #000000; text-align:center;color:red;"class="yellow" onclick="inserisciRicavi(this,1,1,11,2021)">0.0</td>
		
		<td style="border-right:2px solid #000000; text-align:center;color:red;">716.2</td>
		<td style="border-right:2px solid #000000; text-align:center;color:red;border-top:2px solid #000000;border-bottom:2px solid #000000;">2,168.2</td>
	</tr>
	<tr>
		<td></td>
		<td>bdg</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,0,2021)">140.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,1,2021)">140.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,2,2021)">194.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,3,2021)">155.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,4,2021)">189.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,5,2021)">208.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,6,2021)">199.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,7,2021)">137.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,8,2021)">173.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,9,2021)">199.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,10,2021)">182.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,2,11,2021)">165.0</td>
		
		<td>629.0</td>
		<td>2,081.0</td>
	</tr>
	<tr>
		<td></td>
		<td>delta mese</td>
		
			<td>(23.7)</td>
		
			<td>57.0</td>
		
			<td>29.4</td>
		
			<td>24.5</td>
		
			<td>(189.0)</td>
		
			<td>(208.0)</td>
		
			<td>(199.0)</td>
		
			<td>(137.0)</td>
		
			<td>(173.0)</td>
		
			<td>(199.0)</td>
		
			<td>(182.0)</td>
		
			<td>(165.0)</td>
		
		<td>87.2</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>a.p.</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,0,2021)">103.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,1,2021)">142.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,2,2021)">186.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,3,2021)">148.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,4,2021)">186.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,5,2021)">188.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,6,2021)">185.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,7,2021)">144.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,8,2021)">186.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,9,2021)">168.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,10,2021)">162.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,1,3,11,2021)">93.0</td>
		
		<td>579.0</td>
		<td>1,891.0</td>
	</tr>
	<tr>
		<td></td>
		<td  style="border-left: 2px solid #DCDCDC;">Giorni Lavoro</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,0,2021)">17.5</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,1,2021)">18.5</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,2,2021)">23.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,3,2021)">19.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,4,2021)">21.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,5,2021)">21.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,6,2021)">22.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,7,2021)">22.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,8,2021)">20.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,9,2021)">23.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,10,2021)">21.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,0,11,2021)">19.0</td>
		
		<td>247.0</td>
		<td></td>
	</tr>
	<tr>
		<td style="color: #607D8B; font-size: 13px;">STIRO</td>
		<td style="color: black;">Consuntivo</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,0,2021)">106.7</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,1,2021)">64.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,2,2021)">99.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,3,2021)">59.5</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,4,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,5,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,6,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,7,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,8,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,9,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,10,2021)">0.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,1,11,2021)">0.0</td>
		
		<td>329.2</td>
		<td>1,006.6</td>
	</tr>
	<tr>
		<td></td>
		<td>bdg</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,0,2021)">73.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,1,2021)">73.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,2,2021)">93.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,3,2021)">77.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,4,2021)">85.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,5,2021)">84.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,6,2021)">87.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,7,2021)">88.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,8,2021)">81.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,9,2021)">92.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,10,2021)">84.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,2,11,2021)">76.4</td>
		
		<td>316.0</td>
		<td>993.4</td>
	</tr>
	<tr>
		<td></td>
		<td>delta mese</td>
		
			<td>33.7</td>
		
			<td>(9.0)</td>
		
			<td>6.0</td>
		
			<td>(17.5)</td>
		
			<td>(85.0)</td>
		
			<td>(84.0)</td>
		
			<td>(87.0)</td>
		
			<td>(88.0)</td>
		
			<td>(81.0)</td>
		
			<td>(92.0)</td>
		
			<td>(84.0)</td>
		
			<td>(76.4)</td>
		
		<td>13.2</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>a.p.</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,0,2021)">63.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,1,2021)">54.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,2,2021)">87.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,3,2021)">83.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,4,2021)">118.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,5,2021)">91.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,6,2021)">39.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,7,2021)">63.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,8,2021)">93.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,9,2021)">80.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,10,2021)">68.0</td>
		
			<td class="yellow" onclick="inserisciRicavi(this,2,3,11,2021)">49.0</td>
		
		<td>287.0</td>
		<td>888.0</td>
	</tr>
	<!-- 						TOTALE -->
	<tr style="background-color: #BCCCE2;">
		<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
			<td></td>
		
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td style="color: #607D8B; font-size: 13px;">TOTALE</td>
		<td style="color: black;">Consuntivo</td>
		
			<td>507.0</td>
		
			<td>732.0</td>
		
			<td>833.0</td>
		
			<td>570.9</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
			<td>0.0</td>
		
		<td>2,642.9</td>
		<td>7,957.3</td>
	</tr>
	<tr>
		<td></td>
		<td>bdg</td>
		
			<td>524.0</td>
		
			<td>581.0</td>
		
			<td>746.0</td>
		
			<td>636.0</td>
		
			<td>692.0</td>
		
			<td>723.0</td>
		
			<td>698.0</td>
		
			<td>509.0</td>
		
			<td>705.0</td>
		
			<td>764.0</td>
		
			<td>673.0</td>
		
			<td>550.4</td>
		
		<td>2,487.0</td>
		<td>7,801.4</td>
	</tr>
	<tr>
		<td></td>
		<td>delta bdg</td>
		
			<td>(17.0)</td>
		
			<td>151.0</td>
		
			<td>87.0</td>
		
			<td>(65.1)</td>
		
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
		<td>155.9</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>a.p.</td>
		
			<td>396.0</td>
		
			<td>423.0</td>
		
			<td>641.0</td>
		
			<td>485.0</td>
		
			<td>715.0</td>
		
			<td>580.0</td>
		
			<td>561.0</td>
		
			<td>510.0</td>
		
			<td>647.0</td>
		
			<td>651.0</td>
		
			<td>643.0</td>
		
			<td>281.0</td>
		
		<td>1,945.0</td>
		<td>6,533.0</td>
	</tr>


	<tr>
		<td></td>
		<td>delta a.p.</td>
		
			<td>111.0</td>
		
			<td>309.0</td>
		
			<td>192.0</td>
		
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
			<td>0,0</td>
		
		<td style="background-color: #BCCCE2; font-size: 15px;">697.9</td>
		<td style="background-color: #BCCCE2; font-size: 15px;">1,424.3</td>
	</tr>
</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="col-sm-12" id="graph_tessitura" style="background-color: #D9E3C0;"></div>
					<div class="col-sm-12" id="graph_confezione" style="background-color: #BCCCE2; margin-top: 8%"></div>
					<div class="col-sm-12" id="graph_stiro" style="background-color: #FCCE56; margin-top: 8%; margin-bottom: 8%"></div>
					<div class="col-sm-12" id="budget">
						<div class="col-sm-3"></div>
					</div>
				</div>
<!-- 				<div class="col-sm-12"> -->
<!-- 					<div class="col-sm-3"></div> -->
<!-- 					<div class="col-sm-6" id="budget"> -->
<!-- 						<div class="col-sm-3"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
	</section>
</div>
<script>
	var month = 8;
	var anno = 2021;
	// var xhr = new XMLHttpRequest();
	// xhr.open('POST', '/Onlyou/GetRCL', true);
	// xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	// xhr.onload = function() {
	// document.getElementById("ricavi-conto-lavoro-page").innerHTML = this.responseText;
	//getGraph();
	// };
	// xhr.send('month=' + month + '&anno=' + anno);

	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/Onlyou/GraphRCLDinamico', true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	// xhr.onload = function() {
	// // var obj = JSON.parse(this.responseText);
	// // console.log("GRAPH:" + obj)
	// // graphRCL(obj.APConfezione, "graph_confezione");
	// };
	//document.getElementById("ricavi-conto-lavoro-page").style.visibility = 'hidden';
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			var obj = JSON.parse(this.responseText);
			console.log("GRAPH:" + obj)
			setTimeout(function() {
				graphRCL(obj.APConfezione, obj.ConsConfezione,
						"graph_confezione", 'CONFEZIONE');
				graphRCL(obj.APStiro, obj.ConsStiro, "graph_stiro", 'STIRO');
				graphRCL(obj.APTessitura, obj.ConsTessitura, "graph_tessitura",
						'TESSITURA');
				barGraphRCL(obj.PercConsTes, obj.PercConsConf,
						obj.PercConsStir, obj.PercBdgTes, obj.PercBdgConf,
						obj.PercBdgStir, anno);
				// $('#rcl-table').DataTable({
				// "ordering" : false,
				// "order" : [],
				// "paging" : false,
				// "autoWidth" : true,
				// "pageLength" : 16,
				// "bFilter" : false,
				// "dom" : '<"topcustom"lfr>t<"bottomcustom"ip>'
				//
				// });
				//       document.getElementById("ricavi-conto-lavoro-page").style.visibility = 'visible';
			}, 500);

		}
	};
	xhr.send('month=' + month + '&anno=' + 2017);
</script>
<script src="/Onlyou/ajax-pages/ricavi-conto-lavoro-dinamico.js"></script>
<script>
	$(window).on("scroll", function() {
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();
		if ((scrollHeight - scrollPosition) / scrollHeight != 0) {

			document.getElementById("dockbar").className = "hide";
		}
	});

	$(window).on("scroll", function() {
		var scrollHeight = $(document).height();
		var scrollPosition = $(window).height() + $(window).scrollTop();
		if ((scrollHeight - scrollPosition) / scrollHeight === 0) {

			document.getElementById("dockbar").className = "";
		}
	});
</script>
<%--<div id="dockbar" class="hide">
	<div class="scroll-container">
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
		<button type="button" onclick="openModalShare()">
			<img src="/Onlyou/dashboard/images/dockicon/check.svg" alt="icon">
		</button>
		<button type="button" onclick="openModalPriority()">
			<img src="/Onlyou/dashboard/images/dockicon/remind.svg" alt="icon">
		</button>
		<!--            <button uib-tooltip="Zoom" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Carica" type="button"> -->
		
		<!--            </button> -->
		<button type="button" onclick="printf()">
			<img src="/Onlyou/dashboard/images/dockicon/print.svg" alt="icon">
		</button>
		<!--            <button uib-tooltip="Scarica" type="button"> -->
		
		<!--            </button> -->
	</div>
</div>--%>
<input type="hidden" value="" id="param-start">

<script>
	function printf() {

		window.print();
	}
</script>



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

<%--<div id = "right-navi">
<button type="button" class="right-toggle" onclick="rgtForce()">
	<span class="bullet one"></span>
	<span class="bullet two"></span>
	<span class="bullet three"></span>
</button>--%>
<%--<div class="user">
	<img src="/Onlyou/dashboard/images/user-demo.png" alt="icon">
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
	<small>© 2017 ONLYOU </small>--%>
	<%--<nav class="footer-navi">
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
</footer>--%>
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
			var collection_prior = document.getElementsByClassName('prior');

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
			xhr.onload = function() {
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
    </script>

		<style>

	  body{
		  padding:20px 20px;
		font-family:'Trebuchet MS';
		color:#4a4a4a;
	}
	 

	  .col-sm-12{
		text-align:center;
	}

	  #rcl-table{

		  width:100%;
		padding:5px;
		border:1px solid grey;
		border-collapse:collapse;
	  }

	.fa fa-chevron-left{
		float:left;
	}

	#ap{
		border-bottom:2px solid #000000;
	}

	#tessitura,#confezione{
		/*border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3;*/
		border-left: 1px solid #D3D3D3;
		background-color: rgba(0, 0, 0, 0.05);
	}


		</style>
</body>
</html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
