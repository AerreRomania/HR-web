<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-gusti.aspx.vb" Inherits="Views.HR.form_timbrature_new" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Timbrature</title>
    <style>
        html{
             overflow-y: hidden;
        }

        *:not(.icon-th):not(.icon) {
            font-family: "Calibri", "Candara", "Segoe", "Segoe UI", Optima, Arial, sans-serif;
            font-weight: normal;
        }
        .inputtxt {
            margin-right: 50px;
            width: 158px;
            font-size: 13px;
        }
        .labeltxt {
            font-size: 13px;
            border-bottom: 1px dotted #888888;
        }
        .RadGrid_Default .rgMasterTable .rgSelectedCell, .RadGrid_Default .rgSelectedRow {
            background: #c23749!important;
            color: #fff;
        }
        .RadGrid_Default .rgHeader {
            color: #333;
            font-weight: 600;
            letter-spacing: 0.3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="RadGrid1" runat="server" PageSize="10" AllowFilteringByColumn="True" MasterTableView-RowIndicatorColumn-CurrentFilterFunction="Contains" OnPreRender="gvCktMap_PreRender" AllowPaging="True" DataSourceID="GridSource">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                    <ClientSettings AllowDragToGroup="True">
                        <ClientEvents OnRowSelected="RowSelected" />
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>

                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="GridSource">
                        <Columns>
                            <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Nume" FilterControlAltText="Filter Nume column" HeaderText="Nome:" SortExpression="Nume" UniqueName="Nume">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Prenume" FilterControlAltText="Filter Prenume column" HeaderText="Cognome:" SortExpression="Prenume" UniqueName="Prenume">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdAngajat" DataType="System.Int32" FilterControlAltText="Filter IdAngajat column" HeaderText="IdAngajat" SortExpression="IdAngajat" UniqueName="IdAngajat">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdTipPostDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdTipPostDeLucru column" HeaderText="IdTipPostDeLucru" SortExpression="IdTipPostDeLucru" UniqueName="IdTipPostDeLucru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdPostDeLucru" DataType="System.Int32" FilterControlAltText="Filter IdPostDeLucru column" HeaderText="IdPostDeLucru" SortExpression="IdPostDeLucru" UniqueName="IdPostDeLucru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdDepartament" DataType="System.Int32" FilterControlAltText="Filter IdDepartament column" HeaderText="IdDepartament" SortExpression="IdDepartament" UniqueName="IdDepartament">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdEchipa" DataType="System.Int32" FilterControlAltText="Filter IdEchipa column" HeaderText="IdEchipa" SortExpression="IdEchipa" UniqueName="IdEchipa">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdLinie" DataType="System.Int32" FilterControlAltText="Filter IdLinie column" HeaderText="IdLinie" SortExpression="IdLinie" UniqueName="IdLinie">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Data" DataType="System.DateTime" FilterControlAltText="Filter Data column" HeaderText="Data:" SortExpression="Data" UniqueName="Data">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IdTipOra" DataType="System.Int32" FilterControlAltText="Filter IdTipOra column" HeaderText="IdTipOra" SortExpression="IdTipOra" UniqueName="IdTipOra">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="R1DAL" DataType="System.Decimal" FilterControlAltText="Filter R1DAL column" HeaderText="R1DAL:" SortExpression="R1DAL" UniqueName="R1DAL">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="R1ALL" DataType="System.Decimal" FilterControlAltText="Filter R1ALL column" HeaderText="R1ALL:" SortExpression="R1ALL" UniqueName="R1ALL">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="R1TOT" DataType="System.Decimal" FilterControlAltText="Filter R1TOT column" HeaderText="R1TOT:" SortExpression="R1TOT" UniqueName="R1TOT">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodAngajat" FilterControlAltText="Filter CodAngajat column" HeaderText="CodAngajat" ReadOnly="True" SortExpression="CodAngajat" UniqueName="CodAngajat">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodSistem" DataType="System.Int32" FilterControlAltText="Filter CodSistem column" HeaderText="CodSistem" SortExpression="CodSistem" UniqueName="CodSistem">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Marca" FilterControlAltText="Filter Marca column" HeaderText="R-num:" SortExpression="Marca" UniqueName="Marca">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodDepartament" FilterControlAltText="Filter CodDepartament column" HeaderText="CodDepartament" SortExpression="CodDepartament" UniqueName="CodDepartament">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Departament" FilterControlAltText="Filter Departament column" HeaderText="Departament" SortExpression="Departament" UniqueName="Departament">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodPostDeLucru" FilterControlAltText="Filter CodPostDeLucru column" HeaderText="CodPostDeLucru" SortExpression="CodPostDeLucru" UniqueName="CodPostDeLucru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PostDeLucru" FilterControlAltText="Filter PostDeLucru column" HeaderText="Incadrare:" SortExpression="PostDeLucru" UniqueName="PostDeLucru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodLinie" FilterControlAltText="Filter CodLinie column" HeaderText="CodLinie" SortExpression="CodLinie" UniqueName="CodLinie">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Linie" FilterControlAltText="Filter Linie column" HeaderText="Linie" SortExpression="Linie" UniqueName="Linie">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodEchipa" FilterControlAltText="Filter CodEchipa column" HeaderText="CodEchipa" SortExpression="CodEchipa" UniqueName="CodEchipa">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Echipa" FilterControlAltText="Filter Echipa column" HeaderText="Echipa" SortExpression="Echipa" UniqueName="Echipa">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TipPostDeLucru" FilterControlAltText="Filter TipPostDeLucru column" HeaderText="Diretti/Indiretti:" SortExpression="TipPostDeLucru" UniqueName="TipPostDeLucru">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CodTipOra" FilterControlAltText="Filter CodTipOra column" HeaderText="CodTipOra" SortExpression="CodTipOra" UniqueName="CodTipOra">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TipOra" FilterControlAltText="Filter TipOra column" HeaderText="Tip Ora:" SortExpression="TipOra" UniqueName="TipOra">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="GridSource" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT * FROM [PrezenteView]"></asp:SqlDataSource>

                <table style="margin:0 auto; position:center;margin-top:10px;">
                    <tr>
                        <td class="labeltxt">R-num:</td>
                        <td><asp:TextBox runat="server" ID="txtMarca" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Nome:</td>
                        <td><asp:TextBox runat="server" ID="txtNome" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Cognome:</td>
                        <td><asp:TextBox runat="server" ID="txtCognome" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Linie:</td>
                        <td><asp:TextBox runat="server" ID="txtLine" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="labeltxt">Data:</td>
                        <td><telerik:RadDatePicker runat="server" ID="dpData" CssClass="inputtxt"></telerik:RadDatePicker></td>

                        <td class="labeltxt">R1DAL:</td>
                        <td><telerik:RadNumericTextBox runat="server" ID="nmr1dal" CssClass="inputtxt" NumberFormat-DecimalDigits="1"></telerik:RadNumericTextBox></td>

                        <td class="labeltxt">R1ALL:</td>
                        <td><telerik:RadNumericTextBox runat="server" id="nmr1all" CssClass="inputtxt" NumberFormat-DecimalDigits="1"></telerik:RadNumericTextBox></td>

                        <td class="labeltxt">R1TOT:</td>
                        <td><telerik:RadNumericTextBox runat="server" ID="nmr1tot" CssClass="inputtxt" NumberFormat-DecimalDigits="1"></telerik:RadNumericTextBox></td>
                    </tr>

                    <tr>
                        <td class="labeltxt">Reparto:</td>
                        <td><asp:TextBox runat="server" ID="txtReparto" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Incadrare:</td>
                        <td><asp:TextBox runat="server" ID="txtPostDeLucru" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Diretti/Indiretti:</td>
                        <td><asp:TextBox runat="server" ID="txtTipPostDeLucru" CssClass="inputtxt" Enabled="false"></asp:TextBox></td>

                        <td class="labeltxt">Tip Ora:</td>
                        <td>
                            <telerik:RadComboBox ID="ComboTipOre" Runat="server" DataSourceID="TipOraLookback" DataTextField="TipOra" DataValueField="Id">
                            </telerik:RadComboBox>
                            <asp:SqlDataSource ID="TipOraLookback" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString2 %>" SelectCommand="SELECT [Id], [TipOra] FROM [TipuriOre]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                                    <asp:UpdateProgress runat="server">
                                        <ProgressTemplate>
                                            <span style="float:right;">Updating...Please wait...</span>
                                            <img src="Images/img/spinner.gif"style="float: right;padding: 5px;" />
                                                <script type="text/javascript">
                                                    Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(
                                                        function () {
                                                            $("#btnUpdate").hide();
                                                        }
                                                    );
                                                </script>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <asp:Button runat="server" ID="btnUpdate" ClientIDMode="static" Text="Update" Style="margin: 0 auto;width: 80px;float: right;border: 4px #ffffff double;background: #c23749;margin-right: 50px;color: white;" />
                            </td>
                    </tr>
                              <tr>
                                <td colspan="8">
                                    <embed src="./form-gusti-upload.aspx" runat="server" frameborder="0" width="96%" height="400px;" />
                                </td>
                            </tr>
                </table>

                <asp:textbox runat="server" ID="lblid" style="display:none;"></asp:textbox>

                <script type="text/javascript">
                    function RowSelected(sender, eventArgs) {
                        var grid = sender;
                        var MasterTable = grid.get_masterTableView();
                        var row = MasterTable.get_dataItems()[eventArgs.get_itemIndexHierarchical()];

                        
                        var nume = MasterTable.getCellByColumnUniqueName(row, "Nume");
                        document.getElementById("txtNome").value = nume.innerHTML;

                        var id = MasterTable.getCellByColumnUniqueName(row, "Id");
                        document.getElementById("lblid").value = id.innerHTML;

                        var prenume = MasterTable.getCellByColumnUniqueName(row, "Prenume");
                        document.getElementById("txtCognome").value = prenume.innerHTML;

                        var marca = MasterTable.getCellByColumnUniqueName(row, "Marca");
                        document.getElementById("txtMarca").value = marca.innerHTML;

                        var linie = MasterTable.getCellByColumnUniqueName(row, "Linie");
                        document.getElementById("txtLine").value = linie.innerHTML;

                        var Dataa = MasterTable.getCellByColumnUniqueName(row, "Data");
                        var X = document.getElementById("dpData_dateInput_ClientState").value;
                        X = JSON.parse(X);
                        X.lastSetTextBoxValue = Dataa.innerHTML;
                        X.validationText = Dataa.innerHTML;
                        X.valueAsString = Dataa.innerHTML;
                        document.getElementById("dpData_dateInput_ClientState").value = (JSON.stringify(X));
                        document.getElementById("dpData_dateInput").value = X.lastSetTextBoxValue;
                        
                        var r1dal = MasterTable.getCellByColumnUniqueName(row, "R1DAL");
                        document.getElementById("nmr1dal").value = r1dal.innerHTML;

                        var r1all = MasterTable.getCellByColumnUniqueName(row, "R1ALL");
                        document.getElementById("nmr1all").value = r1all.innerHTML;

                        var r1tot = MasterTable.getCellByColumnUniqueName(row, "R1TOT");
                        document.getElementById("nmr1tot").value = r1tot.innerHTML;

                        
                        var reparto = MasterTable.getCellByColumnUniqueName(row, "Departament");
                        document.getElementById("txtReparto").value = reparto.innerHTML;

                        var postdelucru = MasterTable.getCellByColumnUniqueName(row, "PostDeLucru");
                        document.getElementById("txtPostDeLucru").value = postdelucru.innerHTML;

                        var tippostdelucru = MasterTable.getCellByColumnUniqueName(row, "TipPostDeLucru");
                        document.getElementById("txtTipPostDeLucru").value = tippostdelucru.innerHTML;

                            var tipora = MasterTable.getCellByColumnUniqueName(row, "TipOra");
                            var combo = $find("<%= ComboTipOre.ClientID %>");
                            var itm = combo.findItemByText(tipora.innerHTML);
                            itm.select();
                    }
                </script>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
