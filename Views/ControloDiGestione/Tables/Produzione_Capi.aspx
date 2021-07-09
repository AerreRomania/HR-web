<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Produzione_Capi.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Produzione_Capi" %>

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
<script src="./js/chart.bundle.min.js""></script>

<script src=./js/angular.min.js"></script>

<script src="./js/angular-ui-router.min.js"></script>
<script src="./js/angular-animate.min.js"></script>
<script src="./js/ui-bootstrap-tpls-2.2.0.min.js"></script>
<script src=="./js/bootstrap.min.js"></script>

<script src="/Onlyou/dashboard/js/app.js"></script>


<script src="./dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="./dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="./dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>

</head>
<body>
	

	<style>

	 h1{

	 }

	 h4{
		 color:#00008B;
	 }


	 .detailrow{
		 margin-top:-50px;
	 }

	 #amendamento{
		 float:right;
	 }

	 .col-sm-12{
		 text-align:center;
	 }
	    .top-icons {
	        background-color: darkred;
	    }
#cinquepuntoquattro{
	border:1px solid #D3D3D3;
	border-right:1px solid #D3D3D3;
	border-collapse:collapse;
	overflow-x:auto;
/*	width:40%;*/
	margin-top:-12px;
}


.col-md-8{
	bottom:1000px;
		margin-left:700px;
	
}

	#months,#years,#cambios,{
		bottom:1000px;
		margin-left:1000px;
	
	 }
thead{
	border-right:1px solid #D3D3D3;
}

#righr{
	float:right;
	margin-right:220px;
}

#errori{
	float:right;
	margin-right:-42px;
}

	 #chButton{
		 background-color:#6495ED;
		 color:#ffffff;
		 padding:3px  3px ;
		 font-size:17px;
		 font-family:arial;
		 border-radius:7%;
	 }

	 #tassi{
		 text-align:center;

	 }

	 tbody{
		text-align:center;
	 }

	#tess{
		float:left;
/*		margin-left:70px;
*/		color:#00008B;
	}

	.hr{
/*    background-color:linear-gradient(to right,blue,red,orange,yellow,lightgreen,green);
*/	 height: 5px;
  background-color: red; /* For browsers that do not support gradients */
  background-image: linear-gradient(red, yellow);
	}

	</style>

	<div class="container">

		<div class="">
		
		<div class="">
<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-12">
						<h4 id="tassi"><u>PRODUZIONI MENSILI-nr.Capi-/000</u></h4>

						<div style="display: inline-block; float: right;">
							<b class="col-sm-12 knitting-title"> <font color="#000000">Analisi di Perioda </font></b>
						</div>
					</div>
					</br>

					 <div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
	</br>

			<%--		<div>
	<section class="detailrow">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">

							Mese 
								<select id="month" name="month" onchange="this.form.submit()">
									
										<option value="1" selected >1</option>
									
										<option value="2" >2</option>
									
										<option value="3" >3</option>
									
										<option value="4">4</option>
									
										<option value="5" >5</option>
									
										<option value="6" >6</option>
									
										<option value="7" >7</option>
									
										<option value="8">8</option>
									
										<option value="9" >9</option>
									
										<option value="10" >10</option>
									
										<option value="11" >11</option>
									
										<option value="12" >12</option>
									
								</select>
								Anno
								<select id="year" name="year" onchange="this.form.submit()">
									
										<option value="2017" selected >2017</option>
									
										<option value="2018" >2018</option>
									
										<option value="2019" >2019</option>
									
										<option value="2020">2020</option>
									
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
							</section>--%>
					<section class="detail" id="load-data">

						<div class="col-md-2">
						
						</div>
						<div class="col-md-8">
							
						</div>
						<div class="col-md-2">
						
						</div>
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>
					</div>
				</div>	
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
		
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
			
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>

						<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version">
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
				<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>

<div id="tess">
<h1>OLIMPIAS KNITTING doo-</h1>
		</div>
					</br>
					</br>
					</br>
		<div class="hr">
					<hr size="3" width="300" align="left"noshade color="blue" />
			</div>
	</br>
	</br>
	</br>
