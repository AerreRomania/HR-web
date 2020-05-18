<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportAbsenteLuna.aspx.cs" Inherits="RaportAbsenteLuna" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportAbsenteLuna" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Reparti / Mansione</title>
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="fRaportAbsenteLuna" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportAbsenteLuna" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportAbsenteLunaWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="~/Js/RaportAbsenteLuna.js" />
                <asp:ScriptReference Path="~/Js/pagina.js" />
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
                                <asp:Label ID="lRaportAbsenteLuna" runat="server" CssClass="principal" Text="Analisi straordinario per tipologia (autorizzate)"></asp:Label>
                           </td> 
                           <td>
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
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruLuna" runat="server" CssClass="continut" Text="Mese"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFiltruLuna" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruDepartament" runat="server" CssClass="continut" Text="Reparto"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruDepartament" runat="server" ReadOnly="True" Width="200px" Text=""></asp:TextBox>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruCod" runat="server" CssClass="continut" Text="Cod"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruCod" runat="server" ReadOnly="True" Width="60px" Text=""></asp:TextBox>
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
                            <td valign="top">
                                <table id="tAbsenteProcent" width="675" style="border: 1px solid #800080; border-collapse: collapse;">
                                    <tr>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htA" runat="server" 
                                                Text="Causale/Mese" Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htCodSistem" runat="server" 
                                                Text="Controllo commesse respinte da Bnt" Width="120px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htC" runat="server" 
                                                Text="campionatura" Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htMarca" runat="server" 
                                                Text="riparazione capi * stiro" Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htRaportAbsentaLuna" runat="server" 
                                                Text="riparazione capi" Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htPrenume" runat="server" 
                                                Text="recupero capi difettati giornalieri" Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htData" runat="server" 
                                                Text="controllo difettosità tessitura   " Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htTipOra" runat="server" Text="Personale Capo Linea+struttura" 
                                                Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htR1DAL" runat="server" Text="stiro colli" 
                                                Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htR1ALL" runat="server" Text="per produzioni" 
                                                Width="110px"></asp:Label></td>
                                        <td class="rSecundLarge" align="center">&nbsp;<asp:Label ID="htR1TOT" runat="server" Text="TOTALI" 
                                                Width="110px"></asp:Label></td>
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