<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manutenzioni_Ordinarie.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Manutenzioni_Ordinarie" %>

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
	
    		 <div align="right">
	<button onclick="window.print()">
		<img class="top-icons" onclick="printData();" src="/Images/C.Gestione/dockicon/print.svg" alt="Print" />
	</button>
	</div>
</br>


    <table style="border-collapse:separate;margin-left:550px;width:5%">
            <figcaption style="margin-left:445px;font-family:monospace;font-size:13px;">DATI PER GRAFO:</figcaption> 
  <tr>
                              
      
    <th>11.310</th>
      <th>6099</th>

    <th>8116</th>

    <th>10.307</th>
  </tr>
     
  <tr>
    <td> 23.660 </td>
    <td> 4.989 </td>
    <td> 11.142 </td>
    <td> 13.737 </td>
  </tr>

  <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
          <tr>
    <td> 46.760 </td>
    <td> 16.885 </td>
    <td> 6.902 </td>
    <td> 10.923 </td>
    
  </tr>
</table>
    </br>
    </br>

    <div id="forms">

        <form>
  <label for="fname">Dati grafico ok?</label>
  <input type="text" id="fname3" name="fname">
        <br><br>
  <label for="lname">data rif.report:</label>&nbsp; &nbsp; 
  <input type="text" id="lname2" name="lname">
        </br>
        </br>
        <label for="lname">Coerenza mese:</label>
  <input type="text" id="lname" name="lname">
     
        <br><br>
 <%-- <input type="submit" value="Submit">--%>
</form>
    </div>

     <table style="width:100%;color:red;">
    <figcaption>	
        <center>
		CONSUNTIVO MANUTENZIONI ORDINARIE-Esercizio 2020			
            </center>
</figcaption>
         </br>
         </table>
              <table id="second" style="border-collapse:separate;margin-left:100px;width:60%;">

  <tr>
          <%--<caption>2017</caption>                     
        <caption>2018</caption>  
          <caption>2019</caption>  
          <caption>2020</caption>  --%>
    <th style="border-style:dashed;">Divisione: TESSITURA CAPI	
Stabilim.: KNITTING - SERBIA	</th>
      <th style="border-style:dashed;width:60px;">Cons.</br>2017</th>

    <th style="border-style:dashed;width:60px;">Cons.</br>2018</th>

    <th style="border-style:dashed;width:60px;">Cons.</br>2019</th>
    <th style="border-style:dashed;width:60px;">BDG</br>
        2020</th>
    <th style="border-style:dashed;width:60px;">PRC1</br>
        2020</th>
    <th style="border-style:dashed;width:60px;">PRC2</br>
2020</th>
    <th style="border-style:dashed;width:60px;">Progr. a	</br>
precedente	
</th>
    <th style="border-style:dashed;width:60px;">Spesato a</br>
dic-20</th>
    <th style="border-style:dashed;width:60px;">Progr. a</br>
dic-20
</th>
  </tr>
         </table>

    </br>
    </br>

     <table id="second" style="border-collapse:separate;margin-left:100px;width:60%;">
    
  <tr>
          <%--<caption>2017</caption>                     
        <caption>2018</caption>  
          <caption>2019</caption>  
          <caption>2020</caption>  --%>
    <th style="border-style:dashed;width:14%;padding-top:15px;padding-bottom:15px;">FABBRICATI:	
IMPIANTI:	
MACCHINARI:	
ATTREZZATURE INDUSTRIALI:	
MEZZI DI TRASPORTO:	
	</th>
      <th style="border-style:dashed;width:60px;"> 76.879 </br>
 139.894 </br>
 54.387 </br>
 1.000 
</th>

    <th style="border-style:dashed;width:60px;"> 783 v
 25.879 </br>
 144.336 </br>
 28.542 </br>
 1.819 </br>
</th>

    <th style="border-style:dashed;width:60px;"> 873 </br>
 27.219 </br>
 119.594 </br>
 22.792 </br>
 878 
</th>
    <th style="border-style:dashed;width:60px;"> 10.000 	</br>
 35.000 	</br>
 85.000 	</br>
 35.000 	</br>
 2.000 	