<thead>
	<tr>
		</br>
		<th style="background-color: tan; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:72px; font-weight:bold;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:72px;color:red;border-bottom:1px solid #000000;border-top:1px solid #000000;color:blue;" colspan="2">TESSITURA </th>
		<th style=" background-color:tan; width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;"colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px; width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;color:red;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;" colspan="2"></th>
		<%--<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">efff</th>--%>
		
											</tr>
					
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2017</td>
														
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">capi/mese</br>2018</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2019</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;background-color:#F4A460;">capi/mese</br>2020</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/17</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;width:72px;">capi </br>gg/18</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/19</td>
													<td style="background-color:#F4A460;border-right: 1px solid #000000;border-bottom:1px solid #000000;width:72px;">capi </br>gg/20</td>
													<%--<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>--%>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">delta</br>19/20
													</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>


										
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">GEN</td>
													<td  style="border-right: 1px solid #000000;">140,2 </td>
													<td style="border-right: 1px solid #000000;">104,7 </td>
													<td  style="border-right: 1px solid #000000;">136,5 </td>
													<td style="border-right: 1px solid #000000;">104,9 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													
													<td  style="border-right: 1px solid #000000;">4,6 </td>
													<td  style="border-right: 1px solid #000000;">7,6 </td>
													<td  style="border-right: 1px solid #000000;">5,5 </td>
													<td style="background-color:#90EE90;" >(2,1)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>--%>
<%--													<td  style="border-right: 1px solid #000000;background-color:#90EE90;">888</td>--%>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">FEB</td>
													<td  style="border-right: 1px solid #000000;">138,0 </td>
													<td style="border-right: 1px solid #000000;">175,4 </td>
													<td  style="border-right: 1px solid #000000;">157,4 </td>
													<td style="border-right: 1px solid #000000;">137,4 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													
													<td  style="border-right: 1px solid #000000;">6,7 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													<td style="background-color:#90EE90;">(0,8)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAR</td>
													<td  style="border-right: 1px solid #000000;">187,5 </td>
													<td style="border-right: 1px solid #000000;">166,6 </td>
													<td  style="border-right: 1px solid #000000;">166,5 </td>
													<td style="border-right: 1px solid #000000;">101,1 </td>
													<td  style="border-right: 1px solid #000000;">6,0 </td>
													
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">3,4 </td>
													<td style="background-color:#90EE90;">(2,0) </td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"> </td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">APR</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;border-left:1px solid #000000;">GIU</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">LUG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">AGO</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">SET</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">OTT</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;" >f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">NOV</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">DIC</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
<%--													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #000000;">PROG.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#F4A460;">1.332</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">g</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;COLOR:red;background-color:#DCDCDC;">5,5%</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">-10,3%</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;">-13,5%</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOT.</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.889</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.879</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.588</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.332</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,5</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,8</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,2</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">4,5</td>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #90EE90;background-color:#90EE90;">(0,7)</td>
<%--													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;">dec</td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<%--<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>--%>

										</tbody>
									</table>


							</br>

				</div>
				</div>
															<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>

<div id="tess">

<thead>
	<tr>
		</br>
		<th style="background-color: tan; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:72px; font-weight:bold;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:72px;color:red;border-bottom:1px solid #000000;border-top:1px solid #000000;color:blue;" colspan="2">CONFEZIONE	 </th>
		<th style=" background-color:tan; width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;"colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px; width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;color:red;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;" colspan="2"></th>
		<%--<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">efff</th>--%>
		
											</tr>
					
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2017</td>
														
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">capi/mese</br>2018</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2019</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;background-color:#F4A460;">capi/mese</br>2020</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/17</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;width:72px;">capi </br>gg/18</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/19</td>
													<td style="background-color:#F4A460;border-right: 1px solid #000000;border-bottom:1px solid #000000;width:72px;">capi </br>gg/20</td>
													<%--<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>--%>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">delta</br>19/20
													</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>


										
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">GEN</td>
													<td  style="border-right: 1px solid #000000;">140,2 </td>
													<td style="border-right: 1px solid #000000;">104,7 </td>
													<td  style="border-right: 1px solid #000000;">136,5 </td>
													<td style="border-right: 1px solid #000000;">104,9 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													
													<td  style="border-right: 1px solid #000000;">4,6 </td>
													<td  style="border-right: 1px solid #000000;">7,6 </td>
													<td  style="border-right: 1px solid #000000;">5,5 </td>
													<td style="background-color:#90EE90;" >(2,1)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>--%>
