<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costi_Mensili_per_reparto.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Costi_Mensili_per_reparto" %>

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
<script src="/Onlyou/js/chart.bundle.min.js"></script>
<script src="/Onlyou/js/angular.min.js"></script>
<script src="/Onlyou/js/angular-ui-router.min.js"></script>
<script src="/Onlyou/js/angular-animate.min.js"></script>
<script src="/Onlyou/js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src="/Onlyou/js/bootstrap.min.js"></script>
<script src="/Onlyou/dashboard/js/app.js"></script>
<script src="/Onlyou/dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
</head>

<body bgcolor="#F8F8FF">

    <div id="title">
    <h2> Costi mensili per reparto </h2>
        </div>

    <div style="display: inline-block; float: right;">
							<b class="col-sm-12 knitting-title">Olimpias Knitting-anno 2019</b>
						</div>
					</div>
					</br>
					</br>
	
    		 <div align="right">
	<button onclick="window.print()">
		<img id="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
			<div>
	<section class="detailrow">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">

							Mese 
								<select id="month" name="month" onchange="this.form.submit()">
									
										<option value="1" >1</option>
									
										<option value="2" >2</option>
									
										<option value="3" >3</option>
									
										<option value="4">4</option>
									
										<option value="5" >5</option>
									
										<option value="6" >6</option>
									
										<option value="7" >7</option>
									
										<option value="8"selected >8</option>
									
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
									
										<option value="2020"selected >2020</option>
									
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
					<section class="detail" id="load-data">
                        </div>
		
		
				
				
<style>

    #lastcolumn{
        margin-left:-15px;
    }

   #secondconfezione{
      margin-top:-60px;
    }

   #thirdconfezione{
       margin-top:-130px;
   }
  

    #csscolumn{
        margin-left:-330px;
    }

    #firstcolumn{
        margin-left:-20px;
    }

    .col-sm-12{
        text-align:center;
        margin-top:-20px;
        margin-bottom:20px;
    }

    #title{
        text-align:center;
    }
* {
  box-sizing: border-box;
}

.row {
  margin-left:35px;
  margin-right:55px;
}
  
.column {
  float: left;
  width: 50%;
  
}

.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  line-height:0px;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: center;
  padding: 8px;
}

/*tr:nth-child(even) {
  background-color: #f2f2f2;
}*/

h3{
    color:#6495ED;
}

#tessiturax{
    margin-left:-38px;
    width:100px;
}

#tessituray{
    margin-left:-70px;
}

#tessituraZ{
    margin-left:-70px;

}

@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>
</head>
<body>

<div class="row">
  <div class="column">
    <table id="tessiturax">
        <h3>TESSITURA</h3>
      <tr>
        <th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:46px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
        <th style="border-right: 1px solid #000000;font-weight:bold;font-size:13px;width:46px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">FATT.17</th>
        <th  style=" border-right: 1px solid #000000;width:133px;  font-weight:bold;font-size:13px;width:46px;color:red;border-bottom:1px solid #D3D3D3;"colspan="2">FATT.18</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;17</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C 28</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;"colspan="2" >costi GG</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.17</th>
        <th style="background-color:#90EE90; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.18</th>
      </tr>
      <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td style="font-size:15px;">0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
      <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style=" background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        	<tr>
													<td style="border-right: 1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;">0</td>
													<td style="border-right: 1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;">0</td>
													<td style="border-right: 1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-top:1px solid #000000;">0</td>
													
													<td style="border-right: 1px solid #000000;background-color:#90EE90;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-top:1px solid #000000;"></td>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style=";border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">costi</td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;border-right:1px solid #f4f4f4;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media mese</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												<tr>
													<td style="border-left: 1px solid #f4f4f4;border-top:1px solid #000000;font-size:12px;">Scostamenti </td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">con</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;;">a.p.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Fatturato</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90;font-size:12px;">maggior </td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; border-right:1px solid #f4f4f4;"></td>
													
													<tr>
													<td style="font-size:12px;border-left:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Costi</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
														<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">maggior </td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">costi</td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
														<tr>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;font-size:11px;">TOTALE</td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;">Differenza </td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;"> con a.p</td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90;color:red;font-size:11px;">POSITIVA</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
    </table>
  </div>
    </br>
    </br>
    </br>

  <div<%-- style="width:40%;float:right;"--%> class="column">
     <div class="column">
         </br>
       
    <table id="firstcolumn">
      <h5> TESSITURA-andamento costi 2018/2019</h5>
     <tr>

        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
        <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
     

    </table>
  </div>
    <div class="column">
    <table id="csscolumn" >

       <tr>
    
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
      </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
  
        <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:27px;padding-right:27px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
    </table>
  </div>
