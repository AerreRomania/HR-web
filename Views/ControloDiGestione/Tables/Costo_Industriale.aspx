<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costo_Industriale.aspx.cs"  Inherits="Views_ControloDiGestione_Tables_Costo_Industriale" %>
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
<body style="background-color:#f4f4f4;">

	

	<style>

	

	 .top-icons{
		float:right;
				background-color:darkred;
	}

	.detail{
		width:100%;
	}
	 

	

	 td{
		 border-right: 1px solid black;
	 }

	 #collapse{
		 border-collapse:collapse;
		border:1px solid #D3D3D3;

		}

	 .col-sm-5{
		 margin-left:530px;
		 margin-bottom:5px;
	 }

	 .col-sm-12{
		 text-align:center;
	/*	 width:100%;*/
	 }

	    body {
	        padding: 20px 20px;
	        font-family: 'Trebuchet MS';
	        color: #4a4a4a;
	    }
	
	</style>
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




		</div>
		<div class="">
			



<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Calcolo costo industriale</h1>

			
					<div style="display: inline-block;float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno 2018</b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: left;">
						<form action="/Onlyou/montly-balance"
							method="GET">

							<section style="margin-left:-100px;margin-top:5px;">
                                Mese
                                <select id="month" name="month" onchange="this.form.submit()">
                                    
                                        <option value="1" >1</option>
                                    
                                        <option value="2" >2</option>
                                    
                                        <option value="3" selected>3</option>
                                    
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
							<section style="margin-left:200px;margin-top:-20px;">
								Anno <select id="year" name="year" onchange="this.form.submit()">
									
										<option value="2017" selected>2017</option>
									
										<option value="2018" >2018</option>
										<option value="2019" >2019</option>
										<option value="2020" >2020</option>
										<option value="2021" >2021</option>
									
								</select>
							</section>
						</form>
					</div>
					
				</div>
				</br>
				</br>
				<div class="col-sm-12">
					<div class="table-responsive">
						<table style="/*border-top:0px !important;*/ border-right: none; border-left: none" id="monthly-balance"
							class="table table-bordered table-hover table-condensed"
							width="100%">
							

				<table id="collapse" class="table table-bordered table-hover table-condensed version" width="100%;">			
<thead>
	<tr>
		<!-- 		<th -->
		<!-- 			style="border-top: 1px solid #ddd; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px;"></th> -->
		<%--<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important">Cambio mese:</th>--%>
	
		
<%--			<th style="padding: 0px; font-size: 10px;text-align:right; border-bottom: 1px solid black;border-left: none;border-right: none !important"></th>--%>

		
			<%--<t--%><%--h style="padding: 0px; font-size: 10px; border-right: none !important" colspan="2"></th>--%>
		<%--	<th style="padding: 0px; font-size: 10px;margin-right:100px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>%>


		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>

		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2">0.00</th>--%>

		
		
		<%--	<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>
		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>
		
			<th style="padding: 0px; font-size: 10px; border-bottom: 1px solid black;border-left: none;border-right: none !important"colspan="2"></th>--%>
		
	</tr>

	<div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>

	<tr>
		<!-- 		<th><span class="sr-only">Seleziona</span></th> -->
		<!-- 		<th -->
		<!-- 			style="border-top: 1px solid #ddd; background-color: #CFEACF !important; border-right: 1px solid black; padding: 0px;">Codice</th> -->
		<th style="color:#6495ED;width:300px;border-top: 1px solid #d3d3d3;border-bottom: 1px solid #FAFAD2; background-color: #FAFAD2!important; border-right: 1px solid black;">CALCOLO COSTO INDUSTRIALE </br> per Reparto<br>31/10/2017
		</th>
		<th style="width:198px;border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3; background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 0px;">Tessitura</th>
		<th style="width:198px;border-top: 1px solid #D3D3D3; border-bottom: 1px solid #D3D3D3; background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 0px;">Confezione </th>
		<th style="width:198px;border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3;  background-color: #FAFAD2 !important; border-right: 1px solid black; padding: 0px;">Stiro</th>
		<th style="width:198px;border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3;  background-color: #FAFAD2 !important; border-right: 1px solid black; padding: 0px;">Totale</th>
		<th style="width:198px;border-top: 1px solid #D3D3D3;border-bottom: 1px solid #D3D3D3; color:#FAFAD2; background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 0px;">Empty</th>

	</tr>
	<tr>

		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000; background-color: #FAFAD2 !important; border-right: 1px solid #000000; padding: 10px; font-size: 11px;"></th>
		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 10px; font-size: 11px;">valore</th>
		<th style="border-top: 1px solid #D3D3D3; border-bottom: 1px solid #000000; background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 10px; font-size: 11px;">%</th>
		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #FAFAD2 !important; border-right: 1px solid #000000; padding: 10px; font-size: 11px;">valore</th>
		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #FAFAD2 !important; border-right: 1px solid black; padding: 10px; font-size: 11px;"></th>
		<th style="border-top: 1px solid #D3D3D3;border-bottom: 1px solid #000000;  background-color: #FAFAD2 !important; border-right: 1px solid #D3D3D3; padding: 10px; font-size: 11px;"></th>
	
