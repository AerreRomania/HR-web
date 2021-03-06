﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CE_Budget.aspx.cs"  Inherits="Views_ControloDiGestione_Tables_CE_Budget" %>
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
<link rel="stylesheet" href="../../css/font-awesome.min.css"/>
<link rel="stylesheet" href="../../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../../css/animate.min.css"/>
<link rel="stylesheet" href="../../css/style.css"/>
<link rel="stylesheet" href="../../css/datatable/datatables.bootstrap.css"/>
<link rel="stylesheet" href="../../css/datatable/datatables.min.css"/>

<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> -->
<link rel="stylesheet" type="text/css" href="../../css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="../../css/dataTables.bootstrap.min.css"/>
<script src="/Onlyou/js/jquery-2.1.0.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script> -->
<script src="/Onlyou/new/js/jquery.dataTables.min.js"></script>


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
<script src="/Onlyou/dashboard/js/app.js"></script>
<!-- MAIN APP END -->
<!-- MODULES -->

<script src="/Onlyou/dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body bgcolor="#F8F8FF">

	<style>

	 #fatturo,#valore,#consumi,#esterne,#lavorodiretto,#lavoroindiretto,#costiindustria,#costodelvenduto,#marginelordo,#indgenerale,#costicom,#speseg,#operativol,#leasing,#operativon,#ebit,#resercitio,#ires,#rnetto,#ebitda{
		 border-top:1px solid #000000;
		 border-bottom:1px solid #000000;
	 }

	 td{
		 border-right: 1px solid black;
	 }

	 #collapse{
		 border-collapse:collapse;
		border:1px solid ;
		border-top:none;
	
	 }

	 .col-sm-5{
		 margin-left:530px;
		 margin-bottom:5px;
	 }

	 .col-sm-12{
		 text-align:center;

	 }

	   body{
		  padding:20px 20px;
		font-family:'Trebuchet MS';
		color:#4a4a4a;
	}

	     .top-icons{
		float:right;
	 background-color:darkred;
	}

		 thead{
			 border:1px solid #D3D3D3;
		 }

	</style>


	<div class="container">

		<div class="">
			
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

		</div>
		<div class="">
			
<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Conto economico Budget</h1>
					
			
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno</b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: left;">
						<form action="/Onlyou/montly-balance"
							method="GET">

								Mese 
								<select id="month" name="month" onchange="this.form.submit()">
									
										<option value="1"selected >1</option>
									
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
									
								</select>
								Anno
								<select id="year" name="year" onchange="this.form.submit()">
									
										<option value="2017" >2017</option>
									
										<option value="2018" >2018</option>
									
										<option value="2019" >2019</option>
									
										<option value="2020" >2020</option>
									
										<option value="2021"selected >2021</option>
									
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
						</form>
					</div>
					
				</div>
				</br>
				<div class="col-sm-12">
					<div class="table-responsive">
						<table style="border-top:0px !important; border-right: none; border-left: none" id="monthly-balance"
							class="table table-bordered table-hover table-condensed"
							width="100%">
							
							<asp:Table ID="test" runat="server"></asp:Table>
				<table id="collapse" class="table table-bordered table-hover table-condensed version" width="100%">			
<thead>

	<div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
	
	<tr>
		<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"></th>
	
		
			<th style="padding: 0px; font-size: 10px;text-align:right; border-bottom: 1px solid black;border-left: none;border-right: none !important"></th>

		
			<th style="padding: 0px; font-size: 10px;margin-right:100px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>

		
		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>
		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>
		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>
		
	</tr>
	<tr>
		<!-- 		<th><span class="sr-only">Seleziona</span></th> -->
		<!-- 		<th -->
		<!-- 			style="border-top: 1px solid #ddd; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px;">Codice</th> -->
		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3; color:#F8F8FF;background-color: #F8F8FF; !important; border-right: 1px solid black; padding: 0px;">Conto economico al:<br>31/10/2017
		</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Gennaio</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Febbraio</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Marzo</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Aprile</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Maggio</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Giugno</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Luglio</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Agosto</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Settembre</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Ottobre</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Novembre</th>
		<th colspan="2" style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; width:95px;padding: 0px;">Dicembre</th>
		<th colspan="2" style="border-top: 1px solid black; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black;width:95px; padding: 0px;">Totale</th>
		<th colspan="2" style="border-top: 1px solid lightgray; border-bottom: none; background-color: white!important; border-right: 1px solid black; width:95px;padding: 0px;color:white;">Empty</th>
		<th id="over" colspan="2" style="border-top: 1px solid black; border-bottom: 2px solid #FFFFFF ; background-color: lightgray!important;width:95px; border-right: 1px solid transparent; padding: 0px;">Prog </br> Cons</th>
	</tr>
	<tr>

		<th style="border-top: 1px solid #000000;border-bottom: 1px solid #000000; background-color: #F8F8FF !important; border-right: 1px solid black; padding-bottom: 25px; font-size: 11px;"></th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000; border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd; border-bottom: 1px solid #000000; border-bottom: 1px solid #000000; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">%</th>
		<td style="border-right: none;background-color:#FFFFFF;"></td>
		<td style="background-color:#FFFFFF;"></td>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: lightgray !important; border-right: 1px solid black; padding: 0px; font-size: 11px;">Val</th>
		<th style="border-top: 1px solid #ddd;border-bottom: 1px solid #000000;  background-color: lightgray !important; border-right: 1px solid transparent; padding: 0px; font-size: 11px;">%</th>

	</tr>
