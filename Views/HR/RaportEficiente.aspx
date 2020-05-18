<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportEficiente.aspx.cs" Inherits="RaportEficiente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportEficiente" runat="server">
    <title>Reparti / Mansione</title>
    <link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="Css/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
    <style type="text/css">
        .top-icons{
             cursor:pointer;
        }
        body{
            height:1000px;
        }
    </style>
</head>
<body>
    <form id="fRaportEficiente" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportEficiente" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportEficienteWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="Js/RaportEficiente.js" />
                <asp:ScriptReference Path="Js/pagina.js" />
                <asp:ScriptReference Path="Js/jquery-1.7.1.min.js" />
                <asp:ScriptReference Path="Js/jquery-ui-1.8.18.custom.min.js" />
                 <%-- Exporting Libs --%>
                <asp:ScriptReference Path="js/printThis.js" />
                <asp:ScriptReference Path="js/jspdf.min.js" />
                <asp:ScriptReference Path="js/html2canvas.js" />
            </Scripts>
        </asp:ScriptManager>
        <table cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td>
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Statistica.aspx">&lt;Main&gt;</asp:HyperLink>
                           </td>
                           <td align="center">
                                <asp:Label ID="lRaportEficiente" runat="server" CssClass="principal" Text="Analisi efficienza per Dipendente"></asp:Label>
                           </td> 
                           <td>
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="Images/Image/loading.gif" alt="Loading ..."/> Loading ...</ProgressTemplate>
                                </asp:UpdateProgress>
                           </td>

                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printExcel();" src="./Images/icons/icon-excel.png" alt="Export to Excel" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printPDF();" src="./Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" onclick="printData();" src="./Images/icons/icon-print.png" alt="Print" /></td>


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
                                            <asp:DropDownList ID="ddlFiltru" runat="server">
                                                <asp:ListItem>Periodo</asp:ListItem>
                                                <asp:ListItem>Mese</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 270px;">
                                            <table id="tPerioada">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruDeLa" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        a
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruPanaLa" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="tLuna">
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddlFiltruAn" runat="server"></asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlFiltruLuna" runat="server"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lOrdonare" runat="server" CssClass="continut" Text="Ordina"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlOrdonare" runat="server">
                                                <asp:ListItem Value="0">% assenza</asp:ListItem>
                                                <asp:ListItem Value="1">% efficienza</asp:ListItem>
                                                <asp:ListItem Value="2">data assunzione</asp:ListItem>
                                                <asp:ListItem Value="3">nominativo</asp:ListItem>
                                                <asp:ListItem Value="4">linea</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruDepartament" runat="server" CssClass="continut" Text="Reparto"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruDepartament" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
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
                <td align="center">
                    <table>
                        <tr>
                            <td valign="top">
                                <table id="tRaportEficiente">
                                    <tr>
                                        <td>&nbsp;</td>
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
    </form>
</body>
</html>