<%--													<td  style="border-right: 1px solid #000000;background-color:#90EE90;">888</td>--%>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">FEB</td>
													<td  style="border-right: 1px solid #000000;">138,0 </td>
													<td style="border-right: 1px solid #000000;">175,4 </td>
													<td  style="border-right: 1px solid #000000;">157,4 </td>
													<td style="border-right: 1px solid #000000;">137,4 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													
													<td  style="border-right: 1px solid #000000;">6,7 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													<td style="background-color:#90EE90;">(0,8)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAR</td>
													<td  style="border-right: 1px solid #000000;">187,5 </td>
													<td style="border-right: 1px solid #000000;">166,6 </td>
													<td  style="border-right: 1px solid #000000;">166,5 </td>
													<td style="border-right: 1px solid #000000;">101,1 </td>
													<td  style="border-right: 1px solid #000000;">6,0 </td>
													
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">3,4 </td>
													<td style="background-color:#90EE90;">(2,0) </td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"> </td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">APR</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;border-left:1px solid #000000;">GIU</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">LUG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">AGO</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">SET</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">OTT</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;" >f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">NOV</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">DIC</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
<%--													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #000000;">PROG.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#F4A460;">1.627</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">g</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;color:red;">8,8%</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOT.</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.889</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.879</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.588</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.332</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,5</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">6,2</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,2</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">4,5</td>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #90EE90;background-color:#90EE90;">(0,7)</td>
<%--													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;">dec</td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<%--<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>--%>

										</tbody>
									</table>


							</br>

				</div>
				</div>

						<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>

<div id="tess">

<thead>
	<tr>
		</br>
		<th style="background-color: tan; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:72px; font-weight:bold;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:72px;color:red;border-bottom:1px solid #000000;border-top:1px solid #000000;color:blue;" colspan="2">STIRO </th>
		<th style=" background-color:tan; width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;"colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px; width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;color:red;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;" colspan="2"></th>
		<%--<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">efff</th>--%>
		
											</tr>
					
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2017</td>
														
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">capi/mese</br>2018</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2019</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;background-color:#F4A460;">capi/mese</br>2020</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/17</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;width:72px;">capi </br>gg/18</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/19</td>
													<td style="background-color:#F4A460;border-right: 1px solid #000000;border-bottom:1px solid #000000;width:72px;">capi </br>gg/20</td>
													<%--<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>--%>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">delta</br>19/20
													</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>


										
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">GEN</td>
													<td  style="border-right: 1px solid #000000;">140,2 </td>
													<td style="border-right: 1px solid #000000;">104,7 </td>
													<td  style="border-right: 1px solid #000000;">136,5 </td>
													<td style="border-right: 1px solid #000000;">104,9 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													
													<td  style="border-right: 1px solid #000000;">4,6 </td>
													<td  style="border-right: 1px solid #000000;">7,6 </td>
													<td  style="border-right: 1px solid #000000;">5,5 </td>
													<td style="background-color:#90EE90;" >(2,1)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>--%>
<%--													<td  style="border-right: 1px solid #000000;background-color:#90EE90;">888</td>--%>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">FEB</td>
													<td  style="border-right: 1px solid #000000;">138,0 </td>
													<td style="border-right: 1px solid #000000;">175,4 </td>
													<td  style="border-right: 1px solid #000000;">157,4 </td>
													<td style="border-right: 1px solid #000000;">137,4 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													
													<td  style="border-right: 1px solid #000000;">6,7 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													<td style="background-color:#90EE90;">(0,8)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAR</td>
													<td  style="border-right: 1px solid #000000;">187,5 </td>
													<td style="border-right: 1px solid #000000;">166,6 </td>
													<td  style="border-right: 1px solid #000000;">166,5 </td>
													<td style="border-right: 1px solid #000000;">101,1 </td>
													<td  style="border-right: 1px solid #000000;">6,0 </td>
													
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">3,4 </td>
													<td style="background-color:#90EE90;">(2,0) </td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"> </td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">APR</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;border-left:1px solid #000000;">GIU</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">LUG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">AGO</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">SET</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">OTT</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;" >f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">NOV</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">DIC</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
