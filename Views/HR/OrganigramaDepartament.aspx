<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="OrganigramaDepartament.aspx.cs" Inherits="OrganigrammaDepartamentNew" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <meta charset="utf-8" />
    <title></title>

    <style type="text/css">
        @import url('https://fonts.googleapis.com/css?family=Exo');

        * {
            font-family: 'Exo', sans-serif !important;
        }

        .top-icons {
            cursor: pointer;
            margin-right: 15px;
            margin-top: 10px;
        }

        .RadComboBox_Default .rcbReadOnly .rcbInput {
            color: #333;
            text-align: left;
        }

        body {
            height: 800px;
            overflow-y: auto;
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
            font-size: 12px;
            background-color: orange !important;
            text-align: left !important;
            text-transform: uppercase;
        }

        .RadGrid_Default .rgHeader, .RadGrid_Default th.rgResizeCol, .RadGrid_Default .rgHeaderWrapper {
            border: 2px solid white;
            background: #ffbf49 0 -2300px !important;
            border: 0.4px solid white !important
        }

        .RadGrid_Default td {
            border: 1px solid white !important;
            text-align: left;
        }

        .RadGrid_Default {
            -webkit-box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
            -moz-box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
            box-shadow: 2px 2px 16px 0px rgba(0,0,0,0.58);
        }

        #lbl_Deparament_Name {
            /*width: 1400px;*/
            margin: 0 auto;
            display: -webkit-box;
            font-family: lato;
            text-transform: uppercase;
        }

        .principal {
            background: #c23749;
            font-size: 20pt;
            color: white;
            width:100%;
        }

        span.principal {
            color: #ffffff;
            font-size: 25px;
            margin-left: 5px;
            text-transform: uppercase;
        }

        body {
            margin: 0;
        }

        .rgCommandRow {
            display: none;
        }


        .RadGrid_Default .rgMasterTable, .RadGrid_Default .rgDetailTable, .RadGrid_Default .rgGroupPanel table, .RadGrid_Default .rgCommandRow table, .RadGrid_Default .rgEditForm table, .RadGrid_Default .rgPager table {
            font-family: "Segoe UI",Arial,Helvetica,sans-serif;
            font-size: 11px !important;
            line-height: 11px !important;
        }

        .RadGrid .rgFilterRow>td {
            padding-top: 3px;
            padding-bottom: 3px;
        }

        th.rgHeader.grid_header {
            box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
        }

        .RadGrid .rgHeader, .RadGrid th.rgResizeCol {
            padding-top: 2px!important;
            padding-bottom: 2px!important;
            text-align: left;
            margin-left: 0px;
            font-weight: normal;
            padding-left: 2px!important;
            padding-right: 2px!important;
            line-height: 20px!important;
        }
        .RadGrid_Default .rgHeader a {
            color: #333;
            box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33)!important;
            display: block;
            width: 100%;
            padding-left: 5px!important;
            margin-left: 0px!important;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="~/js/printThis.js" />
                <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/html2canvas.js" />

                <asp:ScriptReference Path="~/js/OrganigramaDepartamentExport.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="onRequestStart"></telerik:RadAjaxManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <table class="principal">
                    <tbody>
                        <tr>
                            <td style="width: 400px;"></td>

                            <td align="center">
                                <div id="lRaportSuplimentareDepartament" class="principal">
                                    <asp:Label runat="server" ID="lbl_Deparament_Name"></asp:Label>
                                </div>
                            </td>

                            <td style="width: 400px;">
                                <div id="up" style="display: none; font-size: 20px; left: 14%; position: absolute; top: 70px;" role="status" aria-hidden="true">
                                    <img src="../../Images/Image/loading.gif" alt="Loading ...">
                                    Loading ...
                                </div>
                            </td>

                            <td style="width: 50px;">
                                <img class="top-icons" id="btn_excel" onclick="printExcel();" src="../../Images/icons/icon-excel.png" alt="Export to Excel">
                            </td>
                            <td style="width: 50px;">
                                <img class="top-icons" id="btn_pdf" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF"></td>
                            <td style="width: 50px;">
                                <img class="top-icons" id="btn_print" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print"></td>
                        </tr>
                    </tbody>
                </table>

                <div style="float: left;">
                <form name="myForm">
                    <asp:label runat="server" id="txt_loaded" style="margin-left:5px; margin-right:30px"></asp:label>

                    <input type="radio" onclick="radio1()" name="myRadios" value="radio_generale" id="radio_elenco"  checked="checked">
                    <label for="radio_elenco" class="radio-inline">Elenco</label>
                    <input type="radio" onclick="radio2()" name="myRadios" value="radio_maternita" id="radio_organigrammi" >
                    <label for="radio_organigrammi" class="radio-inline">Organigrammi</label>
                </form>
                    </div>
                <br />
                <br />
                <telerik:RadGrid runat="server" ID="RadGrid1" AllowFilteringByColumn="True" AllowSorting="true" Style="float: left; margin: 0px 60px auto;" AutoGenerateColumns="false" ClientSettings-Scrolling-AllowScroll="true" ClientSettings-Scrolling-ScrollHeight="600" Width="1444px" HeaderStyle-CssClass="grid_header">
                    <ClientSettings EnableRowHoverStyle="false" EnableClientPrint="true" Virtualization-EnableVirtualization="false">
                        <Scrolling AllowScroll="True" UseStaticHeaders="true" EnableColumnClientFreeze="true" SaveScrollPosition="true" />
                    </ClientSettings>

                    <SortingSettings SortedBackColor="#FFF6D6" EnableSkinSortStyles="false"></SortingSettings>

                    <MasterTableView AutoGenerateColumns="false" CommandItemDisplay="Top" CommandItemSettings-ShowExportToCsvButton="true" TableLayout="Auto" HierarchyLoadMode="Client">
                        <Columns>

                            <telerik:GridBoundColumn DataField="IDs" AllowFiltering="false" HeaderStyle-Width="20px" FilterControlAltText="Filter Ids column" HeaderText="N°:" SortExpression="IDs" UniqueName="IDs">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Nome" HeaderStyle-Width="150px" AllowFiltering="false" FilterControlAltText="Filter Nome column" HeaderText="Nome:" SortExpression="Nome" UniqueName="Nome">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Cognome" AllowSorting="true" HeaderStyle-Width="150px" AllowFiltering="false" FilterControlAltText="Filter Prenume column" HeaderText="Cognome:" SortExpression="Cognome" UniqueName="Cognome">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Data Nascita" AllowFiltering="false" HeaderStyle-Width="100px" FilterControlAltText="Filter Data Nascita column" HeaderText="Data Nascita:" SortExpression="Data Nascita" UniqueName="DataNascita">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Mansione" HeaderStyle-Width="150px" ItemStyle-CssClass="MansioneClass"
                                FilterControlAltText="Filter Mansione column" HeaderText="Mansione:"
                                SortExpression="Mansione" UniqueName="Mansione">
                                <FilterTemplate>
                                    <telerik:RadComboBox runat="server" ID="cmbMansione" CssClass="cmb_mansione"
                                        DataTextField="Mansione" DataValueField="Mansione"
                                        OnDataBinding="cmbProductName_DataBinding_Mansione" OnDataBound="ComboMansione_DataBound"
                                        OnClientSelectedIndexChanged="applySearch"
                                        Style="width: 100%;">
                                    </telerik:RadComboBox>
                                </FilterTemplate>
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Linea" HeaderStyle-Width="150px" AllowSorting="true"
                                FilterControlAltText="Filter Linea column" HeaderText="Linea:" ItemStyle-CssClass="LineaClass"
                                SortExpression="Linea" UniqueName="Linea">
                                <FilterTemplate>
                                    <telerik:RadComboBox runat="server" ID="cmbLinea" CssClass="cmb_linea"
                                        DataTextField="Linea" DataValueField="Linea"
                                        OnDataBinding="cmbProductName_DataBinding_Linea" OnDataBound="ComboLinea_DataBound" OnClientSelectedIndexChanged="applySearch">
                                    </telerik:RadComboBox>
                                </FilterTemplate>
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Note" AllowSorting="true" HeaderStyle-Width="100px" AllowFiltering="false" FilterControlAltText="Filter Note column" HeaderText="Note:" SortExpression="Note" UniqueName="Note">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>

                    <ExportSettings UseItemStyles="true" FileName="Organigramma">
                    </ExportSettings>

                </telerik:RadGrid>

                <iframe id="iframee" frameBorder="0" src="#" width="1550" height="700" style="display:none;" name="printf"></iframe>

                <asp:label runat="server" ID="link" style="display:none;" />

            <telerik:RadScriptBlock runat="server" ID="sds">
            <script type="text/javascript"> 

                var filter1 = "Select a Mansione";
                var filter2 = "Select a Linea";
                
                loadIframe($('#iframee'), $('#link').text());

                $(".rgRow").each(function (index, element) {
                    $(this).addClass('prred');
                });

                $(".rgAltRow").each(function (index, element) {
                    $(this).addClass('prred');
                });

                function applySearch() {
                    filter1 = $(".cmb_mansione").val();
                    filter2 = $(".cmb_linea").val();
                    $(".rgRow").show();
                    $(".rgAltRow").show();

                    $(".rgRow").each(checkRow);
                    $(".rgAltRow").each(checkRow);

                      $(".prred:visible").each(function(index, element){
                          $(this).find('td').first().html(index + 1);

                          if (index % 2 === 0) { 
                              $(this).removeClass('rgAltRow');
                              $(this).addClass('rgRow');
                          }
                          else {
                               $(this).removeClass('rgRow');
                              $(this).addClass('rgAltRow');
                          }
                      });
                };

                function checkRow() {
                    var isFirstMatch = (filter1 === "Select a Mansione" || filter1 === $(this).find('.MansioneClass').first().html());
                    var isSecondMatch = (filter2 === "Select a Linea" || filter2 === $(this).find('.LineaClass').first().html());
                    
                    if (!(isFirstMatch && isSecondMatch)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                };
                
                function radio1() {
                    document.getElementById('radio_organigrammi').removeAttribute('checked');
                    document.getElementById('radio_elenco').setAttribute('checked', 'checked');

                    document.getElementById('btn_excel').setAttribute("onClick", "printExcel()");
                    document.getElementById('btn_pdf').setAttribute("onClick", "printPDF()");
                    document.getElementById('btn_print').setAttribute("onClick", "printData()");

                    $('#btn_excel').show();
                    $('#btn_pdf').show();
                    $('#btn_print').show();

                    $('#RadGrid1').show();
                     $('#iframee').hide();
                };

                function radio2() {
                    document.getElementById('radio_elenco').removeAttribute('checked');
                    document.getElementById('radio_organigrammi').setAttribute('checked', 'checked');

                    document.getElementById('btn_excel').setAttribute("onClick", "printExcel2()");
                    document.getElementById('btn_pdf').setAttribute("onClick", "printPDF2()");
                    document.getElementById('btn_print').setAttribute("onClick", "printData2()");

                    $('#btn_excel').hide();
                    $('#btn_pdf').hide();
                    $('#btn_print').show();
                    $('#RadGrid1').hide();

                    $('#iframee').show();
                    $("#iframee").contents().find("#tOrganigramaDepartament").wrapInner('<span></span>');
                };

                function loadIframe(iframeName, url) {
                    var $iframe = $(iframeName);

                    if ( $iframe.length ) {
                        $iframe.attr('src',url);   
                        return false;
                    }
                    return true;
                };

            </script>
        </telerik:RadScriptBlock>

                    </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
