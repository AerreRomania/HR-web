<%--<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Main.aspx.vb" ClientIDMode="Static" Inherits="Views_ControloDiGestione_Tables_ContoEconomicoprogress_ContoEconomicoProgressivo" %>--%>
<%@ Page Language="C#" AutoEventWireup="false" CodeFile="CE_Progressivo.aspx.cs" Inherits="Views_ControloDiGestione_Tables_CE_Progressivo" %>


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
<link rel="stylesheet" href="../..//css/animate.min.css">
<link rel="stylesheet" href="../..//new/css/style.css">
<link rel="stylesheet" href="../..//css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="../..//css/datatable/datatables.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> -->
<link rel="stylesheet" type="text/css" href="../../css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="../../css/dataTables.bootstrap.min.css"/>
<script src="./js/jquery-2.1.0.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.datatables.net/v/bs/dt-1.10.16/fc-3.2.4/fh-3.1.3/r-2.2.1/datatables.min.js"></script> -->
<script src="./new/js/jquery.dataTables.min.js"></script>
<script src="./js/chart.bundle.min.js"></script>
<script src="./js/angular.min.js"></script>
<script src="./js/angular-ui-router.min.js"></script>
<script src="./js/angular-animate.min.js"></script>
<script src="./js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./dashboard/js/app.js"></script>


<script src="./dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="./dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="./dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
</head>
<body style="background-color:#F8F8FF">
	


	<div class="container">

		<div class="">
			



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>

	body{
		font-family:'Trebuchet MS';
		color:#4a4a4a;
	}

	#cinquepuntoquattro{
		border-collapse:collapse;
		border:1px solid;
	}
.col-sm-12{
		text-align:center;
	}
	

	th{
		color:#696969;
		    font-weight: normal;
		font-size:13px;
		font-family:italic;
	}

	#cer{
		font-style:arial;
		font-size:18px;
	}

	thead{
		border:1px solid;
	}

.top-icons{
		float:right;
				background-color:darkred;

	}

</style>
		
    


    

<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1 style="font-style:bold;" id="title">   Conto economico a costo del venduto</h1>

							Mese 
								<select id="month" name="month" onchange="this.form.submit()">
									
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
									
								</select>
								Anno
								<select id="year" name="year" onchange="this.form.submit()">
									
										<option value="2017" >2017</option>
									
										<option value="2018" selected>2018</option>
									
										<option value="2019" >2019</option>
									
										<option value="2020" >2020</option>
									
										<option value="2021" >2021</option>
									
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
							<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
				<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version" width="100%">
					
					



<thead>
	<tr id="cer">
		</br>
		<th style="background-color: #d9d9d9; border-right: 1px solid black;padding-top:20px;font-weight:bold;font-size:15px;">Conto Economico Riclassificato</th>
		<th style="background-color: #d9d9d9; border-right: 1px solid black; font-weight:bold;font-size:15px;"colspan="2">Progressivo Precedente</th>
		<th style="background-color: #CFEACF; border-right: 1px solid black;font-weight:bold;font-size:15px;" colspan="2">Mese Corrente</th>
		<th style="background-color: #d9d9d9; font-weight:bold;font-size:15px;" colspan="2">Progressivo Attuale</th>
	</tr>

	  <div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
	</br>
	
	<tr>
		<th style="background-color: #d9d9d9; border-right: 1px solid black;border-top: 1px solid black; border-bottom: 1px solid black; padding: 0px;font-weight:bold;font-size:15px;"">Apr-2018</th>

		<th style="background-color: #d9d9d9; border-right: 1px solid black; border-top: 1px solid black; border-bottom: 1px solid black;padding: 0px; font-weight:bold;font-size:15px;"">Valore
		</th>
		<th style="background-color: #d9d9d9; border-right: 1px solid black; border-top: 1px solid black; border-bottom: 1px solid black;padding: 0px; font-weight:bold;font-size:15px;"">%</th>

		<th style="background-color: #CFEACF; border-right: 1px solid black;border-top: 1px solid black; border-bottom: 1px solid black; padding: 0px;font-weight:bold;font-size:15px;"">- Apr-2018
		</th>
		<th style="background-color: #CFEACF; border-right: 1px solid black; border-top: 1px solid black; border-bottom: 1px solid black;padding: 0px;font-weight:bold;font-size:15px;"">%</th>

		<th style="background-color: #d9d9d9; border-right: 1px solid black;border-top: 1px solid black; border-bottom: 1px solid black; padding: 0px;font-weight:bold;font-size:15px;"">Valore
		</th>
		<th style="background-color: #d9d9d9; border-right: 1px solid black;border-top: 1px solid black; border-bottom: 1px solid black;padding: 0px;font-weight:bold;font-size:15px;"">%</th>
		</tr>
	
	
