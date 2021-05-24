





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



		</div>
		<div class="">
			





<!-- SETTING -->



	


	













<!-- END SETTING -->

<div>
	<section class="detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<h1>Costi mensili per reparto</h1>

					<a class="link" href="/Onlyou/new/index.jsp?m=costi_cat">
						<i class="fa fa-chevron-left"></i> Indietro
					</a>
					<div style="display: inline-block; float: right;">
						<b class="col-sm-12 knitting-title">Olimpias Knitting - anno <span id="yearspan">2018</span></b>
					</div>
					<div class="col-sm-5" style="display: inline-block; float: right;">
						<form action="/Onlyou/GetSetData" method="GET">
							<section>
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
							<input type="hidden" name="totalRow" value="80" />
							<input type="hidden" name="totalColumn" value="9" />
							<input type="hidden" name="table" value="seipuntocinque" />
							<input type="hidden" name="page" value="/new/index.jsp?m=seipuntocinque" />
						</form>
					</div>
				</div>
				<div id="">
					


<style>
.seipuntocinque th, td {
	white-space: nowrap;
	overflow: hidden;
	padding-left: 5px !important;
	padding-right: 5px !important;
}
</style>
<div class="col-md-12">
	<div class="col-md-5">
		<table class="table table-bordered table-hover table-condensed version seipuntocinque">
			
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th>TESSITURA</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th></th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;"></th>
					<th style="white-space: nowrap; overflow: hidden; padding-left: 5px; padding-right: 5px; width: 12.5%;">FATT. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">FATT. 18</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">C 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">C 18</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">costi GG</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 18</th>
				</tr>
			</thead>
			<tbody id="seipuntocinque_tessitura">
				





	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,0,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,0,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,0,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,0,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,1,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,1,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,1,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,1,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,2,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,2,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,2,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,2,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,3,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,3,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,3,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,3,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,4,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,4,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,4,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,4,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,5,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,5,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,5,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,5,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,6,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,6,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,6,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,6,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,7,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,7,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,7,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,7,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,8,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,8,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,8,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,8,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,9,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,9,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,9,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,9,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,10,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,10,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,10,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,10,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,11,2,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,11,3,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,11,4,'_tessitura')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,11,5,'_tessitura')"></td>
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
		
			<td></td>
		
		
		
		
		
            <td></td>
        
		
		
		
            <td></td>
        
		
	</tr>

<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>fatturato</td>
	<td></td>
	<td>costi</td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden;">Media mese</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr style="height: 10px !important; background-color: #FFFFFF;"></tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden" colspan="2">Scostamenti con a.p.</td>
	<td colspan="2">Fatturato</td>
	<td colspan="2"></td>
    
    </tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">Costi</td>
	<td colspan="2"></td>
    
    
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">TOTALE</td>
	<td colspan="2"></td>
    
    </tr>

		</table>
	</div>
	<div class="col-md-7">
		<div>
			<canvas id="chart_div_tessitura_costi" width="100%" height="20%"></canvas>
		</div>
		<div>
			<canvas id="chart_div_tessitura_ricavi" width="100%" height="20%"></canvas>
		</div>
		<!-- 		<div style="width: 100%;" id="chart_div_tessitura_costi"></div> -->
		<!-- 		<div style="width: 100%;" id="chart_div_tessitura_ricavi"></div> -->
	</div>
</div>



<div class="col-md-12">
	<div class="col-md-5">
		<table class="table table-bordered table-hover table-condensed version seipuntocinque">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th>CONFEZIONE</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th></th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;"></th>
					<th style="white-space: nowrap; overflow: hidden; padding-left: 5px; padding-right: 5px;">FATT. 17</th>
					<th style="white-space: nowrap; overflow: hidden;">FATT. 18</th>
					<th style="white-space: nowrap; overflow: hidden;">C 17</th>
					<th style="white-space: nowrap; overflow: hidden;">C 18</th>
					<th style="white-space: nowrap; overflow: hidden;">costi GG</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 18</th>
				</tr>
			</thead>
			<tbody id="seipuntocinque_confezione">
				





	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,20,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,20,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,20,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,20,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,21,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,21,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,21,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,21,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,22,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,22,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,22,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,22,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,23,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,23,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,23,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,23,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,24,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,24,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,24,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,24,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,25,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,25,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,25,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,25,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,26,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,26,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,26,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,26,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,27,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,27,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,27,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,27,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,28,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,28,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,28,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,28,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,29,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,29,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,29,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,29,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,30,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,30,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,30,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,30,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,31,2,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,31,3,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,31,4,'_confezione')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,31,5,'_confezione')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>fatturato</td>
	<td></td>
	<td>costi</td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden;">Media mese</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr style="height: 10px !important; background-color: #FFFFFF;"></tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden" colspan="2">Scostamenti con a.p.</td>
	<td colspan="2">Fatturato</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">Costi</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">TOTALE</td>
	<td colspan="2"></td>
	
	
