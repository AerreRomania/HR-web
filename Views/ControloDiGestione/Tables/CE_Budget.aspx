
<%@ Page Language="C#" AutoEventWireup="false" CodeFile="CE_Budget.aspx.cs" Inherits="Views_ControloDiGestione_Tables_CE_Budget" %>
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
<link rel="stylesheet" href="/Onlyou/css/font-awesome.min.css">
<link rel="stylesheet" href="/Onlyou/css/bootstrap.min.css">
<link rel="stylesheet" href="/Onlyou/css/animate.min.css">
<link rel="stylesheet" href="/Onlyou/new/css/style.css">
<link rel="stylesheet" href="/Onlyou/css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="/Onlyou/css/datatable/datatables.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> -->
<link rel="stylesheet" type="text/css" href="/Onlyou/new/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="/Onlyou/new/css/dataTables.bootstrap.min.css"/>
<script src="/Onlyou/js/jquery-2.1.0.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script> -->
<script src="/Onlyou/new/js/jquery.dataTables.min.js"></script>
<!-- CHART JS -->

<script src="/Onlyou/js/chart.bundle.min.js"></script>
<!-- CHART JS END -->
<!-- CORE -->
<script src="/Onlyou/js/angular.min.js"></script>
<!-- CORE END -->
<!-- THIRD PARTY MODULES -->
<script src="/Onlyou/js/angular-ui-router.min.js"></script>
<script src="/Onlyou/js/angular-animate.min.js"></script>
<script src="/Onlyou/js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src="/Onlyou/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script> -->

<!-- THIRD PARTY MODULES END -->
<!-- MAIN APP -->
<script src="/Onlyou/dashboard/js/app.js"></script>
<!-- MAIN APP END -->
<!-- MODULES -->

<script src="/Onlyou/dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body>
	<!-- LEFT NAVIGATION -->


	<div class="container">

		<div class="">
			

<!-- Left navigation -->

<script>

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

</script>






		</div>
		<div class="">
			




<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Conto economico Budget</h1>

					<a class="link" href="/Onlyou/new/index.jsp?m=situazioni_economiche_cat"> <i class="fa fa-chevron-left"></i> Indietro
					</a>
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno <span id="yearspan"></span></b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: right;">
						<section>
							Mese <select id="month" onchange="getCER(this);">
								
									<option value="1" >1</option>
								
									<option value="2" >2</option>
								
									<option value="3" >3</option>
								
									<option value="4" >4</option>
								
									<option value="5" >5</option>
								
									<option value="6" >6</option>
								
									<option value="7" >7</option>
								
									<option value="8" >8</option>
								
									<option value="9" >9</option>
								
									<option value="10" >10</option>
								
									<option value="11" >11</option>
								
									<option value="12" >12</option>
								
							</select> Anno <select id="year" onchange="getCER(this);">
								
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
					</div>
				</div>

				<!-- 				<div id="cinquepuntodue"> -->
				<!-- 					<table class="table table-bordered table-hover table-condensed version" cellspacing="0" id="cinquepuntodue_sopra" width="100%"> -->
				




<!-- <div class="col-sm-12"> -->
	<div id="cinquepuntodue">
		<table class="table table-bordered table-hover table-condensed version" cellspacing="0" id="cinquepuntodue_sopra" width="100%">
			<thead>
				<tr>
					<th style="border: none !important; padding: 0px;"></th>

					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Gennaio</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Febbraio</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Marzo</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Aprile</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Maggio</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Giugno</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Luglio</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Agosto</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Settembre</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Ottobre</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Novembre</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Dicembre</th>
					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;" colspan="2">Totale</th>
					
					<th style="background-color: white !important; border: none !important"></th>
					
					<th style="border-bottom: none !important; background-color: #a9a9a9; padding: 0px;" colspan="2">Prog Cons</th>

<!-- 					<th style="background-color: white !important; border: none !important"></th> -->
<!-- 					<th style="background-color: white !important; border: none !important"></th> -->
<!-- 					<th style="background-color: white !important; border: none !important"></th> -->