<tbody>
	
		<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid black";colspan="2">Vendite a terzi</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid black; colspan="2">234.0</th>
	</tr
	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid black;  colspan="2">Vendite a Benetton</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid black;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid black; colspan="2">234.0</th>
	</tr>
	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">Vendite a gruppo</th>
			<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
				<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
				<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
				<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
				<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
				<th style="background-color: #FFFFFF; border-right: 1px solid black;  colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; padding-top:15px;  colspan="2">RICAVI TIPICI</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black;border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">Vendite Scarti</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">Vendite Varie</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">sconti</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #ffd699; border-top: 1px solid black; border-bottom: 1px solid black;padding-top:15px;  border-right: 1px solid; colspan="2">RICAVI NETTI</th>
		<th style="background-color:#ffd699; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-top: 1px solid black; border-bottom: 1px solid black;  border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699;border-top: 1px solid black; border-bottom: 1px solid black;   border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">delta rim.pr e wip</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">delta mp</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">dConsumo filati</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Acquisti materiali per vendita diretta</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Costi accessori di acquisto</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

			<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black;  padding-top:15px; border-right: 1px solid;border-right: 1px solid;colspan="2">TOT.CONSUM</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black; border-right: 1px solidcol;span="2">234.0</th>
	</tr>
	
	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Materiali di consumo</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Lavorazioni esterne</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Lavoro Diretto</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Lavoro Indiretto</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Lavoro Distaccato</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Energie/Acqua</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Manutenzioni Industriali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Altri costi industriali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">Affitti industriali</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Ammortamento industriali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

			<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black;  padding-top:15px; border-right: 1px solid;colspan="2">COSTO DEL VENDUTO</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #ffd699; border-bottom: 1px solid black; margin-top:0px; padding-top:15px; border-right: 1px solid;colspan="2">MARGINE INDUSTRIALE</th>
		<th style="background-color:#ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#ffd699; border-bottom: 1px solid black;   margin-top:0px;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF; border-right: 1px solid;border-right: 1px solid;colspan="2">Publicita'/Promotion</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Provvigioni/Ensarco</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Trasporti commerciali terzi</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Consulenze commerciali</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Altre Commerciali</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">Costo del personale Commerciale</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black; padding-top:15px; border-right: 1px solid; colspan="2">COSTI COMMERCIALI</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Costo lavoro a struttura(comp.Sede)</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Consulenze professionali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Costo per godimento beni di terzi</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Compensi amministratori</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">Assicurazioni</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Manutenzioni struttura e automezzi</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Costi EDP</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Spese generali struttura</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Affitti Distaccati</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Oneri/proventi a struttura</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Spese viaggio</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black; padding-top:15px;  border-right: 1px solid;colspan="2">TOT.SPESE GENERALI</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #ffd699; border-bottom: 1px solid black; margin-top:0px; padding-top:15px; border-right: 1px solid;colspan="2">EBITDA</th>
		<th style="background-color:#ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;   margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Ammortamenti Industriali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid;  colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Ammortamenti di Struttura</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Ammortamenti Immateriali</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Leasing</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black;padding-top:15px;  border-right: 1px solid; colspan="2">TOTALE AMM./LEASING</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #ffd699; border-bottom: 1px solid black; margin-top:0px;padding-top:15px;  border-right: 1px solid;colspan="2">EBIT</th>
		<th style="background-color:#ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;   margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Plusvalenze cespiti</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Minusvalenze cespiti</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Acc.F.doSval.Crediti</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Perdite su crediti</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Indennizzo assicurativo</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Oneri diversi</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">Proventi diversi</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Oneri e Proventi Finanziari</th>
		<th style="background-color:#FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">Diff.cambio</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid; colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #d9d9d9;border-top: 1px solid black; border-bottom: 1px solid black; padding-top:15px; border-right: 1px solid; colspan="2">EBT</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color:#d9d9d9;  border-top: 1px solid black; border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #d9d9d9; border-top: 1px solid black;  border-bottom: 1px solid black; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

	<tr>
		<th style="background-color: #FFFFFF;padding-top:15px; border-right: 1px solid; colspan="2">IRAP</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color:#FFFFFF; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #FFFFFF;  border-right: 1px solid;colspan="2">234.0</th>
	</tr>

		<tr>
		<th style="background-color: #ffd699; border-bottom: 1px solid black; margin-top:0px; padding-top:15px; border-right: 1px solid;colspan="2">RISULTATO MESE</th>
		<th style="background-color:#ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;   margin-top:0px;border-right: 1px solid; colspan="2">234.0</th>
		<th style="background-color: #ffd699;  border-bottom: 1px solid black; margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
		<th style="background-color: #ffd699; border-bottom: 1px solid black;  margin-top:0px; border-right: 1px solid;colspan="2">234.0</th>
	</tr>

