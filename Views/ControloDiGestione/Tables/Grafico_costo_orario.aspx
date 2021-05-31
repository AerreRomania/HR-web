<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grafico_costo_orario.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Grafico_costo_orario" %>

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
<link rel="stylesheet" href="../../css/datatable/datatables.bootstrap.css">
<link rel="stylesheet" href="../../css/datatable/datatables.min.css">
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
<script src="/Onlyou/dashboard/js/app.js"></script>


<script src="/Onlyou/dashboard/modules/treasure-plan-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/share/modal-share-ctrl.js"></script>
<script src="/Onlyou/dashboard/modules/modal/priority/modal-priority-ctrl.js"></script>
<!-- MODULES END -->
</head>
<body bgcolor="#F8F8FF">

	<div class="container">

		<div class="">
			

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

		<div class="">
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Grafico costo orario</h1>

					<a class="link" href="/Onlyou/new/index.jsp?m=costi_cat"> <i class="fa fa-chevron-left"></i> Indietro
					</a>
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno <span id="yearspan"></span></b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: right;">
						<section>
							Mese <select id="month" onchange="">
								
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
								
							</select> Anno <select id="year" onchange="">
								
									<option value="2017" >2017</option>
								
									<option value="2018" >2018</option>
								
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

					</div>
				</div>
				</br>
				</br>
				</br>
				<div id="seipuntodue">
					



<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChartTessitura);
	google.charts.setOnLoadCallback(drawChartConfezione);
	google.charts.setOnLoadCallback(drawChartStiro);

	function drawChartTessitura() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Diretti variabili', 11 ],
				[ 'Diretti fissi', 2 ], [ 'Ind + struttura', 2 ] ]);

		var options = {
			pieHole : 0.0,
            backgroundColor: "#F8F8FF",
			chartArea : {
				left : '50%',
				top : '30%',
				width : '50%',
				height : '50%'
			},
			colors : [ '#CFEACF', '#f6d2b4', '#61a3f9' ],
			hAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
			vAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchartTessitura'));
		chart.draw(data, options);
	}

	function drawChartConfezione() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Diretti variabili', 11 ],
				[ 'Diretti fissi', 2 ], [ 'Ind + struttura', 2 ] ]);

		var options = {
			pieHole : 0.0,
            backgroundColor: "#F8F8FF", /*initial  "#F4F4F4",*/
			chartArea : {
				left : '50%',
				top : '30%',
				width : '50%',
				height : '50%'
			},
			colors : [ '#CFEACF', '#f6d2b4', '#61a3f9' ],
			hAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
			vAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchartConfezione'));
		chart.draw(data, options);
	}

	function drawChartStiro() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Diretti variabili', 11 ],
				[ 'Diretti fissi', 2 ], [ 'Ind + struttura', 2 ] ]);

		var options = {
			pieHole : 0.0,
            backgroundColor: "#F8F8FF", /*initial "#F4F4F4",*/
			chartArea : {
				left : '50%',
				top : '30%',
				width : '50%',
				height : '50%'
			},
			colors : [ '#CFEACF', '#f6d2b4', '#61a3f9' ],
			hAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
			vAxis : {
				textStyle : {
					fontSize : '11',
					fontName : "Trebuchet MS"
				}
			},
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchartStiro'));
		chart.draw(data, options);
	}

	$(window).resize(function() {
		drawChartTessitura();
		drawChartConfezione();
		drawChartStiro();
	});
</script>




<div class="col-sm-4">
	<div id="donutchartConfezione"></div>
	<div class="col-sm-12">
		<p style="color: #61a3f9; font-size: 19px" class="col-sm-6">COSTO H/CICLO</p>
		<p style="color: #61a3f9" class="col-sm-5">Costo Confezione</p>
	</div>
	<div class="col-sm-12">
		<p style="color: #61a3f9; font-size: 19px" class="col-sm-6">TARIFFE</p>
		<p style="color: #61a3f9" class="col-sm-5"></p>
	</div>
	<div class="col-sm-12">
		<p style="color: #61a3f9; font-size: 19px" class="col-sm-6">% MARGINE</p>
		<p style="color: #61a3f9" class="col-sm-5"></p>
	</div>
</div>
<div class="col-sm-4">
	<div id="donutchartTessitura"></div>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10">Costo Tessitura</p>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10"></p>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10"></p>
</div>
<div class="col-sm-4">
	<div id="donutchartStiro"></div>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10">Costo Stiro</p>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10"></p>
	<p style="text-align: right; color: #61a3f9" class="col-sm-10"></p>
</div>

				</div>
			</div>
		</div>
	</section>
</div>


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

	   h1{
		   text-align:center;
	   }

	   .col-sm-5{
		   margin-right:380px;
	   }

			</style>
</body>
</html>