<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Gennaio</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Febbraio</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Marzo</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Aprile</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Maggio</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Giugno</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Luglio</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Agosto</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Settembre</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Ottobre</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; border-right: 1px solid black; padding: 0px;">Novembre</th> -->
<!-- 					<th style="border-bottom: none !important; background-color: #CFEACF; padding: 0px;">Dicembre</th> -->
				</tr>
				<tr>
					<th></th>

					<th style="background-color: #CFEACF; padding: 0px;">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px">%</th>
					<th style="background-color: #CFEACF; padding: 0px">VAL</th>
					<th style="background-color: #CFEACF; border-right: 1px solid black; border-right: 1px solid black; padding: 0px">%</th>
					
					<th style="background-color: white !important; border: none !important"></th>
					
					<th style="background-color: #a9a9a9; padding: 0px">VAL</th>
					<th style="background-color: #a9a9a9; padding: 0px">%</th>
					
<!-- 					<th style="background-color: white !important; border: none !important"></th> -->
<!-- 					<th style="background-color: white !important; border: none !important"></th> -->
<!-- 					<th style="background-color: white !important; border: none !important"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; border-right: 1px solid black; padding: 0px"></th> -->
<!-- 					<th style="background-color: #CFEACF; padding: 0px"></th> -->

				</tr>
			</thead>
			<tbody>
				<tr>
					
					
					<td style=" white-space: nowrap; overflow: hidden">  F.to Gruppo c/lavoro<br>
						  F.to Benetton c/lavoro<br>
						  F.to Terzi netto c/lavoro<br>
						  F.to Gruppo c/vendita<br>
						  F.to Benetton c/vendita<br>
						  F.to Terzi netto c/vendita<br>
						  F.to Sottoprodotti<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="7" onpaste="setCERtxtAreaPrg(this,0,6,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							
								�<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>


				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black;  white-space: nowrap; overflow: hidden"> TOT. FATTURATO</td>
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,0)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,2)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,4)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,6)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,8)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,10)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,12)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,14)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,16)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,18)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,20)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,22)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,24)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
								
								
								<td></td>
								
								
								
								
								
								
							
						
							
								
								
								
								
								
								<td onclick="setCERtxt(this,7,27)">0.0</td>
								
								
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style=" white-space: nowrap; overflow: hidden">  Delta Rimanenze</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,0)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,2)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,4)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,6)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,8)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,10)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,12)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,14)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,16)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,18)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,20)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,22)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,24)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								<td></td>
								
								
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,8,27)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 3px solid black; border-top: 1px solid black;  white-space: nowrap; overflow: hidden"> VALORE PRODUZIONE</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,0)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,2)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,4)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,6)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,8)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,10)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,12)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,14)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,16)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,18)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,20)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,22)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,24)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								<td></td>
								
								
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,9,27)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				<tr>
					
					
					<td style=" white-space: nowrap; overflow: hidden">  Consumi materia prima<br>
						  Consumi coloranti/ingredienti<br>
						 Trasporti su acquisti<br>
						Costi Accessori di Acquisto<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="4" onpaste="setCERtxtAreaPrg(this,10,13,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>



				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> TOT. CONSUMI</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,14,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					
					<td style=" white-space: nowrap; overflow: hidden">  Tessitura<br>
						  Confezione<br>
						  Stiro<br>
						  Finissaggio<br>
						  Altre lavorazioni<br>
						  Tintoria<br>
						  Stampe<br>
						  Rammendo<br>
						  Ricami<br>
						  Trasporti su lavorazioni esterne<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onpaste="setCERtxtAreaPrg(this,15,24,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> TOTALE LAVORAZIONI ESTERNE</td>
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																														
								
								<td></td>
								
								
								
								
							
						
					
						
							
							
																														
								
								
		                           <td>0.0</td>
								
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; white-space: nowrap; overflow: hidden"> LAVORO DIRETTO</td>
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								<td></td>
								
								
								
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,26,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> LAVORO INDIRETTO</td>
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
																															
								
								<td></td>
								
								
								
							
						
					
						
							
							
																															
								
								
		                           <td onclick="setCERBdg(this,27,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>

				<tr>
					
					
					<td style="white-space: nowrap; overflow: hidden">  Energia elettrica<br>
						  Metano<br>
						  Manutenzione industriale<br>
						  Manutenzione struttura<br>
						  Mat. di consumo<br>
						  Depuratore/Acquedotto<br>
						  Smaltimento rifiuti<br>
						  Consumi Imballi e Sussidiarie<br>
						  Prestazioni di lavoro esterno<br>
						  Trasporti Bnt<br>
						  Altri costi di prod.ne<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="11" onpaste="setCERtxtAreaPrg(this,28,38,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> TOTALE ALTRI COSTI INDUSTRIALI</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,39,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; white-space: nowrap; overflow: hidden"> TOTALE COSTO DEL VENDUTO</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,40,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> MARGINE INDUSTRIALE LORDO</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,41,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>
				<tr>
					
					
					<td style=" white-space: nowrap; overflow: hidden">  Costo pers. commerciale<br>
						  Costo pers. Gen. Amm<br>
						  Coto pers. Gruppo<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="3" onpaste="setCERtxtAreaPrg(this,42,44,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					

					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>
				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> LAVORO IND. GENERALE</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,45,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>

				<tr>
					
					
					<td style="white-space: nowrap; overflow: hidden">  Pubblicita'/ Promotion<br>
						  Provvigioni/ Enasarco<br>
						  Trasporti commerciali terzi<br>
						  Consulenza Commerciali<br>
						  Altre Commerciali<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="5" onpaste="setCERtxtAreaPrg(this,46,50,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>


				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> TOT. COSTI COMMERCIALI</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,51,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>

				<tr>
					
					
					<td style="white-space: nowrap; overflow: hidden">  Assicurazioni<br>
						  Consulenza<br>
						  Manut. automezzi<br>
						  Manut. macch.ufficio<br>
						  Sindaci<br>
						  Amministratori<br>
						  Pulizia uffici<br>
						  Postelegrafoniche<br>
						  Cancelleria<br>
						  Rappres.,viaggi,diarie<br>
						  Spese varie<br>
						  Spese varie Gruppo<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="12" onpaste="setCERtxtAreaPrg(this,52,63,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>

				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black;  white-space: nowrap; overflow: hidden"> TOT. SPESE GENERALI</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,64,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>


				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black;  white-space: nowrap; overflow: hidden"> RISULTATO OPERATIVO LORDO</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,65,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>

				<tr>
					
					
					<td style="white-space: nowrap; overflow: hidden">  Amm.Imm.tecniche<br>
						  Amm.Imm.Immateriali<br>
						  Locazioni/ Affitto<br>
						  Ammortamenti rivalutazione<br>
						  Ammortamenti Gruppo<br>
						  Ammortamenti anticipati<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="6" onpaste="setCERtxtAreaPrg(this,66,71,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>

				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> TOTALE AMM./LEASING</td>
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
														
								
								<td></td>
								
								
								
							
						
					
						
							
							
														
								
								
								<td onclick="setCERtxt(this,72,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>


				<tr>
					
					<td style="background-color: #CFEACF; border-bottom: 1px solid black; white-space: nowrap; overflow: hidden"> RISULTATO OPERATIVO NETTO</td>
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,0)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,2)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,4)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,6)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,8)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,10)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,12)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,14)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,16)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,18)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,20)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,22)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,24)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
						
							
							
												
								
								<td></td>
								
								
								
							
						
					
						
							
							
												
								
								
								<td onclick="setCERtxt(this,73,27)">0.0</td>
								
								
							
						
					
						
							
								<td>�</td>
							
							
						
					
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



				</tr>

				<tr>
					
					
					<td style="white-space: nowrap; overflow: hidden">  Plusvalenze cespiti<br>
						  Minusvalenze cespiti<br>
						  Acc. F.do Sval.crediti<br>
						  Perdite su crediti<br>
						  Indennizzi assicurativi<br>
						  Oneri diversi<br>
						  Proventi diversi<br>
						  Correttivo gruppo<br>
						</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,0)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,2)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,4)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,6)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,8)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,10)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,12)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,14)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,16)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,18)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,20)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
						<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="8" onpaste="setCERtxtAreaPrg(this,74,81,22)">0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;0.0&#13;&#10;</textarea></td>
						<td>
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							
								�
								<br>
							</td>
					
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
						<td></td>
					<td>
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						
							0.0
							<br>
						</td>
					<td>
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						
							�
							<br>
						</td>
