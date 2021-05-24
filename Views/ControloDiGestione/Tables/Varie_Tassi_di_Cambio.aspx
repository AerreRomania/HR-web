<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Varie_Tassi_di_Cambio.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Varie_Tassi_di_Cambio" %>

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
<body bgcolor="#F8F8FF">
	<!-- LEFT NAVIGATION -->

	<style>
	    .top-icons {
	        background-color: darkred;
	    }
#cinquepuntoquattro{
	border:1px solid #D3D3D3;
	border-right:1px solid #D3D3D3;
	border-collapse:collapse;
	overflow-x:auto;
	width:40%;
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

#change{
	margin-top:-350px;
	margin-left:-110px;
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

	
	 
	</style>


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

</script>


<div id = "left-navi" onmouseover = "openClose()" onmouseout = "openClose()">
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
</div>--%>



		<%--</div>--%>
		<div class="">
			








<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-12">
						<h1 id="tassi">TASSI DI CAMBIO</h1>

						<%--<a class="link" href="/Onlyou/new/index.jsp?m=varie_cat">
							<i class="fa fa-chevron-left"></i> Indietro
						</a>--%>
						<div style="display: inline-block; float: right;">
							<b class="col-sm-12 knitting-title">Olimpias Knitting</b>
						</div>
					</div>
					</br>

					 <div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
	</br>

					<section class="detail" id="load-data">

						<div class="col-md-2">
							<!--                 <h1> -->
							
							<!--                         <i class="fa fa-arrow-left"></i> -->
							<!--                     </button> -->
							<!--                 </h1> -->
						</div>
						<div class="col-md-8">
							<!-- 							<h1>Caricamento file</h1> -->
							<!--                 <a class="link" ui-sref="^" ui-sref-opts="{reload: true}"> -->
							<!--                     <i class="fa fa-chevron-left"></i> Indietro -->
							<!--                 </a> -->
						</div>
						<div class="col-md-2">
							<!--                 <h1> -->
							
							<!--                         <i class="fa fa-arrow-right"></i> -->
							<!--                     </button> -->
							<!--                 </h1> -->
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
					
					



<thead>
	<tr>
		</br>
		<th style="background-color: #f4f4f4; border-right: 1px solid SILVER;;padding-top:20px;font-weight:bold;font-size:15px;">Numero </br> Mesi</th>
		<th style="background-color: #f4f4f4; border-right: 1px solid #DCDCDC; font-weight:bold;font-size:15px;"colspan="2">Anno</th>
		<th style="background-color: #D3D3D3; border-right: 1px solid SILVER;font-weight:bold;font-size:15px;" colspan="2">Mese </th>
		<th style="background-color: #ffffff; font-weight:bold;font-size:15px; border-right: 1px solid SILVER" colspan="2">Cambio</th>
		<th style="background-color:#d3d3d3; font-weight:bold;font-size:15px; border-right: 1px solid SILVER" colspan="2">Elimina</th>

											</tr>
										</thead>
										<tbody>
											
												<tr>
													<td  style="border-right:1px solid #D3D3D3;border-right: 1px solid SILVER;">38</td>

													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">10</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=10&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
										
												<tr>
													<td style="border-right: 1px solid SILVER;">37</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">9</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">35</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">8</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">34</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">7</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">32</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">6</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">31</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">5</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"</td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td  style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">29</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">4</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">26</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">3</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">25</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">2</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">24</td>
													<td>2017</td>
													<td></td>
													<td style="background-color: #D3D3D3;">1</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">0.0</td>
													<td><a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">49</td>
													<td>2018</td>
													<td></td>
													<td style="background-color: #D3D3D3;">4</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">118.626</td>
													<td><a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">47</td>
													<td>2018</td>
													<td></td>
													<td style="background-color: #D3D3D3;">3</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">118.653</td>
													<td><a href="/Onlyou/DeleteMonth?month=3&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">44</td>
													<td>2018</td>
													<td></td>
													<td style="background-color: #D3D3D3;">2</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color: #D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">118.7</td>
													<td><a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid SILVER;">43</td>
													<td>2018</td>
													<td></td>
													<td style="background-color: #D3D3D3;">1</td>
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;"></td>
													<td style="background-color:#D3D3D3;"></td>
													
													<td style="background-color: #D3D3D3;border-right: 1px solid SILVER;">118.865</td>
													<td><a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a></td>
												</tr>
											
										</tbody>
									</table>

								</div>
								
								
							</div>
							<div class="col-md-8">
								<div class="col-md-12 form-group">
									<form action="/Onlyou/cambio-tasso" method="post">
										<div class="col-md-6 form-group">

											<div id="change">
											<p id="months">
												Mese di cambio:
												<select name="month" id="month" style="max-width: 100px; display: inline-block; height: 34px;" class="form-control" onchange="showButton('1');">
													<option value="0">Mese</option>
													
														<option value="1">1</option>
													
														<option value="2">2</option>
													
														<option value="3">3</option>
													
														<option value="4">4</option>
													
														<option value="5">5</option>
													
														<option value="6">6</option>
													
														<option value="7">7</option>
													
														<option value="8">8</option>
													
														<option value="9">9</option>
													
														<option value="10">10</option>
													

												</select>
											</p>
											<p id="years">
												Anno di cambio:
												<select name="year" id="year" style="max-width: 100px; display: inline-block; height: 34px;" class="form-control" onchange="showButton('1');">
													<option value="0">Anno</option>
													
														<option value="2017">2017</option>
													
														<option value="2018">2018</option>
													
												</select>
											</p>
											<p id="cambios">
												Cambio:
												<input type="text" name="valuta" id="valuta" onkeyup="showButton('1');" />
											</p>
										</div>
										</div>
										<div class="col-md-3 form-group">
											<input type="submit" class="btn btn-balance" id="chButton"  disabled value="SUBMIT" />
										</div>

									</form>
								</div>

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
		// 		var file = document.getElementById("parFile").files.length;
		// 		if (n == '2' && file > 0) {

		// 			document.getElementById("parButton").disabled = false;
		// 		} else
		// 			document.getElementById("parButton").disabled = true;

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
</button>
<div class="user">
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
<footer>--%>
	<%--<small>© 2017 ONLYOU </small>
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
<%--</div>
		</div>
	</div>--%>

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
