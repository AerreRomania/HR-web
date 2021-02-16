<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportNumarAngajatiDetaliat.aspx.cs" Inherits="RaportNumarAngajatiDetaliat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="hRaportNumarAngajatiDetaliat" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=.25, user-scalable=yes"/>--%>

    <title>Reparti / Mansione</title>
    <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .top-icons {
            cursor: pointer;
        }

        body {
            height: 800px;
             background-color: #f3f3f3;
                         width:1520px;

        }

        td.rSubSelectat {
            text-align: center !important;
        }

        .header {
            background-color: white;
        }

        .content {
            padding: 16px;
        }

        .sticky {
            position: fixed;
            top: 0;
        }

            .sticky + .content {
                padding-top: 102px;
            }

        #myHeader, #myHeader2 {
            display: none;
        }

            #myHeader td {
                border: 0px solid #ffffff;
                color: black;
                background: #FFC107;
                font-weight: 600;
                font-size: 10pt;
                text-align: center;
            }

        #myHeader2 {
            padding-top: 23px;
            -webkit-box-shadow: 2px 2px 5px 0px rgba(255, 255, 255, 0.75);
            -moz-box-shadow: 2px 2px 5px 0px rgba(255, 255, 255, 0.75);
            box-shadow: 2px 2px 5px 0px rgba(255, 255, 255, 0.75);
            border-color: white;
        }

            #myHeader2 td.rSelectat {
                background-color: #cecece;
                border: 0px solid #ffffff;
                font-weight: 600;
                font-size: 10pt;
                text-align: center !important;
                height: 40px;
                color: black;
            }

        td.rSelectat {
            background-color: #bbbbbba6;
            border: 2px solid #ffffff;
            font-weight: 600;
            font-size: 12pt;
            text-align: center !important;
            height: 40px;
            color: black;
        }

        td.rSubSelectat {
            background-color: #f3f3f3;
        }

        .rPeki {
            width: 60px;
        }