</tr>

			</tbody>
		</table>
	</div>
	<div class="col-md-7">
		<div>
			<canvas id="chart_div_confezione_costi" width="100%" height="20%"></canvas>
		</div>
		<div>
			<canvas id="chart_div_confezione_ricavi" width="100%" height="20%"></canvas>
		</div>
		<!-- 		<div style="width: 100%;" id="chart_div_confezione_costi"></div> -->
		<!-- 		<div style="width: 100%;" id="chart_div_confezione_ricavi"></div> -->
	</div>
</div>


<div class="col-md-12">
	<div class="col-md-5">
		<table class="table table-bordered table-hover table-condensed version seipuntocinque">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th>STIRO</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th></th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;"></th>
					<th style="white-space: nowrap; overflow: hidden; padding-left: 5px; padding-right: 5px;">FATT. 17</th>
					<th style="white-space: nowrap; overflow: hidden;">FATT. 18</th>
					<th style="white-space: nowrap; overflow: hidden;">C 17</th>
					<th style="white-space: nowrap; overflow: hidden;">C 18</th>
					<th style="white-space: nowrap; overflow: hidden;">costi GG</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 18</th>
				</tr>
			</thead>
			<tbody id="seipuntocinque_stiro">
				





	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,40,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,40,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,40,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,40,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,41,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,41,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,41,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,41,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,42,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,42,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,42,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,42,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,43,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,43,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,43,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,43,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,44,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,44,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,44,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,44,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,45,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,45,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,45,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,45,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,46,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,46,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,46,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,46,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,47,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,47,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,47,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,47,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,48,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,48,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,48,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,48,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,49,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,49,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,49,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,49,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,50,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,50,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,50,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,50,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,51,2,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,51,3,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,51,4,'_stiro')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,51,5,'_stiro')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>fatturato</td>
	<td></td>
	<td>costi</td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden;">Media mese</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr style="height: 10px !important; background-color: #FFFFFF;"></tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden" colspan="2">Scostamenti con a.p.</td>
	<td colspan="2">Fatturato</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">Costi</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">TOTALE</td>
	<td colspan="2"></td>
	
	
</tr>

			</tbody>
		</table>
	</div>
	<div class="col-md-7">
		<canvas id="chart_div_stiro_costi" width="100%" height="20%"></canvas>
		<canvas id="chart_div_stiro_ricavi" width="100%" height="20%"></canvas>
		<!-- 		<div style="width: 100%;" id="chart_div_stiro_costi"></div> -->
		<!-- 		<div style="width: 100%;" id="chart_div_stiro_ricavi"></div> -->
	</div>
</div>
<div class="col-md-12">
	<div class="col-md-5">
		<table class="table table-bordered table-hover table-condensed version seipuntocinque">
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th>TOTALE REPARTI</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr>
					<th></th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;"></th>
					<th style="white-space: nowrap; overflow: hidden; padding-left: 5px; padding-right: 5px; width: 12.5%;">FATT. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">FATT. 18</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">C 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">C 18</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">costi GG</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 17</th>
					<th style="white-space: nowrap; overflow: hidden; width: 12.5%;">Ris. 18</th>
				</tr>
			</thead>
			<tbody id="seipuntocinque_generale">
				





	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,60,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,60,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,60,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,60,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,61,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,61,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,61,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,61,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,62,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,62,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,62,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,62,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,63,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,63,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,63,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,63,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,64,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,64,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,64,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,64,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,65,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,65,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,65,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,65,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,66,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,66,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,66,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,66,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,67,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,67,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,67,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,67,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,68,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,68,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,68,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,68,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,69,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,69,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,69,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,69,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,70,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,70,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,70,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,70,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,71,2,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,71,3,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,71,4,'_generale')"></td>
				
			
		
			
				
				
				
				
					<td onclick="setDataMulti(this,71,5,'_generale')"></td>
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

	<tr>
		
			
				
					<td></td>
				
				
				
				
			
		
			
				
				
					<td></td>
				
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
			
				
				
				
					<td></td>
				
				
			
		
		
			
				<td></td>
			
			
		
			
			
				<td></td>
			
		
			
			
				<td></td>
			
		

	</tr>

<tr>
	<td></td>
	<td></td>
	<td></td>
	<td>fatturato</td>
	<td></td>
	<td>costi</td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden;">Media mese</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
