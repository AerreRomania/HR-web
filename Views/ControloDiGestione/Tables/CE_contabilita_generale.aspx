<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CE_contabilita_generale.aspx.vb" Inherits="Views_ControloDiGestione_Tables_CE_contabilita_generale" %>

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
<link rel="stylesheet" type="text/css" href="../../css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="../../css/dataTables.bootstrap.min.css"/>
<script src="/Onlyou/js/jquery-2.1.0.min.js"></script>
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
<body bgcolor="#f4f4f4">
	<!-- LEFT NAVIGATION -->


	<div class="container">

		<%--<div class="">
			

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
</div>



		</div>--%>
		<div class="">
			



<%--<head>--%>
<style>

	

	thead{
		border-bottom:1px solid black;
		border-right:1px solid black;

	}

	#cinquepuntosei{
		/*background-color:#ffee00;*/
		width:100%;
		padding:5px;
		border:1px solid grey;
		border-collapse:collapse;
	}

	#myBtn{
		float:left;
		background-color:#f4f4f4;
		border-style:none;
		text-align:center;
	}

	.col-sm-12{
		text-align:center;
	}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #F4F4F4;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/*.btn btn-danger btn-sm{
	color:red;
	border-style:none;
}*/

body{
	padding-left:60px;
	padding-right:60px;
}


</style>



<%--</head>--%>

<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Contabilità generale</h1>

				<%--	<a class="link" href="/Onlyou/new/index.jsp?m=situazioni_economiche_cat">
						<i class="fa fa-chevron-left"></i> Indietro
					</a>
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno 2018</b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: right;">
						<section>
							<form action="/Onlyou/GetCPS" method="GET">--%>

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
								<button class="btn btn-danger btn-sm" name="clear" value="1" >Svuota valori</button>
							</form>

						</section>
					</div>
				</div>
				<div class="col-sm-12">
						<table>
							<tr>
								<td width="86%"><button id="myBtn" class="btn btn-link">INSERISCI VALORI</button>
								<td>Tasso di cambio: 118.626</td>
							</tr>
						</table>
				</div>
				<table id="cinquepuntosei" class="table table-bordered table-hover table-condensed">
					


<thead>
	<tr>
		<td style="background-color:yellow;border-right: 1px solid black; padding-top:20px;text-align:center;">Cod.1</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Cod.2</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Riclass</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Descrizione Riclassifica</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Descrizione Italiano</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Importo Rsd</th>
		<td style="background-color:yellow;border-right: 1px solid black;padding-top:20px;text-align:center;">Importo Euro</th>
	</tr>
</thead>
<tbody>
	
	<tr>
		<td style="background-color:white;border-right: 1px solid black;padding-top:10px;"></td>
		<td style="background-color:white;border-right: 1px solid black;"></td>
		<td style="background-color:white;border-right: 1px solid black;"></td>
		<td style="background-color:white;border-right: 1px solid black;"></td>
		<td style="background-color:white;border-right: 1px solid black;"><strong>TOTALE</strong></td>
		<td style="text-align:right;background-color:#d6d6c2;border-right: 1px solid black;"><strong>0.0</strong></td>
		<td style="text-align:right;background-color:#d6f5d6;border-right: 1px solid black;"><strong>0.0</strong></td>
	</tr>
	
</tbody>
				</table>


				<div id="myModal" class="modal">
					<div class="modal-content">
						INSERIMENTO VALORI A COLONNA
						<span class="close">&times;</span>
					</div>
					<div class="modal-content">

						<table id="cinquepuntosei_inserimento" class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th>Cod.1</thstyle="border-bottom:>
									<th>Cod.2</th>
									<th>Riclass</th>
									<th>Descrizione Riclassifica</th>
									<th>Descrizione Italiano</th>
									<th>Importo Rsd</th>
								</tr>
							</thead>

							<tbody>
								<tr>

									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="0" />
										</form>
									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="1" />
										</form>
									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="2" />
										</form>
									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="3" />
										</form>
									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="4" />
										</form>
									
										<form action="/Onlyou/SetCPStxtArea" method="POST">
											<td onclick="this.firstElementChild.disabled = false;"><textarea disabled rows="10" onchange="this.form.submit();" name="value"></textarea></td>
											<input type="hidden" name="year" value="2018" />
											<input type="hidden" name="month" value="4" />
											<input type="hidden" name="col" value="5" />
										</form>
									
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
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
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
	<div class="scroll-container">--%>
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Marca come importante" type="button"> -->
		
		<!--            </button> -->
	<%--	<button type="button" onclick="openModalShare()">
			<img src="/Onlyou/dashboard/images/dockicon/check.svg" alt="icon">
		</button>--%>
		<%--<button type="button" onclick="openModalPriority()">
			<img src="/Onlyou/dashboard/images/dockicon/remind.svg" alt="icon">
		</button>--%>
		<!--            <button uib-tooltip="Zoom" type="button"> -->
		
		<!--            </button> -->
		<!--            <button uib-tooltip="Carica" type="button"> -->
		
		<!--            </button> -->
		<%--<button type="button" onclick="printf()">
			<img src="/Onlyou/dashboard/images/dockicon/print.svg" alt="icon">
		</button>--%>
		<!--            <button uib-tooltip="Scarica" type="button"> -->
		
		<!--            </button> -->
<%--	</div>
</div>--%>
<input type="hidden" value="" id="param-start">
<script src="/Onlyou/ajax-pages/cinquepuntosei.js"></script>
<script>
	function printf() {

		window.print();
	}
	getCPS();
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
	</nav>--%>
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

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