</thead>
<tbody>
	
		<tr>
			
				
				
				
					<td>  F.to Gruppo c/lavoro</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>
								
			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>


		</tr>
	
		<tr>
			
				
				
				
					<td>  F.to Benetton c/lavoro</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
			
		</tr>

		<tr>
			
				
				
				
					<td>  F.to Terzi netto c/lavoro</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  F.to Gruppo c/vendita</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  F.to Benetton c/vendita</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  F.to Terzi netto c/vendita</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  F.to Sottoprodotti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="fatturo">
			
				
					<td  style="background-color:#CFEACF;"> TOT. FATTURATO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Delta Rimanenze</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="valore">
			
				
					<td style="background-color:#CFEACF;">  VALORE PRODUZIONE</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
		
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consumi materia prima</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
						
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consumi coloranti/ingredienti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td> Trasporti su acquisti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>Costi Accessori di Acquisto</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="consumi">
			
				
				
				
					<td style="background-color:#CFEACF;">  TOT. CONSUMI</td>
					
						
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>

			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Tessitura</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Confezione</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Stiro</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Finissaggio</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Altre lavorazioni</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Tintoria</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Stampe</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Rammendo</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ricami</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Trasporti su lavorazioni esterne</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="esterne"   style="background-color:#CFEACF;">
			
				
				
				
					<td> TOTALE LAVORAZIONI ESTERNE</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
					
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr  id="lavorodiretto" style="background-color:#CFEACF;">
			
				
				
				
					<td> LAVORO DIRETTO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
	
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr id="lavoroindiretto"   style="background-color:#CFEACF;">
			
				
				
				
					<td> LAVORO INDIRETTO</td>
					
				
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
														
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Energia elettrica</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Metano</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manutenzione industriale</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manutenzione struttura</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Mat. di consumo</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Depuratore/Acquedotto</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Smaltimento rifiuti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consumi Imballi e Sussidiarie</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Prestazioni di lavoro esterno</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Trasporti Bnt</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Altri costi di prod.ne</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="costiindustria" style="background-color:#CFEACF;">
			
				
				
				
					<td> TOTALE ALTRI COSTI INDUSTRIALI</td>
					
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
		
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr  id="costodelvenduto" style="background-color:#CFEACF;">
			
				
				
				
					<td> TOTALE COSTO DEL VENDUTO</td>
				
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
							
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr id="marginelordo" style="background-color:#CFEACF;">
			
				
				
				
					<td> MARGINE INDUSTRIALE LORDO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Costo pers. commerciale</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Costo pers. Gen. Amm</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Coto pers. Gruppo</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>	

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="indgenerale" style="background-color:#CFEACF;">
			
				
				
				
					<td> LAVORO IND. GENERALE</td>
					
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Pubblicita'/ Promotion</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Provvigioni/ Enasarco</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>	

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

				<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Trasporti commerciali terzi</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consulenza Commerciali</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Altre Commerciali</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="costicom" style="background-color:#CFEACF;">
			
				
				
				
					<td> TOT. COSTI COMMERCIALI</td>
					
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Assicurazioni</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consulenza</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manut. automezzi</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manut. macch.ufficio</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Sindaci</td>
					
						
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amministratori</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>

			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Pulizia uffici</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Postelegrafoniche</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		
							
		</tr>
	
		<tr>
			
				
				
				
					<td>  Cancelleria</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Rappres.,viaggi,diarie</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Spese varie</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Spese varie Gruppo</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="speseg" style="background-color:#CFEACF;">
			
				
				
				
					<td> TOT. SPESE GENERALI</td>
					
				
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr  id="operativol"style="background-color:#CFEACF;">
			
				
				
				
					<td> RISULTATO OPERATIVO LORDO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amm.Imm.tecniche</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amm.Imm.Immateriali</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Locazioni/ Affitto</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti rivalutazione</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti Gruppo</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti anticipati</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr  id="leasing" style="background-color:#CFEACF;">
			
				
				
				
					<td> TOTALE AMM./LEASING</td>
				
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr  id="operativon" style="background-color:#CFEACF;">
			
				
				
				
					<td> RISULTATO OPERATIVO NETTO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Plusvalenze cespiti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Minusvalenze cespiti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Acc. F.do Sval.crediti</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Perdite su crediti</td>
			
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Indennizzi assicurativi</td>
			
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Oneri diversi</td>
					

									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Proventi diversi</td>
			
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Correttivo gruppo</td>
			
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="ebit" style="background-color:#CFEACF;">
			
				
				
				
					<td> E.B.I.T</td>
					
				
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>  Oneri e proventi finanziari</td>
			
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="resercitio"style="background-color:#CFEACF;";">
			
				
				
				
					<td> RISULTATO DI ESERCIZIO</td>
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>Irap</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr  id="ires" style="background-color:#CFEACF;">
			
				
				
				
					<td>RISULTATO MESE ANTE IRES</td>
					
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
		<tr>
			
				
				
				
					<td>Ires</td>
					
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
							
									<td style="border-right: 1px solid black;"> %</td>
								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>

								<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
							
									<td style="border-right: 1px solid black;"> %</td>
								
							<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
									<td style="border-right: 1px solid black;">%</td>
								
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
							
									<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>
								
			<td style="border-right: 1px solid black;">0.0</td>
								
								
									<td style="border-right: 1px solid black;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#e6e6e6;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#e6e6e6;"> %</td>
		</tr>
	
		<tr id="rnetto"  style="background-color:#CFEACF;">
			
				
				
				
					<td>RISULTATO NETTO</td>
					
	
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

			<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;background-color:#FFFFFF;"> </td>

			<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>

	
	
		

	<tr id="ebitda" style="background-color:#CFEACF;">
			
				
				
				
					<td>E.B.I.T.D.A.</td>
					
					
									<td style="border-top:1px solid #000000;background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> 0%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
						
									<td style="background-color:#CFEACF;">0.0</td>
					
									<td style="background-color:#CFEACF;">%</td>
							
									<td style="background-color:#CFEACF;">0.0</td>
						
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;">0.0</td>
							
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;">%</td>
								
									<td style="background-color:#CFEACF;"> 0.0</td>
								
									<td style="background-color:#CFEACF;"> %</td>

		<td style="border-right:none;border-top:1px solid transparent;border-bottom:1px solid lightgray;background-color:#FFFFFF;"></td>
								
								
									<td style="border-right:none;border-top:1px solid transparent;border-bottom:1px solid lightgray;background-color:#FFFFFF;"> </td>

		<td style="border-right:none;background-color:#CFEACF;">0.0</td>
								
								
									<td style="border-right:1px solid transparent;background-color:#CFEACF;"> %</td>
		</tr>
	
