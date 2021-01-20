<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportAbsente.aspx.cs" Inherits="RaportAbsente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportAbsente" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Assenteismo Generale</title>
    <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body { height: 950px; }

        .tdcentered {
            text-align: center;
            font-weight: 600;
            background: #cecece;
            color: black;
            border: 5px solid #ffffff;
        }

        #Categorie_120 {
            color: black;
            background-color: #ffc107
        }

        td.rSubSelectat {
            background-color: #cecece;
            color: black;
        }

        td.rSelectat {
            color: black;
            background-color: #cecece;
        }

        #120 td {
            background-color: #cecece !important;
            background: #cecece;
        }

        @media print {
            @page {
                size: landscape;
            }

            .td_amministrazione, .td_stiro, .td_tess, .td_conf {
                border: none;
                text-align: center;
            }
        }

        #mailreport {
            z-index: 9999;
            height: 700px;
            width: 550px;
            background-color: white;
            position: absolute;
            top: 10%;
            left: 22%;
            box-shadow: 1px 1px 3px 0px black;
        }

        #mailreportexit {
            z-index: 99999;
            position: absolute;
            right: 10px;
            top: 10px;
            font-size: 14pt;
            font-weight: 600;
        }

        #mailreportexit:hover { cursor: pointer; }

        #tblEmail { margin-left: 25px; }

        #tblEmailSecond { margin-left: 25px; }

        #tblEmailThird { margin-left: 25px; }

        #assent_grids {
            z-index: 9999;
            width: 430px;
            position: absolute;
            top: 0%;
            left: 100%;
            margin-left: 25px;
        }

        .gridStyle { box-shadow: 1px 1px 1px #8c8c8c; }

        .gridStyle th { background: white; }

        .gridStyle td {
            background: white;
            text-align: center;
        }


        .google-visualization-tooltip {
            z-index: +1;
            margin-top: -180px;
            margin-left: 40px;
        }

        #Departament_100:hover {
            cursor: pointer;
            background: orange;
        }

        #Departament_104:hover {
            cursor: pointer;
            background: orange;
        }

        #Departament_108:hover {
            cursor: pointer;
            background: orange;
        }

        #Departament_112:hover {
            cursor: pointer;
            background: orange;
        }

        #Departament_116:hover {
            cursor: pointer;
            background: orange;
        }

    </style>
    <script type="text/javascript">
        
            function printExcel() {


                var tab_text = "<html><head><style type='text/css'>td{font-align:center;vertical-align: middle;}.td_amministrazione,.td_stiro,.td_conf,.td_tess,{background-color:#cecece;}.rSecund{background:#FFC107;}</style></head><table border='0px' style='text-align:center;'><h3> Assenteismo Generale - Anno:" + $('#ddlFiltruAn').val() + "</h3><tr border='0px'>";
                var j = 0;

                var vrednos = $("#ddlFilterTip").val();
                if (vrednos === 'Ore') {
                    tab = document.getElementById('tAbsenteOre'); // id of table
                } else {
                    tab = document.getElementById('tAbsenteProcent'); // id of table
                }


                for (j = 0; j < tab.rows.length; j++) {
                    tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                }


                tab_text = tab_text + "</table></html>";

                var ua = window.navigator.userAgent;
                var msie = ua.indexOf("MSIE ");

                if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
                {
                    txtArea1.document.open("txt/html", "replace");
                    txtArea1.document.write(tab_text);
                    txtArea1.document.close();
                    txtArea1.focus();
                    sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
                }
                else
                    sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));

                return (sa);
            } 
    </script>
