<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statistica.aspx.cs" Inherits="Statistica"%>Image/

<html>
<head runat="server">
    <title>STATISTICHE</title>
    <link href="../../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="fMeniu" runat="server"> 
    <table style="width:100%;height:100%;">
        <tr>
            <td align="center" valign="middle">
                
                <table style="background-image:url(../../Images/Image/sigla.gif); background-repeat:no-repeat; background-position: center;">
                    <tr>
                        <td style="font-family: Tahoma; font-size: 22px; color: #202396; font-weight: bold;" align="center" colspan="7">
                            STATISTICHE
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <br /><br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 180px;border: 1px solid black; background-color: #D99694; height: 40px;" align="center">
                            <asp:Label ID="lGenerale" runat="server" Text="GENERALE" CssClass="meniu"></asp:Label>
                        </td>
                        <td style="width: 180px;border: 1px solid black; background-color: #A6A6A6;" align="center">
                            <asp:Label ID="lTessitura" runat="server" Text="TESSITURA" CssClass="meniu"></asp:Label>
                        </td>
                        <td style="width: 180px;border: 1px solid black; background-color: #77933C;" align="center">
                            <asp:Label ID="lConfezione" runat="server" Text="CONFEZIONE" CssClass="meniu"></asp:Label>
                        </td>
                        <td style="width: 180px;border: 1px solid black; background-color: #E46C0A;" align="center">
                            <asp:Label ID="lStiro" runat="server" Text="STIRO" CssClass="meniu"></asp:Label>
                        </td>
                        <td style="width: 180px;border: 1px solid black; background-color: #C4BD97;" align="center">
                            <asp:Label ID="lStruttura" runat="server" Text="STRUTTURA" CssClass="meniu"></asp:Label>
                        </td>
                        <td style="width: 180px;border: 1px solid black; background-color: #FFFFFF;" align="center">
                            <asp:HyperLink ID="hlMeniu" runat="server" CssClass="meniuPrincipal" NavigateUrl="Personal.aspx">Main</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; background-color: #95B3D7; height: 25px;" align="center">
                            <asp:HyperLink ID="hlRaportNumarAngajati" runat="server" CssClass="meniu" NavigateUrl="RaportNumarAngajati.aspx">Organico Generale</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteDepartament.aspx?Departament=TESSITURA ">Assenteismo</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteDepartament.aspx?Departament=CONFEZIONE">Assenteismo</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteDepartament.aspx?Departament=STIRO">Assenteismo</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteDepartament.aspx?Departament=STRUTTURA">Assenteismo</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; background-color: #95B3D7; height: 25px;" align="center">
                            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="meniu" NavigateUrl="RaportNumarAngajatiDetaliat.aspx">Reparti / Mansione</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="meniu" NavigateUrl="RaportSuplimentareDepartament.aspx?Departament=TESSITURA ">Straordinario</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink8" runat="server" CssClass="meniu" NavigateUrl="RaportSuplimentareDepartament.aspx?Departament=CONFEZIONE">Straordinario</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink9" runat="server" CssClass="meniu" NavigateUrl="RaportSuplimentareDepartament.aspx?Departament=STIRO">Straordinario</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink10" runat="server" CssClass="meniu" NavigateUrl="RaportSuplimentareDepartament.aspx?Departament=STRUTTURA">Straordinario</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; background-color: #95B3D7; height: 25px;" align="center">
                            <asp:HyperLink ID="HyperLink11" runat="server" CssClass="meniu" NavigateUrl="RaportAbsente.aspx">Assenteismo</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink12" runat="server" CssClass="meniu" NavigateUrl="RaportPrezenteDepartament.aspx?Departament=TESSITURA ">Presenze</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink13" runat="server" CssClass="meniu" NavigateUrl="RaportPrezenteDepartament.aspx?Departament=CONFEZIONE">Presenze</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink14" runat="server" CssClass="meniu" NavigateUrl="RaportPrezenteDepartament.aspx?Departament=STIRO">Presenze</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; background-color: #95B3D7; height: 25px;" align="center">
                            <asp:HyperLink ID="HyperLink15" runat="server" CssClass="meniu" NavigateUrl="RaportSuplimentare.aspx">Straordinario</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink17" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteAn.aspx?Departament=CONFEZIONE">Straordinario x causale (anno)</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink18" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteAn.aspx?Departament=STIRO">Straordinario x causale (anno)</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25px;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteLuna.aspx?Departament=CONFEZIONE">Straordinario x causale (mese)</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink16" runat="server" CssClass="meniu" NavigateUrl="RaportAbsenteLuna.aspx?Departament=STIRO">Straordinario x causale (mese)</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25px;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink19" runat="server" CssClass="meniu" NavigateUrl="RaportEficiente.aspx?Departament=CONFEZIONE">Efficienze</asp:HyperLink>
                        </td>
                        <td style="border: 1px solid black; background-color: #95B3D7;" align="center">
                            <asp:HyperLink ID="HyperLink20" runat="server" CssClass="meniu" NavigateUrl="RaportEficiente.aspx?Departament=STIRO">Efficienze</asp:HyperLink>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