</thead>
<tbody>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #D3D3D3;">  Ore macchina(funzionamento macchina)</td>
					
						
							
								
									<td style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #D3D3D3;">0.00</td>
								
								
							
							<td style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #D3D3D3;"> 0.00</td>
						
					<td style="border-right: 1px solid #000000;border-bottom:1px solid #d3d3d3;"> 0.00</td>
						
								
									<td style="border-right: 1px solid #000000;border-bottom:1px solid #d3d3d3;"> 0.00</td>
								
							
								
									<td style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #D3D3D3;"> 0.00</td>
								
					
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #D3D3D3;">  Ore uomo</td>

			<td style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #D3D3D3;"> 0.0</td>
					
									<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;">0.0</td>
								
									<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #000000;">0.0</td>
								
									<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #000000;"> 0.0</td>
									<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
				
		</tr>

		<tr>
	
					<td style="border-bottom:1px solid #D3D3D3;">  Efficienza diretti lorda</td>
					
						
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
							
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
									<td style="border-bottom:1px solid #D3D3D3;">0.0</td>
								
								
									<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #D3D3D3;">  Giorni lavorati</td>
					
						
							
								
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
									<td style="border-bottom:1px solid #D3D3D3;">0.0</td>
								
								
									<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #D3D3D3;">  quantita/giorno</td>
					
						
							
								
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
							
							
						
					
						
							
								
									<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #000000;">  Prezzo medio</td>
					
						
							
								
									<td style="border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;"> 0.0</td>
								
								<td style="border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;"> 0.0</td>
								
						<td style="border-bottom:1px solid #000000;"> 0.0</td>
