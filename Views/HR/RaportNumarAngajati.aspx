<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportNumarAngajati.aspx.cs" Inherits="RaportNumarAngajati" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="hRaportNumarAngajati" runat="server">
    <title>Organico Generale</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <%--<link href="Css/height.css" rel="stylesheet" type="text/css" />--%>
    <link href="../../css/mobile/HR/OrganicoGenerale.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .top-icons {
            cursor: pointer;
        }

            .top-icons:hover {
            }

        body {
            height: 1200px !important;
            background-color: #f4f4f4;
        }

        td.rSelectat {
            background-color: #cecece;
            color: black !important;
        }

        #tRaportNumarAngajati #Departament_6, #tRaportNumarAngajati #Ianuarie_6, #tRaportNumarAngajati #Februarie_6, #tRaportNumarAngajati #Martie_6, #tRaportNumarAngajati #Aprilie_6, #tRaportNumarAngajati #Mai_6, #tRaportNumarAngajati #Iunie_6, #tRaportNumarAngajati #Iulie_6, #tRaportNumarAngajati #August_6, #tRaportNumarAngajati #Septembrie_6, #tRaportNumarAngajati #Octombrie_6, #tRaportNumarAngajati #Noiembrie_6, #tRaportNumarAngajati #Decembrie_6, #tRaportNumarAngajati #Medie_6 {
            background-color: white;
        }

        #tRaportNumarAngajatiMaternita #Departament_5, #tRaportNumarAngajatiMaternita #Ianuarie_5, #tRaportNumarAngajatiMaternita #Februarie_5, #tRaportNumarAngajatiMaternita #Martie_5, #tRaportNumarAngajatiMaternita #Aprilie_5, #tRaportNumarAngajatiMaternita #Mai_5, #tRaportNumarAngajatiMaternita #Iunie_5, #tRaportNumarAngajatiMaternita #Iulie_5, #tRaportNumarAngajatiMaternita #August_5, #tRaportNumarAngajatiMaternita #Septembrie_5, #tRaportNumarAngajatiMaternita #Octombrie_5, #tRaportNumarAngajatiMaternita #Noiembrie_5, #tRaportNumarAngajatiMaternita #Decembrie_5, #tRaportNumarAngajatiMaternita #Medie_5 {
            background-color: white;
        }

        #Departament_5 {
            color: black;
        }

        .heading {
            background: #ffc107;
            line-height: 30px;
            margin-bottom: 3px;
            max-width: 1350px;
            box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }

        #htDepartament, #htCodSistem, #htMarca, #htRaportNumarAngajat, #htPrenume, #htData, #htTipOra, #htR1DAL, #htR1ALL, #htR1TOT, #Label1, #Label2, #Label3, #Label4, #Label5, #Label6, #Label7, #Label8, #Label9, #Label10, #Label11, #Label12, #Label13, #Label14, #Label15, #Label16, #Label17, #Label18 {
            box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }

        .google-visualization-tooltip { z-index:+1; margin-top:-180px;margin-left:40px;} 

        #tRaportNumarAngajati #Departament_0:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }
        #tRaportNumarAngajati #Departament_1:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }
        #tRaportNumarAngajati #Departament_2:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }
        #tRaportNumarAngajati #Departament_3:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }

       #tRaportNumarAngajati #Departament_4:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
       }
        #tRaportNumarAngajati #Departament_5:hover{
            cursor:pointer;
            background:#FFC107;
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }


    </style>

    <style type="text/css" media="print">
        @page {
            size: landscape;
        }

        .rSecund {
            text-transform: uppercase !important;
        }
    </style>

