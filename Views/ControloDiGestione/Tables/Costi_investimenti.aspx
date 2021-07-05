
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costi_investimenti.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Costi_investimenti" %>

<!DOCTYPE html>

<head>
	<meta charset="utf-8">
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
	




<html>
<head>
<style>

    .top-icons{
        background-color:darkred;
    }

    hr {
  border:none;
  border-top:1px dotted;
  color:white;
  height:0px;
  width:50%;
}

    h4{
        text-align:center;
    }

    #code{
        float:left;
    }
* {
  box-sizing: border-box;
}

.row {
  margin-left:5px;
  margin-right:5px;
}
  
.column {
  float: left;/*Aici se pozitioneaza dedesubt daca float nu exista*/
  width: 25%;
  padding: 7px;
  margin-top:0px;
}

 Clearfix (clear floats) 
.row::after {
  content: "";
  clear: both;
  display: table;
}

    table {
        border-collapse: collapse;
        border-spacing:0;
        width: 100%;
        border: 1px solid #000000;
    }

th, td {
  text-align: left;
  padding: 10px;
  font-weight:bold;
  font-size:0.9em;
}

    tr:nth-child(even) {
        background-color: white;
    }

  tbody{
           border:1px solid #000000;
       }

  

</style>
</head>
<body>

     <div id="code">
    <h4>Cod.INV1</h4>
        </div>
    </br>

<h4>INVESTIMENTI-Esercizio 2020 - </h4>
    	</br>
   
					 <div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
<div class="row">
  <div class="column">
    <table style="float:left;">
        <tbody>
           
      <tr>
        <th>Divisione: KNITTING</th>
        <th></th>
      </tr>
           
      <tr>
        <td>Stabilim.:  SERBIA MAGLIERIA</td>
        <td style="border-bottom:1px solid #000000;"></td>
      </tr>
            
            </tbody>
       
        <div class="row">
  <div class="column">
      <tr>
        <td><u><em>INVESTIMENTI TECNICI</em></u></td>
        <td ></td>
      </tr>

      <tr>
        <td></td>
        <td></td>
      </tr>

         <tr>
        <td>ACQUISTO MACCHINE CONFEZIONE EX LAES BABIC</td>
        <td></td>
      </tr>

         <tr>
        <td>NR. 14 MACCHINE DA TESSERE</td>
        <td></td>
      </tr>

          <tr>
        <td>ACQUISTO MACCHINE CONFEZIONE TECNOSTIRO</td>
        <td></td>
      </tr>

          <tr>
        <td>TAVOLO STIRO </td>
        <td></td>
      </tr>

          <tr>
        <td>ATTREZZATURE VARIE</td>
        <td></td>
      </tr>

          <tr>
        <td>LUCI LED</td>
        <td></td>
      </tr>

          <tr>
        <td>COMPRESSORE</td>
        <td></td>
      </tr>

          <tr>
        <td>CITROEN C3</td>
        <td></td>
      </tr>

          <tr>
        <td>MACCHINE MASCHERINE</td>
        <td></td>
      </tr>

          <tr>
        <td>RICAMATRICE</td>
        <td></td>
      </tr>

          <tr>
        <td>VARIE ED EVENTUALI</td>
        <td></td>
      </tr>

          <tr>
        <td>AREA SISTEMI INFORMATIVI: </td>
        <td></td>
      </tr>

          <tr>
        <td>ACQUISTI PACCHETTI SOFTWARE</td>
        <td></td>
      </tr>
          <tr>
        <td>ACQUISTI HARDWARE</td>
        <td></td>
      </tr>

          <tr>
        <td style="float:right;">Totale</td>
        <td></td>
      </tr>

             <tr>
        <td>INTERVENTI DI INGEGNERIA E MANUTENZIONE</td>
        <td></td>
      </tr>

             <tr>
        <td>AGGIORNAMENTO BLINDOSBARRE</td>
        <td></td>
      </tr>

             <tr>
        <td>MIGLIORIE SICUREZZA STABILIMENTO</td>
        <td></td>
      </tr>

             <tr>
        <td>LAVORI EDILI PAVIM. PARETI E PITTURE</td>
        <td></td>
      </tr>

             <tr>
        <td>LAVORI EDILI SU FABB.16 AREA MENSA</td>
        <td></td>
      </tr>
             <tr>
        <td>LAVORI ADEGUAMENTO ANTINCENDIO</td>
        <td></td>
      </tr>

             <tr>
        <td>AMPLIAMENTO IMPIANTO ASPIRAZIONE STIRO</td>
        <td></td>
      </tr>

             <tr>
        <td>VARIE ED EVENTUALI</td>
        <td></td>
      </tr>
             <tr>
        <td style="float:right;">Totale</td>
        <td></td>
      </tr>

        	<tbody>
										
											<tr>
													<td style="width:430px ;height:40px;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOTALE</td>
												
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

										</tbody>
    </table>
  </div>

  <div class="column">
    <table style="width:100px;margin-left:20px;">
      <tr>
        <th style="background-color:#90EE90;border-top:1px solid #000000;text-align:center;"></th>
        <th style="background-color:#90EE90;border-top:1px solid #000000;text-align:center;"> 31.12.2020</th>
        <th style="background-color:#90EE90;border-top:1px solid #000000;text-align:center;"></th>
      </tr>
      <tr>
        <td style="border:1PX solid #000000;width:107px;border-collapse:separate;">Autorizzato</td>
        <td style="border:1PX solid #000000;width:107px;border-collapse:separate;">Ordinato</td>
        <td style="border:1PX solid #000000;width:107px;border-collapse:separate;">Fatturato</td>
      </tr>
      <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
    
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td  style="border-left:1PX solid #000000;border-right:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>57.100</td>
        <td style="border-left:1px solid #000000;border-right:1px solid #000000;">56.884 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td  style="border-left:1PX solid #000000;border-right:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"> </td>
        <td <%--style="border:1PX solid #000000;"--%>>13.410</td>
        <td style="border-left:1PX solid #000000;border-right:1px solid #000000;">13.197 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>5.550 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">5.450 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>61.270 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">60.076 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>25.250 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">24.954 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>22.100 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">22.081 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>1.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">1.494 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>60.200 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">59.469 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>5.300  </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">5.200 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>2.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">2.500 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>>11.320 </td>