<td style="border-bottom:1px solid #000000;"> 0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #D3D3D3;"> Ricavi C.to Lavoro Benetton</td>

					<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
						<td style="border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
							<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>
								
							<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>

						<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>

	
			
		</tr>
	
		<tr id="fatturo">
			
				
				
				
					<td  style=" border-bottom:1px solid #D3D3D3;"> Ricavi C.to Lavoro Intercompany</td>
					
						
							
								
									<td style="border-bottom:1px solid #D3D3D3;border-top:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;"> 0.0</td>
								
							
							
						<td style=" border-bottom:1px solid #D3D3D3;"> 0.0</td>
					
						
							
								
									<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
										<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>

		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Ricavi C.to Lavoro Terzi</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

									<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>

		
		</tr>
	
		<tr id="valore">
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">  Vendita capi</td>
					
				<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
			<td style=" border-bottom:1px solid #000000">0.0</td>
								
			<td style=" border-bottom:1px solid #000000;">0.0</td>

									<td style="border-right: 1px solid #D3D3D3;"> 0.0</td>

								
					
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">TOTALE FATTURATO</td>
					
						
					<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
			<td style=" border-bottom:1px solid #000000;">0.0</td>
								
					
									<td style=" border-bottom:1px solid #000000;"> 0.0</td>
								
							
												<td style="border-right: 1px solid #D3D3D3;"> 0.0</td>

					
				
			
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;"> Variazione magazzini Rf Wip</td>
					
					<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
		<td style=" border-bottom:1px solid #000000;">0.0</td>
								
	<td style=" border-bottom:1px solid #000000;">0.0</td>
								
			<td style="border-right: 1px solid #D3D3D3;"> 0.0</td>
							
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;"> VALORE PRODUZIONE</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;background-color:#00BFFF;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #D3D3D3;"> 0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;color:red;">COSTI DIRETTI INDUSTRIALE</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
						
		</tr>
	
		<tr id="consumi">
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #000000;">  VARIABILI</td>
					
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>

						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Consumi filato e accessori x vendita</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
			<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
		<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
								
		
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Consumo filato separazione</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
		<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Vendite materiali vari</td>
					
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
		<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
				
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;"> Costi accessori aquisto</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;">0.0</td>
								
				<td style=" border-bottom:1px solid #000000;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">TOTALE CONSUMI</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;">0.0</td>
								
			<td style=" border-bottom:1px solid #000000;background-color:#00BFFF;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #000000;"> 0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Lavorazioni Esterne</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
				<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #000000;"> 0.0</td>0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
								
							
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Manodopera Diretta</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
						<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;"> Materiali di consumo</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
		<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
	<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Metano</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
				
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;"> Energia Elettrica</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;">0.0</td>
								
			<td style=" border-bottom:1px solid #000000;">0.0</td>
								
	
			<td style="border-bottom:1px solid #000000;border-right: 1px solid #D3D3D3;"> 0.0</td>
		</tr>
	
		<tr id="esterne">
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">TOTALE COSTI DIRETTI VARIABILI</td>
					
									<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
					
									<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;"> 0.0</td>
							
									<td style=" border-bottom:1px solid #000000;">0.0</td>
								
								
									<td style=" border-bottom:1px solid #000000;"> 0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #000000;"> 0.0</td>
								
			
		</tr>
	
		<tr  id="lavorodiretto">
			
				
					<td style="background-color:#FFA500;">margine industriale variabile</td>
					
								<td style="background-color:#FFA500;border-right:1px solid #D3D3D3;">0.0</td>
					
									<td style="background-color:#FFA500;border-right:1px solid #D3D3D3;"> 0.0</td>
								
									<td style="background-color:#FFA500;">0.0</td>

					<td style="background-color:#FFA500;background-color:#00BFFF;"> 0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #000000;"> 0.0</td>
								
			
		</tr>
	
		<tr id="lavoroindiretto">
			
					<td  style="background-color:#98FB98;">Costo orario variabile</td>
					
						<td style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style="background-color:#98FB98;">0.0</td>
								
			<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>
								
					<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>

		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">FISSI</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

				<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;"> Manodopera indiretta</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
								<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Manutenzioni industriali</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>

		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;"> Altri costi di produzione</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
								
				
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Ammortamenti</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
			<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

		
					<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Consulenze Tecniche</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
		<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
			<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #D3D3D3;">Manodopera Servizi + IT</td>
					
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>
								
				<td style=" border-bottom:1px solid #D3D3D3;">0.0</td>

			<td style="border-bottom:1px solid #D3D3D3;border-right: 1px solid #D3D3D3;"> 0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">Affitti ( spazi + distaccati ) netto</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
							<td style=" border-bottom:1px solid #000000;">0.0</td>
								
					<td style=" border-bottom:1px solid #000000;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #D3D3D3;"> 0.0</td>
							
		</tr>
	
		<tr>
			
				
				
				
					<td style=" border-bottom:1px solid #000000;">TOTALE COSTI DIRETTI FISSI</td>
					
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;">0.0</td>
								
						<td style=" border-bottom:1px solid #000000;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #000000;"> 0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #000000;background-color:#FFA500;">margine industriale diretto</td>
					
						<td style="border-bottom:1px solid #000000;background-color:#FFA500;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td style="border-bottom:1px solid #000000;background-color:#FFA500;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style="border-bottom:1px solid #000000;background-color:#FFA500;">0.0</td>
								
						<td style="border-bottom:1px solid #000000;background-color:#FFA500;background-color:#00BFFF;">0.0</td>

			<td style="border-bottom:1px solid #000000;border-right: 1px solid #000000;"> 0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td   style="background-color:#98FB98;"> Costo orario fissi</td>
					
						<td   style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td   style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>

						<td   style="background-color:#98FB98;">0.0</td>

						<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #000000;">0.0</td>
								
					<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;">0.0</td>
								
					
		</tr>
	
		<tr id="costiindustria">
			
				
				
				
					<td  style="background-color:#98FB98;"> COSTO ORARIO DIRETTI</td>
					
						<td  style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>
								
					<td  style="background-color:#98FB98;border-right:1px solid #D3D3D3;"> 0.0</td>
								
			<td  style="background-color:#98FB98;">0.0</td>
								
		<td style="border-bottom:1px solid #D3D3D3;"> 0.0</td>

			<td style="border-bottom:1px solid #d3d3d3;border-right: 1px solid #D3D3D3;"> 0.0</td>
		
		</tr>
	
		<tr  id="costodelvenduto">
			
				
				
				
					<td style="color:red;">TARIFA MEDIA PAGATA</td>
					
						<td style="border-right:1px solid #D3D3D3;"></td>
								
						<td  style="border-right:1px solid #D3D3D3;"></td>
								
					<td  style="border-right:1px solid #000000;"></td>
			<td  style="border-right:1px solid #000000"></td>

								<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;">0.0</td>

				
		</tr>
	
		<tr id="marginelordo">
			
				
				
				
					<td style="background-color:#98FB98;"> margine industriale diretto</td>
					
						<td style="background-color:#98FB98;border-right:1px solid #D3D3D3;">0.0</td>
								
						<td style="background-color:#98FB98;border-right:1px solid #D3D3D3;">  0.0</td>
								
						<td style="background-color:#98FB98;"> 0.0</td>
								
					<td style="background-color:#98FB98;">  0.0</td>

								<td   style=" border-bottom:1px solid #000000;border-right:1px solid #d3d3d3;">0.0</td>

			
		</tr>
	
		<tr>
			
				
				
				
					<td style="border-bottom:1px solid #000000;">TOTALE COSTI STRUTTURA</td>
					<td  style="border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
				<td  style="border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
			<td  style="border-bottom:1px solid #000000;">  0.0</td>
								
		<td  style="border-bottom:1px solid #000000;">  0.0</td>

								<td   style=" border-bottom:1px solid #000000;border-right:1px solid #000000;">0.0</td>

							
		</tr>
	
		<tr>
			
				
				
				
					<td  style="background-color:#98FB98;border-bottom:1px solid #000000;"> Costo orario Struttura</td>
					
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>
								
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>

								<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;">0.0</td>

					
		</tr>
	
		<tr>
			
				
				
				
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;">Costo orario Full Cost</td>
					
						<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
				<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>
								
				<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>

								<td   style=" border-bottom:1px solid #000000;border-right:1px solid #d3d3d3;">0.0</td>

								
		</tr>
	
		<tr id="indgenerale">
			
				
				
				
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;">Utile ante imposte</td>
					
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;"> 0.0</td>
								
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;"> 0.0</td>
								
				<td style="background-color:#98FB98;border-bottom:1px solid #000000;"> 0.0</td>
								
			<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>

								<%--<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;">0.0</td>--%>

			<td   style=" border-bottom:1px solid #000000;border-right:1px solid #000000;">0.0</td>
		</tr>
	
		<tr>
			
				
				
				
					<td style="background-color:#98FB98;border-bottom:1px solid #000000;">Utile netto</td>
					
						<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
						<td style="background-color:#98FB98;border-bottom:1px solid #000000;border-right:1px solid #D3D3D3;">  0.0</td>
								
						<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>
								
						<td style="background-color:#98FB98;border-bottom:1px solid #000000;">  0.0</td>

								<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;">0.0</td>

						
		</tr>
	
		<tr>
			
				
				
				
					<td style="color:red;border-bottom:1px solid #d3d3d3;">COSTI INDIRETTI INDUSTRIALI</td>
					
						<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;"  0.0</td>
								
						<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;" 0.0</td>
								
						<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;"  0.0</td>
								
						<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;"  0.0</td>

			<td   style=" border-bottom:1px solid #D3D3D3;border-right:1px solid #d3d3d3;"
					
		</tr>
	
		<tr>
			
			<%--	
				
				
					<td>  Trasporti commerciali terzi</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
								<td>  0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consulenza Commerciali</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
				
		</tr>
	
		<tr>
			
				
				
				
					<td>  Altre Commerciali</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
				<td>  0.0</td>
				
		</tr>
	
		<tr id="costicom">
			
				
				
				
					<td> TOT. COSTI COMMERCIALI</td>
					
						<td> 0.0</td>
								
					<td>  0.0</td>
								
		<td> 0.0</td>
		<td>  0.0</td>
		
		</tr>
	
		<tr>
			
				
				
				
					<td>  Assicurazioni</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>>
								
								<td>  0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td>  Consulenza</td>
					
						<td>  0.0</td>
								
							<td>  0.0</td>
								
						<td>  0.0</td>
								
								<td>  0.0</td>
								
			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manut. automezzi</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
						<td>  0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Manut. macch.ufficio</td>
					
						<td>  0.0</td>
								
							<td>  0.0</td>
								
						<td>  0.0</td>
								
								<td>  0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td>  Sindaci</td>
					
						<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amministratori</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
						<td>  0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Pulizia uffici</td>
					
					<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Postelegrafoniche</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
					<td>  0.0</td>
							
		</tr>
	
		<tr>
			
				
				
				
					<td>  Cancelleria</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Rappres.,viaggi,diarie</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
						
		</tr>
	
		<tr>
			
				
				
				
					<td>  Spese varie</td>
					
						<td>  0.0</td>
								
								<td>  0.0</td>
								
				<td>  0.0</td>
								
		<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Spese varie Gruppo</td>
					
						<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
		</tr>
	
		<tr id="speseg">
			
				
				
				
					<td> TOT. SPESE GENERALI</td>
					
					<td> 0.0</td>
								
					<td>  0.0</td>
								
				<td> 0.0</td>
								
			<td>  0.0</td>
								
		
		</tr>
	
		<tr  id="operativol">
			
				
				
				
					<td> RISULTATO OPERATIVO LORDO</td>
					
						
							
								
									<td>0.0</td>
					<td> 0.0</td>
				<td>0.0</td>
								
			<td> 0.0</td>
			
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amm.Imm.tecniche</td>
					
				<td>  0.0</td>
								
				<td>  0.0</td>
								
				<td>  0.0</td>
								
				<td>  0.0</td>
							
		</tr>
	
		<tr>
			
				
				
				
					<td>  Amm.Imm.Immateriali</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
				<td>  0.0</td>
								
			<td>  0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Locazioni/ Affitto</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
					<td>  0.0</td>
								
				
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti rivalutazione</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti Gruppo</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
				<td>  0.0</td>
								
				<td>  0.0</td>
								
							
		</tr>
	
		<tr>
			
				
				
				
					<td>  Ammortamenti anticipati</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
								<td>  0.0</td>
								
		</tr>
	
		<tr  id="leasing">
			
				
				
				
					<td> TOTALE AMM./LEASING</td>
					
				<td>0.0</td>
								
				<td> 0.0</td>
								
			<td>0.0</td>
								
	<td> 0.0</td>
	
		</tr>
	
		<tr  id="operativon">
			
				
				
				
					<td> RISULTATO OPERATIVO NETTO</td>
					
						<td>0.0</td>
								
					<td> 0.0</td>
								
			<td>0.0</td>
								
		<td> 0.0</td>
		
		</tr>
	
		<tr>
			
				
				
				
					<td>  Plusvalenze cespiti</td>
					
						<td>  0.0</td>
								
				<td>  0.0</td>
								
					<td>  0.0</td>
								
					<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Minusvalenze cespiti</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
				<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Acc. F.do Sval.crediti</td>
					
						<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
								<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Perdite su crediti</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
					<td>  0.0</td>
						
		</tr>
	
		<tr>
			
				
				
				
					<td>  Indennizzi assicurativi</td>
					
						<td>  0.0</td>
								
								<td>  0.0</td>
								
							<td>  0.0</td>
								
						<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Oneri diversi</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
								<td>  0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>  Proventi diversi</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
						<td>  0.0</td>
								
								<td>  0.0</td>
					
		</tr>
	
		<tr>
			
				
				
				
					<td>  Correttivo gruppo</td>
					
						<td>  0.0</td>
								
					<td>  0.0</td>
								
						<td>  0.0</td>
								
						<td>  0.0</td>
								
		</tr>
	
		<tr id="ebit">
			
				
				
				
					<td> E.B.I.T</td>
					
				<td>0.0</td>
								