/*        ddlFiltruAn
*/
        #myHeader2 td.rSelectat {
            /*background-color: #cecece;*/
            border: 0px solid #ffffff !important;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .radio-inline {
            font-size: 9pt;
            text-transform: uppercase;
        }

       


        
        /* 
##Device = Low Resolution Tablets, Mobiles (Landscape)
##Screen = B/w 481px to 767px
*/

        @media (min-width: 481px) and (max-width: 767px) {
            #myHeader, #myHeader2 {
                display:none!important;
            }
        }

        /* 
##Device = Most of the Smartphones Mobiles (Portrait)
##Screen = B/w 320px to 479px
*/

        @media (min-width: 320px) and (max-width: 480px) {
            #myHeader, #myHeader2 {
                display:none!important;
            }
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
    <form id="fRaportNumarAngajatiDetaliat" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportNumarAngajatiDetaliat" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportNumarAngajatiDetaliatWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                <asp:ScriptReference Path="~/Js/pagina.js" />
                <asp:ScriptReference Path="~/Js/RaportNumarAngajatiDetaliat.js" />

                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="~/js/printThis.js" />
                <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/html2canvas.js" />
            </Scripts>
        </asp:ScriptManager>
        <script type="text/javascript">
            $(document).ready(function () {

                // When the user scrolls the page, execute myFunction 
                window.onscroll = function () { myFunction() };

                // Get the header
                var header = document.getElementById("myHeader");
                var header2 = document.getElementById("myHeader2");
                // Get the offset position of the navbar
                var sticky = header.offsetTop;

                // Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
                function myFunction() {
                    if (window.pageYOffset > 150) {
                        header.classList.add("sticky");
                        header2.classList.add("sticky");
                        $("#myHeader").show();
                        $("#myHeader2").show();
                    }

                    if (window.pageYOffset < 150) {
                        header.classList.remove("sticky");
                        header2.classList.remove("sticky");
                        $("#myHeader").hide();
                        $("#myHeader2").hide();
                    }

                    $('#MeBigger').css('width', '64px');

                    $('#Gennaio').text($('#Ianuarie_0').text());
                    $('#Febbraio').text($('#Februarie_0').text());
                    $('#Marzo').text($('#Martie_0').text());
                    $('#Aprile').text($('#Aprilie_0').text());
                    $('#Maggio').text($('#Mai_0').text());
                    $('#Giugno').text($('#Iunie_0').text());
                    $('#Luglio').text($('#Iulie_0').text());
                    $('#Agosto').text($('#August_0').text());
                    $('#Settembre').text($('#Septembrie_0').text());
                    $('#Ottobre').text($('#Octombrie_0').text());
                    $('#Novembre').text($('#Noiembrie_0').text());
                    $('#Dicembre').text($('#Decembrie_0').text());
                    $('#Media').text($('#Medie_0').text());
                }
            });
        </script>
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                            <td style="width: 100px;">
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx">&lt;Main&gt;</asp:HyperLink>
                            </td>
                            <td align="center">
                                <asp:Label ID="lRaportNumarAngajatiDetaliat" runat="server" CssClass="principal" Text="Reparti / Mansione"></asp:Label>
                            </td>


                            <td style="width: 50px;">
                                <img class="top-icons" onclick="fnExcelReport();" src="../../Images/icons/icon-excel.png" alt="Export to Excel" /></td>
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
                                            <asp:Label ID="lFiltruAn" runat="server" CssClass="continut" Text="ANNO"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFiltruAn" runat="server">
                                                <asp:ListItem>2021</asp:ListItem>

                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 40px;">&nbsp;</td>

                                        <td>
                                            <asp:Label ID="lFiltruDep" runat="server" CssClass="continut" Text="DEPARTAMENT"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFiltruDep" runat="server">
                                                <asp:ListItem Selected="True">ALL</asp:ListItem>
                                                <asp:ListItem>TESSITURA</asp:ListItem>
                                                <asp:ListItem>CONFEZIONE A</asp:ListItem>
                                                <asp:ListItem>CONFEZIONE B</asp:ListItem>
                                                <asp:ListItem>STIRO</asp:ListItem>
                                                <asp:ListItem>AMMINISTRAZIONE</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                          <td style="width: 40px;">&nbsp;</td>
                                         <td>
                                            <asp:Label ID="Label21" runat="server" CssClass="continut" Text="MANSIONE"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFiltruMansione" runat="server" DataSourceID="SqlDataSource2"  AppendDataBoundItems="true"  DataTextField="PostDeLucru" DataValueField="PostDeLucru"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                 ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString %>"
                                                 SelectCommand="SELECT DISTINCT [PostDeLucru] FROM [WbmOlimpiasHR].[dbo].[NumarAngajatiDetaliatView]"></asp:SqlDataSource>
                                        </td>

                                        <td style="width: 40px;">&nbsp;</td>
                                        <td>
                                            <form name="myForm" action="post">
                                                <input type="radio" onclick="radio1()" name="myRadios" value="radio_generale" id="radio_generale"  checked="checked" /><label for="radio_generale" class="radio-inline">Generale</label>
                                                <input type="radio" onclick="radio2()" name="myRadios" value="radio_maternita" id="radio_maternita" />
                                                <label for="radio_maternita" class="radio-inline">Maternita</label>
                                            </form>
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
                        <tr id="myHeader" class="header">
                            <td style="width: 250px!important;">Reparto</td>
                            <td style="width: 105px!important;">Dir./Indir.</td>
                            <td style="width: 65px!important;">Gennaio</td>
                            <td style="width: 65px!important;">Febbraio</td>
                            <td style="width: 65px!important;">Marzo</td>
                            <td style="width: 65px!important;">Aprile</td>
                            <td style="width: 65px!important;">Maggio</td>
                            <td style="width: 65px!important;">Giugno</td>
                            <td style="width: 65px!important;">Luglio</td>
                            <td style="width: 65px!important;">Agosto</td>
                            <td style="width: 65px!important;">Settembre</td>
                            <td style="width: 65px!important;">Ottobre</td>
                            <td style="width: 65px!important;">Novembre</td>
                            <td style="width: 65px!important;">Dicembre</td>
                            <td style="width: 65px!important;">MEDIA</td>
                        </tr>
                        <tr id="myHeader2" class="header2" style="display: none;">
                            <td class="rSelectat" style="width: 215px!important;">TOTALE GENERALE</td> 
                            <td class="rSelectat" style="width: 0px;" id="MeBigger"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Gennaio"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Febbraio"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Marzo"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Aprile"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Maggio"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Giugno"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Luglio"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Agosto"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Settembre"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Ottobre"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Novembre"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Dicembre"></td>
                            <td class="rSelectat" style="width: 65px!important;" id="Media"></td>
                        </tr>


                        <tr>
                            <td valign="top" style="height: 135px" id="id_generale">
                                <table id="tRaportNumarAngajatiDetaliat" width="675" style=" border-collapse: collapse;">
                                    <tr id="myHeader1" class="header1">
                                        <td class="rSecund">
                                            <asp:Label ID="htDepartament" runat="server"
                                                Text="Reparto" Width="200px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label5" runat="server"
                                                Text="" Width="60px">&nbsp;</asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htCodSistem" runat="server"
                                                Text="Gennaio" Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htMarca" runat="server"
                                                Text="Febbraio" Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htRaportAbsenta" runat="server"
                                                Text="Marzo" Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htPrenume" runat="server"
                                                Text="Aprile" Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htData" runat="server"
                                                Text="Maggio" Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htTipOra" runat="server" Text="Giugno"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1DAL" runat="server" Text="Luglio"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1ALL" runat="server" Text="Agosto"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="htR1TOT" runat="server" Text="Settembre"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label1" runat="server" Text="Ottobre"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label2" runat="server" Text="Novembre"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label3" runat="server" Text="Dicembre"
                                                Width="60px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label4" runat="server" Text="MEDIA"
                                                Width="60px"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>

                            <td valign="top" style="height: 130px;display: none;" id="id_maternita">
                                <table id="tRaportNumarAngajatiDetaliatMaternita" width="675" style=" border-collapse: collapse; display: none;">
                                    <tr id="myHeader12" class="header1">
                                        <td class="rSecund">
                                            <asp:Label ID="Label6" runat="server"
                                                Text="Reparto" Width="250px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label7" runat="server"
                                                Text="" Width="104px">&nbsp;</asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label8" runat="server"
                                                Text="Gennaio" Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label9" runat="server"
                                                Text="Febbraio" Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label10" runat="server"
                                                Text="Marzo" Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label11" runat="server"
                                                Text="Aprile" Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label12" runat="server"
                                                Text="Maggio" Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label13" runat="server" Text="Giugno"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label14" runat="server" Text="Luglio"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label15" runat="server" Text="Agosto"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label16" runat="server" Text="Settembre"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label17" runat="server" Text="Ottobre"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label18" runat="server" Text="Novembre"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label19" runat="server" Text="Dicembre"
                                                Width="65px"></asp:Label></td>
                                        <td class="rSecund">
                                            <asp:Label ID="Label20" runat="server" Text="MEDIA"
                                                Width="65px"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                                        <div id="printing-holder" style="width:1350px"></div>

                    <asp:HiddenField ID="hfId" runat="server" />
                    <asp:HiddenField ID="hfRowIndex" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