<%--													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #000000;">PROG.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#F4A460;">1.811</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">g</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;color:red;background-color:#DCDCDC;">1,5%</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOT.</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.889</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.879</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.588</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.332</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,5</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,8</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,2</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">4,5</td>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #90EE90;background-color:#90EE90;">(0,7)</td>
<%--													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;">dec</td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<%--<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>--%>

										</tbody>
									</table>


							</br>

				</div>
				</div>

			<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>

<div id="tess">

<thead>
	<tr>
		</br>
		<th style="background-color: tan; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:72px; font-weight:bold;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:72px;color:red;border-bottom:1px solid #000000;border-top:1px solid #000000;color:blue;" colspan="2">SARTORIA </th>
		<th style=" background-color:tan; width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;"colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px; width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;color:red;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;" colspan="2"></th>
		<%--<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;" colspan="2"></th>
		<th style="background-color:tan; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">efff</th>--%>
		
											</tr>
					
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2017</td>
														
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">capi/mese</br>2018</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;">capi/mese</br>2019</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;background-color:#F4A460;">capi/mese</br>2020</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/17</td>
													<td style="border-right: 1px solid #000000; border-bottom:1px solid #000000;width:72px;">capi </br>gg/18</td>
													<td style="border-bottom:1px solid #000000;border-right:1px solid #000000;width:72px;">capi </br>gg/19</td>
													<td style="background-color:#F4A460;border-right: 1px solid #000000;border-bottom:1px solid #000000;width:72px;">capi </br>gg/20</td>
													<%--<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>--%>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">delta</br>19/20
													</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>


										
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">GEN</td>
													<td  style="border-right: 1px solid #000000;">140,2 </td>
													<td style="border-right: 1px solid #000000;">104,7 </td>
													<td  style="border-right: 1px solid #000000;">136,5 </td>
													<td style="border-right: 1px solid #000000;">104,9 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													
													<td  style="border-right: 1px solid #000000;">4,6 </td>
													<td  style="border-right: 1px solid #000000;">7,6 </td>
													<td  style="border-right: 1px solid #000000;">5,5 </td>
													<td style="background-color:#90EE90;" >(2,1)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>--%>
<%--													<td  style="border-right: 1px solid #000000;background-color:#90EE90;">888</td>--%>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">FEB</td>
													<td  style="border-right: 1px solid #000000;">138,0 </td>
													<td style="border-right: 1px solid #000000;">175,4 </td>
													<td  style="border-right: 1px solid #000000;">157,4 </td>
													<td style="border-right: 1px solid #000000;">137,4 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													
													<td  style="border-right: 1px solid #000000;">6,7 </td>
													<td  style="border-right: 1px solid #000000;">6,1 </td>
													<td  style="border-right: 1px solid #000000;">5,3 </td>
													<td style="background-color:#90EE90;">(0,8)</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAR</td>
													<td  style="border-right: 1px solid #000000;">187,5 </td>
													<td style="border-right: 1px solid #000000;">166,6 </td>
													<td  style="border-right: 1px solid #000000;">166,5 </td>
													<td style="border-right: 1px solid #000000;">101,1 </td>
													<td  style="border-right: 1px solid #000000;">6,0 </td>
													
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">5,4 </td>
													<td  style="border-right: 1px solid #000000;">3,4 </td>
													<td style="background-color:#90EE90;">(2,0) </td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"> </td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">APR</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">MAG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;border-left:1px solid #000000;">GIU</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">LUG</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
										<%--			<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">AGO</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">SET</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">OTT</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;" >f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<%--<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">NOV</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
											<%--		<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left:1px solid #000000;">DIC</td>
													<td  style="border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
<%--													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>--%>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #000000;">PROG.</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#F4A460;">405</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">g</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;color:red;">0,0%</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #000000;background-color:#DCDCDC;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#DCDCDC;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
												<%--	<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOT.</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.889</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.879</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.588</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">1.332</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,5</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,8</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">5,2</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:yellow;">4,5</td>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