<!-- 					<td></td> -->
<!-- 					<td></td> -->
<!-- 					<td></td> -->



<!-- 								<br> -->


				</tr>

				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> E.B.I.T</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,0)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,2)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,4)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,6)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,8)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,10)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,12)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,14)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,16)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,18)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,20)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,22)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,24)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								<td></td>
								
								
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,82,27)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="white-space: nowrap; overflow: hidden">  Oneri e proventi finanziari</td>
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,0)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,1)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,2)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,3)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,4)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,5)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,6)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,7)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,8)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,9)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,10)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,11)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,12)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,13)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,14)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,15)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,16)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,17)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,18)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,19)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,20)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,21)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,22)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,23)">�</td>
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,24)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,25)">�</td>
								
								
							
						
							
								
								
																																
								
								<td></td>
								
								
								
								
							
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,83,27)">0.0</td>
								
								
								
							
						
							
								
									<td onclick="setCERBdg(this,83,28)">�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden"> RISULTATO DI ESERCIZIO</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,0)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,2)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,4)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,6)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,8)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,10)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,12)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,14)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,16)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,18)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,20)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,22)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,24)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								<td></td>
								
								
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,84,27)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="white-space: nowrap; overflow: hidden">Irap</td>
						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,0)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,1)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,2)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,3)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,4)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,5)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,6)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,7)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,8)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,9)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,10)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,11)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,12)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,13)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,14)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,15)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,16)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,17)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,18)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,19)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,20)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,21)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,22)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,23)">�</td>
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,24)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,25)">�</td>
								
								
							

						
							
								
								
																																
								
								<td></td>
								
								
								
								
							

						
							
								
								
																																
								
								
		                           <td onclick="setCERBdg(this,85,27)">0.0</td>
								
								
								
							

						
							
								
									<td onclick="setCERBdg(this,85,28)">�</td>
								
								
							

						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden">RISULTATO MESE ANTE IRES</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,0)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,2)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,4)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,6)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,8)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,10)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,12)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,14)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,16)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,18)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,20)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,22)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,24)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								<td></td>
								
								
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,86,27)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
			    
					<tr>
						<td style="white-space: nowrap; overflow: hidden">Ires</td>
						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,0)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,1)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,2)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,3)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,4)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,5)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,6)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,7)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,8)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,9)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,10)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,11)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,12)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,13)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,14)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,15)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,16)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,17)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,18)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,19)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,20)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,21)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,22)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,23)">�</td>
								
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,24)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,25)">�</td>
								
								
							

						
							
								
								
																							
								
								<td></td>
								
								
								
									
								
							

						
							
								
								
																							
								
								
		                           <td onclick="setCERBdg(this,87,27)">0.0</td>
								
								
									
								
							

						
							
								
									<td onclick="setCERBdg(this,87,28)">�</td>
								
								
							

						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="background-color: #CFEACF; border-bottom: 1px solid black; border-top: 1px solid black; white-space: nowrap; overflow: hidden">RISULTATO NETTO</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,0)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,2)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,4)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,6)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,8)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,10)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,12)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,14)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,16)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,18)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,20)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,22)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,24)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
							
								
								
															
								
								<td></td>
								
								
								
								
							

						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,88,27)">0.0</td>
								
								
								
							

						
							
								
									<td>�</td>
								
								
							

						
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->



					</tr>
				
				
					<tr>
						<td style="background-color: #CFEACF; white-space: nowrap; overflow: hidden">E.B.I.T.D.A</td>
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,0)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,2)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,4)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,6)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,8)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,10)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,12)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,14)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,16)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,18)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,20)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,22)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,24)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
							
								
								
															
								
								<td></td>
								
								
								
								
							
						
							
								
								
															
								
								
								<td onclick="setCERtxt(this,89,27)">0.0</td>
								
								
								
							
						
							
								
									<td>�</td>
								
								
							
						