</head>
<body>
    <form id="fRaportNumarAngajati" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportNumarAngajati" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportNumarAngajatiWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-1.12.4.min.js" />
                <asp:ScriptReference Path="~/Js/RaportNumarAngajati.js" />
                <asp:ScriptReference Path="~/Js/pagina.js" />
                <asp:ScriptReference Path="~/js/peki_angajati_sort.js" />
                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="~/js/printThis.js" />
                <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/html2canvas.js" />
                <asp:ScriptReference Path="https://www.google.com/jsapi" />
             </Scripts>
        </asp:ScriptManager>

        <div id="editor"></div>

        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                            <td style="width: 100px;">
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx">&lt;Main&gt;</asp:HyperLink>
                            </td>

                            <td align="center">
                                <asp:Label ID="lRaportNumarAngajati" runat="server" CssClass="principal" Text="Organico Generale MENSILE"></asp:Label>
                            </td>

                            <td style="width: 50px;">
                                <img class="top-icons" onclick="$('#bExcel').click();" src="../../Images/icons/icon-excel.png" alt="Export to Excel" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print" /></td>

                            <td style="width: 150px;">
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="../../Images/Image/loading.gif" alt="Loading ..." />
                                        Loading ...
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellpadding="0" cellspacing="0" class="principal">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                         </td>
                                        <td>
                                           
                                        </td>
                                        <td style="width: 40px;">&nbsp;
                                        </td>
                                        <td>
                                            <input runat="server" id="bExcel" visible="true" value="Export to Excel" style="display: none;" type="button" onclick="fnExcelReport(); fnExcelReportMaternita();" class="xls" />
                                            <iframe id="txtArea1" style="display: none"></iframe>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="tbla1">
                        <tr>
                            <td valign="top" style="height: 130px">

                                 <div class="heading">
                                        <h3 style="margin-left: 65px; margin-bottom: 0px; text-transform: uppercase;">General Report: <span style="float:right;margin-right:15px;">Anno: <asp:DropDownList ID="ddlFiltruAn" runat="server">
                                                
                                                <asp:ListItem>2020</asp:ListItem>

                                            </asp:DropDownList></span> </h3>
                                </div>
                                <table id="tRaportNumarAngajati" width="100%" style="  border-collapse: collapse;">
                                   
                                    <tr>
                                        <td class="rSecund" style="">
                                            <asp:Label ID="htDepartament" runat="server"
                                                Text="REPARTO:" Width="250px" Style=""></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htCodSistem" runat="server"
                                                Text="Gennaio" Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htMarca" runat="server"
                                                Text="Febbraio" Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htRaportNumarAngajat" runat="server"
                                                Text="Marzo" Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htPrenume" runat="server"
                                                Text="Aprile" Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htData" runat="server"
                                                Text="Maggio" Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htTipOra" runat="server" Text="Giugno"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1DAL" runat="server" Text="Luglio"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1ALL" runat="server" Text="Agosto"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1TOT" runat="server" Text="Settembre"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label1" runat="server" Text="Ottobre"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label2" runat="server" Text="Novembre"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label3" runat="server" Text="Dicembre"
                                                Width="80px"></asp:Label></td>
                                        <td class="rSecund" style="background: transparent;">
                                            <asp:Label ID="Label4" Style="background: #cecece;" runat="server" Text="MEDIA" Width="80px">
                                            </asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <table id="tbla2">
                        <tr>
                            <td valign="top" style="height: 130px">

                             <div class="heading">
                                    <h3 style="margin-left: 65px; margin-bottom: 0px; text-transform: uppercase;">di qui Maternita Report:</h3>
                                </div>
                            <table id="tRaportNumarAngajatiMaternita" width="100%" style=" border-collapse: collapse;">
                                <tr>
                                    <td class="rSecund" style="">
                                        <asp:Label ID="Label5" runat="server"
                                            Text="REPARTO:" Width="250px" Style=""></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label6" runat="server"
                                            Text="Gennaio" Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label7" runat="server"
                                            Text="Febbraio" Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label8" runat="server"
                                            Text="Marzo" Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label9" runat="server"
                                            Text="Aprile" Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label10" runat="server"
                                            Text="Maggio" Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label11" runat="server" Text="Giugno"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label12" runat="server" Text="Luglio"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label13" runat="server" Text="Agosto"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label14" runat="server" Text="Settembre"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label15" runat="server" Text="Ottobre"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label16" runat="server" Text="Novembre"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund">
                                        <asp:Label ID="Label17" runat="server" Text="Dicembre"
                                            Width="80px"></asp:Label></td>
                                    <td class="rSecund" style="background: transparent;">
                                        <asp:Label ID="Label18" Style="background: #cecece;" runat="server" Text="MEDIA" Width="80px">
                                        </asp:Label></td>
                                </tr>
                            </table>
                          </td>
                        </tr>
                    </table>

                    <br />
                    <h2 id="hchart">Totale dipendenti:</h2>
                    <div id="bar-chart-totale" style="width:100%">
                    </div>
                    <br />
                    <br />
                    <div id="printing-holder" style="width:100%"></div>
                    <asp:HiddenField ID="hfId" runat="server" />
                    <asp:HiddenField ID="hfRowIndex" runat="server" />
                </td>
            </tr>
        </table>
  <script type="text/javascript">
      $(document).ready(function () {
          $("#ddlFiltruAn").change(function () {
              setTimeout(function () {
                  drawChartsTotale();

                  $("#4").click(function () {
                      drawChartsTessitura();
                      $("#hchart").text('Tessitura dipendenti:');
                  });

                  $("#1").click(function () {
                      drawChartsConfA();
                      $("#hchart").text('Confezione A dipendenti:');
                  });

                  $("#2").click(function () {
                      drawChartsConfB();
                      $("#hchart").text('Confezione B dipendenti:');
                  });

                  $("#3").click(function () {
                      drawChartsStiro();
                      $("#hchart").text('Stiro dipendenti:');
                  });

                  $("#0").click(function () {
                      drawChartsAmmini();
                      $("#hchart").text('Amministrazione dipendenti:');
                  });

                  $("#5").click(function () {
                      drawChartsTotale();
                      $("#hchart").text('Totale dipendenti:');
                  });

              }, 2000);
          });
          setTimeout(function () {
              drawChartsTotale();

              $("#4").click(function () {
                  drawChartsTessitura();
                  $("#hchart").text('Tessitura dipendenti:');
              });

              $("#1").click(function () {
                  drawChartsConfA();
                  $("#hchart").text('Confezione A dipendenti:');
              });

              $("#2").click(function () {
                  drawChartsConfB();
                  $("#hchart").text('Confezione B dipendenti:');
              });

              $("#3").click(function () {
                  drawChartsStiro();
                  $("#hchart").text('Stiro dipendenti:');
              });

              $("#0").click(function () {
                  drawChartsAmmini();
                  $("#hchart").text('Amministrazione dipendenti:');
              });

              $("#5").click(function () {
                  drawChartsTotale();
                  $("#hchart").text('Totale dipendenti:');
              });

          }, 2000);
      });

      google.load("visualization", "1", { packages: ["corechart"] });

      function drawChartsTotale() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'TESSITURA', 'CONFEZIONE A', 'CONFEZIONE B', 'STIRO', 'AMMINISTRAZIONE'],
              ['Gennaio', parseInt($('#Ianuarie_4').text()) || 0, parseInt($('#Ianuarie_1').text()) || 0, parseInt($('#Ianuarie_2').text()) || 0, parseInt($('#Ianuarie_3').text()) || 0, parseInt($('#Ianuarie_0').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_4').text()) || 0, parseInt($('#Februarie_1').text()) || 0, parseInt($('#Februarie_2').text()) || 0, parseInt($('#Februarie_3').text()) || 0, parseInt($('#Februarie_0').text()) || 0],
              ['Marzo', parseInt($('#Martie_4').text()) || 0, parseInt($('#Martie_1').text()) || 0, parseInt($('#Martie_2').text()) || 0, parseInt($('#Martie_3').text()) || 0, parseInt($('#Martie_0').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_4').text()) || 0, parseInt($('#Aprilie_1').text()) || 0, parseInt($('#Aprilie_2').text()) || 0, parseInt($('#Aprilie_3').text()) || 0, parseInt($('#Aprilie_0').text()) || 0],
              ['Maggio', parseInt($('#Mai_4').text()) || 0, parseInt($('#Mai_1').text()) || 0, parseInt($('#Mai_2').text()) || 0, parseInt($('#Mai_3').text()) || 0, parseInt($('#Mai_0').text()) || 0],
              ['Giugno', parseInt($('#Iunie_4').text()) || 0, parseInt($('#Iunie_1').text()) || 0, parseInt($('#Iunie_2').text()) || 0, parseInt($('#Iunie_3').text()) || 0, parseInt($('#Iunie_0').text()) || 0],
              ['Luglio', parseInt($('#Iulie_4').text()) || 0, parseInt($('#Iulie_1').text()) || 0, parseInt($('#Iulie_2').text()) || 0, parseInt($('#Iulie_3').text()) || 0, parseInt($('#Iulie_0').text()) || 0],
              ['Agosto', parseInt($('#August_4').text()) || 0, parseInt($('#August_1').text()) || 0, parseInt($('#August_2').text()) || 0, parseInt($('#August_3').text()) || 0, parseInt($('#August_0').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_4').text()) || 0, parseInt($('#Septembrie_1').text()) || 0, parseInt($('#Septembrie_2').text()) || 0, parseInt($('#Septembrie_3').text()) || 0, parseInt($('#Septembrie_0').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_4').text()) || 0, parseInt($('#Octombrie_1').text()) || 0, parseInt($('#Octombrie_2').text()) || 0, parseInt($('#Octombrie_3').text()) || 0, parseInt($('#Octombrie_0').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_4').text()) || 0, parseInt($('#Noiembrie_1').text()) || 0, parseInt($('#Noiembrie_2').text()) || 0, parseInt($('#Noiembrie_3').text()) || 0, parseInt($('#Noiembrie_0').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_4').text()) || 0, parseInt($('#Decembrie_1').text()) || 0, parseInt($('#Decembrie_2').text()) || 0, parseInt($('#Decembrie_3').text()) || 0, parseInt($('#Decembrie_0').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,
              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#98604c', '#f32828', '#af1d1d', '#259f11', '#8bc34a'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }

      function drawChartsTessitura() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'TESSITURA', { role: 'annotation' }],
              ['Gennaio', parseInt($('#Ianuarie_4').text()) || 0, parseInt($('#Ianuarie_4').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_4').text()) || 0, parseInt($('#Februarie_4').text()) || 0],
              ['Marzo', parseInt($('#Martie_4').text()) || 0, parseInt($('#Martie_4').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_4').text()) || 0, parseInt($('#Aprilie_4').text()) || 0],
              ['Maggio', parseInt($('#Mai_4').text()) || 0, parseInt($('#Mai_4').text()) || 0],
              ['Giugno', parseInt($('#Iunie_4').text()) || 0, parseInt($('#Iunie_4').text()) || 0],
              ['Luglio', parseInt($('#Iulie_4').text()) || 0, parseInt($('#Iulie_4').text()) || 0],
              ['Agosto', parseInt($('#August_4').text()) || 0, parseInt($('#August_4').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_4').text()) || 0, parseInt($('#Septembrie_4').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_4').text()) || 0, parseInt($('#Octombrie_4').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_4').text()) || 0, parseInt($('#Noiembrie_4').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_4').text()) || 0, parseInt($('#Decembrie_4').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,
              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#98604c'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }

      function drawChartsConfA() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'CONFZIONE A', { role: 'annotation' }],
              ['Gennaio', parseInt($('#Ianuarie_1').text()) || 0, parseInt($('#Ianuarie_1').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_1').text()) || 0, parseInt($('#Februarie_1').text()) || 0],
              ['Marzo', parseInt($('#Martie_1').text()) || 0, parseInt($('#Martie_1').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_1').text()) || 0, parseInt($('#Aprilie_1').text()) || 0],
              ['Maggio', parseInt($('#Mai_1').text()) || 0, parseInt($('#Mai_1').text()) || 0],
              ['Giugno', parseInt($('#Iunie_1').text()) || 0, parseInt($('#Iunie_1').text()) || 0],
              ['Luglio', parseInt($('#Iulie_1').text()) || 0, parseInt($('#Iulie_1').text()) || 0],
              ['Agosto', parseInt($('#August_1').text()) || 0, parseInt($('#August_1').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_1').text()) || 0, parseInt($('#Septembrie_1').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_1').text()) || 0, parseInt($('#Octombrie_1').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_1').text()) || 0, parseInt($('#Noiembrie_1').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_1').text()) || 0, parseInt($('#Decembrie_1').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,
              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#f32828'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }

      function drawChartsConfB() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'CONFZIONE B', { role: 'annotation' }],
              ['Gennaio', parseInt($('#Ianuarie_2').text()) || 0, parseInt($('#Ianuarie_2').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_2').text()) || 0, parseInt($('#Februarie_2').text()) || 0],
              ['Marzo', parseInt($('#Martie_2').text()) || 0, parseInt($('#Martie_2').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_2').text()) || 0, parseInt($('#Aprilie_2').text()) || 0],
              ['Maggio', parseInt($('#Mai_2').text()) || 0, parseInt($('#Mai_2').text()) || 0],
              ['Giugno', parseInt($('#Iunie_2').text()) || 0, parseInt($('#Iunie_2').text()) || 0],
              ['Luglio', parseInt($('#Iulie_2').text()) || 0, parseInt($('#Iulie_2').text()) || 0],
              ['Agosto', parseInt($('#August_2').text()) || 0, parseInt($('#August_2').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_2').text()) || 0, parseInt($('#Septembrie_2').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_2').text()) || 0, parseInt($('#Octombrie_2').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_2').text()) || 0, parseInt($('#Noiembrie_2').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_2').text()) || 0, parseInt($('#Decembrie_2').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,
              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#af1d1d'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }

      function drawChartsStiro() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'STIRO', { role: 'annotation' }],
              ['Gennaio', parseInt($('#Ianuarie_3').text()) || 0, parseInt($('#Ianuarie_3').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_3').text()) || 0, parseInt($('#Februarie_3').text()) || 0],
              ['Marzo', parseInt($('#Martie_3').text()) || 0, parseInt($('#Martie_3').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_3').text()) || 0, parseInt($('#Aprilie_3').text()) || 0],
              ['Maggio', parseInt($('#Mai_3').text()) || 0, parseInt($('#Mai_3').text()) || 0],
              ['Giugno', parseInt($('#Iunie_3').text()) || 0, parseInt($('#Iunie_3').text()) || 0],
              ['Luglio', parseInt($('#Iulie_3').text()) || 0, parseInt($('#Iulie_3').text()) || 0],
              ['Agosto', parseInt($('#August_3').text()) || 0, parseInt($('#August_3').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_3').text()) || 0, parseInt($('#Septembrie_3').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_3').text()) || 0, parseInt($('#Octombrie_3').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_3').text()) || 0, parseInt($('#Noiembrie_3').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_3').text()) || 0, parseInt($('#Decembrie_3').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,
              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#259f11'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }

      function drawChartsAmmini() {
          var barData = google.visualization.arrayToDataTable([
              ['Luna', 'AMMINISTRAZIONE', { role: 'annotation' }],
              ['Gennaio', parseInt($('#Ianuarie_0').text()) || 0, parseInt($('#Ianuarie_0').text()) || 0],
              ['Febbraio', parseInt($('#Februarie_0').text()) || 0, parseInt($('#Februarie_0').text()) || 0],
              ['Marzo', parseInt($('#Martie_0').text()) || 0, parseInt($('#Martie_0').text()) || 0],
              ['Aprile', parseInt($('#Aprilie_0').text()) || 0, parseInt($('#Aprilie_0').text()) || 0],
              ['Maggio', parseInt($('#Mai_0').text()) || 0, parseInt($('#Mai_0').text()) || 0],
              ['Giugno', parseInt($('#Iunie_0').text()) || 0, parseInt($('#Iunie_0').text()) || 0],
              ['Luglio', parseInt($('#Iulie_0').text()) || 0, parseInt($('#Iulie_0').text()) || 0],
              ['Agosto', parseInt($('#August_0').text()) || 0, parseInt($('#August_0').text()) || 0],
              ['Settembre', parseInt($('#Septembrie_0').text()) || 0, parseInt($('#Septembrie_0').text()) || 0],
              ['Ottobre', parseInt($('#Octombrie_0').text()) || 0, parseInt($('#Octombrie_0').text()) || 0],
              ['Novembre', parseInt($('#Noiembrie_0').text()) || 0, parseInt($('#Noiembrie_0').text()) || 0],
              ['Dicembre', parseInt($('#Decembrie_0').text()) || 0, parseInt($('#Decembrie_0').text()) || 0]
          ]);
          // set bar chart options
          var barOptions = {
              pointsVisible: true,

              tooltip: { isHtml: true },
              focusTarget: 'category',
              backgroundColor: 'transparent',
              colors: ['#8bc34a'],
              fontName: 'Open Sans',
              chartArea: {
                  left: 50,
                  top: 10,
                  width: '100%',
                  height: '70%'
              },
              bar: {
                  groupWidth: '80%'
              },
              hAxis: {
                  textStyle: {
                      fontSize: 11
                  }
              },
              vAxis: {
                  minValue: 0,
                  maxValue: 0,
                  baselineColor: '#DDD',
                  gridlines: {
                      color: '#DDD',
                      count: 4
                  },
                  textStyle: {
                      fontSize: 11
                  }
              },
              legend: {
                  position: 'bottom',
                  textStyle: {
                      fontSize: 12
                  }
              },
              animation: {
                  duration: 1200,
                  easing: 'out',
                  startup: true
              }
          };
          // draw bar chart twice so it animates
          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart-totale'));
          barChart.draw(barData, barOptions);
      }
  </script>
        </form>
</body>
</html>
