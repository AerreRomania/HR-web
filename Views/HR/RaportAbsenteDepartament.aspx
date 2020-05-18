<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportAbsenteDepartament.aspx.cs" Inherits="RaportAbsenteDepartament" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head id="hRaportAbsenteDepartament" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

        <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
        <title>Analisi assenze</title>
        <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
        <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            select {
                text-transform: uppercase;
            }
            
            .top-icons {
                cursor: pointer;
            }
            
            .floatingHeader {
                position: fixed;
                top: 0;
                display: none;
            }
            
            .blanko {
                width: 5px !important;
                border: 1px solid #ffffff;
            }
            
            body {
                height: 800px;
            }
            
            #tAbsenteDepartamentOre {
                zoom: 80%;
                -ms-zoom: 80%;
                -moz-zoom: 80%;
                -webkit-zoom: 80%;
            }
             
            
            td.rNeselectat,
            td.rWeekend {
                height: 25px;
                letter-spacing: 0.5px;
            }
            
            td.rWeekend {
                font-size: 9pt;
            }
            
            .sticky .rWeekend {
                border: 1px solid #ffffff !important;
                font-size: 9pt;
            }
            
            td.rSelectat {
                background-color: #d0d0d0;
                color: black;
                border: 1px solid #ffffff !important;
                font-weight: 600;
                font-size: 9pt;
                text-align: center !important;
            }
            
            .tot {
                text-align: center;
                vertical-align: middle;
                background-color: #d0d0d0;
            }
            
            #tbFiltruDepartament {
                padding-left: 5px;
            }
            
            .sticky {
                position: fixed;
                top: 0;
                width: 100%;
            }
            
            .sticky+.content {
                padding-top: 102px;
            }
            
            .spaner {
                font-size: 12pt;
                padding-left: 10px;
            }
            
            table {
                border-spacing: 0px !important;
            }
            
            .rSecund {
                box-shadow: 1px 1px 2px 0px rgba(0, 0, 0, 0.33);
            }
            
            #tAbsenteDepartamentOre span {
                width: 100%;
                display: inline-block;
            }
            
            .persist-header td.rWeekend span,
            td.rSelectat span {
                box-shadow: 1px 1px 2px 0px rgba(0, 0, 0, 0.33);
                height: 100%;
                vertical-align: middle;
                line-height: 40px;
            }
        </style>

        <script type="text/javascript">
            function UpdateTableHeaders() {
                $(".persist-area").each(function() {

                    var el = $(this),
                        offset = el.offset(),
                        scrollTop = $(window).scrollTop(),
                        floatingHeader = $(".floatingHeader", this);

                    if ((scrollTop > offset.top) && (scrollTop < offset.top + el.height())) {
                        floatingHeader.css({
                            "display": "block"
                        });
                        $('#rDipendente').css('width', $('#Departament_2').width() + 'px');
                        $('#rMansione').css('width', $('#PostDeLucru_2').width() + 'px');
                        $('#rLinea').css('width', $('#EchipaLinie_2').width() + 'px');

                         
                        $('.persist-header').css('width', '1796.98px');
                        $('#tAbsenteDepartamentOre').css('width', '1796.98px');

                        $('.totDesno').width($('#rTotale').width() + 1.76);

                        $('.floatingHeader #rDipendente').find('span').width($('.persist-header #rDipendente').width() + 1.76);
                        $('.floatingHeader #rMansione').find('span').width($('.persist-header #rMansione').width() + 1.76);
                        $('.floatingHeader .blanko').find('span').width($('.persist-header .blanko').width() + 1.76);
                        $('.floatingHeader #rLinea').find('span').width($('.persist-header #rLinea').width() + 1.76);
                        $('.floatingHeader .rPeki').find('span').width($('.persist-header .rPeki').width() + 1.76);
                        $('.floatingHeader #rTotale').find('span').width($('.persist-header #rTotale').width() + 1.76);



                    } else {
                        floatingHeader.css({
                            "display": "none"
                        });
                        $('.persist-header').css('width', '1796.98px');
                        $('#tAbsenteDepartamentOre').css('width', '1796.98px');

                        $('#rDipendente').css('width', $('#Departament_2').width() + 'px');
                        $('#rMansione').css('width', $('#PostDeLucru_2').width() + 'px');
                        $('#rLinea').css('width', $('#EchipaLinie_2').width() + 'px');

                        $('.totDesno').width($('#rTotale').width() + 1.76);

                        $('.floatingHeader #rDipendente').find('span').width($('.persist-header #rDipendente').width() + 1.76);
                        $('.floatingHeader #rMansione').find('span').width($('.persist-header #rMansione').width() + 1.76);
                        $('.floatingHeader .blanko').find('span').width($('.persist-header .blanko').width() + 1.76);
                        $('.floatingHeader #rLinea').find('span').width($('.persist-header #rLinea').width() + 1.76);
                        $('.floatingHeader .rPeki').find('span').width($('.persist-header .rPeki').width() + 1.76);
                        $('.floatingHeader #rTotale').find('span').width($('.persist-header #rTotale').width() + 1.76);
                    };
                });
            }
        </script>
    </head>

    <body runat="server" id="dby">
        <form id="fRaportAbsenteDepartament" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
            <asp:ScriptManager ID="smRaportAbsenteDepartament" runat="server">
                <Services>
                    <asp:ServiceReference Path="RaportAbsenteDepartamentWS.asmx" />
                </Services>
                <Scripts>
                    <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                    <asp:ScriptReference Path="~/Js/RaportAbsenteDepartament.js" />
                    <asp:ScriptReference Path="~/Js/pagina.js" />
                    <%-- Exporting Libs --%>
                        <asp:ScriptReference Path="~/js/printThis.js" />
                        <asp:ScriptReference Path="~/js/jspdf.min.js" />
                        <asp:ScriptReference Path="~/js/html2canvas.js" />
                </Scripts>
            </asp:ScriptManager>

            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td class="principal">
                        <table>
                            <tr>
                                <td style="width: 500px;">
                                    <%--<asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx" Width="120px">&lt;Main&gt;</asp:HyperLink>--%>
                                </td>
                                <td align="center">
                                    <asp:Label ID="lRaportAbsenteDepartament" runat="server" CssClass="principal" Text=""></asp:Label>
                                </td>

                                <td style="width: 500px;">
                                    <asp:UpdateProgress ID="up" runat="server">
                                        <ProgressTemplate>
                                            <img src="../../Images/Image/loading.gif" alt="Loading ..." /> Loading ...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>

                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printExcel();" src="../../Images/icons/icon-excel.png" alt="Export to Excel" /></td>
                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                                <td style="width: 50px;">
                                    <img class="top-icons" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print" /></td>

                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="center" style="height: 20px;">
                        <table cellpadding="0" cellspacing="0" class="principal eew">
                            <tr>
                                <td>
                                    <br />
                                    <table>
                                        <tr>
                                            <td>
                                                <span class="spaner">ANNO:</span>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlFiltruAn" onchange="Lista();" runat="server">
                                                    <asp:ListItem value="2020">2020</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td><span class="spaner">MESE:</span></td>
                                            <td>
                                                <asp:DropDownList ID="ddlFiltruLuna" onchange="Lista();" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <span class="spaner">LINEA:</span>
                                            </td>
                                            <td>
                                                <asp:DropDownList Style="display: block;" ID="ddlFiltruEchipaLinie" runat="server">
                                                    <asp:ListItem Value="ALL" Text="ALL"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>

                                            <td>
                                                <span class="spaner">MANSIONE:</span>
                                            </td>
                                            <td>
                                                <asp:DropDownList Style="display: block;" ID="ddlFiltruMansione" runat="server">
                                                    <asp:ListItem Value="ALL" Text="ALL"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>

                                            <td>
                                                <span class="spaner">DEPARTAMENT:</span>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbFiltruDepartament" runat="server" ReadOnly="True" Width="100px" Enabled="false"></asp:TextBox>
                                            </td>
                                            <td>
                                                <input runat="server" id="bExcel" visible="false" value="Export" type="button" onclick="bExcel_Click()" class="xls" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="eew">
                            <tr>
                                <td valign="top" align="center">
                                    <table id="tAbsenteDepartamentOre" class="persist-area" style="border-collapse: collapse; width: 1796.98px"></table>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="hfId" runat="server" />
                        <asp:HiddenField ID="hfRowIndex" runat="server" />

                    </td>
                </tr>
            </table>
            <div id="printing-holder"></div> 

            <script type="text/javascript">
                //// DOM Ready
                $(function() {

                    var clonedHeaderRow;

                    $(".persist-area").each(function () {
                        clonedHeaderRow = $(".persist-header", this);
                        clonedHeaderRow
                            .before(clonedHeaderRow.clone())
                            .css("width", clonedHeaderRow.width())
                            .addClass("floatingHeader").css('visibility', 'hidden');
                    });

                    $(window).scroll(UpdateTableHeaders).trigger("scroll");


                    function UpdateTableHeaders() {
                        $(".persist-area").each(function() {

                            var el = $(this),
                                offset = el.offset(),
                                scrollTop = $(window).scrollTop(),
                                floatingHeader = $(".floatingHeader", this);

                            if ((scrollTop > offset.top) && (scrollTop < offset.top + el.height())) {
                                floatingHeader.css({
                                    "visibility": "visible"
                                });
                            } else {
                                floatingHeader.css({
                                    "visibility": "hidden"
                                });
                            }
                        });
                    }
                });
            </script>
        </form>
    </body>

    </html>