<!-- 						<td style="border: none !important"></td> -->
<!-- 						<td style="border: none !important"></td> -->
<!-- 						<td style="border: none !important"></td> -->



					</tr>
				

			</tbody>
		</table>
	</div>
<!-- </div> -->

<!-- 				<div class="col-sm-12"> -->
<!-- 					<div class="table-responsive"> -->

<!-- 						<table class="table table-bordered table-hover table-condensed version" cellspacing="0" id="cinquepuntodue_sotto"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th style="height: 40px;" colspan = "9" class = "fix-first">Voce</th> -->
<!-- 									<th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid black;"></th> -->
<!-- 		                             <th style="border-bottom: 1px solid black; border-right: none;"></th> -->
<!-- 		                             <th style="border-right: 0px solid #ddd;"></th> -->
<!-- 									<th>Gennaio</th> -->
<!-- 									<th>Febbraio</th> -->
<!-- 									<th>Marzo</th> -->
<!-- 									<th>Aprile</th> -->
<!-- 									<th>Maggio</th> -->
<!-- 									<th>Giugno</th> -->
<!-- 									<th>Luglio</th> -->
<!-- 									<th>Agosto</th> -->
<!-- 									<th>Settembre</th> -->
<!-- 									<th>Ottobre</th> -->
<!-- 									<th>Novembre</th> -->
<!-- 									<th>Dicembre</th> -->

