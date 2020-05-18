<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prezente.aspx.cs" Inherits="Prezente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hPrezente" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Prezente</title>
    <link href="Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body{
            height:800px;
            overflow-y:hidden;
                        overflow-x:hidden;

        }
    </style>
</head>
<body>
    <form id="fPrezente" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smPrezente" runat="server">
            <Services>
                <asp:ServiceReference Path="PrezenteWS.asmx" />
                <%--<asp:ServiceReference Path="DepartamenteWS.asmx" />--%>
            </Services>
            <Scripts>
                <asp:ScriptReference Path="js/jquery-1.12.4.min.js" />
                <asp:ScriptReference Path="Js/Prezente.js" />
                <%--<asp:ScriptReference Path="Js/Departamente.js" />--%>
                <asp:ScriptReference Path="Js/pagina.js" />
                <%--<asp:ScriptReference Path="js/timbrature-video.js" />--%>
            </Scripts>
        </asp:ScriptManager>
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td class="principal">
                    <table width="100%">
                        <tr>
                           <td style="width: 100px;">
                                <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Personal.aspx">&lt;Main&gt;</asp:HyperLink>
                           </td>
                           <td align="center">
                                <asp:Label ID="lPrezente" runat="server" CssClass="principal" Text="Presente"></asp:Label>
                           </td> 
                           <td style="width: 150px;" align="right">
                                <asp:UpdateProgress ID="up" runat="server">
                                    <ProgressTemplate>
                                        <img src="Images/Image/loading.gif" alt="Loading ..."/> Loading ...</ProgressTemplate>
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
                                <table id="tPrezente" class="principal" width="675" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="secund">&nbsp;<asp:Label ID="htCodPrezenta" runat="server" 
                                                Text="Cod angajat" Width="80px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htCodSistem" runat="server" 
                                                Text="Cod sistem" Width="80px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htMarca" runat="server" 
                                                Text="Marca" Width="70px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htPrezenta" runat="server" 
                                                Text="Nume" Width="150px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htPrenume" runat="server" 
                                                Text="Prenume" Width="150px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htData" runat="server" 
                                                Text="Data" Width="80px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htTipOra" runat="server" Text="Tip ora" 
                                                Width="200px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htR1DAL" runat="server" Text="R1DAL" 
                                                Width="50px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htR1ALL" runat="server" Text="R1ALL" 
                                                Width="50px"></asp:Label></td>
                                        <td class="secund">&nbsp;<asp:Label ID="htR1TOT" runat="server" Text="R1TOT" 
                                                Width="50px"></asp:Label></td>
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
                                                        <asp:Label ID="lFiltruCodAngajat" runat="server" CssClass="continut" Text="Cod angajat"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruCodAngajat" runat="server"  Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lFiltruCodSistem" runat="server" CssClass="continut" Text="Cod sistem"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruCodSistem" runat="server"  Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lFiltruMarca" runat="server" CssClass="continut" Text="Marca"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruMarca" runat="server"  Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lFiltruNume" runat="server" CssClass="continut" Text="Nume" ToolTip="Nume"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbFiltruNume" runat="server"  Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lFiltruDepartament" runat="server" CssClass="continut" Text="Departament"></asp:Label>
                                                    </td>
                                                    <td>
                                                     <%--<asp:TextBox ID="tbFiltruCodDepartament" runat="server"  Width="100px"></asp:TextBox>--%>

                                                        <asp:TextBox ID="tbFiltruDepartament" runat="server"  Width="100px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hfId" runat="server" />
                                <asp:HiddenField ID="hfRowIndex" runat="server" />
                                <asp:HiddenField ID="hfIdAngajat" runat="server" />
                                <asp:HiddenField ID="hfIdTipPostDeLucru" runat="server" />
                                <asp:HiddenField ID="hfIdPostDeLucru" runat="server" />
                                <asp:HiddenField ID="hfIdDepartament" runat="server" />
                                <asp:HiddenField ID="hfIdEchipa" runat="server" />
                                <asp:HiddenField ID="hfIdLinie" runat="server" />
                                <asp:HiddenField ID="hfIdTipOra" runat="server" />
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
                            <td style="border: solid 1px #c0c0c0;" valign="top">
                                <table id="tGeneral">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lAngajat" runat="server" Text="Cod angajat" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbCodAngajat" runat="server" Width="125px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bAngajat" runat="server" class="navigare" onclick="bAngajat_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lCodSistem" runat="server" Text="Cod sistem" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbCodSistem" runat="server" Width="150px" ></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lMarca" runat="server" Text="Marca" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbMarca" runat="server" Width="150px" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lNume" runat="server" Text="Nume" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbNume" runat="server" Width="150px"></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lPrenume" runat="server" Text="Prenume" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbPrenume" runat="server" Width="150px" ></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lTipPostDeLucru" runat="server" CssClass="continut" Text="Tip post de lucru" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbTipPostDeLucru" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bTipPostDeLucru" runat="server" class="navigare" onclick="bTipPostDeLucru_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lPostDeLucru" runat="server" CssClass="continut" Text="Post de lucru"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbPostDeLucru" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bPostDeLucru" runat="server" class="navigare" onclick="bPostDeLucru_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lDepartament" runat="server" CssClass="continut" Text="Departament"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbDepartament" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bDepartament" runat="server" class="navigare" onclick="bDepartament_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lEchipa" runat="server" CssClass="continut" Text="Echipa" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbEchipa" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bEchipa" runat="server" class="navigare" onclick="bEchipa_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lLinie" runat="server" Text="Linie" CssClass="continut"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbLinie" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bLinie" runat="server" class="navigare" onclick="bLinie_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lData" runat="server" Text="Data" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbData" runat="server" Width="100px" ></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lTipOra" runat="server" CssClass="continut" Text="Tip ora" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbTipOra" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input id="bTipOra" runat="server" class="navigare" onclick="bTipOra_Click()" style="background-image: url(Images/Image/table.png)" type="button" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr><tr>
                                        <td align="right">
                                            <asp:Label ID="lR1DAL" runat="server" Text="R1DAL" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbR1DAL" runat="server" Width="50px"></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lR1ALL" runat="server" Text="R1ALL" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbR1ALL" runat="server" Width="50px" ></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lR1TOT" runat="server" Text="R1TOT" CssClass="continut" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbR1TOT" runat="server" Width="50px" ></asp:TextBox>
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

                        <tr>
                                        <td colspan="12">
                                            <%--<asp:FileUpload id="fuImport" runat="server" Width="350px"></asp:FileUpload>--%>

                                            <embed src="./form-timbrature.aspx" runat="server"  frameborder="0" width="100%" height="500px;"></embed>

                                        </td>
                                    </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>