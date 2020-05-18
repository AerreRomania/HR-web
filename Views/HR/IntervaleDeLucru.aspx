<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IntervaleDeLucru.aspx.cs" Inherits="IntervaleDeLucru" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hIntervaleDeLucru" runat="server">
    <title>Orario</title>
    <link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="fIntervaleDeLucru" runat="server">
        <asp:ScriptManager ID="smIntervaleDeLucru" runat="server">
            <Services>
                <asp:ServiceReference Path="IntervaleDeLucruWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="Js/IntervaleDeLucru.js" />
                <asp:ScriptReference Path="Js/pagina.js" />
            </Scripts>
        </asp:ScriptManager>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td>
                                <asp:Label ID="lIntervaleDeLucru" runat="server" CssClass="principal" Text="Orario"></asp:Label>
                           </td> 
                           <td align="right">
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="Images/Image/loading.gif" alt="Loading ..."/> Loading ...
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                           </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="principal">
                        <tr>
                            <td valign="top" style="height: 130px">
                                <table id="tIntervaleDeLucru" class="principal" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="secund">&nbsp;<asp:Label ID="htUtilizatot" runat="server" 
                                                Text="Orario"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                            <td rowspan="4" valign="top">
                                <table cellpadding="0" cellspacing="0" class="principal">
                                    <tr>
                                        <td class="secund">
                                            <asp:Label ID="lCautare" runat="server" CssClass="secund" Text="Ricerca"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lFiltruIntervalDeLucru" runat="server" CssClass="continut" Text="Orario"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruIntervalDeLucru" runat="server"  Width="120px"></asp:TextBox>
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
                        <tr>
                            <td align="center">
                                <table class="principal">
                                    <tr>
                                        <td><input runat="server" id="bAdaugare" title="Aggiungi CTRL+N" type="button" onclick="bAdaugare_Click()" class="comanda" value="Aggiungi" /></td>
                                        <td><input runat="server" id="bStergere" title="Cancella CTRL+D" type="button" onclick="bStergere_Click()" class="comanda" value="Cancella" /></td>
                                        <td><input runat="server" id="bPrima" title="Prima pagina" type="button" onclick="bPrima_Click()" style="background-image: url(Images/Image/prima.png)" class="navigare" /></td>
                                        <td><input runat="server" id="bAnterior" title="Pagina anterioara" type="button" onclick="bAnterior_Click()" style="background-image: url(Images/Image/anterior.png)" class="navigare" /></td>
                                        <td>
                                            <asp:TextBox ID="tbPaginaCurenta" ToolTip="Pagina curenta" runat="server" Width="30px" >1</asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lDin" runat="server" Text="da"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbNumarPagini" ToolTip="Numar pagini" runat="server" Width="30px" ReadOnly="True">1</asp:TextBox>
                                        </td>
                                        <td><input runat="server" id="bUrmator" title="Pagina urmatoare" type="button" onclick="bUrmator_Click()" style="background-image: url(Images/Image/urmator.png)" class="navigare" /></td>
                                        <td><input runat="server" id="bUltima" title="Ultima pagina" type="button"  onclick="bUltima_Click()" style="background-image: url(Images/Image/ultima.png)" class="navigare" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lIntervalDeLucru" runat="server" Text="Orario" CssClass="continut"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbIntervalDeLucru" runat="server" Width="250px" ></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table>
                                    <tr>
                                        <td>
                                            <input id="bOk" type="button" value="Ok" onclick="bOk_Click()" class="confirmare" /></td>
                                        <td align="center">
                                            <input id="bCancel" type="button" value="Cancel" onclick="bCancel_Click()" class="confirmare" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>