</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
    $(window).on("scroll", function () {
        var scrollHeight = $(document).height();
        var scrollPosition = $(window).height() + $(window).scrollTop();
        if ((scrollHeight - scrollPosition) / scrollHeight != 0) {

            document.getElementById("dockbar").className = "hide";
        }
    });

    $(window).on("scroll", function () {
        var scrollHeight = $(document).height();
        var scrollPosition = $(window).height() + $(window).scrollTop();
        if ((scrollHeight - scrollPosition) / scrollHeight === 0) {

            document.getElementById("dockbar").className = "";
        }
    });
    function setChange(value, month) {
        var year = document.getElementById("year").value;
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/Onlyou/SetMontlyChange', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            document.getElementById(tablepage).innerHTML = this.responseText;
        };
        xhr.send('month=' + month + '&value=' + value.value + '&year=' + year);
    }
</script>
<div id="dockbar" class="hide">
	<div class="scroll-container">
	
	</div>
</div>
<input type="hidden" value="" id="param-start">
<script>
    $(document).ready(function () {

        if ($.fn.dataTable.isDataTable('#monthly-balance')) {
            table = $('#monthly-balance').DataTable();
            table.destroy();
        } else {
            table = $('#monthly-balance').DataTable({
                scrollY: "750px",
                scrollX: true,
                scrollCollapse: true,
                paging: false,
                fixedColumns: {
                    leftColumns: 0
                },
                "searching": false,
                "info": false,
                "ordering": false,
            });
        }
    });
</script>
<script>
    function printf() {
        window.print();
    }
</script>
		</div>
		<div class="">
			



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
        };
    </script>
</body>
</html>