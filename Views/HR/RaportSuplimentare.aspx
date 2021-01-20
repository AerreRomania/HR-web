<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportSuplimentare.aspx.cs" Inherits="RaportSuplimentare" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head id="hRaportSuplimentare" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

        <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
        <title>Straordinario</title>
        <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
        <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            td.rSubSelectat {
                    text-align: left!important;
                    padding-left: 10px;
                    padding: 5px;
            }
            
            td.rSelectat {
                background-color: #cecece;
            }
            
            body {
                height: 750px;
                overflow: hidden;
            }
            
            .top-icons {
                cursor: pointer;
            }
            
            .top-icons:hover {}
            
            #110 td {
                background: #cecece;
            }
                    .google-visualization-tooltip { z-index:+1; margin-top:-180px;margin-left:40px;} 

                    #Departament_100:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
                    #Departament_102:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
                    #Departament_104:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
                    #Departament_106:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
                    #Departament_108:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
                    #Categorie_110:hover{
                        cursor:pointer;
                        background:orange!important;
                    }
        </style>
    </head>

    <body>
        <form id="fRaportSuplimentare" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
            <asp:ScriptManager ID="smRaportSuplimentare" runat="server">
                <Services>
                    <asp:ServiceReference Path="RaportSuplimentareWS.asmx" />
                </Services>
                <Scripts>
                    <asp:ScriptReference Path="~/js/jquery-1.12.4.min.js" />
                    <asp:ScriptReference Path="~/Js/RaportSuplimentare.js" />
                    <asp:ScriptReference Path="~/Js/pagina.js" />
                    <%-- Exporting Libs --%>
                        <asp:ScriptReference Path="~/js/printThis.js" />
                        <asp:ScriptReference Path="~/js/jspdf.min.js" />
                        <asp:ScriptReference Path="~/js/html2canvas.js" />

                        <asp:ScriptReference Path="https://www.google.com/jsapi" />
                </Scripts>
            </asp:ScriptManager>
            <div id="editor"></div>

            <table cellpadding="0" cellspacing="0" style="width:100%">
                <tr>
                    <td class="principal">
                        <table width="100%" id="dugmici">
                            <tr>
                                <td style="width: 100px;">
                                    <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx">&lt;Main&gt;</asp:HyperLink>
                                </td>
                                <td align="center">
                                    <asp:Label ID="lRaportSuplimentare" runat="server" CssClass="principal" Text="Straordinario Generale"></asp:Label>
                                </td>
                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printExcel();" src="../../Images/icons/icon-excel.png" alt="Export to Excel" /></td>
                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print" /></td>

                                <td style="width: 150px;">
                                    <asp:UpdateProgress ID="up" runat="server">
                                        <ProgressTemplate>
                                            <img src="../../Images/Image/loading.gif" alt="Loading ..." /> Loading ...</ProgressTemplate>
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
                                                <asp:Label ID="lFiltruAn" runat="server" CssClass="continut" Text="ANNO"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlFiltruAn" runat="server">
                                                    <asp:ListItem value="2021">2021</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 40px;">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <input runat="server" id="bExcel" visible="false" value="Export" type="button" onclick="bExcel_Click()" class="xls" />
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
                        <table>
                            <tr>
                                <td valign="top" id="idExport" style="background:white;width:1220px;">
                                    <h1 style="padding-left:5px;display:none;" id="hexport">Straordinario Generale</h1>
                                    <table id="tSuplimentareOre" width="675" style="  border-collapse: collapse;">
                                        <tr>
                                            <td class="rSecund" colspan="2">
                                                <asp:Label ID="Label5" runat="server" Text="Ore" Width="250px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label6" runat="server" Text="Gennaio" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label7" runat="server" Text="Febbraio" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label8" runat="server" Text="Marzo" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label9" runat="server" Text="Aprile" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label10" runat="server" Text="Maggio" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label11" runat="server" Text="Giugno" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label12" runat="server" Text="Luglio" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label13" runat="server" Text="Agosto" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label14" runat="server" Text="Settembre" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label15" runat="server" Text="Ottobre" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label16" runat="server" Text="Novembre" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label17" runat="server" Text="Dicembre" Width="70px"></asp:Label>
                                            </td>
                                            <td class="rSecund">
                                                <asp:Label ID="Label18" runat="server" Text="TOTALE" Width="70px"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="hfId" runat="server" />
                        <asp:HiddenField ID="hfRowIndex" runat="server" />
                    </td>
                </tr>
            </table>

            <%-- Bar Chart --%>
                <div>
                    <br />
                    <h3 style="padding-left:5px;" id="hchart">Totale Ore:</h3>
                    <div id="bar-chart" style="width: 1220px;"></div>
                </div>

                <script type="text/javascript">
                    $(function () {


                        $('.spn_selectedyear').text($('.ddlyear').val());

                        $("#btn_add").click(function () {
                            $("#cruder").show();
                        });

                        $("#btn_hide").click(function () {
                            $("#cruder").hide();
                        });

                        $('.cancel-button').click(function () {
                            $('td.principal').show();
                        });

                        $('.action-button').click(function () {
                            $('td.principal').show();
                        });

                        $('.grid_style > tbody').prepend('<tr><td> </td><td><b>HOURS</b></td><td><b>VALUES</b></td></tr>');


                        //Delay 2s - if #up je hide pokazi grafik
                        setTimeout(checkIfIsLoaded(), 2000);

                        function checkIfIsLoaded() {


                            if ($('#up').css('display') !== 'none') {
                                console.log('1.cekiranje startovano');
                                setTimeout(drawCharts(), 1000);
                                console.log('1.gotovo');

                            } else {
                                console.log('2.cekiranje startovano');
                                setTimeout(checkIfIsLoaded(), 1000);
                                console.log('2.gotovo drugo');
                            }
                        };
                    });

                    function yearchanged() {
                        $('.spn_selectedyear').text($('.ddlyear').val());
                        setTimeout(drawCharts(), 20);

                    }

                    google.load("visualization", "1", {
                        packages: ["corechart"]
                    });
 
                      function drawCharts() {
              
                                        $("#100").click(function () {
                                            drawChartsTessitura();
                                            $("#hchart").text('Tessitura dipendenti:');
                                        });

                                        $("#102").click(function () {
                                            drawChartsConfA();
                                            $("#hchart").text('Confezione A dipendenti:');
                                        });

                                        $("#104").click(function () {
                                            drawChartsConfB();
                                            $("#hchart").text('Confezione B dipendenti:');
                                        });

                                        $("#106").click(function () {
                                            drawChartsStiro();
                                            $("#hchart").text('Stiro dipendenti:');
                                        });

                                        $("#108").click(function () {
                                            drawChartsAmmini();
                                            $("#hchart").text('Amministrazione dipendenti:');
                                        });

                                        $("#110").click(function () {
                                            drawChartsTotale();
                                            $("#hchart").text('Totale dipendenti:');
                                        });

                                        $('.spn_selectedyear').text($('.ddlyear').val());

                                        $("#btn_add").click(function () {
                                            $("#cruder").show();
                                        });

                                        $("#btn_hide").click(function () {
                                            $("#cruder").hide();
                                        });

                                        var barData = google.visualization.arrayToDataTable([
                                            ['Months', 'Tessitura', 'Confezione A', 'Confezione B', 'Stiro', 'Amministrazione'],
                                            ['January', parseInt($('#Ianuarie_101').text()) || 0, parseInt($('#Ianuarie_103').text()) || 0, parseInt($('#Ianuarie_105').text()) || 0, parseInt($('#Ianuarie_107').text()) || 0, parseInt($('#Ianuarie_109').text()) || 0],
                                            ['February', parseInt($('#Februarie_101').text()) || 0, parseInt($('#Februarie_103').text()) || 0, parseInt($('#Februarie_105').text()) || 0, parseInt($('#Februarie_107').text()) || 0, parseInt($('#Februarie_109').text()) || 0],
                                            ['March', parseInt($('#Martie_101').text()) || 0, parseInt($('#Martie_103').text()) || 0, parseInt($('#Martie_105').text()) || 0, parseInt($('#Martie_107').text()) || 0, parseInt($('#Martie_109').text()) || 0],
                                            ['Aprile', parseInt($('#Aprilie_101').text()) || 0, parseInt($('#Aprilie_103').text()) || 0, parseInt($('#Aprilie_105').text()) || 0, parseInt($('#Aprilie_107').text()) || 0, parseInt($('#Aprilie_109').text()) || 0],
                                            ['May', parseInt($('#Mai_101').text()) || 0, parseInt($('#Mai_103').text()) || 0, parseInt($('#Mai_105').text()) || 0, parseInt($('#Mai_107').text()) || 0, parseInt($('#Mai_109').text()) || 0],
                                            ['Jun', parseInt($('#Iunie_101').text()) || 0, parseInt($('#Iunie_103').text()) || 0, parseInt($('#Iunie_105').text()) || 0, parseInt($('#Iunie_107').text()) || 0, parseInt($('#Iunie_109').text()) || 0],
                                            ['July', parseInt($('#Iulie_101').text()) || 0, parseInt($('#Iulie_103').text()) || 0, parseInt($('#Iulie_105').text()) || 0, parseInt($('#Iulie_107').text()) || 0, parseInt($('#Iulie_109').text()) || 0],
                                            ['August', parseInt($('#August_101').text()) || 0, parseInt($('#August_103').text()) || 0, parseInt($('#August_105').text()) || 0, parseInt($('#August_107').text()) || 0, parseInt($('#August_109').text()) || 0],
                                            ['September', parseInt($('#Septembrie_101').text()) || 0, parseInt($('#Septembrie_103').text()) || 0, parseInt($('#Septembrie_105').text()) || 0, parseInt($('#Septembrie_107').text()) || 0, parseInt($('#Septembrie_109').text()) || 0],
                                            ['Octobre', parseInt($('#Octombrie_101').text()) || 0, parseInt($('#Octombrie_103').text()) || 0, parseInt($('#Octombrie_105').text()) || 0, parseInt($('#Octombrie_107').text()) || 0, parseInt($('#Octombrie_109').text()) || 0],
                                            ['Novembre', parseInt($('#Noiembrie_101').text()) || 0, parseInt($('#Noiembrie_103').text()) || 0, parseInt($('#Noiembrie_105').text()) || 0, parseInt($('#Noiembrie_107').text()) || 0, parseInt($('#Noiembrie_109').text()) || 0],
                                            ['Decembre', parseInt($('#Decembrie_101').text()) || 0, parseInt($('#Decembrie_103').text()) || 0, parseInt($('#Decembrie_105').text()) || 0, parseInt($('#Decembrie_107').text()) || 0, parseInt($('#Decembrie_109').text()) || 0]
                                        ]);
                                        var barOptions = {
                                            focusTarget: 'category',
                                            backgroundColor: 'transparent',
                                            colors: ['cornflowerblue', '#f95959', '#af1d1d', '#259f11', '#98604c', 'orange'],
                                            tooltip: {isHtml: true},
                                            chartArea: {
                                                left: 50,
                                                top: 10,
                                                width: 1170,
                                                height: '70%'
                                            },
                                            bar: {
                                                groupWidth: '70%'
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
                                        var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                                        barChart.draw(barData, barOptions);
                      }

                      function drawChartsTessitura() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'TESSITURA',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_101').text()) || 0, parseInt($('#Ianuarie_101').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_101').text()) || 0, parseInt($('#Februarie_101').text()) || 0],
                              ['Marzo', parseInt($('#Martie_101').text()) || 0, parseInt($('#Martie_101').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_101').text()) || 0, parseInt($('#Aprilie_101').text()) || 0],
                              ['Maggio', parseInt($('#Mai_101').text()) || 0, parseInt($('#Mai_101').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_101').text()) || 0, parseInt($('#Iunie_101').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_101').text()) || 0, parseInt($('#Iulie_101').text()) || 0],
                              ['Agosto', parseInt($('#August_101').text()) || 0, parseInt($('#August_101').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_101').text()) || 0, parseInt($('#Septembrie_101').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_101').text()) || 0, parseInt($('#Octombrie_101').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_101').text()) || 0, parseInt($('#Noiembrie_101').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_101').text()) || 0, parseInt($('#Decembrie_101').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
                              focusTarget: 'category',
                              backgroundColor: 'transparent',
                              colors: ['cornflowerblue'],
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                      }

                      function drawChartsConfA() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'CONFEZIONE A',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_103').text()) || 0, parseInt($('#Ianuarie_103').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_103').text()) || 0, parseInt($('#Februarie_103').text()) || 0],
                              ['Marzo', parseInt($('#Martie_103').text()) || 0, parseInt($('#Martie_103').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_103').text()) || 0, parseInt($('#Aprilie_103').text()) || 0],
                              ['Maggio', parseInt($('#Mai_103').text()) || 0, parseInt($('#Mai_103').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_103').text()) || 0, parseInt($('#Iunie_103').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_103').text()) || 0, parseInt($('#Iulie_103').text()) || 0],
                              ['Agosto', parseInt($('#August_103').text()) || 0, parseInt($('#August_103').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_103').text()) || 0, parseInt($('#Septembrie_103').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_103').text()) || 0, parseInt($('#Octombrie_103').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_103').text()) || 0, parseInt($('#Noiembrie_103').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_103').text()) || 0, parseInt($('#Decembrie_103').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
                              focusTarget: 'category',
                              backgroundColor: 'transparent',
                              colors: ['#f95959'],
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                      }
                                                   
                      function drawChartsConfB() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'CONFEZIONE B',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_105').text()) || 0, parseInt($('#Ianuarie_105').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_105').text()) || 0, parseInt($('#Februarie_105').text()) || 0],
                              ['Marzo', parseInt($('#Martie_105').text()) || 0, parseInt($('#Martie_105').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_105').text()) || 0, parseInt($('#Aprilie_105').text()) || 0],
                              ['Maggio', parseInt($('#Mai_105').text()) || 0, parseInt($('#Mai_105').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_105').text()) || 0, parseInt($('#Iunie_105').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_105').text()) || 0, parseInt($('#Iulie_105').text()) || 0],
                              ['Agosto', parseInt($('#August_105').text()) || 0, parseInt($('#August_105').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_105').text()) || 0, parseInt($('#Septembrie_105').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_105').text()) || 0, parseInt($('#Octombrie_105').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_105').text()) || 0, parseInt($('#Noiembrie_105').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_105').text()) || 0, parseInt($('#Decembrie_105').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                      }

                      function drawChartsStiro() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'STIRO',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_107').text()) || 0, parseInt($('#Ianuarie_107').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_107').text()) || 0, parseInt($('#Februarie_107').text()) || 0],
                              ['Marzo', parseInt($('#Martie_107').text()) || 0, parseInt($('#Martie_107').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_107').text()) || 0, parseInt($('#Aprilie_107').text()) || 0],
                              ['Maggio', parseInt($('#Mai_107').text()) || 0, parseInt($('#Mai_107').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_107').text()) || 0, parseInt($('#Iunie_107').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_107').text()) || 0, parseInt($('#Iulie_107').text()) || 0],
                              ['Agosto', parseInt($('#August_107').text()) || 0, parseInt($('#August_107').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_107').text()) || 0, parseInt($('#Septembrie_107').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_107').text()) || 0, parseInt($('#Octombrie_107').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_107').text()) || 0, parseInt($('#Noiembrie_107').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_107').text()) || 0, parseInt($('#Decembrie_107').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                        }

                      function drawChartsAmmini() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'AMMINISTRAZIONE',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_109').text()) || 0, parseInt($('#Ianuarie_109').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_109').text()) || 0, parseInt($('#Februarie_109').text()) || 0],
                              ['Marzo', parseInt($('#Martie_109').text()) || 0, parseInt($('#Martie_109').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_109').text()) || 0, parseInt($('#Aprilie_109').text()) || 0],
                              ['Maggio', parseInt($('#Mai_109').text()) || 0, parseInt($('#Mai_109').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_109').text()) || 0, parseInt($('#Iunie_109').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_109').text()) || 0, parseInt($('#Iulie_109').text()) || 0],
                              ['Agosto', parseInt($('#August_109').text()) || 0, parseInt($('#August_109').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_109').text()) || 0, parseInt($('#Septembrie_109').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_109').text()) || 0, parseInt($('#Octombrie_109').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_109').text()) || 0, parseInt($('#Noiembrie_109').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_109').text()) || 0, parseInt($('#Decembrie_109').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                                    }
                    
                      function drawChartsTotale() {
                          var barData = google.visualization.arrayToDataTable([
                              ['Luna', 'TOTALE',{ role: 'annotation' }],
                              ['Gennaio', parseInt($('#Ianuarie_110').text()) || 0, parseInt($('#Ianuarie_110').text()) || 0],
                              ['Febbraio', parseInt($('#Februarie_110').text()) || 0, parseInt($('#Februarie_110').text()) || 0],
                              ['Marzo', parseInt($('#Martie_110').text()) || 0, parseInt($('#Martie_110').text()) || 0],
                              ['Aprile', parseInt($('#Aprilie_110').text()) || 0, parseInt($('#Aprilie_110').text()) || 0],
                              ['Maggio', parseInt($('#Mai_110').text()) || 0, parseInt($('#Mai_110').text()) || 0],
                              ['Giugno', parseInt($('#Iunie_110').text()) || 0, parseInt($('#Iunie_110').text()) || 0],
                              ['Luglio', parseInt($('#Iulie_110').text()) || 0, parseInt($('#Iulie_110').text()) || 0],
                              ['Agosto', parseInt($('#August_110').text()) || 0, parseInt($('#August_110').text()) || 0],
                              ['Settembre', parseInt($('#Septembrie_110').text()) || 0, parseInt($('#Septembrie_110').text()) || 0],
                              ['Ottobre', parseInt($('#Octombrie_110').text()) || 0, parseInt($('#Octombrie_110').text()) || 0],
                              ['Novembre', parseInt($('#Noiembrie_110').text()) || 0, parseInt($('#Noiembrie_110').text()) || 0],
                              ['Dicembre', parseInt($('#Decembrie_110').text()) || 0, parseInt($('#Decembrie_110').text()) || 0]
                          ]);
                          // set bar chart options
                          var barOptions = {
                              pointsVisible: true,
                              tooltip: {isHtml: true},
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
                          var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
                          barChart.draw(barData, barOptions);
                      }
                </script>
        </form>
    </body>
    </html>