<td> 0.0</td>
								
<td>0.0</td>
								
<td> 0.0</td>
		
		</tr>
	
		<tr>
			
				
				
				
					<td>  Oneri e proventi finanziari</td>
					
					<td>  0.0</td>
								
						<td>  0.0</td>
								
					<td>  0.0</td>
								
				<td>  0.0</td>
								
		</tr>
	
		<tr id="resercitio">
			
				
				
				
					<td> RISULTATO DI ESERCIZIO</td>
					
						
							
								
									<td>0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td> 0.0</td>
								
							
							
						
					
						
							
								
									<td>0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td> 0.0</td>
								
		</tr>
	
		<tr>
			
				
				
				
					<td>Irap</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
							<td>  0.0</td>
								
								
		</tr>
	
		<tr  id="ires">
			
				
				
				
					<td>RISULTATO MESE ANTE IRES</td>
					
						<td>0.0</td>
								
			<td> 0.0</td>
								
	<td>0.0</td>
								
<td> 0.0</td>
	
		</tr>
	
		<tr>
			
				
				
				
					<td>Ires</td>
					
						<td>  0.0</td>
								
						<td>  0.0</td>
								
							<td>  0.0</td>
								
								<td>  0.0</td>
								
		</tr>
	
		<tr id="rnetto">
			
				
				
				
					<td>RISULTATO NETTO</td>
					
		<td>0.0</td>
								