</th>
    <th style="border-style:dashed;width:60px;"></th>
    <th style="border-style:dashed;width:60px;"></th>
    <th style="border-style:dashed;width:60px;"> 5.573 </br>
 8.051 </br>
 83.414 </br>
 15.909 </br>
 465 

</th>
    <th style="border-style:dashed;width:60px;"> 148 </br>
 -   
 21.091 </br>
 4.185 </br>
 285 
</th>
    <th style="border-style:dashed;width:60px;"> 5.721 </br>
 8.051 </br>
 104.505 </br>
 20.094 </br>
 749 

</th>
  </tr>
         </table>
    </br>
    </br>
     <table id="second" style="border-collapse:separate;margin-left:100px;width:60%;">
    
  <tr>
          <%--<caption>2017</caption>                     
        <caption>2018</caption>  
          <caption>2019</caption>  
          <caption>2020</caption>  --%>
    <th style="border-style:dashed;width:14%;padding-top:15px;padding-bottom:15px;">TOTALE

	</th>
      <th style="border-style:dashed;width:60px;">  272.160 

</th>

    <th style="border-style:dashed;width:60px;">  201.359 

</th>

    <th style="border-style:dashed;width:60px;">  171.357 

</th>
    <th style="border-style:dashed;width:60px;">  167.000 

</th>
    <th style="border-style:dashed;width:60px;">-</th>
    <th style="border-style:dashed;width:60px;">-</th>
    <th style="border-style:dashed;width:60px;"> 113.413 

</th>
    <th style="border-style:dashed;width:60px;"> 25.709 

</th>
    <th style="border-style:dashed;width:60px;">  139.121 

</th>
  </tr>
         
         </table>
    </br>
    </br>
   <table border="0"  id="novalues">
       <tr>
           <th style="border-bottom:hidden;font-size:17px ;text-align:center;">Budget</th>
       </tr>
        <tr>
           <th style="border-bottom:hidden;">300.000&nbsp; --------------------------------------- <%--<hr size="1" width="180px" align="right"/>--%></th>
       </tr>
     <tr>
           <th style="border-bottom:hidden;">250.000&nbsp; --------------------------------------- </th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">200.000&nbsp; ---------------------------------------</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">150.000&nbsp; ---------------------------------------</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">100.000&nbsp; ---------------------------------------</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">50.000&nbsp;&nbsp; ----------------------------------------</th>
       </tr>
       <tr>
           <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;-----------------------------------------</th>
       </tr>
   </table>
   
     </br>
    </br>
    <center>
   <table border="0"  id="novalues2">
       <tr>
           <th style="border-bottom:hidden;font-size:17px ;text-align:center;">Andamento Mensile</th>
       </tr>
        <tr>
           <th style="border-bottom:hidden;">60.000</th>
       </tr>
     <tr>
           <th style="border-bottom:hidden;">50.000</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">40.000</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">30.000</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">20.000</th>
       </tr>
       <tr>
           <th style="border-bottom:hidden;">10.000</th>
       </tr>
       <tr>
           <th>0</th>
       </tr>
   </table>
   </center>
<html>
<head>
<style>

    .top-icons{
        background-color:darkred;
    }
     th, td {
  border: 1px solid black;
  border-collapse: separate;
}
th, td {
  padding: 7px;
  text-align: left;
  font-size:13px;
}

#lname{
    background-color:#000000;
    width:10%;
            margin-left:4px;
            border:1px ridge #000000 ;
            color:red;
}

#lname2{
    background-color:#FFFF00;
        width:10%;
       margin-left:3px;
     border:1px ridge #000000;

}

#fname3{
        width:10%;
        margin-left:3px;
       border:1px ridge #000000 ;
}

#captions{
    color:red;
}

#novalues{
    margin-left:100px;
    width:250px;
    height:300px;
    border-collapse:collapse;
      color: #A9A9A9;
      border-color:#A9A9A9;
}

#novalues2{
    margin-left:100px;
    width:500px;
    height:300px;
    border-collapse:collapse;
      color: #A9A9A9;
      border-color:#A9A9A9;
      margin-top:-335px;
      margin-left:-30px;/*margin-left:170px;*/
}

  
</style>
</head>
<body>

   
			
<%--<div class="row">
  <div class="column">
    <table>
        <tbody>
           
  
    

										</tbody>

    </table>
  </div>
</div>

</body>--%>
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