</tr>
<tr style="height: 10px !important; background-color: #FFFFFF;"></tr>
<tr>
	<td></td>
	<td style="white-space: nowrap; overflow: hidden" colspan="2">Scostamenti con a.p.</td>
	<td colspan="2">Fatturato</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">Costi</td>
	<td colspan="2"></td>
	
	
</tr>
<tr>
	<td></td>
	<td colspan="2"></td>
	<td colspan="2">TOTALE</td>
	<td colspan="2"></td>
	
	
</tr>

			</tbody>
		</table>
	</div>
	<div class="col-md-7">
		<canvas id="chart_div_generale_costi" width="100%" height="20%"></canvas>
		<canvas id="chart_div_generale_ricavi" width="100%" height="20%"></canvas>
		<!-- 		<div style="width: 100%;" id="chart_div_generale_costi"></div> -->
		<!-- 		<div style="width: 100%;" id="chart_div_generale_ricavi"></div> -->
	</div>
</div>
</div>
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
// 	var lineChartData = {
// 		labels : [ 'January', 'February', 'March', 'April', 'May', 'June', 'July' ],
// 		datasets : [ {
// 			label : 'My First dataset',
// 			borderColor : "#00ff00",
// 			backgroundColor : "rgba(0, 0, 0, 0.1)",
// 			fill : false,
// 			data : [ 10, 20 ],
// 			yAxisID : 'y-axis-1',
// 		}, {
// 			label : 'My Second dataset',
// 			//      borderColor: window.chartColors.blue,
// 			//      backgroundColor: window.chartColors.blue,
// 			fill : false,
// 			data : [ 20, 10 ],
// 			yAxisID : 'y-axis-2'
// 		} ]
// 	};

// 	window.onload = function() {
// 		var ctx = document.getElementById('myChart').getContext('2d');
// 		window.myLine = Chart.Line(ctx, {
// 			data : lineChartData,
// 			options : {
// 				responsive : true,
// 				hoverMode : 'index',
// 				stacked : false,
// 				title : {
// 					display : true,
// 					text : 'Chart.js Line Chart - Multi Axis'
// 				},
// 				scales : {
// 					yAxes : [ {
// 						type : 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
// 						display : true,
// 						position : 'left',
// 						id : 'y-axis-1',
// 					}, {
// 						type : 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
// 						display : true,
// 						position : 'right',
// 						id : 'y-axis-2',

// 						// grid line settings
// 						gridLines : {
// 							drawOnChartArea : false, // only want the grid lines for one axis to show up
// 						},
// 					} ],
// 				}
// 			}
// 		});
// 	};

// 	document.getElementById('randomizeData').addEventListener('click', function() {
// 		lineChartData.datasets.forEach(function(dataset) {
// 			dataset.data = dataset.data.map(function() {
// 				return randomScalingFactor();
// 			});
// 		});

// 		window.myLine.update();
// 	});

	// var ctx = document.getElementById("myChart").getContext('2d');
	// var myChart = new Chart(ctx, {
	//     type: 'bar',
	//     data: {
	//         labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	//         datasets: [{
	//             label: '# of Votes',
	//             data: [12, 19, 3, 5, 2, 3],
	//             backgroundColor: [
	//                 'rgba(255, 99, 132, 0.2)',
	//                 'rgba(54, 162, 235, 0.2)',
	//                 'rgba(255, 206, 86, 0.2)',
	//                 'rgba(75, 192, 192, 0.2)',
	//                 'rgba(153, 102, 255, 0.2)',
	//                 'rgba(255, 159, 64, 0.2)'
	//             ],
	//             borderColor: [
	//                 'rgba(255,99,132,1)',
	//                 'rgba(54, 162, 235, 1)',
	//                 'rgba(255, 206, 86, 1)',
	//                 'rgba(75, 192, 192, 1)',
	//                 'rgba(153, 102, 255, 1)',
	//                 'rgba(255, 159, 64, 1)'
	//             ],
	//             borderWidth: 1
	//         }]
	//     },
	//     options: {
	//         scales: {
	//             yAxes: [{
	//                 ticks: {
	//                     beginAtZero:true
	//                 }
	//             }]
	//         }
	//     }
	// });
</script>

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
	//	var tessituraData = [{3,3,3,3,3,3,3,3,3}];
	// 	setTimeout(function() {
	// 		console.log("->");
	// 		var tablea = $('#seipuntocinque_tessitura');
	// 		tablea.DataTable({
	//             scrollY : "800px",
	//             scrollX : true,
	//             scrollCollapse : false,
	//             paging : false,
	//             fixedColumns : false,
	//             "searching" : false,
	//             "info" : false,
	//             "ordering" : false,
	//         });
	//     }, 5000);
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