<td> 0.0</td>
								
<td>0.0</td>
								
<td> 0.0</td>
				
		</tr>--%>

<%--	<tr>
			
				
					<td style="height: 15px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>
					
						<td style="height: 10px !important; background-color: #FFFFFF !important; border-bottom: 1px solid black !important; border-top: 1px solid black !important; border-right: none !important"></td>

		</tr>--%>
	
		<%--<tr>

					<%--<td>E.B.I.T.D.A</td>--%>
		
							<%--		<td style="background-color: rgba(0, 0, 0, 0.1);">0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td style="background-color: rgba(0, 0, 0, 0.1);"> 0.0</td>
								
							
							
						
					
						
							
								
									<td style="background-color: rgba(0, 0, 0, 0.1);">0.0</td>
								
								
							
							
						
					
						
							
								
								
									<td style="background-color: rgba(0, 0, 0, 0.1);"> 0.0</td>
								
								
		</tr>--%>

	
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
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
	<%--	<button type="button" onclick="openModalShare()">
			<img
				src="/Images/C.Gestione/dockicon/check.svg"
				alt="icon">
		</button>
		<button type="button" onclick="openModalPriority()">
			<img
				src="/Images/C.Gestione/dockicon/remind.svg"
				alt="icon">
		</button>--%>
		<!--            <button uib-tooltip="Zoom" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Carica" type="button"> -->
		
		<!--            </button> -->
	<%--	<button type="button" onclick="printf()">
			<img
				src="/Images/C.Gestione/dockicon/print.svg"
				alt="icon">
		</button>--%>
		<!--            <button uib-tooltip="Scarica" type="button"> -->
		
		<!--            </button> -->
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
	//getData();
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
</button>
<div class="user">
	<img src="/Onlyou/dashboard/images/user-demo.png" alt="icon">
	<span>Carlo Alberto della Siega</span>
	<a href="#" class="btn btn-wire">Logout</a>
</div>--%>
<%--<nav class="user-navi">
	<ul>
		<li>--%>
			<%--<a href="#">Il mio profilo</a>
		</li>
		<li>
			<a href="#">Impostazioni</a>
		</li>
		<li>
			<a href="#">Contatta l'assistenza</a>
		</li>
		<li>--%>
	<%--		<a href="#">Preferenze</a>
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
    </script>
</body>
</html>