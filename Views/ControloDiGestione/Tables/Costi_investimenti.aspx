<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Costi_investimenti.aspx.cs" Inherits="Views_ControloDiGestione_Tables_Costi_investimenti" %>

<!DOCTYPE html>

<head>
	<meta charset="utf-8">
</head>
<body>
	

	<style>

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
	border:1px solid #000000;
	border-right:1px solid #000000;
	border-collapse:collapse;
	overflow-x:auto;

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
	border-right:1px solid #000000;
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
		margin-left:70px;
		color:#6495ED;
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
						<h4 id="tassi">INVESTIMENTI - Esercizio 2020 -
						</h4>
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
						</div>
						<div class="col-md-8">
						</div>
						<div class="col-md-2">
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
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version"></table>
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
			
														<div class="col-sm-12 form-group">
							<div  class="col-sm-4 form-group">
								<div  class="table-responsive">
									<table id="cambio"class="table table-bordered table-hover table-condensed version" >
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
				<table id="cinquepuntoquattro"class="table table-bordered table-hover table-condensed version">


<thead>
	<tr style="border-bottom:1px solid #000000;">
		</br>
		<th style="border: 1px solid #000000;;padding-top:20px;width:430px; font-weight:bold;font-size:15px;border-collapse:separate;">Divisione:KNITTING</br> Stabilim:SERBIA MAGLIERIA</th>
											</tr>
										</thead>
					
										<tbody>
										
												<tr>
													<td  style="border-top: 1px solid #000000;border-right: 1px solid #000000;border-left: 1px solid #000000;"><u><em>INVESTIMENTI TECNICI </em></u></td>
													</tr>
											
											<tr>
													<th style=" border-right: 1px solid #000000;border-left:1px solid black;/*padding-top:20px;*/width:140px; font-weight:bold;font-size:15px;"></th>
		<th style="border-right: 1px solid #000000;font-weight:bold;font-size:15px; width:140px;border-bottom:1px solid #000000;border-top: 1px solid #000000;margin-bottom:20px;" colspan="2">Autorizzato </th>
		<th style=" border-right: 1px solid #000000;width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;border-top: 1px solid #000000;"colspan="2">Odinato</th>
		<th style=" border-top: 1px solid #000000;width:133px;  font-weight:bold;font-size:15px;width:65px;border-bottom:1px solid #000000;"colspan="2">Fatturato</th>
													
												</tr>
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;"></td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td  style="border-right:1px solid #000000;"></td>
													<td></td>
													<a href="/Onlyou/DeleteMonth?month=9&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-ACQUISTO MACCHINE CONFEZIONE EX LAES BABIC</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>57.100</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>56.884 </td>
													<a href="/Onlyou/DeleteMonth?month=8&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
													

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-NR. 14 MACCHINE DA TESSERE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td></td>
													<a href="/Onlyou/DeleteMonth?month=7&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-ACQUISTO MACCHINE CONFEZIONE TECNOSTIRO</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>13.410</td>
													<td  style="border-right: 1px solid #000000;"></td>
												<td> </td>
												<td>13.197  </td>
													<a href="/Onlyou/DeleteMonth?month=6&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-TAVOLO STIRO</td>
													<td></td>
<%--													<td style="border-right: 1px solid #000000;"></td>--%>
<%--													<td>f</td>--%>
													<td style="border-right: 1px solid #000000;"></td>
													<td>5.550</td>
													<td  style="border-right: 1px solid #000000;"></td>
													<td></td>
												<td>5.450 </td>
													<a href="/Onlyou/DeleteMonth?month=5&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td  style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-ATTREZZATURE VARIE </td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>61.270</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
												<td>60.076 </td>
													<a href="/Onlyou/DeleteMonth?month=4&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-LUCI LED</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>25.250</td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>24.954  </td>
													<a href="/Onlyou/DeleteMonth?month=3&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-COMPRESSORE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>22.100 </td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>22.081  </td>
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-CITROEN C3</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>1.500 </td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>1.494  </td>
													<a href="/Onlyou/DeleteMonth?month=1&year=2017">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-MACCHINE MASCHERINE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>60.200 </td>
													<td style="border-right: 1px solid #000000;"></td>
												<td></td>
													<td>59.469 </td>
												
													<a href="/Onlyou/DeleteMonth?month=4&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-RICAMATRICE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>5.300 </td>
													<td style="border-right: 1px solid #000000;"></td>
											        <td></td>
													<td>5.200 </td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-VARIE ED EVENTUALI</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													 <td></td>
													<td> </td>
													<a href="/Onlyou/DeleteMonth?month=1&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-AREA SISTEMI INFORMATIVI: </td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td> </td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											
											<tr>
													<td style="border-right:1px solid #000000;border-left: 1px solid #000000;">-ACQUISTI PACCHETTI SOFTWARE</td>
													<td></td>
													<td style="border-right:1px solid #000000;"></td>
													<td>2.500 </td>
													<td style="border-right:1px solid #000000;"></td>
											    	<td></td>
													<td>2.500 </td>
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>
											

											<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">ACQUISTI HARDWARE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td>11.320 </td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>10.986 </td>

													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

											
											<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">ACQUISTI HARDWARE</td>
													<td></td>
													<td style="border-right: 1px solid #000000;"></td>		

													<td>265.500 </td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td>262.291 </td>
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
												</tr>

												<tr>
													<td style="border-right: 1px solid #000000;float:right;">Totale</td>
													<td></td>
													<td style="border-right: 1px solid #000000;">0</td>		

													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td></td>
													
													<a href="/Onlyou/DeleteMonth?month=2&year=2018">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</a>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;"><u> <em>INTERVENTI DI INGEGNERIA E MANUTENZIONE</u></em></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-AGGIORNAMENTO BLINDOSBARRE</td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-MIGLIORIE SICUREZZA STABILIMENTO</td>
												<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
												<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-LAVORI EDILI PAVIM. PARETI E PITTURE</td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

											<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-LAVORI EDILI SU FABB.16 AREA MENSA</td>
												<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
												<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-LAVORI ADEGUAMENTO ANTINCENDIO</td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-AMPLIAMENTO IMPIANTO ASPIRAZIONE STIRO</td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;border-left: 1px solid #000000;">-VARIE ED EVENTUALI</td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>
													<td></td>
																										<td style="border-right: 1px solid #000000;"></td>

													</tr>

												<tr>
													<td style="border-right: 1px solid #000000;float:right;">Totale</td>
													<td></td>
													<td style="border-right: 1px solid #000000;">0</td>		

													<td></td>
													<td style="border-right: 1px solid #000000;"></td>
													<td></td>
													<td></td>
													
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
					
<div id="tess">
										<tbody>
										
											<tr>
													<td style="width:430px ;height:40px;border-left:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">TOTALE</td>
													<%--<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>
													<td style="border-top:1px solid #000000;">ETC</td>--%>
													
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
		
<tbody>

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

