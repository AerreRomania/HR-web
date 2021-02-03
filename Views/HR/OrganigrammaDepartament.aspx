<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrganigrammaDepartament.aspx.cs" Inherits="OrganigrammaDepartamentNew" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title></title>

    <style type="text/css">
        body {
            height: 875px;
        }

        .RadComboBoxDropDown .rcbList > li {
            font-size: 11px;
            font-weight: 600;
        }

        #btn_close {
            float: right;
            right: 40px;
            position: fixed;
            top: 30px;
            font-weight: 800;
            font-size: 20pt;
            cursor: pointer;
        }

        .rgFilterRow td {
            border: 0px solid white !important;
        }

        #btn_close:hover {
            color: red;
            cursor: pointer;
        }

        .RadGrid_Default {
            color: black !important;
        }

        .grid_header {
            font-weight: 600 !important;
            font-size: 14px;
            background-color: orange !important;
            text-align: center !important;
        }

        .RadGrid_Default .rgHeader, .RadGrid_Default th.rgResizeCol, .RadGrid_Default .rgHeaderWrapper {
            border: 2px solid white;
            background: #ffbf49 0 -2300px !important;
            border: 0.4px solid white !important
        }


        .RadGrid_Default td {
            border: 1px solid white !important;
            text-align: center;
        }


        .RadGrid_Default {
            -webkit-box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
            -moz-box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
            box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
            </Scripts>
        </telerik:RadScriptManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:UpdateProgress ID="up" runat="server">
                    <ProgressTemplate>
                        <span style="font-size: 20px; left: 24%; position: absolute; top: 10px;">
                            <img src="Images/img/spinner.gif" alt="Loading ..." />
                            Loading data. Please Wait...
                        </span>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <telerik:RadGrid runat="server" ID="RadGrid1" AllowFilteringByColumn="True" AllowSorting="true"  Style="margin: 0 auto; margin-top: 30px;" AutoGenerateColumns="false" ClientSettings-Scrolling-AllowScroll="true" ClientSettings-Scrolling-ScrollHeight="700" Width="1400" HeaderStyle-CssClass="grid_header">

                    <ClientSettings EnableRowHoverStyle="true" EnableClientPrint="true" Virtualization-EnableVirtualization="true">
                        <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                    </ClientSettings>

                    <SortingSettings SortedBackColor="#FFF6D6" EnableSkinSortStyles="false"></SortingSettings>
                    
                    <MasterTableView AutoGenerateColumns="false">
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="TemplateColumn" DataField="ID" AllowSorting="true" AllowFiltering="false" HeaderText="&#8470;">
                                <ItemTemplate>
                                    <asp:Label ID="numberLabel" CssClass="Id_Counter" runat="server" Text='<%#Container.ItemIndex+1%>' Width="40px" />
                                </ItemTemplate>
                                <HeaderStyle Width="100px" />
                            </telerik:GridTemplateColumn>


                            <telerik:GridBoundColumn DataField="Nome" AllowFiltering="false" FilterControlAltText="Filter Nume column" HeaderText="Nome:" SortExpression="Nome" UniqueName="Nome">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Cognome" AllowSorting="true" AllowFiltering="false" FilterControlAltText="Filter Prenume column" HeaderText="Cognome:" SortExpression="Cognome" UniqueName="Cognome">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Data Nascita" AllowFiltering="false" FilterControlAltText="Filter Data Nascita column" HeaderText="Data di Assunzione:" SortExpression="Data Nascita" UniqueName="DataNascita">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="Mansione" ItemStyle-CssClass="MansioneClass"
                                FilterControlAltText="Filter Mansione column" HeaderText="Mansione:"
                                SortExpression="Mansione" UniqueName="Mansione">
                                <FilterTemplate>
                                    <telerik:RadComboBox runat="server" ID="cmbMansione" CssClass="cmb_mansione"
                                        DataTextField="Mansione" DataValueField="Mansione"
                                        OnDataBinding="cmbProductName_DataBinding_Mansione" OnDataBound="ComboMansione_DataBound"
                                        OnClientSelectedIndexChanged="applySearch"
                                        Style="width: 100%;">
                                    </telerik:RadComboBox>


                                    <telerik:RadScriptBlock runat="server" ID="sds">
                                        <script type="text/javascript"> 

                                            var filter1 = "Select a Mansione";
                                            var filter2 = "Select a Linea";

                                            function applySearch() {
                                                filter1 = $(".cmb_mansione").val();
                                                filter2 = $(".cmb_linea").val();
                                                $(".rgRow").show();
                                                $(".rgAltRow").show();

                                                $(".rgRow").each(checkRow);
                                                $(".rgAltRow").each(checkRow);
                                            }

                                            function checkRow() {
                                                var isFirstMatch = (filter1 === "Select a Mansione" || filter1 === $(this).find('.MansioneClass').first().html());
                                                var isSecondMatch = (filter2 === "Select a Linea" || filter2 === $(this).find('.LineaClass').first().html());
                                                if (!(isFirstMatch && isSecondMatch)) {
                                                    $(this).hide();
                                                    $(".rgRow").css('background', 'white');
                                                    $(".rgAltRow").css('background', 'white');
                                                    $(".Id_Counter").css('color', 'white');
                                                } else {
                                                    $(".rgRow").css('background', 'white');
                                                    $(".rgAltRow").css('background', 'whitesmoke');
                                                    $(".Id_Counter").css('color', 'black');
                                                }
                                            }

                                        </script>
                                    </telerik:RadScriptBlock>
                                </FilterTemplate>
                            </telerik:GridBoundColumn>



                            <telerik:GridBoundColumn DataField="Linea" AllowSorting="true"
                                FilterControlAltText="Filter Linea column" HeaderText="Linea:" ItemStyle-CssClass="LineaClass"
                                SortExpression="Linea" UniqueName="Linea">
                                <FilterTemplate>
                                    <telerik:RadComboBox runat="server" ID="cmbLinea" CssClass="cmb_linea"
                                        DataTextField="Linea" DataValueField="Linea"
                                        OnDataBinding="cmbProductName_DataBinding_Linea" OnDataBound="ComboLinea_DataBound" OnClientSelectedIndexChanged="applySearch">
                                    </telerik:RadComboBox>

                                </FilterTemplate>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Note" AllowSorting="false" AllowFiltering="false" FilterControlAltText="Filter Note column" HeaderText="Note:" SortExpression="Note" UniqueName="Note">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>

                </telerik:RadGrid>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