</div>

    </br>
    </br>
    </br>


   <div class="row">
  <div class="column">
    <table id="tessituray">
        <h3>CONFEZIONE</h3>
      <tr>
        <th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:46px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
        <th style="border-right: 1px solid #000000;font-weight:bold;font-size:13px;width:46px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">FATT.17</th>
        <th  style=" border-right: 1px solid #000000;width:46px;  font-weight:bold;font-size:13px;width:56px;color:red;border-bottom:1px solid #D3D3D3;"colspan="2">FATT.18</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C 28</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;"colspan="2" >costi GG</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.17</th>
        <th style="background-color:#90EE90; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.18</th>
      </tr>
     <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
      <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-top:1px solid #000000;border-bottom:1px solid #000000;"></td>
        <td style="border-top:1px solid #000000;border-bottom:1px solid #000000;">0</td>
        <td  style="background-color: #F8F8FF; border-bottom:1px solid #000000;border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-top:1px solid #000000;"></td>
        <td style="border-top:1px solid #000000;border-bottom:1px solid #000000;">0</td>
        <td  style="background-color: #F8F8FF; border-bottom:1px solid #000000;border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-top:1px solid #000000;"></td>
        <td style="border-top:1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;">0</td>
        <td style="border-top:1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
          <td  style="background-color: #90EE90;border-bottom:1px solid #000000;border-left:1px solid black;width:66px;font-size:15px;border-top:1px solid #000000;">0</td>
           <td  style="background-color: #90EE90; border-bottom:1px solid #000000;border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-top:1px solid #000000;"></td>
          <td  style="background-color: #F8F8FF;border-bottom:1px solid #000000;width:66px;font-size:15px;border-top:1px solid #000000;">0.0</td>
          <td  style="background-color: #F8F8FF; border-bottom:1px solid #000000;border-right: 1px solid #000000;width:66px;font-size:15px;border-top:1px solid #000000;border-top:1px solid #000000;"></td>
          <td style="border-top:1px solid #000000;border-bottom:1px solid #000000;">0</td>
          <td  style="background-color: #F8F8FF; border-bottom:1px solid #000000;border-right: 1px solid #000000;width:66px;font-size:15px;border-top:1px solid #000000;"></td>
          <td  style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td   style="background-color:#90EE90;border-bottom:1px solid #000000; border-right: 1px solid #000000;width:66px;font-size:15px;border-top:1px solid #000000;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90;border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style=";border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">costi</td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;border-right:1px solid #f4f4f4;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media mese</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												<tr>
													<td style="border-left: 1px solid #f4f4f4;border-top:1px solid #000000;font-size:12px;">Scostamenti </td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">con</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;;">a.p.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Fatturato</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90;font-size:12px;">maggior </td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; border-right:1px solid #f4f4f4;"></td>
													
													<tr>
													<td style="font-size:12px;border-left:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Costi</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
														<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">maggior </td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">costi</td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
														<tr>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;font-size:11px;">TOTALE</td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;">Differenza </td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;"> con a.p</td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90;color:red;font-size:11px;">POSITIVA</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
    </table>
  </div>


       </br>
    </br>
    </br>
    </br>
   
  <div class="column">
    <table>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
              <div id="secondconfezione">
      <h5>CONFEZIONE-andamento costi 2018/2019</h5>
          </div>
      <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
    <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
     

    </table>
  </div>
    <div class="column">
    <table>
       
  <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        
        
      
       
       <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
     

    </table>
  </div>
</div>

    </br>
    </br>

   <div class="row">
  <div class="column">
    <table id="tessituraZ">

        <h3>STIRO</h3
      <tr>
        <th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:66px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
        <th style="border-right: 1px solid #000000;font-weight:bold;font-size:13px;width:56px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">FATT.17</th>
        <th  style=" border-right: 1px solid #000000;width:133px;  font-weight:bold;font-size:13px;width:56px;color:red;border-bottom:1px solid #D3D3D3;"colspan="2">FATT.18</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:66px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;17</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:66px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C 28</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:66px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;"colspan="2" >costi GG</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:66px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.17</th>
        <th style="background-color:#90EE90; font-weight:bold;font-size:13px; width:66px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.18</th>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
      <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td style="background-color: #90EE90;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;border-bottom:1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td  style="background-color: #F8F8FF;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td style="background-color: #90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td  style="background-color: #90EE90; border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">costi</td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;border-right:1px solid #f4f4f4;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media mese</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												<tr>
													<td style="border-left: 1px solid #f4f4f4;border-top:1px solid #000000;font-size:12px;">Scostamenti </td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">con</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;;">a.p.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Fatturato</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90;font-size:12px;">maggior </td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; border-right:1px solid #f4f4f4;"></td>
													
													<tr>
													<td style="font-size:12px;border-left:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Costi</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
														<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">maggior </td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">costi</td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
														<tr>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;font-size:11px;">TOTALE</td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;">Differenza </td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;"> con a.p</td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90;color:red;font-size:11px;">POSITIVA</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

    </table>
  </div>
       </br>
       </br>
       </br>
      
     
     <div class="column">
    <table>
        <h5>STIRO-andamento costi 2017/2018</h5>
    <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
                

     <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>

    </table>
  </div>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
       </br>
        <div class="column">
    <table>
        <h5>STIRO-andamento ricavi 2017/2018</h5>
       <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
      <tr>
        <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
    </table>
  </div>