</thead>
</tbody>

				</table>
			</div>
		</div>
	</section>
</div>
<script src="<%--/Onlyou--%> ./ajax-pages/cinquepuntoquattro.js"></script>


<script id="set-data" 
        month="4" 
        year="2018" 
        total-row="65" 
        total-column="6" 
        db-table='cinquepuntoquattro' 
        post-page="ajax-pages/cinquepuntoquattro.jsp" 
        get-page="ajax-pages/cinquepuntoquattro.jsp"
	    servlet="<%--/Onlyou--%> ./GetSetData" 
	    src="<%--/Onlyou--%> ./js/functions.js"></script>

<script>
	$(document).ready(function() {
		setTimeout(function() {
			dataTableRefresh();
		}, 100)
	});
	getData();
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
<%--<button type="button" class="right-toggle" onclick="rgtForce()">
	<span class="bullet one"></span>
	<span class="bullet two"></span>
	<span class="bullet three"></span>
</button>--%>
<%--<div class="user">
	<img src="/Images/C.Gestione/user-demo.png" alt="icon">
	<span>Carlo Alberto della Siega</span>
	<a href="#" class="btn btn-wire">Logout</a>
</div>--%>
<%--<nav class="user-navi">
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
</nav>--%>
<footer>
	<small>© 2017 ONLYOU </small>
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
			 				//collection[i].style.display = 'block';
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
				 				//collection[i].style.display = 'block';
				collection[i].classList.add("show");
			}

			for (var i = 0, len = collection_prior.length; i < len; i++) {
				 //collection_prior[i].style.display = 'block';
				collection_prior[i].classList.add("hide");
				collection_prior[i].classList.remove("show");

			}

		}
	</script>

	<script>
		function update(n) {
			//document.getElementById("month-id").value = n;
			//var change = document.getElementById("change").value
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
			 //var table = document.getElementById("monthly-balance").innerHTML =
		};
    </script>
</body>
</html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>--%>
<%--<body>
    <form id="form1" runat="server">
        <div>

        </div>
    </form>--%>
<%--</body>--%>
<%--</html>--%>
