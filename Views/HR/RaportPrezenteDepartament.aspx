<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportPrezenteDepartament.aspx.cs" Inherits="RaportPrezenteDepartament" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportPrezenteDepartament" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Analisi presenze</title>
    <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="~/Css/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
    <style type="text/css">
        .top-icons{
           cursor:pointer;
        }

        body{
            height: 850px;
            background-color:#f4f4f4;
        }

        .peki{
            width: 300px!important;
            /*display: -webkit-inline-box;*/
            margin-left:8px;
        }
        #tblPrezenze{
            background-color:#f4f4f4;
        }

        td.rAntet{
            padding-left:0px; 
            padding-right:0px; 
        }

        td.rAntet span{
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
                display: inline-block;
                width: 100%;
        }

        td.rAntetSecundRosu{
            width:10px;
        }

        td.rAntetSecundRosu {
            background-color: #ff0000;
            font: 9px/12px Arial, Helvetica, sans-serif;
            color: #ffffff;
            border: 1px solid #ffffff;
            font-weight: 600;
            text-align: left;
             padding-left:5px;
        }

        td.rAntetSecundAlb {
            background-color: #e2e2e2;
            font: 10px/15px Arial, Helvetica, sans-serif;
            /* color: #294460; */
            color: black;
            border: 1px solid #ffffff;
            font-weight: 600;
            text-align: left;
            padding-left:5px;
        }

        #myTable .rAntet{
            padding-left:5px;
            padding-right:5px;
        }

        #tPrezenteDepartament {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
        /*cursor: move;*/
         cursor: grab; 
         cursor: -o-grab; 
         cursor: -moz-grab; 
         cursor: -webkit-grab;

    }

    </style>
</head>
<body>
    <form id="fRaportPrezenteDepartament" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportPrezenteDepartament" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportPrezenteDepartamentWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="../../js/RaportPrezenteDepartament.js" />
                <asp:ScriptReference Path="../../js/jquery-1.7.1.min.js" />
                <asp:ScriptReference Path="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js" />
                <asp:ScriptReference Path="../../js/jquery.maskedinput-1.3.js" />
                <asp:ScriptReference Path="../../js/draggablescroll.js" />
                <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>--%>

                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="../../js/printThis.js" />
                <asp:ScriptReference Path="../../js/jspdf.min.js" />
                <asp:ScriptReference Path="../../js/html2canvas.js" />
            </Scripts>
        </asp:ScriptManager>
        <table cellpadding="0" cellspacing="0" style="width:97%">
            <tr>
                <td class="principal" colspan="2">
                    <table width="100%">
                        <tr>
                           <td style="width: 200px;">
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx" Width="120px">&lt;Main&gt;</asp:HyperLink>
                           </td>
                           <td align="center">
                                <asp:Label ID="lRaportPrezenteDepartament" runat="server" CssClass="principal" Text="Analisi presenze"></asp:Label>
                           </td> 
                            

                           <td style="width: 350px;">
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="../../Images/Image/loading.gif" alt="Loading ..."/> Loading ...</ProgressTemplate>
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
                <td valign="middle" align="center" style="height:50px;" colspan="2">
                    <table cellpadding="0" cellspacing="0" class="principal">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lFiltruData" runat="server" CssClass="continut" Text="GIORNO"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruData" runat="server" ReadOnly="True" Width="75px"></asp:TextBox>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruDepartament" runat="server" CssClass="continut" Text="Reparto"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruDepartament" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
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
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
        <table id="tblPrezenze" aling="center">

            <tr>
                <td style="width: 475px" align="center">
                    <table id="tTotal">
                        <tr> 
                            <td valign="top">
                                &nbsp;
                            </td> 
                        </tr>
                      
                    </table>
                   
                    <%-- <table> <tr><td style="text-decoration:underline;">Legend:</td></tr></table>
                    <table>
                        <tr>
                            <td class="rAntetSecundRosu"></td><td><span id="idassenti"></span> = Assenti</td>
                        </tr>
                        <tr style="display:none;">
                            <td class="rAntetSecundGalben"></td><td><span runat="server" id="idmaternita"></span> = Maternita</td>
                        </tr>
                            <tr>
                            <td style="background-color: forestgreen;"></td><td><span id="idferie"></span> = Ferie</td>
                        </tr>
                    </table>--%>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td class="rAntetSecundRosu"></td>
                            <td><span id="idassenti"></span> = Assenti</td>
                        </tr>
                        <tr>
                            <td style="background-color: forestgreen;"></td>
                            <td><span id="idferie"></span> = Ferie</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td valign="top">
                                <table cellspacing="5" cellpadding="5" class="dragscroll" id="tPrezenteDepartament" width="1560px" style="display:block;">
                                    <tr>
                                        <td align="center">&nbsp;</td>
                                    </tr>
                                </table>

                                 <table cellspacing="5" cellpadding="5" class="dragscroll" id="tPrezenteDepartament1" width="1560px" style="display:none;">
                                    <tr>
                                        <td align="center">&nbsp;</td>
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

        <script type="text/javascript">
            $(document).ajaxComplete(function () {
                console.log('ovde ajaxComplete');
                $('#idassenti').text($('.inAssenti').text());
            });

            $(document).load(function () {
                console.log('ovde Load');
                $('#idassenti').text($('.inAssenti').text());
            });
        </script>
 
    </form>
</body>
</html>