</div>
    <div class="row">
    <div class="column">
    <table id="tessituraZ">
        <h3>TOTALE REPARTI</h3>
      <tr>
        <th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:46px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
        <th style="border-right: 1px solid #000000;font-weight:bold;font-size:13px;width:46px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">FATT.17</th>
        <th  style=" border-right: 1px solid #000000;width:46px;  font-weight:bold;font-size:13px;width:56px;color:red;border-bottom:1px solid #D3D3D3;"colspan="2">FATT.18</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">C 28</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;"colspan="2" >costi GG</th>
        <th style="background-color:#F8F8FF; font-weight:bold;font-size:13px;width:46px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.17</th>
        <th style="background-color:#90EE90; font-weight:bold;font-size:13px; width:46px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Ris.18</th>
      </tr>
     <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
      <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
        <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td  style="background-color:#90EE90;border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
       <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>
          <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;padding-top:20px;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;padding-top:20px;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;padding-top:20px;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
        <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td  style="background-color: #F8F8FF;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
          <td  style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td   style="background-color:#90EE90; border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;width:66px;font-size:15px;"></td>
      </tr>

         <tr>
        <td style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
        <td>0</td>
        <td></td>
          <td  style="background-color: #F8F8FF;border-left:1px solid black;width:66px;font-size:15px;">0</td>
           <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px; font-weight:bold;font-size:15px;"></td>
          <td  style="background-color: #F8F8FF;width:66px;font-size:15px;">0.0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td>0</td>
          <td  style="background-color: #F8F8FF; border-right: 1px solid #000000;width:66px;font-size:15px;"></td>
          <td  style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
          <td  style="background-color:#90EE90;border-right: 1px solid #000000;width:66px;font-size:15px;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
      </tr>
        <tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style=";border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;font-size:12px;">costi</td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td  style="border-top:1px solid #000000;border-right:1px solid #f4f4f4;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media mese</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												<tr>
													<td style="border-left: 1px solid #f4f4f4;border-top:1px solid #000000;font-size:12px;">Scostamenti </td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">con</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;;">a.p.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Fatturato</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0.0</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90;font-size:12px;">maggior </td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; font-size:12px;">fatturato</td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-top:1px solid #000000;background-color:#90EE90; border-right:1px solid #f4f4f4;"></td>
													
													<tr>
													<td style="font-size:12px;border-left:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Costi</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													
														<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">maggior </td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; font-size:12px;">costi</td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #90EE90;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #90EE90;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
														<tr>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td  style="border-right: 1px solid #f4f4f4;border-left:1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #f4f4f4;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;font-size:11px;">TOTALE</td>
													<td style="border-right: 1px solid #f4f4f4;border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;">0</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;"> </td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;">Differenza </td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;color:red;background-color:#90EE90;font-size:12px;"> con a.p</td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90;color:red;font-size:11px;">POSITIVA</td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;background-color:#90EE90; "></td>
													<td  style="border-bottom:1px solid #f4f4f4;border-top:1px solid #000000;border-right:1px solid #f4f4f4;background-color:#90EE90; "></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
    </table>
  </div>


       </br>
    </br>
    </br>
    </br>
   
  <div class="column">
    <table id="firstcolumn">
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
      
              <div id="thirdconfezione">
      <h5>GENERALE-andamento ricavi 2018/2019</h5>
          </div>
      <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
    <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
     

    </table>
  </div>
    <div class="column">
    <table id="lastcolumn">
    
  <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>

       <tr>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:180px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="border-bottom:2px solid #d3d3d3;border-right:1px solid #d3d3d3;width:280px;padding-top:15px ;padding-bottom:20px ;padding-left:30px;padding-right:30px;"></th>
        <th  style="width:180px;border-bottom:2px solid #d3d3d3;padding-left:30px;padding-right:30px;"></th>
      </tr>
     

    </table>
  </div>
</div>

    </br>
    </br>

</body>
</html>
		
<script>

    {
        document.getElementById("top-icons").style.backgroundColor = "indianred";
    }
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
         
        };
    </script>

	<style>

/*	 .col-sm-12{
		 text-align:center;
	 }

	 #center{
		 border-collapse:collapse;
	 }*/

	



	 
	</style>
</body>
</html>