<hr/>
              <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">10.986 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>>265.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">262.291 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>>265.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">262.291 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>>265.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">262.291 </td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>>265.500 </td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;">262.291 </td>
      </tr>
        
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

          <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
        <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>

             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
             <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
        <td></td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;"></td>
      </tr>
        <tr>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;">0</td>
        <td style="border-bottom:1px solid #000000;">0</td>
        <td style="border-right:1PX solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;">0</td>
      </tr>
       	<tbody>
	
											<tr>

													<td style="width:430px ;height:40px;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td style="width:430px ;height:40px;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">265.500</td>
                                                <td style="border-left:1px solid #000000;">262.291</td>
												
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

										</tbody>
    </table>
  </div>

     <div class="column">
    <table style="/*float:right;*/padding:1px;width:100px;margin-left:0px;">
      <tr>
        <th style="background-color:#90EE90;border-top:1PX solid #000000;text-align:center;"></th>
        <th style="background-color:#90EE90;border-top:1px solid #000000;text-align:center;padding:1px;">TOTALE ANNO</th>
        <th style="background-color:#90EE90;border-top:1PX solid #000000;text-align:center;"></th>
      </tr>
      <tr>
        <td style="border:1PX solid #000000;background-color:#90EE90;width:117px;">2020</td>
        <td style="border:1PX solid #000000;width:117px;color:white;">Ordinato</td>
        <td style="border:1PX solid #000000;width:117px;color:white;">Fatturato</td>
      </tr>
        </br>
      <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">66.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">0</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">100.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">11.023 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">22.081 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">1.494 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">50.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">40.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">25.000 </td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">320.598 </td>
        <td></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;">0</td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">10.000</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">10.000</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">10.000</td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
          <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;"></td>
        <td <%--style="border:1PX solid #000000;"--%>></td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
      <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>

           <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">5000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;"></td>
      </tr>
         <tr>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;background-color:#90EE90;">35.000</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;">0</td>
        <td style="border-left:1PX solid #000000;border-right:1PX solid #000000;">0</td>
      </tr>

        	<tbody>
										
											<tr>
													<td style="width:430px ;height:40px;border-left:1PX solid #000000;border-right:1PX solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;">355.598</td>
													<td style="width:430px ;height:40px;border-left:1PX solid #000000;border-right:1PX solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
                                                <td>0</td>
												
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

										</tbody>

    </table>
  </div>