<%--													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>--%>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;background-color:#90EE90;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;border-left:1px solid #90EE90;background-color:#90EE90;">(0,7)</td>
<%--													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right:1px solid #000000;">dec</td>--%>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											<%--<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>--%>

										</tbody>
									</table>


							</br>

				</div>
				</div>

		

						<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
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
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>

				<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>
					


<thead>
		<tr>
		</br>
		<th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:140px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:140px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">COSTO 16 </th>
		<th style=" border-right: 1px solid #000000;width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;"colspan="2">COSTO 17</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px; width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;color:red;" colspan="2">Mc 16</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Mc 17</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">c.mc 16</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">c.mc 17</th>
		<th style="background-color:#90EE90; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Delta %</th>
		
											</tr>
					
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
														
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>


										
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td >j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">fffGEN</td>
													<td style="border-bottom:1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">g</td>
													
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">fffGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td s>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">fffGEN</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">g</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style=";border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
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
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
											
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
							</br>
								</div>
							</div>
					<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" <%--width="50%"--%>>
										<thead>
											<tr id="theady">
														<input type="hidden" name="totalRow" value="65" />
							<input type="hidden" name="totalColumn" value="6" />
							<input type="hidden" name="table" value="cinquepuntoquattro" />
							<input type="hidden" name="page" value="/new/index.jsp?m=cinquepuntoquattro" />
						</form>

					</div>
				</div>
				<table id="cinquepuntoquattro" class="table table-bordered table-hover table-condensed version"<%-- width="40%"--%>>
		
<%--<div id="tess">
<h1>AQUA</h1>
	</div>
					</br>
					</br>
					</br>--%>

<thead>
		<tr>
		</br>
		<th style="background-color: #F8F8FF; border-right: 1px solid #000000;border-left:1px solid black;padding-top:20px;width:140px; font-weight:bold;border-bottom:1px solid #D3D3D3;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:140px;color:red;border-bottom:1px solid #D3D3D3;" colspan="2">COSTO 16 </th>
		<th style=" border-right: 1px solid #000000;width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #D3D3D3;"colspan="2">COSTO 17</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px; width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;color:red;" colspan="2">Mc 16</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Mc 17</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">c.mc16</th>
		<th style="background-color:#f4f4f4; font-weight:bold;font-size:15px;width:65px; border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">c.mc 17</th>
		<th style="background-color:#90EE90; font-weight:bold;font-size:15px;width:65px;border-right: 1px solid #000000;border-bottom:1px solid #D3D3D3;" colspan="2">Delta %</th>
	</tr>
	</thead>
<tbody>
<tr>
													<td  style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
														
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td >j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>

													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;">hhhGEN</td>
													<td style="border-bottom:1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">g</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;">hhhGEN</td>
													<td>d</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>f</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td s>g</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>h</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>j</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td>l</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td style="background-color:#90EE90;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;"></td>
													
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">hhhGEN</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">d</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">f</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">g</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">h</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">j</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">l</td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;">777</td>
													<td  style="border-right: 1px solid #000000;background-color:#90EE90;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-left:1px solid #f4f4f4;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style=";border-top:1px solid #000000;color:#f4f4f4;">0</td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
													<td style="border-top:1px solid #000000;"></td>
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
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;font-size:12px;">Media consumo kwh/giorno</td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">222</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;">233</td>
													<td style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #D3D3D3;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-bottom:1px solid #000000;border-top:1px solid #000000;border-right: 1px solid #d3d3d3;"></td>
													<td style="border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
													<td  style="border-right: 1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;"></td>
												
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
							</br>

								</div>
							
							</div>
							<div class="col-md-8">
								<div class="col-md-12 form-group">
									<form action="/Onlyou/cambio-tasso" method="post">
										<div class="col-md-6 form-group">

											<div id="change">
								<div class="clearfix"></div>

							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>

</div>

<script>
	function 
    {
        document.getElementById("amendamento2").style.color = "#f4f4f4";

    }

    function showButton(n) {
        //  alert(n);
        if (n == '1') {
            var sel1 = document.getElementById("month").value
            var sel2 = document.getElementById("year").value
            var file = document.getElementById("valuta").value;

            if (sel1 != 0 && sel2 != 0 && file > 0) {
                document.getElementById("chButton").disabled = false;
            } else
                document.getElementById("chButton").disabled = true;
        }

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