</head>
<body>
    <form id="fRaportAbsente" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportAbsente" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportAbsenteWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-1.12.4.min.js" />
                <asp:ScriptReference Path="~/Js/RaportAbsente3.js" />
                <asp:ScriptReference Path="~/Js/pagina.js" />
                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="~/js/printThis.js" />
                 <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/html2canvas.js" />
                <asp:ScriptReference Path="https://www.google.com/jsapi" />

            </Scripts>
        </asp:ScriptManager>
         <div id="editor"></div>

        <table cellpadding="0" cellspacing="0" align="center" style="width:100%">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td style="width: 100px;">
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx">&lt;Main&gt;</asp:HyperLink>
                           </td>

                           <td align="center">
                                <asp:Label ID="lRaportAbsente" runat="server" CssClass="principal" Text="ASSENTEISMO GENERALE"></asp:Label>
                           </td>
                            <td style="width: 50px;display:none;">
                                <img class="top-icons" onclick="bdetailed();" src="../../Images/icons/line-chart.png" alt="Show detailed" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printExcel();" src="../../Images/icons/icon-excel.png" alt="Export to Excel" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print" /></td>

                           <td style="width: 150px;">
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="../../Images/Image/loading.gif" alt="Loading ..."/> Loading ...</ProgressTemplate>
                                </asp:UpdateProgress>
                           </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellpadding="0" cellspacing="0" class="principal" style="width:100%;">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lFiltruAn" runat="server" CssClass="continut" Text="ANNO"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFiltruAn" runat="server">
                                                <asp:ListItem>2021</asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                                <asp:ListItem>2019</asp:ListItem>

                                            </asp:DropDownList>
                                        </td>                                        
                                    
                                        <td>
                                            <asp:DropDownList ID="ddlFilterTip" runat="server">
                                                <asp:ListItem>Percentuale</asp:ListItem>
                                                <asp:ListItem>Ore</asp:ListItem>
                                            </asp:DropDownList>
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

                    <table id="assent_tables">
                      
                        <tr>
                            <td valign="top">
                                <table id="tAbsenteProcent" width="100%" style=" width:100%; border-collapse: collapse;">
                                    <tr>
                                        <td class="rSecund" colspan="2"><asp:Label ID="htProcent" runat="server" Text="Percentuale" Width="250px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htCodSistem" runat="server" Text="Gennaio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htMarca" runat="server" Text="Febbraio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htRaportAbsenta" runat="server" Text="Marzo" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htPrenume" runat="server" Text="Aprile" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htData" runat="server" Text="Maggio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htTipOra" runat="server" Text="Giugno" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htR1DAL" runat="server" Text="Luglio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htR1ALL" runat="server" Text="Agosto" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="htR1TOT" runat="server" Text="Settembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label1" runat="server" Text="Ottobre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label2" runat="server" Text="Novembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label3" runat="server" Text="Dicembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label4" runat="server" Text="TOTALE" Width="70px"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                        <tr>
                            <td valign="top">
                                <table id="tAbsenteOre" width="100%" style=" width:100%;  border-collapse: collapse; display:none;">
                                    <tr>
                                        <td class="rSecund" colspan="2"><asp:Label ID="Label5" runat="server" Text="Ore" Width="250px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label6" runat="server" Text="Gennaio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label7" runat="server" Text="Febbraio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label8" runat="server" Text="Marzo" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label9" runat="server" Text="Aprile" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label10" runat="server" Text="Maggio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label11" runat="server" Text="Giugno" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label12" runat="server" Text="Luglio" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label13" runat="server" Text="Agosto" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label14" runat="server" Text="Settembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label15" runat="server" Text="Ottobre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label16" runat="server" Text="Novembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label17" runat="server" Text="Dicembre" Width="70px"></asp:Label></td>
                                        <td class="rSecund"><asp:Label ID="Label18" runat="server" Text="TOTALE" Width="70px"></asp:Label></td>
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

             <br />
                    <h2 id="hchart">Totale Percentuale %:</h2>
                    <div id="bar-chart" style="width:1220px">
                    </div>

        <div id="printing-holder"></div>


          <div id="mailreport" style="display: none;">

            <span id="mailreportexit" onclick="bdetailedexit();">X</span>
            <br />
            <br />
            <%-- First Shift --%>
            <table style='font-family: arial;' id="tblEmail">
                <tr>
                    <td colspan='2' style='font-weight: 600; color: #293d61; font-size: 14pt;'>ASSENTEISMO GIORNALIERO </td>
                    <td colspan='1' style='color: #334c79; font-size: 11pt;'>
                        <asp:Label runat="server" ID="txtprima"> - Prima Turno</asp:Label></td>
                    <td colspan='2' style='float: right; text-align: right; font-size: 8pt; font-weight: 600;'>Anno 2019 </td>
                </tr>
                <tr style='background: #cecece; line-height: 22px;'>
                    <td colspan='2'></td>
                    <td colspan='1' style="text-align: center;">
                        <asp:Label runat="server" ID="StatusPrima"></asp:Label></td>
                    <td colspan='2' style='font-size: 10pt; color: #363d61; text-align: right; padding-right: 5px; font-weight: 600;'>
                        <asp:Label runat="server" ID="dtame"></asp:Label>
                    </td>
                </tr>
                <tr style='line-height: 30px; background: #f0fafd;'>
                    <td colspan='2' style='font-weight: 600; color: red; padding-left: 5px; vertical-align: middle; font-size: 11pt;'>REPARTO </td>
                    <td colspan='1' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>% assenteismo</td>
                    <td colspan='2' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>nr persone assenti</td>
                </tr>
                <tr style='background: #d6ebfb; line-height: 25px;' id="trConfA">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Confezione A </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perConfA"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assConfA"></asp:Label></td>
                </tr>
                <tr style='line-height: 25px; background: #f0fafd;' id="trConfB">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Confezione B</td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perConfB"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assConfB"></asp:Label></td>
                </tr>
                <tr style='background: #d6ebfb; line-height: 25px;' id="trStiro">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Stiro </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perStiro"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assStiro"></asp:Label></td>
                </tr>

                <tr style='background: #f0fafd; line-height: 25px;' id="trTess">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Tessitura </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perTess"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assTess"></asp:Label></td>
                </tr>


                <tr style='line-height: 25px; background: #d6ebfb;' id="trAmmini">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Amministrazione</td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perAmmini"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assAmmini"></asp:Label></td>
                </tr>
                <tr style='line-height: 30px; background: #acd7f7;'>
                    <td colspan='3' style='padding-left: 5px; font-weight: 600;'>Totale</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_totale"></asp:Label></td>
                </tr>
            </table>
            <br />
            <%-- SECOND SHIFT --%>
            <table style='font-family: arial;' id="tblEmailSecond">
                <tr>
                    <td colspan='2' style='font-weight: 600; color: #293d61; font-size: 14pt;'>ASSENTEISMO GIORNALIERO </td>
                    <td colspan='1' style='color: #334c79; font-size: 11pt;'>
                        <asp:Label runat="server" ID="txtSecondo"> - Secondo Turno</asp:Label></td>
                    <td colspan='2' style='float: right; text-align: right; font-size: 8pt; font-weight: 600;'></td>
                </tr>
                <tr style='background: #cecece; line-height: 22px;'>
                    <td colspan='2'></td>
                    <td colspan='1' style="text-align: center;">
                        <asp:Label runat="server" ID="StatusSecondo"></asp:Label></td>
                    <td colspan='2' style='font-size: 10pt; color: #363d61; text-align: right; padding-right: 5px; font-weight: 600;'></td>
                </tr>
                <tr style='line-height: 30px; background: #f0fafd;'>
                    <td colspan='2' style='font-weight: 600; color: red; padding-left: 5px; vertical-align: middle; font-size: 11pt;'>REPARTO </td>
                    <td colspan='1' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>% assenteismo</td>
                    <td colspan='2' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>nr persone assenti</td>
                </tr>

                <tr style='background: #f0fafd; line-height: 25px;' id="trStiroS">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Stiro </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perStiroS"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assStiroS"></asp:Label></td>
                </tr>

                <tr style='background: #d6ebfb; line-height: 25px;' id="trTessS">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Tessitura </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perTessS"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assTessS"></asp:Label></td>
                </tr>



                <tr style='line-height: 30px; background: #acd7f7;'>
                    <td colspan='3' style='padding-left: 5px; font-weight: 600;'>Totale</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_totaleS"></asp:Label></td>
                </tr>
            </table>



            <br />



            <table style='font-family: arial;' id="tblEmailThird">
                <tr>
                    <td colspan='2' style='font-weight: 600; color: #293d61; font-size: 14pt;'>ASSENTEISMO GIORNALIERO </td>
                    <td colspan='1' style='color: #334c79; font-size: 11pt;'>
                        <asp:Label runat="server" ID="txtThird"> - Terzo Turno</asp:Label></td>
                    <td colspan='2' style='float: right; text-align: right; font-size: 8pt; font-weight: 600;'></td>
                </tr>
                <tr style='background: #cecece; line-height: 22px;'>
                    <td colspan='2'></td>
                    <td colspan='1' style="text-align: center;">
                        <asp:Label runat="server" ID="StatusThird"></asp:Label></td>
                    <td colspan='2' style='font-size: 10pt; color: #363d61; text-align: right; padding-right: 5px; font-weight: 600;'>
                        <asp:Label runat="server" ID="ddtames"></asp:Label>
                    </td>
                </tr>
                <tr style='line-height: 30px; background: #f0fafd;'>
                    <td colspan='2' style='font-weight: 600; color: red; padding-left: 5px; vertical-align: middle; font-size: 11pt;'>REPARTO </td>
                    <td colspan='1' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>% assenteismo</td>
                    <td colspan='2' style='color: red; font-size: 11pt; font-weight: 600; padding-left: 5px; padding-right: 5px;'>nr persone assenti</td>
                </tr>

                <tr style='background: #d6ebfb; line-height: 25px;' id="trTessT">
                    <td colspan='2' style='padding-left: 5px; font-weight: 600;'>Tessitura </td>
                    <td colspan='1' style='text-align: center; font-weight: 600; letter-spacing: 0.6px;'>
                        <asp:Label runat="server" ID="_perTessT"></asp:Label>%</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_assTessT"></asp:Label></td>
                </tr>



                <tr style='line-height: 30px; background: #acd7f7;'>
                    <td colspan='3' style='padding-left: 5px; font-weight: 600;'>Totale</td>
                    <td colspan='2' style='text-align: center; font-weight: 600;'>
                        <asp:Label runat="server" ID="_totaleT"></asp:Label></td>
                </tr>
            </table>

               


            <div id="assent_grids" style="display: block;">
                <asp:GridView runat="server" ID="grd_ass_ConfA" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_ConfB" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_Stiro" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_StiroS" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_Tess" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_TessS" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
                <asp:GridView runat="server" ID="grd_ass_TessT" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>

                <asp:GridView runat="server" ID="grd_ass_Ammin" Style="display: none;" OnRowDataBound="grd_ass_ConfA_RowDataBound" CssClass="gridStyle"></asp:GridView>
            </div>
        </div>

        <script type="text/javascript">
            
            $(document).ready(function () {
      

                setTimeout(function () {
                    if ($('#ddlFilterTip').val() == 'Percentuale') {
                        drawChartsDefaultPercentuale();
                   
                        //If Departament click for percentuale
                    } else
                    {
                        drawChartsDefaultOre();
                        //If Departament click for ore
                    }
               
                }, 2000);
           
            });


            google.load("visualization", "1", {packages:["corechart"]});

            function drawChartsDefaultPercentuale() {
                $("#tAbsenteProcent #Departament_100").click(function () {
                    drawChartsPercentualeTessitura();
                    $("#hchart").text('Totale assenteismo Tessitura:');
                });

                $("#tAbsenteProcent #Departament_104").click(function () {
                    drawChartsPercentualeConfA();
                    $("#hchart").text('Totale assenteismo Confezione A:');
                });

                $("#tAbsenteProcent #Departament_108").click(function () {
                    drawChartsPercentualeConfB();
                    $("#hchart").text('Totale assenteismo Confezione B:');
                });

                $("#tAbsenteProcent #Departament_112").click(function () {
                    drawChartsPercentualeStiro();
                    $("#hchart").text('Totale assenteismo Stiro:');
                });

                $("#tAbsenteProcent #Departament_116").click(function () {
                    drawChartsPercentualeAmmin();
                    $("#hchart").text('Totale assenteismo Amministrazione:');
                });



                $("#tAbsenteOre #Departament_100").click(function () {
                    drawChartsOreTessitura();
                    $("#hchart").text('Totale assenteismo Tessitura:');
                });

                $("#tAbsenteOre #Departament_104").click(function () {
                    drawChartsOreConfA();
                    $("#hchart").text('Totale assenteismo Confezione A:');
                });

                $("#tAbsenteOre #Departament_108").click(function () {
                    drawChartsOreConfB();
                    $("#hchart").text('Totale assenteismo Confezione B:');
                });

                $("#tAbsenteOre #Departament_112").click(function () {
                    drawChartsOreStiro();
                    $("#hchart").text('Totale assenteismo Stiro:');
                });

                $("#tAbsenteOre #Departament_116").click(function () {
                    drawChartsOreAmmin();
                    $("#hchart").text('Totale assenteismo Amministrazione:');
                });
 

                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'TESSITURA', 'CONFEZIONE A','CONFEZIONE B','STIRO','AMMINISTRAZIONE'],
                    ['Gennaio',  parseInt($('.jan_tess').text()) || 0, parseInt($('.jan_confa').text()) || 0, parseInt($('.jan_confb').text()) || 0,parseInt($('.jan_stiro').text()) || 0,parseInt($('.jan_ammin').text()) || 0],
                    ['Febbraio', parseInt($('.feb_tess').text()) || 0, parseInt($('.feb_confa').text()) || 0, parseInt($('.feb_confb').text()) || 0,parseInt($('.feb_stiro').text()) || 0,parseInt($('.feb_ammin').text()) || 0],
                    ['Marzo',    parseInt($('.mar_tess').text()) || 0, parseInt($('.mar_confa').text()) || 0, parseInt($('.mar_confb').text()) || 0,parseInt($('.mar_stiro').text()) || 0,parseInt($('.mar_ammin').text()) || 0],
                    ['Aprile',   parseInt($('.apr_tess').text()) || 0, parseInt($('.apr_confa').text()) || 0, parseInt($('.apr_confb').text()) || 0,parseInt($('.apr_stiro').text()) || 0,parseInt($('.apr_ammin').text()) || 0],
                    ['Maggio',   parseInt($('.may_tess').text()) || 0, parseInt($('.may_confa').text()) || 0, parseInt($('.may_confb').text()) || 0,parseInt($('.may_stiro').text()) || 0,parseInt($('.may_ammin').text()) || 0],
                    ['Giugno',   parseInt($('.jun_tess').text()) || 0, parseInt($('.jun_confa').text()) || 0, parseInt($('.jun_confb').text()) || 0,parseInt($('.jun_stiro').text()) || 0,parseInt($('.jun_ammin').text()) || 0],
                    ['Luglio',   parseInt($('.jul_tess').text()) || 0, parseInt($('.jul_confa').text()) || 0, parseInt($('.jul_confb').text()) || 0,parseInt($('.jul_stiro').text()) || 0,parseInt($('.jul_ammin').text()) || 0],
                    ['Agosto',   parseInt($('.avg_tess').text()) || 0, parseInt($('.avg_confa').text()) || 0, parseInt($('.avg_confb').text()) || 0,parseInt($('.avg_stiro').text()) || 0,parseInt($('.avg_ammin').text()) || 0],
                    ['Settembre',parseInt($('.sep_tess').text()) || 0, parseInt($('.sep_confa').text()) || 0, parseInt($('.sep_confb').text()) || 0,parseInt($('.sep_stiro').text()) || 0,parseInt($('.sep_ammin').text()) || 0],
                    ['Ottobre',  parseInt($('.oct_tess').text()) || 0, parseInt($('.oct_confa').text()) || 0, parseInt($('.oct_confb').text()) || 0,parseInt($('.oct_stiro').text()) || 0,parseInt($('.oct_ammin').text()) || 0],
                    ['Novembre', parseInt($('.nov_tess').text()) || 0, parseInt($('.nov_confa').text()) || 0, parseInt($('.nov_confb').text()) || 0,parseInt($('.nov_stiro').text()) || 0,parseInt($('.nov_ammin').text()) || 0],
                    ['Dicembre', parseInt($('.dec_tess').text()) || 0, parseInt($('.dec_confa').text()) || 0, parseInt($('.dec_confb').text()) || 0,parseInt($('.dec_stiro').text()) || 0,parseInt($('.dec_ammin').text()) || 0]
                ]);
                // set bar chart options
                var barOptions = {

                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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

            //PERCENTUALE START
            function drawChartsPercentualeTessitura() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteProcent #Ianuarie_101').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Ianuarie_102').text()) || 0,    parseFloat($('#tAbsenteProcent #Ianuarie_102').text()) || 0,     parseFloat($('#tAbsenteProcent #Ianuarie_103').text()) || 0    ,parseFloat($('#tAbsenteProcent #Ianuarie_103').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteProcent #Februarie_101').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_101').text()) || 0,    parseFloat($('#tAbsenteProcent #Februarie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Februarie_102').text()) || 0,    parseFloat($('#tAbsenteProcent #Februarie_103').text()) || 0   ,parseFloat($('#tAbsenteProcent #Februarie_103').text()) || 0     ],
                    ['Marzo',    parseFloat($('#tAbsenteProcent #Martie_101').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_101').text()) || 0,       parseFloat($('#tAbsenteProcent #Martie_102').text()) || 0,      parseFloat($('#tAbsenteProcent #Martie_102').text()) || 0,       parseFloat($('#tAbsenteProcent #Martie_103').text()) || 0      ,parseFloat($('#tAbsenteProcent #Martie_103').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteProcent #Aprilie_101').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_101').text()) || 0,      parseFloat($('#tAbsenteProcent #Aprilie_102').text()) || 0,     parseFloat($('#tAbsenteProcent #Aprilie_102').text()) || 0,      parseFloat($('#tAbsenteProcent #Aprilie_103').text()) || 0     ,parseFloat($('#tAbsenteProcent #Aprilie_103').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteProcent #Mai_101').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_101').text()) || 0,          parseFloat($('#tAbsenteProcent #Mai_102').text()) || 0,         parseFloat($('#tAbsenteProcent #Mai_102').text()) || 0,          parseFloat($('#tAbsenteProcent #Mai_103').text()) || 0         ,parseFloat($('#tAbsenteProcent #Mai_103').text()) || 0           ],
                    ['Giugno',   parseFloat($('#tAbsenteProcent #Iunie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_101').text()) || 0,        parseFloat($('#tAbsenteProcent #Iunie_102').text()) || 0,       parseFloat($('#tAbsenteProcent #Iunie_102').text()) || 0,        parseFloat($('#tAbsenteProcent #Iunie_103').text()) || 0       ,parseFloat($('#tAbsenteProcent #Iunie_103').text()) || 0         ],
                    ['Luglio',   parseFloat($('#tAbsenteProcent #Iulie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_101').text()) || 0,        parseFloat($('#tAbsenteProcent #Iulie_102').text()) || 0,       parseFloat($('#tAbsenteProcent #Iulie_102').text()) || 0,        parseFloat($('#tAbsenteProcent #Iulie_103').text()) || 0       ,parseFloat($('#tAbsenteProcent #Iulie_103').text()) || 0         ],
                    ['Agosto',   parseFloat($('#tAbsenteProcent #August_101').text()) || 0,    parseFloat($('#tAbsenteProcent #August_101').text()) || 0,       parseFloat($('#tAbsenteProcent #August_102').text()) || 0,      parseFloat($('#tAbsenteProcent #August_102').text()) || 0,       parseFloat($('#tAbsenteProcent #August_103').text()) || 0      ,parseFloat($('#tAbsenteProcent #August_103').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteProcent #Septembrie_101').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_101').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_102').text()) || 0,  parseFloat($('#tAbsenteProcent #Septembrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Septembrie_103').text()) || 0 , parseFloat($('#tAbsenteProcent #Septembrie_103').text()) || 0   ],
                    ['Ottobre',  parseFloat($('#tAbsenteProcent #Octombrie_101').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Octombrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Octombrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Octombrie_103').text()) || 0   ,parseFloat($('#tAbsenteProcent #Octombrie_103').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteProcent #Noiembrie_101').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Noiembrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Noiembrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Noiembrie_103').text()) || 0   ,parseFloat($('#tAbsenteProcent #Noiembrie_103').text()) || 0     ],
                    ['Dicembre', parseFloat($('#tAbsenteProcent #Decembrie_101').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_101').text()) || 0,     parseFloat($('#tAbsenteProcent #Decembrie_102').text()) || 0,   parseFloat($('#tAbsenteProcent #Decembrie_102').text()) || 0,    parseFloat($('#tAbsenteProcent #Decembrie_103').text()) || 0  , parseFloat($('#tAbsenteProcent #Decembrie_103').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    pointsVisible: true,
                    annotations: {
                        textStyle: { fontSize: 10 }
                    },
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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

            function drawChartsPercentualeConfA() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteProcent #Ianuarie_105').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_105').text()) || 0,     parseFloat($('#tAbsenteProcent #Ianuarie_106').text()) || 0,   parseFloat($('#tAbsenteProcent #Ianuarie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Ianuarie_107').text()) || 0   , parseFloat($('#tAbsenteProcent #Ianuarie_107').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteProcent #Februarie_105').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Februarie_106').text()) || 0,  parseFloat($('#tAbsenteProcent #Februarie_106').text()) || 0,     parseFloat($('#tAbsenteProcent #Februarie_107').text()) || 0  , parseFloat($('#tAbsenteProcent #Februarie_107').text()) || 0     ],
                    ['Marzo',    parseFloat($('#tAbsenteProcent #Martie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_105').text()) || 0,        parseFloat($('#tAbsenteProcent #Martie_106').text()) || 0,     parseFloat($('#tAbsenteProcent #Martie_106').text()) || 0,       parseFloat($('#tAbsenteProcent #Martie_107').text()) || 0     , parseFloat($('#tAbsenteProcent #Martie_107').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteProcent #Aprilie_105').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_105').text()) || 0,       parseFloat($('#tAbsenteProcent #Aprilie_106').text()) || 0,    parseFloat($('#tAbsenteProcent #Aprilie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Aprilie_107').text()) || 0    , parseFloat($('#tAbsenteProcent #Aprilie_107').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteProcent #Mai_105').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_105').text()) || 0,           parseFloat($('#tAbsenteProcent #Mai_106').text()) || 0,        parseFloat($('#tAbsenteProcent #Mai_106').text()) || 0,           parseFloat($('#tAbsenteProcent #Mai_107').text()) || 0       ,  parseFloat($('#tAbsenteProcent #Mai_107').text()) || 0          ],
                    ['Giugno',   parseFloat($('#tAbsenteProcent #Iunie_105').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_105').text()) || 0,         parseFloat($('#tAbsenteProcent #Iunie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Iunie_106').text()) || 0,        parseFloat($('#tAbsenteProcent #Iunie_107').text()) || 0      , parseFloat($('#tAbsenteProcent #Iunie_107').text()) || 0         ],
                    ['Luglio',   parseFloat($('#tAbsenteProcent #Iulie_105').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_105').text()) || 0,         parseFloat($('#tAbsenteProcent #Iulie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Iulie_106').text()) || 0,        parseFloat($('#tAbsenteProcent #Iulie_107').text()) || 0      , parseFloat($('#tAbsenteProcent #Iulie_107').text()) || 0         ],
                    ['Agosto',   parseFloat($('#tAbsenteProcent #August_105').text()) || 0,    parseFloat($('#tAbsenteProcent #August_105').text()) || 0,        parseFloat($('#tAbsenteProcent #August_106').text()) || 0,     parseFloat($('#tAbsenteProcent #August_106').text()) || 0,       parseFloat($('#tAbsenteProcent #August_107').text()) || 0     , parseFloat($('#tAbsenteProcent #August_107').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteProcent #Septembrie_105').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_106').text()) || 0, parseFloat($('#tAbsenteProcent #Septembrie_106').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_107').text()) || 0,  parseFloat($('#tAbsenteProcent #Septembrie_107').text()) || 0   ],
                    ['Ottobre',  parseFloat($('#tAbsenteProcent #Octombrie_105').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Octombrie_106').text()) || 0,  parseFloat($('#tAbsenteProcent #Octombrie_106').text()) || 0,     parseFloat($('#tAbsenteProcent #Octombrie_107').text()) || 0  , parseFloat($('#tAbsenteProcent #Octombrie_107').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteProcent #Noiembrie_105').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Noiembrie_106').text()) || 0,  parseFloat($('#tAbsenteProcent #Noiembrie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Noiembrie_107').text()) || 0 ,  parseFloat($('#tAbsenteProcent #Noiembrie_107').text()) || 0    ],
                    ['Dicembre', parseFloat($('#tAbsenteProcent #Decembrie_105').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_105').text()) || 0,    parseFloat($('#tAbsenteProcent #Decembrie_106').text()) || 0,  parseFloat($('#tAbsenteProcent #Decembrie_106').text()) || 0,      parseFloat($('#tAbsenteProcent #Decembrie_107').text()) || 0 ,  parseFloat($('#tAbsenteProcent #Decembrie_107').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 10 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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

            function drawChartsPercentualeConfB() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteProcent #Ianuarie_109').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_109').text()) || 0,      parseFloat($('#tAbsenteProcent #Ianuarie_110').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_110').text()) || 0,         parseFloat($('#tAbsenteProcent #Ianuarie_111').text()) || 0   , parseFloat($('#tAbsenteProcent #Ianuarie_111').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteProcent #Februarie_109').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Februarie_110').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_110').text()) || 0,         parseFloat($('#tAbsenteProcent #Februarie_111').text()) || 0 ,  parseFloat($('#tAbsenteProcent #Februarie_111').text()) || 0    ],
                    ['Marzo',    parseFloat($('#tAbsenteProcent #Martie_109').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_109').text()) || 0,        parseFloat($('#tAbsenteProcent #Martie_110').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_110').text()) || 0,           parseFloat($('#tAbsenteProcent #Martie_111').text()) || 0     , parseFloat($('#tAbsenteProcent #Martie_111').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteProcent #Aprilie_109').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_109').text()) || 0,       parseFloat($('#tAbsenteProcent #Aprilie_110').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_110').text()) || 0,          parseFloat($('#tAbsenteProcent #Aprilie_111').text()) || 0    , parseFloat($('#tAbsenteProcent #Aprilie_111').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteProcent #Mai_109').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_109').text()) || 0,           parseFloat($('#tAbsenteProcent #Mai_110').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_110').text()) || 0,              parseFloat($('#tAbsenteProcent #Mai_111').text()) || 0        , parseFloat($('#tAbsenteProcent #Mai_111').text()) || 0           ],
                    ['Giugno',   parseFloat($('#tAbsenteProcent #Iunie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_109').text()) || 0,         parseFloat($('#tAbsenteProcent #Iunie_110').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_110').text()) || 0,             parseFloat($('#tAbsenteProcent #Iunie_111').text()) || 0     ,  parseFloat($('#tAbsenteProcent #Iunie_111').text()) || 0        ],
                    ['Luglio',   parseFloat($('#tAbsenteProcent #Iulie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_109').text()) || 0,         parseFloat($('#tAbsenteProcent #Iulie_110').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_110').text()) || 0,             parseFloat($('#tAbsenteProcent #Iulie_111').text()) || 0     ,  parseFloat($('#tAbsenteProcent #Iulie_111').text()) || 0        ],
                    ['Agosto',   parseFloat($('#tAbsenteProcent #August_109').text()) || 0,    parseFloat($('#tAbsenteProcent #August_109').text()) || 0,        parseFloat($('#tAbsenteProcent #August_110').text()) || 0,    parseFloat($('#tAbsenteProcent #August_110').text()) || 0,           parseFloat($('#tAbsenteProcent #August_111').text()) || 0     , parseFloat($('#tAbsenteProcent #August_111').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteProcent #Septembrie_109').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_109').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_110').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_110').text()) || 0,       parseFloat($('#tAbsenteProcent #Septembrie_111').text()) || 0 , parseFloat($('#tAbsenteProcent #Septembrie_111').text()) || 0    ],
                    ['Ottobre',  parseFloat($('#tAbsenteProcent #Octombrie_109').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Octombrie_110').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_110').text()) || 0,        parseFloat($('#tAbsenteProcent #Octombrie_111').text()) || 0  , parseFloat($('#tAbsenteProcent #Octombrie_111').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteProcent #Noiembrie_109').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Noiembrie_110').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_110').text()) || 0,        parseFloat($('#tAbsenteProcent #Noiembrie_111').text()) || 0  , parseFloat($('#tAbsenteProcent #Noiembrie_111').text()) || 0     ],
                    ['Dicembre', parseFloat($('#tAbsenteProcent #Decembrie_109').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_109').text()) || 0,     parseFloat($('#tAbsenteProcent #Decembrie_110').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_110').text()) || 0,        parseFloat($('#tAbsenteProcent #Decembrie_111').text()) || 0  , parseFloat($('#tAbsenteProcent #Decembrie_111').text()) || 0     ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 10 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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

            function drawChartsPercentualeStiro() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteProcent #Ianuarie_113').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_113').text()) || 0,      parseFloat($('#tAbsenteProcent #Ianuarie_114').text()) || 0,   parseFloat($('#tAbsenteProcent #Ianuarie_114').text()) || 0,     parseFloat($('#tAbsenteProcent #Ianuarie_115').text()) || 0    ,parseFloat($('#tAbsenteProcent #Ianuarie_115').text()) || 0     ],
                    ['Febbraio', parseFloat($('#tAbsenteProcent #Februarie_113').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Februarie_114').text()) || 0,  parseFloat($('#tAbsenteProcent #Februarie_114').text()) || 0,     parseFloat($('#tAbsenteProcent #Februarie_115').text()) || 0  , parseFloat($('#tAbsenteProcent #Februarie_115').text()) || 0   ],
                    ['Marzo',    parseFloat($('#tAbsenteProcent #Martie_113').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_113').text()) || 0,        parseFloat($('#tAbsenteProcent #Martie_114').text()) || 0,     parseFloat($('#tAbsenteProcent #Martie_114').text()) || 0,        parseFloat($('#tAbsenteProcent #Martie_115').text()) || 0     , parseFloat($('#tAbsenteProcent #Martie_115').text()) || 0      ],
                    ['Aprile',   parseFloat($('#tAbsenteProcent #Aprilie_113').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_113').text()) || 0,       parseFloat($('#tAbsenteProcent #Aprilie_114').text()) || 0,    parseFloat($('#tAbsenteProcent #Aprilie_114').text()) || 0,       parseFloat($('#tAbsenteProcent #Aprilie_115').text()) || 0    , parseFloat($('#tAbsenteProcent #Aprilie_115').text()) || 0     ],
                    ['Maggio',   parseFloat($('#tAbsenteProcent #Mai_113').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_113').text()) || 0,           parseFloat($('#tAbsenteProcent #Mai_114').text()) || 0,        parseFloat($('#tAbsenteProcent #Mai_114').text()) || 0,          parseFloat($('#tAbsenteProcent #Mai_115').text()) || 0         ,parseFloat($('#tAbsenteProcent #Mai_115').text()) || 0          ],
                    ['Giugno',   parseFloat($('#tAbsenteProcent #Iunie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_113').text()) || 0,         parseFloat($('#tAbsenteProcent #Iunie_114').text()) || 0,      parseFloat($('#tAbsenteProcent #Iunie_114').text()) || 0,        parseFloat($('#tAbsenteProcent #Iunie_115').text()) || 0       ,parseFloat($('#tAbsenteProcent #Iunie_115').text()) || 0        ],
                    ['Luglio',   parseFloat($('#tAbsenteProcent #Iulie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_113').text()) || 0,         parseFloat($('#tAbsenteProcent #Iulie_114').text()) || 0,      parseFloat($('#tAbsenteProcent #Iulie_114').text()) || 0,        parseFloat($('#tAbsenteProcent #Iulie_115').text()) || 0       ,parseFloat($('#tAbsenteProcent #Iulie_115').text()) || 0        ],
                    ['Agosto',   parseFloat($('#tAbsenteProcent #August_113').text()) || 0,    parseFloat($('#tAbsenteProcent #August_113').text()) || 0,        parseFloat($('#tAbsenteProcent #August_114').text()) || 0,     parseFloat($('#tAbsenteProcent #August_114').text()) || 0,       parseFloat($('#tAbsenteProcent #August_115').text()) || 0      ,parseFloat($('#tAbsenteProcent #August_115').text()) || 0       ],
                    ['Settembre',parseFloat($('#tAbsenteProcent #Septembrie_113').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_113').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_114').text()) || 0, parseFloat($('#tAbsenteProcent #Septembrie_114').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_115').text()) || 0 , parseFloat($('#tAbsenteProcent #Septembrie_115').text()) || 0  ],
                    ['Ottobre',  parseFloat($('#tAbsenteProcent #Octombrie_113').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Octombrie_114').text()) || 0,  parseFloat($('#tAbsenteProcent #Octombrie_114').text()) || 0,    parseFloat($('#tAbsenteProcent #Octombrie_115').text()) || 0   ,parseFloat($('#tAbsenteProcent #Octombrie_115').text()) || 0    ],
                    ['Novembre', parseFloat($('#tAbsenteProcent #Noiembrie_113').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Noiembrie_114').text()) || 0,  parseFloat($('#tAbsenteProcent #Noiembrie_114').text()) || 0,     parseFloat($('#tAbsenteProcent #Noiembrie_115').text()) || 0  , parseFloat($('#tAbsenteProcent #Noiembrie_115').text()) || 0   ],
                    ['Dicembre', parseFloat($('#tAbsenteProcent #Decembrie_113').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_113').text()) || 0,     parseFloat($('#tAbsenteProcent #Decembrie_114').text()) || 0,  parseFloat($('#tAbsenteProcent #Decembrie_114').text()) || 0,    parseFloat($('#tAbsenteProcent #Decembrie_115').text()) || 0   ,parseFloat($('#tAbsenteProcent #Decembrie_115').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 10 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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

            function drawChartsPercentualeAmmin() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteProcent #Ianuarie_117').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_117').text()) || 0,     parseFloat($('#tAbsenteProcent #Ianuarie_118').text()) || 0,  parseFloat($('#tAbsenteProcent #Ianuarie_118').text()) || 0,      parseFloat($('#tAbsenteProcent #Ianuarie_119').text()) || 0  ,parseFloat($('#tAbsenteProcent #Ianuarie_119').text()) || 0    ],
                    ['Febbraio', parseFloat($('#tAbsenteProcent #Februarie_117').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_117').text()) || 0,    parseFloat($('#tAbsenteProcent #Februarie_118').text()) || 0, parseFloat($('#tAbsenteProcent #Februarie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Februarie_119').text()) || 0 ,parseFloat($('#tAbsenteProcent #Februarie_119').text()) || 0   ],
                    ['Marzo',    parseFloat($('#tAbsenteProcent #Martie_117').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_117').text()) || 0,       parseFloat($('#tAbsenteProcent #Martie_118').text()) || 0,    parseFloat($('#tAbsenteProcent #Martie_118').text()) || 0,        parseFloat($('#tAbsenteProcent #Martie_119').text()) || 0    ,parseFloat($('#tAbsenteProcent #Martie_119').text()) || 0      ],
                    ['Aprile',   parseFloat($('#tAbsenteProcent #Aprilie_117').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_117').text()) || 0,      parseFloat($('#tAbsenteProcent #Aprilie_118').text()) || 0,   parseFloat($('#tAbsenteProcent #Aprilie_118').text()) || 0,       parseFloat($('#tAbsenteProcent #Aprilie_119').text()) || 0   ,parseFloat($('#tAbsenteProcent #Aprilie_119').text()) || 0     ],
                    ['Maggio',   parseFloat($('#tAbsenteProcent #Mai_117').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_117').text()) || 0,          parseFloat($('#tAbsenteProcent #Mai_118').text()) || 0,       parseFloat($('#tAbsenteProcent #Mai_118').text()) || 0,           parseFloat($('#tAbsenteProcent #Mai_119').text()) || 0       ,parseFloat($('#tAbsenteProcent #Mai_119').text()) || 0         ],
                    ['Giugno',   parseFloat($('#tAbsenteProcent #Iunie_117').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_117').text()) || 0,        parseFloat($('#tAbsenteProcent #Iunie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Iunie_118').text()) || 0,         parseFloat($('#tAbsenteProcent #Iunie_119').text()) || 0     ,parseFloat($('#tAbsenteProcent #Iunie_119').text()) || 0       ],
                    ['Luglio',   parseFloat($('#tAbsenteProcent #Iulie_117').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_117').text()) || 0,        parseFloat($('#tAbsenteProcent #Iulie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Iulie_118').text()) || 0,         parseFloat($('#tAbsenteProcent #Iulie_119').text()) || 0     ,parseFloat($('#tAbsenteProcent #Iulie_119').text()) || 0       ],
                    ['Agosto',   parseFloat($('#tAbsenteProcent #August_117').text()) || 0,    parseFloat($('#tAbsenteProcent #August_117').text()) || 0,       parseFloat($('#tAbsenteProcent #August_118').text()) || 0,    parseFloat($('#tAbsenteProcent #August_118').text()) || 0,        parseFloat($('#tAbsenteProcent #August_119').text()) || 0    ,parseFloat($('#tAbsenteProcent #August_119').text()) || 0      ],
                    ['Settembre',parseFloat($('#tAbsenteProcent #Septembrie_117').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_117').text()) || 0,   parseFloat($('#tAbsenteProcent #Septembrie_118').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_118').text()) || 0,    parseFloat($('#tAbsenteProcent #Septembrie_119').text()) || 0,parseFloat($('#tAbsenteProcent #Septembrie_119').text()) || 0  ],
                    ['Ottobre',  parseFloat($('#tAbsenteProcent #Octombrie_117').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_117').text()) || 0,    parseFloat($('#tAbsenteProcent #Octombrie_118').text()) || 0, parseFloat($('#tAbsenteProcent #Octombrie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Octombrie_119').text()) || 0 ,parseFloat($('#tAbsenteProcent #Octombrie_119').text()) || 0   ],
                    ['Novembre', parseFloat($('#tAbsenteProcent #Noiembrie_117').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_117').text()) || 0,    parseFloat($('#tAbsenteProcent #Noiembrie_118').text()) || 0, parseFloat($('#tAbsenteProcent #Noiembrie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Noiembrie_119').text()) || 0 ,parseFloat($('#tAbsenteProcent #Noiembrie_119').text()) || 0   ],
                    ['Dicembre', parseFloat($('#tAbsenteProcent #Decembrie_117').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_117').text()) || 0,    parseFloat($('#tAbsenteProcent #Decembrie_118').text()) || 0, parseFloat($('#tAbsenteProcent #Decembrie_118').text()) || 0,     parseFloat($('#tAbsenteProcent #Decembrie_119').text()) || 0 ,parseFloat($('#tAbsenteProcent #Decembrie_119').text()) || 0   ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 10 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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
            //PERCENTUALE END

            //ORE START
            function drawChartsOreTessitura() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteOre #Ianuarie_101').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Ianuarie_102').text()) || 0,    parseFloat($('#tAbsenteOre #Ianuarie_102').text()) || 0,     parseFloat($('#tAbsenteOre #Ianuarie_103').text()) || 0    ,parseFloat($('#tAbsenteOre #Ianuarie_103').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteOre #Februarie_101').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_101').text()) || 0,    parseFloat($('#tAbsenteOre #Februarie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Februarie_102').text()) || 0,    parseFloat($('#tAbsenteOre #Februarie_103').text()) || 0   ,parseFloat($('#tAbsenteOre #Februarie_103').text()) || 0     ],
                    ['Marzo',    parseFloat($('#tAbsenteOre #Martie_101').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_101').text()) || 0,       parseFloat($('#tAbsenteOre #Martie_102').text()) || 0,      parseFloat($('#tAbsenteOre #Martie_102').text()) || 0,       parseFloat($('#tAbsenteOre #Martie_103').text()) || 0      ,parseFloat($('#tAbsenteOre #Martie_103').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteOre #Aprilie_101').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_101').text()) || 0,      parseFloat($('#tAbsenteOre #Aprilie_102').text()) || 0,     parseFloat($('#tAbsenteOre #Aprilie_102').text()) || 0,      parseFloat($('#tAbsenteOre #Aprilie_103').text()) || 0     ,parseFloat($('#tAbsenteOre #Aprilie_103').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteOre #Mai_101').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_101').text()) || 0,          parseFloat($('#tAbsenteOre #Mai_102').text()) || 0,         parseFloat($('#tAbsenteOre #Mai_102').text()) || 0,          parseFloat($('#tAbsenteOre #Mai_103').text()) || 0         ,parseFloat($('#tAbsenteOre #Mai_103').text()) || 0           ],
                    ['Giugno',   parseFloat($('#tAbsenteOre #Iunie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_101').text()) || 0,        parseFloat($('#tAbsenteOre #Iunie_102').text()) || 0,       parseFloat($('#tAbsenteOre #Iunie_102').text()) || 0,        parseFloat($('#tAbsenteOre #Iunie_103').text()) || 0       ,parseFloat($('#tAbsenteOre #Iunie_103').text()) || 0         ],
                    ['Luglio',   parseFloat($('#tAbsenteOre #Iulie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_101').text()) || 0,        parseFloat($('#tAbsenteOre #Iulie_102').text()) || 0,       parseFloat($('#tAbsenteOre #Iulie_102').text()) || 0,        parseFloat($('#tAbsenteOre #Iulie_103').text()) || 0       ,parseFloat($('#tAbsenteOre #Iulie_103').text()) || 0         ],
                    ['Agosto',   parseFloat($('#tAbsenteOre #August_101').text()) || 0,    parseFloat($('#tAbsenteOre #August_101').text()) || 0,       parseFloat($('#tAbsenteOre #August_102').text()) || 0,      parseFloat($('#tAbsenteOre #August_102').text()) || 0,       parseFloat($('#tAbsenteOre #August_103').text()) || 0      ,parseFloat($('#tAbsenteOre #August_103').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteOre #Septembrie_101').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_101').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_102').text()) || 0,  parseFloat($('#tAbsenteOre #Septembrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Septembrie_103').text()) || 0 , parseFloat($('#tAbsenteOre #Septembrie_103').text()) || 0   ],
                    ['Ottobre',  parseFloat($('#tAbsenteOre #Octombrie_101').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Octombrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Octombrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Octombrie_103').text()) || 0   ,parseFloat($('#tAbsenteOre #Octombrie_103').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteOre #Noiembrie_101').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Noiembrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Noiembrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Noiembrie_103').text()) || 0   ,parseFloat($('#tAbsenteOre #Noiembrie_103').text()) || 0     ],
                    ['Dicembre', parseFloat($('#tAbsenteOre #Decembrie_101').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_101').text()) || 0,     parseFloat($('#tAbsenteOre #Decembrie_102').text()) || 0,   parseFloat($('#tAbsenteOre #Decembrie_102').text()) || 0,    parseFloat($('#tAbsenteOre #Decembrie_103').text()) || 0  , parseFloat($('#tAbsenteOre #Decembrie_103').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 12 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                        maxValue: 3500,
                        baselineColor: '#DDD',
                        gridlines: {
                            color: '#DDD',
                            count: 5
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

            function drawChartsOreConfA() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteOre #Ianuarie_105').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_105').text()) || 0,     parseFloat($('#tAbsenteOre #Ianuarie_106').text()) || 0,   parseFloat($('#tAbsenteOre #Ianuarie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Ianuarie_107').text()) || 0   , parseFloat($('#tAbsenteOre #Ianuarie_107').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteOre #Februarie_105').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Februarie_106').text()) || 0,  parseFloat($('#tAbsenteOre #Februarie_106').text()) || 0,     parseFloat($('#tAbsenteOre #Februarie_107').text()) || 0  , parseFloat($('#tAbsenteOre #Februarie_107').text()) || 0     ],
                    ['Marzo',    parseFloat($('#tAbsenteOre #Martie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_105').text()) || 0,        parseFloat($('#tAbsenteOre #Martie_106').text()) || 0,     parseFloat($('#tAbsenteOre #Martie_106').text()) || 0,       parseFloat($('#tAbsenteOre #Martie_107').text()) || 0     , parseFloat($('#tAbsenteOre #Martie_107').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteOre #Aprilie_105').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_105').text()) || 0,       parseFloat($('#tAbsenteOre #Aprilie_106').text()) || 0,    parseFloat($('#tAbsenteOre #Aprilie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Aprilie_107').text()) || 0    , parseFloat($('#tAbsenteOre #Aprilie_107').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteOre #Mai_105').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_105').text()) || 0,           parseFloat($('#tAbsenteOre #Mai_106').text()) || 0,        parseFloat($('#tAbsenteOre #Mai_106').text()) || 0,           parseFloat($('#tAbsenteOre #Mai_107').text()) || 0       ,  parseFloat($('#tAbsenteOre #Mai_107').text()) || 0          ],
                    ['Giugno',   parseFloat($('#tAbsenteOre #Iunie_105').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_105').text()) || 0,         parseFloat($('#tAbsenteOre #Iunie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Iunie_106').text()) || 0,        parseFloat($('#tAbsenteOre #Iunie_107').text()) || 0      , parseFloat($('#tAbsenteOre #Iunie_107').text()) || 0         ],
                    ['Luglio',   parseFloat($('#tAbsenteOre #Iulie_105').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_105').text()) || 0,         parseFloat($('#tAbsenteOre #Iulie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Iulie_106').text()) || 0,        parseFloat($('#tAbsenteOre #Iulie_107').text()) || 0      , parseFloat($('#tAbsenteOre #Iulie_107').text()) || 0         ],
                    ['Agosto',   parseFloat($('#tAbsenteOre #August_105').text()) || 0,    parseFloat($('#tAbsenteOre #August_105').text()) || 0,        parseFloat($('#tAbsenteOre #August_106').text()) || 0,     parseFloat($('#tAbsenteOre #August_106').text()) || 0,       parseFloat($('#tAbsenteOre #August_107').text()) || 0     , parseFloat($('#tAbsenteOre #August_107').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteOre #Septembrie_105').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_106').text()) || 0, parseFloat($('#tAbsenteOre #Septembrie_106').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_107').text()) || 0,  parseFloat($('#tAbsenteOre #Septembrie_107').text()) || 0   ],
                    ['Ottobre',  parseFloat($('#tAbsenteOre #Octombrie_105').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Octombrie_106').text()) || 0,  parseFloat($('#tAbsenteOre #Octombrie_106').text()) || 0,     parseFloat($('#tAbsenteOre #Octombrie_107').text()) || 0  , parseFloat($('#tAbsenteOre #Octombrie_107').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteOre #Noiembrie_105').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Noiembrie_106').text()) || 0,  parseFloat($('#tAbsenteOre #Noiembrie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Noiembrie_107').text()) || 0 ,  parseFloat($('#tAbsenteOre #Noiembrie_107').text()) || 0    ],
                    ['Dicembre', parseFloat($('#tAbsenteOre #Decembrie_105').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_105').text()) || 0,    parseFloat($('#tAbsenteOre #Decembrie_106').text()) || 0,  parseFloat($('#tAbsenteOre #Decembrie_106').text()) || 0,      parseFloat($('#tAbsenteOre #Decembrie_107').text()) || 0 ,  parseFloat($('#tAbsenteOre #Decembrie_107').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 12 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                        maxValue: 2500,
                        baselineColor: '#DDD',
                        gridlines: {
                            color: '#DDD',
                            count: 5
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

            function drawChartsOreConfB() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteOre #Ianuarie_109').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_109').text()) || 0,      parseFloat($('#tAbsenteOre #Ianuarie_110').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_110').text()) || 0,         parseFloat($('#tAbsenteOre #Ianuarie_111').text()) || 0   , parseFloat($('#tAbsenteOre #Ianuarie_111').text()) || 0      ],
                    ['Febbraio', parseFloat($('#tAbsenteOre #Februarie_109').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Februarie_110').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_110').text()) || 0,         parseFloat($('#tAbsenteOre #Februarie_111').text()) || 0 ,  parseFloat($('#tAbsenteOre #Februarie_111').text()) || 0    ],
                    ['Marzo',    parseFloat($('#tAbsenteOre #Martie_109').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_109').text()) || 0,        parseFloat($('#tAbsenteOre #Martie_110').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_110').text()) || 0,           parseFloat($('#tAbsenteOre #Martie_111').text()) || 0     , parseFloat($('#tAbsenteOre #Martie_111').text()) || 0        ],
                    ['Aprile',   parseFloat($('#tAbsenteOre #Aprilie_109').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_109').text()) || 0,       parseFloat($('#tAbsenteOre #Aprilie_110').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_110').text()) || 0,          parseFloat($('#tAbsenteOre #Aprilie_111').text()) || 0    , parseFloat($('#tAbsenteOre #Aprilie_111').text()) || 0       ],
                    ['Maggio',   parseFloat($('#tAbsenteOre #Mai_109').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_109').text()) || 0,           parseFloat($('#tAbsenteOre #Mai_110').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_110').text()) || 0,              parseFloat($('#tAbsenteOre #Mai_111').text()) || 0        , parseFloat($('#tAbsenteOre #Mai_111').text()) || 0           ],
                    ['Giugno',   parseFloat($('#tAbsenteOre #Iunie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_109').text()) || 0,         parseFloat($('#tAbsenteOre #Iunie_110').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_110').text()) || 0,             parseFloat($('#tAbsenteOre #Iunie_111').text()) || 0     ,  parseFloat($('#tAbsenteOre #Iunie_111').text()) || 0        ],
                    ['Luglio',   parseFloat($('#tAbsenteOre #Iulie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_109').text()) || 0,         parseFloat($('#tAbsenteOre #Iulie_110').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_110').text()) || 0,             parseFloat($('#tAbsenteOre #Iulie_111').text()) || 0     ,  parseFloat($('#tAbsenteOre #Iulie_111').text()) || 0        ],
                    ['Agosto',   parseFloat($('#tAbsenteOre #August_109').text()) || 0,    parseFloat($('#tAbsenteOre #August_109').text()) || 0,        parseFloat($('#tAbsenteOre #August_110').text()) || 0,    parseFloat($('#tAbsenteOre #August_110').text()) || 0,           parseFloat($('#tAbsenteOre #August_111').text()) || 0     , parseFloat($('#tAbsenteOre #August_111').text()) || 0        ],
                    ['Settembre',parseFloat($('#tAbsenteOre #Septembrie_109').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_109').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_110').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_110').text()) || 0,       parseFloat($('#tAbsenteOre #Septembrie_111').text()) || 0 , parseFloat($('#tAbsenteOre #Septembrie_111').text()) || 0    ],
                    ['Ottobre',  parseFloat($('#tAbsenteOre #Octombrie_109').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Octombrie_110').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_110').text()) || 0,        parseFloat($('#tAbsenteOre #Octombrie_111').text()) || 0  , parseFloat($('#tAbsenteOre #Octombrie_111').text()) || 0     ],
                    ['Novembre', parseFloat($('#tAbsenteOre #Noiembrie_109').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Noiembrie_110').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_110').text()) || 0,        parseFloat($('#tAbsenteOre #Noiembrie_111').text()) || 0  , parseFloat($('#tAbsenteOre #Noiembrie_111').text()) || 0     ],
                    ['Dicembre', parseFloat($('#tAbsenteOre #Decembrie_109').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_109').text()) || 0,     parseFloat($('#tAbsenteOre #Decembrie_110').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_110').text()) || 0,        parseFloat($('#tAbsenteOre #Decembrie_111').text()) || 0  , parseFloat($('#tAbsenteOre #Decembrie_111').text()) || 0     ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 12 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                        maxValue: 0 + 300,
                        baselineColor: '#DDD',
                        gridlines: {
                            color: '#DDD',
                            count: 5
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

            function drawChartsOreStiro() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteOre #Ianuarie_113').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_113').text()) || 0,      parseFloat($('#tAbsenteOre #Ianuarie_114').text()) || 0,   parseFloat($('#tAbsenteOre #Ianuarie_114').text()) || 0,     parseFloat($('#tAbsenteOre #Ianuarie_115').text()) || 0    ,parseFloat($('#tAbsenteOre #Ianuarie_115').text()) || 0     ],
                    ['Febbraio', parseFloat($('#tAbsenteOre #Februarie_113').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Februarie_114').text()) || 0,  parseFloat($('#tAbsenteOre #Februarie_114').text()) || 0,     parseFloat($('#tAbsenteOre #Februarie_115').text()) || 0  , parseFloat($('#tAbsenteOre #Februarie_115').text()) || 0   ],
                    ['Marzo',    parseFloat($('#tAbsenteOre #Martie_113').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_113').text()) || 0,        parseFloat($('#tAbsenteOre #Martie_114').text()) || 0,     parseFloat($('#tAbsenteOre #Martie_114').text()) || 0,        parseFloat($('#tAbsenteOre #Martie_115').text()) || 0     , parseFloat($('#tAbsenteOre #Martie_115').text()) || 0      ],
                    ['Aprile',   parseFloat($('#tAbsenteOre #Aprilie_113').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_113').text()) || 0,       parseFloat($('#tAbsenteOre #Aprilie_114').text()) || 0,    parseFloat($('#tAbsenteOre #Aprilie_114').text()) || 0,       parseFloat($('#tAbsenteOre #Aprilie_115').text()) || 0    , parseFloat($('#tAbsenteOre #Aprilie_115').text()) || 0     ],
                    ['Maggio',   parseFloat($('#tAbsenteOre #Mai_113').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_113').text()) || 0,           parseFloat($('#tAbsenteOre #Mai_114').text()) || 0,        parseFloat($('#tAbsenteOre #Mai_114').text()) || 0,          parseFloat($('#tAbsenteOre #Mai_115').text()) || 0         ,parseFloat($('#tAbsenteOre #Mai_115').text()) || 0          ],
                    ['Giugno',   parseFloat($('#tAbsenteOre #Iunie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_113').text()) || 0,         parseFloat($('#tAbsenteOre #Iunie_114').text()) || 0,      parseFloat($('#tAbsenteOre #Iunie_114').text()) || 0,        parseFloat($('#tAbsenteOre #Iunie_115').text()) || 0       ,parseFloat($('#tAbsenteOre #Iunie_115').text()) || 0        ],
                    ['Luglio',   parseFloat($('#tAbsenteOre #Iulie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_113').text()) || 0,         parseFloat($('#tAbsenteOre #Iulie_114').text()) || 0,      parseFloat($('#tAbsenteOre #Iulie_114').text()) || 0,        parseFloat($('#tAbsenteOre #Iulie_115').text()) || 0       ,parseFloat($('#tAbsenteOre #Iulie_115').text()) || 0        ],
                    ['Agosto',   parseFloat($('#tAbsenteOre #August_113').text()) || 0,    parseFloat($('#tAbsenteOre #August_113').text()) || 0,        parseFloat($('#tAbsenteOre #August_114').text()) || 0,     parseFloat($('#tAbsenteOre #August_114').text()) || 0,       parseFloat($('#tAbsenteOre #August_115').text()) || 0      ,parseFloat($('#tAbsenteOre #August_115').text()) || 0       ],
                    ['Settembre',parseFloat($('#tAbsenteOre #Septembrie_113').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_113').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_114').text()) || 0, parseFloat($('#tAbsenteOre #Septembrie_114').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_115').text()) || 0 , parseFloat($('#tAbsenteOre #Septembrie_115').text()) || 0  ],
                    ['Ottobre',  parseFloat($('#tAbsenteOre #Octombrie_113').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Octombrie_114').text()) || 0,  parseFloat($('#tAbsenteOre #Octombrie_114').text()) || 0,    parseFloat($('#tAbsenteOre #Octombrie_115').text()) || 0   ,parseFloat($('#tAbsenteOre #Octombrie_115').text()) || 0    ],
                    ['Novembre', parseFloat($('#tAbsenteOre #Noiembrie_113').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Noiembrie_114').text()) || 0,  parseFloat($('#tAbsenteOre #Noiembrie_114').text()) || 0,     parseFloat($('#tAbsenteOre #Noiembrie_115').text()) || 0  , parseFloat($('#tAbsenteOre #Noiembrie_115').text()) || 0   ],
                    ['Dicembre', parseFloat($('#tAbsenteOre #Decembrie_113').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_113').text()) || 0,     parseFloat($('#tAbsenteOre #Decembrie_114').text()) || 0,  parseFloat($('#tAbsenteOre #Decembrie_114').text()) || 0,    parseFloat($('#tAbsenteOre #Decembrie_115').text()) || 0   ,parseFloat($('#tAbsenteOre #Decembrie_115').text()) || 0    ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 12 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                        maxValue: 3500,
                        baselineColor: '#DDD',
                        gridlines: {
                            color: '#DDD',
                            count: 5
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

            function drawChartsOreAmmin() {
                var barData = google.visualization.arrayToDataTable([
                    ['Luna', 'Assenza non retribuita',{ role: 'annotation' }, 'Infortuni',{ role: 'annotation' },'Malatia',{ role: 'annotation' }],
                    ['Gennaio',  parseFloat($('#tAbsenteOre #Ianuarie_117').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_117').text()) || 0,     parseFloat($('#tAbsenteOre #Ianuarie_118').text()) || 0,  parseFloat($('#tAbsenteOre #Ianuarie_118').text()) || 0,      parseFloat($('#tAbsenteOre #Ianuarie_119').text()) || 0  ,parseFloat($('#tAbsenteOre #Ianuarie_119').text()) || 0    ],
                    ['Febbraio', parseFloat($('#tAbsenteOre #Februarie_117').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_117').text()) || 0,    parseFloat($('#tAbsenteOre #Februarie_118').text()) || 0, parseFloat($('#tAbsenteOre #Februarie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Februarie_119').text()) || 0 ,parseFloat($('#tAbsenteOre #Februarie_119').text()) || 0   ],
                    ['Marzo',    parseFloat($('#tAbsenteOre #Martie_117').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_117').text()) || 0,       parseFloat($('#tAbsenteOre #Martie_118').text()) || 0,    parseFloat($('#tAbsenteOre #Martie_118').text()) || 0,        parseFloat($('#tAbsenteOre #Martie_119').text()) || 0    ,parseFloat($('#tAbsenteOre #Martie_119').text()) || 0      ],
                    ['Aprile',   parseFloat($('#tAbsenteOre #Aprilie_117').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_117').text()) || 0,      parseFloat($('#tAbsenteOre #Aprilie_118').text()) || 0,   parseFloat($('#tAbsenteOre #Aprilie_118').text()) || 0,       parseFloat($('#tAbsenteOre #Aprilie_119').text()) || 0   ,parseFloat($('#tAbsenteOre #Aprilie_119').text()) || 0     ],
                    ['Maggio',   parseFloat($('#tAbsenteOre #Mai_117').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_117').text()) || 0,          parseFloat($('#tAbsenteOre #Mai_118').text()) || 0,       parseFloat($('#tAbsenteOre #Mai_118').text()) || 0,           parseFloat($('#tAbsenteOre #Mai_119').text()) || 0       ,parseFloat($('#tAbsenteOre #Mai_119').text()) || 0         ],
                    ['Giugno',   parseFloat($('#tAbsenteOre #Iunie_117').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_117').text()) || 0,        parseFloat($('#tAbsenteOre #Iunie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Iunie_118').text()) || 0,         parseFloat($('#tAbsenteOre #Iunie_119').text()) || 0     ,parseFloat($('#tAbsenteOre #Iunie_119').text()) || 0       ],
                    ['Luglio',   parseFloat($('#tAbsenteOre #Iulie_117').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_117').text()) || 0,        parseFloat($('#tAbsenteOre #Iulie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Iulie_118').text()) || 0,         parseFloat($('#tAbsenteOre #Iulie_119').text()) || 0     ,parseFloat($('#tAbsenteOre #Iulie_119').text()) || 0       ],
                    ['Agosto',   parseFloat($('#tAbsenteOre #August_117').text()) || 0,    parseFloat($('#tAbsenteOre #August_117').text()) || 0,       parseFloat($('#tAbsenteOre #August_118').text()) || 0,    parseFloat($('#tAbsenteOre #August_118').text()) || 0,        parseFloat($('#tAbsenteOre #August_119').text()) || 0    ,parseFloat($('#tAbsenteOre #August_119').text()) || 0      ],
                    ['Settembre',parseFloat($('#tAbsenteOre #Septembrie_117').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_117').text()) || 0,   parseFloat($('#tAbsenteOre #Septembrie_118').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_118').text()) || 0,    parseFloat($('#tAbsenteOre #Septembrie_119').text()) || 0,parseFloat($('#tAbsenteOre #Septembrie_119').text()) || 0  ],
                    ['Ottobre',  parseFloat($('#tAbsenteOre #Octombrie_117').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_117').text()) || 0,    parseFloat($('#tAbsenteOre #Octombrie_118').text()) || 0, parseFloat($('#tAbsenteOre #Octombrie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Octombrie_119').text()) || 0 ,parseFloat($('#tAbsenteOre #Octombrie_119').text()) || 0   ],
                    ['Novembre', parseFloat($('#tAbsenteOre #Noiembrie_117').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_117').text()) || 0,    parseFloat($('#tAbsenteOre #Noiembrie_118').text()) || 0, parseFloat($('#tAbsenteOre #Noiembrie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Noiembrie_119').text()) || 0 ,parseFloat($('#tAbsenteOre #Noiembrie_119').text()) || 0   ],
                    ['Dicembre', parseFloat($('#tAbsenteOre #Decembrie_117').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_117').text()) || 0,    parseFloat($('#tAbsenteOre #Decembrie_118').text()) || 0, parseFloat($('#tAbsenteOre #Decembrie_118').text()) || 0,     parseFloat($('#tAbsenteOre #Decembrie_119').text()) || 0 ,parseFloat($('#tAbsenteOre #Decembrie_119').text()) || 0   ]
                ]);
                // set bar chart options
                var barOptions = {
                    annotations: {
                        textStyle: { fontSize: 12 }
                    },
                    pointsVisible: true,
                    tooltip: {isHtml: true},
                    focusTarget: 'category',
                    backgroundColor: 'transparent',
                    colors: ['#98604c', '#f32828','#af1d1d','#259f11','#8bc34a'],
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
                            count: 5
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
            //ORE END
        </script>

    </form>
</body>
</html>