</div>

</body>
</html>



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



					
	
			
				
				
				
				
			
		
			
				
				
				
<script>
    function getGraph() {
        var resTC = [];
        var resCC = [];
        var resSC = [];
        var resGC = [];
        var resTR = [];
        var resCR = [];
        var resSR = [];
        var resGR = [];

        var year = '2018';
        var month = '3';
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/Onlyou/GetSeiPuntoCinqueGraph?month=' + month + '&year=' + year, true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            var obj = JSON.parse(this.responseText);

            resTC = obj.TessituraCosti;
            resCC = obj.ConfezioneCosti;
            resSC = obj.StiroCosti;
            resGC = obj.GeneraleCosti;
            resTR = obj.TessituraRicavi;
            resCR = obj.ConfezioneRicavi;
            resSR = obj.StiroRicavi;
            resGR = obj.GeneraleRicavi;
            createChart(resTC[0], resTC[1], 'chart_div_tessitura_costi', year, 'TESSITURA - andamento costi ' + (year - 1) + '/' + year);
            createChart(resCC[0], resCC[1], 'chart_div_tessitura_ricavi', year, 'TESSITURA - andamento ricavi ' + (year - 1) + '/' + year);
            createChart(resSC[0], resSC[1], 'chart_div_confezione_costi', year, 'CONFEZIONE - andamento costi ' + (year - 1) + '/' + year);
            createChart(resGC[0], resGC[1], 'chart_div_confezione_ricavi', year, 'CONFEZIONE - andamento ricavi ' + (year - 1) + '/' + year);
            createChart(resTR[0], resTR[1], 'chart_div_stiro_costi', year, 'STIRO - andamento costi ' + (year - 1) + '/' + year);
            createChart(resCR[0], resCR[1], 'chart_div_stiro_ricavi', year, 'STIRO - andamento ricavi ' + (year - 1) + '/' + year);
            createChart(resSR[0], resSR[1], 'chart_div_generale_costi', year, 'GENERALE - andamento costi ' + (year - 1) + '/' + year);
            createChart(resGR[0], resGR[1], 'chart_div_generale_ricavi', year, 'GENERALE - andamento ricavi ' + (year - 1) + '/' + year);

        };
        xhr.send();
    }

    function createChart(costi, ricavi, idChart, year, title) {
        var lineChartData = {
            labels: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic'],
            datasets: [{
                label: 'Anno ' + (year - 1),
                borderColor: "#176d17",
                backgroundColor: "#29b229",
                fill: false,
                data: costi,
                yAxisID: 'y-axis-1',
            }, {
                label: 'Anno ' + year,
                borderColor: "#d32626",
                backgroundColor: "#f99393",
                fill: false,
                data: ricavi,
                yAxisID: 'y-axis-2'
            }]
        };

        var ctx = document.getElementById(idChart).getContext('2d');
        window.myLine = Chart.Line(ctx, {
            data: lineChartData,
            options: {
                responsive: true,
                hoverMode: 'index',
                stacked: false,
                title: {
                    display: true,
                    text: title
                },
                scales: {
                    yAxes: [{
                        type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: 'left',
                        id: 'y-axis-1',
                    }, {
                        type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: 'right',
                        id: 'y-axis-2',

                        // grid line settings
                        gridLines: {
                            drawOnChartArea: false, // only want the grid lines for one axis to show up
                        },
                    }],
                }
            }
        });
    }


</script>
				</div>
			</div>
		</div>
	</section>
</div>
<script id="set-data" month="3" year="2018" total-row="80" total-column="9" db-table='seipuntocinque' post-page="ajax-pages/seipuntocinque.jsp" get-page="ajax-pages/seipuntocinque.jsp"
	servlet="/Onlyou/GetSetData" servlet-multi="/Onlyou/GetSetDataMulti" multi="true" src="/Onlyou/js/functions.js"></script>


<script src="/Onlyou/new/js/Chart.bundle.min.js"></script>
<script src="/Onlyou/new/js/Chart.min.js"></script>


<script>
    //	getData();
    var resTC = [];
    var resCC = [];
    var resSC = [];
    var resGC = [];
    var resTR = [];
    var resCR = [];
    var resSR = [];
    var resGR = [];
    getDataMulti('_tessitura');
    getDataMulti('_confezione');
    getDataMulti('_stiro');
    getDataMulti('_generale');

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