<!-- 								</tr> -->

<!-- 							</thead> -->
<!-- 							<tbody> -->

<!-- 									<tr> -->

<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->




<!-- 									</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->






<!-- <div> -->
<!-- 	<section class="detail"> -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row"> -->

<!-- 				<div class="col-sm-12"> -->
<!-- 					<div class="table-responsive"> -->

<!-- 						<table class="table table-bordered table-hover table-condensed version" cellspacing="0" id="cinquepuntodue_sotto"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th style="height: 40px;" colspan = "9" class = "fix-first">Voce</th> -->
<!-- 									<th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid #ddd;"></th> -->
<!-- 		                             <th style="border: 0px solid black;"></th> -->
<!-- 		                             <th style="border-bottom: 1px solid black; border-right: none;"></th> -->
<!-- 		                             <th style="border-right: 0px solid #ddd;"></th> -->
<!-- 									<th>Gennaio</th> -->
<!-- 									<th>Febbraio</th> -->
<!-- 									<th>Marzo</th> -->
<!-- 									<th>Aprile</th> -->
<!-- 									<th>Maggio</th> -->
<!-- 									<th>Giugno</th> -->
<!-- 									<th>Luglio</th> -->
<!-- 									<th>Agosto</th> -->
<!-- 									<th>Settembre</th> -->
<!-- 									<th>Ottobre</th> -->
<!-- 									<th>Novembre</th> -->
<!-- 									<th>Dicembre</th> -->

<!-- 								</tr> -->

<!-- 							</thead> -->
<!-- 							<tbody> -->

<!-- 									<tr> -->

<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->
<!-- 										<td style="border: 0px solid #ddd;"></td> -->




<!-- 									</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- </div> -->
<!-- </section> -->
<!-- </div> -->

			</div>
		</div>
	</section>
</div>



<!-- 	<section class="detail"> -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-sm-12"> -->
<!-- 					<h1>Conto economico riclassificato</h1> -->

<!-- 						<i class="fa fa-chevron-left"></i> Indietro -->
<!-- 					</a> -->
<!-- 					<h2 class="knitting-title"> -->
<!-- 						Olimpias Knitting - anno <span id="yearspan">2017</span> -->
<!-- 					</h2> -->

<!-- 					<div class="col-sm-12" id="selcter-month"> -->
<!-- 						<section> -->
<!-- 							Mese -->
<!-- 							<select id="month" onchange="getCER(this);"> -->



<!-- 							</select> -->

<!-- 							Anno -->
<!-- 							<select id="year" onchange="getCER(this)"> -->



<!-- 							</select> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 				</div> -->


<!-- 				<div class="col-sm-12"> -->
<!-- 					<div class="table-responsive" id="cinquepuntodue"> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
<!-- <div class="table-responsive" id="cinquepuntodue"></div> -->


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

<div id="dockbar" class="hide">
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
			<img src="/Images/C.Gestione/dockicon/print.svg" alt="icon">
		</button>
		<!--            <button uib-tooltip="Scarica" type="button"> -->
		
		<!--            </button> -->
	</div>
</div>
<input type="hidden" value="" id="param-start">
<script>
	function printf() {

		window.print();
	}
</script>
<script src="/Onlyou/ajax-pages/cinquepuntodue.js"></script>
<script>
$(document).ready(function() {
	prova();
});
document.body.style.zoom = "88%";
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

<div id = "right-navi">
<button type="button" class="right-toggle" onclick="rgtForce()">
	<span class="bullet one"></span>
	<span class="bullet two"></span>
	<span class="bullet three"></span>
</button>
<div class="user">
	<img src="/Images/Cuser-demo.png" alt="icon">
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
</body>
</html>
        <div>
        </div>
    </form>
</body>
</html>
