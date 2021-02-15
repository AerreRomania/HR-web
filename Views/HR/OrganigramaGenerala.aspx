<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="OrganigramaGenerala.aspx.cs" Inherits="OrganigramaGenerala" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="hRaportAbsenteLuna" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
    <title>Organigramii</title>
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/height.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .RadComboBox_Default .rcbReadOnly .rcbInput {
            color: #333;
            text-align: center;
        }

        body {
            height: 1500px;
            overflow-y:auto;

        }

        .RadComboBoxDropDown .rcbList > li {
            font-size: 11px;
            font-weight: 600;
        }

      

        .rgFilterRow td {
            border: 0px solid white !important;
        }


          #btn_close {
            float: right;
            right: 20px;
            position: fixed;
            top: 50px;
            font-weight: 800;
            font-size: 11pt;
            cursor: pointer;
            z-index: 9999999;
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
            text-align: center !important;
            text-transform: uppercase;
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

        iframe {
            position: fixed;
            background: #000;
            border: none;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .principal {
            height: 50px;
            background: #c23749;
            font-size: 20pt;
            color: white;
        }

        .rgCommandRow{display:none;}

        
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
            padding-left: 0px!important;
            margin-left: 0px!important;
        }

                /*.google-visualization-tooltip { z-index:+1; margin-top:-180px;margin-left:40px;}*/ 

    </style>
</head>
<body>
    <form id="fRaportAbsenteLuna" runat="server" method="post" enctype="multipart/form-data" target="upload_target">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableTheming="True">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />

                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="~/js/printThis.js" />
                <asp:ScriptReference Path="~/js/jspdf.min.js" />
                <asp:ScriptReference Path="~/js/html2canvas.js" />

                <asp:ScriptReference Path="~/js/OrganigramaDepartamentExport.js" />
                <asp:ScriptReference Path="https://www.google.com/jsapi" />

            </Scripts>
        </telerik:RadScriptManager>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <table id="tbl_grid" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td class="principal">
                            <table width="100%">
                                <tr>
                                    <td style="width: 40px;">
                                        <asp:HyperLink ID="hlPersonal" runat="server" CssClass="meniuMain" NavigateUrl="Personal.aspx">&lt;Main&gt;</asp:HyperLink>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lOrganigrama" runat="server" CssClass="principal" Text="Organigramma Generale"></asp:Label>
                                    </td>
                            <td style="width: 50px;"
                                <img class="top-icons" onclick="printDataGenerale();" src="../../Images/icons/icon-print.png" alt="Print" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" style="display:none;" onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF" /></td>
                            <td style="width: 50px;">
                                <img class="top-icons" style="display:none;" onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print" /></td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><h3 style="margin-left:30px;" runat="server" id="lbl_LastDate"></h3></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Table ID="tOrganigrama" runat="server"></asp:Table>
                        </td>
                    </tr>
                </table>

                <div id="shade" style="display: none;">
                    <asp:UpdateProgress ID="up" runat="server">
                        <ProgressTemplate>
                            <span style="font-size: 20px; left: 14%; position: absolute; top: 18px; color: white; z-index: 9999999999;">Loading data. Please Wait...
                            </span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>

                    <span id="btn_close">CLOSE</span>
                    <%--<iframe src="./RaportNumarAngajati.aspx" id="shade_generale" style="display: none;"></iframe>--%>

                    <table class="principal">
                        <tbody>
                            <tr>
                                <td style="width: 200px;"></td>

                                <td align="center">
                                    <span id="lRaportSuplimentareDepartament" class="principal">
                                        <asp:Label runat="server" ID="lbl_Deparament_Name"></asp:Label></span>
                                </td>

                                <td style="width: 200px;">
                                    <div id="up" style="display: none; font-size: 20px; left: 14%; position: absolute; top: 70px;" role="status" aria-hidden="true">
                                        <img src="../../Images/Image/loading.gif" alt="Loading ...">
                                        Loading ...</div>
                                </td>

                                <td style="width: 50px;">
                                    <img class="top-icons"  onclick="printExcel();" src="../../Images/icons/icon-excel.png" alt="Export to Excel">
                                </td>

                                <td style="width: 50px;">
                                    <img class="top-icons"  onclick="printPDF();" src="../../Images/icons/icon-pdf.png" alt="Export to PDF"></td>
                                <td style="width: 50px;">
                                    <img class="top-icons"  onclick="printData();" src="../../Images/icons/icon-print.png" alt="Print"></td>
                            </tr>
                        </tbody>
                    </table>
                    <br />

                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" ClientEvents-OnRequestStart="onRequestStart"></telerik:RadAjaxManager>

                <telerik:RadGrid runat="server" ID="RadGrid1" AllowFilteringByColumn="True" AllowSorting="true" align="center" Style=" margin: 0px 60px auto;" AutoGenerateColumns="false" ClientSettings-Scrolling-AllowScroll="true" ClientSettings-Scrolling-ScrollHeight="700" Width="1223px" HeaderStyle-CssClass="grid_header">
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

                            <telerik:GridBoundColumn DataField="Data Nascita" AllowFiltering="false" HeaderStyle-Width="100px" FilterControlAltText="Filter Data Nascita column" HeaderText="Data di Assunzione:" SortExpression="Data Nascita" UniqueName="DataNascita">
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
                            <telerik:GridBoundColumn DataField="Note" AllowSorting="false" HeaderStyle-Width="100px" AllowFiltering="false" FilterControlAltText="Filter Note column" HeaderText="Note:" SortExpression="Note" UniqueName="Note">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>

                    <ExportSettings UseItemStyles="true" FileName="Organigramma">
                    </ExportSettings>

                </telerik:RadGrid>
                </div>

                <table align="center" id="charts">
                    <tr>
                        <td>
                            <div style="width:800px;height:400px;margin-right:-130px; "  id="chart-percentuale"></div>
                        </td>
                        <td>
                            <div style="width:800px;height:400px;margin-left:-60px; " id="chart-persone"></div>
                        </td>
                    </tr>
                </table>

                <asp:Button ID="load_grid" OnClick="load_grid_Click" runat="server" Text="test" Style="display: none;" />
                <asp:HiddenField runat="server" ID="lbl_selected_dep" />
                <asp:HiddenField runat="server" ID="lbl_mansione" />

                <script type="text/javascript">
                    Sys.Application.add_load(function () {
                       
                        $("#btn_close").click(function () {
                            $("#shade").hide();
                            $("#tbl_grid").show();
                        });

                        $(".TESSITURA").click(function () {
                            $("#shade").show();
                            $("#tbl_grid").hide();
                            $('#<%=lbl_selected_dep.ClientID%>').attr('value', '3');
                            $("#load_grid").click();
                            $("#RadGrid1").show();

                        });

                        $(".STIRO").click(function () {
                            $("#shade").show();
                            $("#tbl_grid").hide();
                            $('#<%=lbl_selected_dep.ClientID%>').attr('value', '1');
                            $("#load_grid").click();
                            $("#RadGrid1").show();

                        });

                        $(".AMMINISTRAZIONE").click(function () {
                            $("#shade").show();
                            $("#tbl_grid").hide();
                            $('#<%=lbl_selected_dep.ClientID%>').attr('value', '5');
                            $("#load_grid").click();
                            $("#RadGrid1").show();

                        });

                        $(".CONFEZIONEA").click(function () {
                            $("#shade").show();
                            $("#tbl_grid").hide();
                            $('#<%=lbl_selected_dep.ClientID%>').attr('value', '2');
                            $("#load_grid").click();
                            $("#RadGrid1").show();

                        });

                        $(".CONFEZIONEB").click(function () {
                            $("#shade").show();
                            $("#tbl_grid").hide();
                            $('#<%=lbl_selected_dep.ClientID%>').attr('value', '14');
                            $("#load_grid").click();
                            $("#RadGrid1").show();
                        });

                        $(".GENERALE").click(function () {
                            $("#shade").show();
                            $("#RadGrid1").hide();
                            $("#shade_generale").show();
                        });

                        $("#btn_close_generale").click(function () {
                            $("#shade_generale").hide();
                            $("#shade").hide();
                            $("#tbl_grid").show();
                        });
                    });
                </script>
                <telerik:RadScriptBlock runat="server" ID="sds">
                <script type="text/javascript"> 

                var filter1 = "Select a Mansione";
                var filter2 = "Select a Linea";


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
            </script>

            <script type="text/javascript">
                $(document).ready(function () {





               $("#ddlFiltruAn").change(function () {
                   setTimeout(function(){
                       drawChartsPercentuale();
                       drawChartsPersons();
               }, 2000);
              });

               setTimeout(function(){
                   drawChartsPercentuale();
                   drawChartsPersons();
               }, 2000);
           
              });

      google.load("visualization", "1", {packages:["corechart"]});
            
      function drawChartsPercentuale() {
 

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Tessitura',  parseInt($(".TESSITURAClass td:nth-child(2)").text()) || 0],
          ['Stiro',  parseInt($(".STIROClass td:nth-child(2)").text()) || 0],
          ['Amministrazione',  parseInt( $(".AMMINISTRAZIONEClass td:nth-child(2)").text()) || 0],
          ['Confezione A', parseInt( $(".CONFEZIONEAClass td:nth-child(2)").text()) || 0],
          ['Confezione B',  parseInt( $(".CONFEZIONEBClass td:nth-child(2)").text()) || 0]
        ]);

        var options = {
            title: 'ORGANIGRAMMA - BY PERCENTUALE',
            pieSliceText: 'percentage',
            backgroundColor: '#f4f4f4'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart-percentuale'));

        chart.draw(data, options);
            }


    function drawChartsPersons() {
 

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Tessitura',  parseInt($(".TESSITURAClass td:nth-child(2)").text()) || 0],
          ['Stiro',  parseInt($(".STIROClass td:nth-child(2)").text()) || 0],
          ['Amministrazione',  parseInt( $(".AMMINISTRAZIONEClass td:nth-child(2)").text()) || 0],
          ['Confezione A', parseInt( $(".CONFEZIONEAClass td:nth-child(2)").text()) || 0],
          ['Confezione B',  parseInt( $(".CONFEZIONEBClass td:nth-child(2)").text()) || 0]
        ]);

        var options = {
            title: 'ORGANIGRAMMA - BY PERSONS',
            pieSliceText: 'value',
            backgroundColor: '#f4f4f4'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart-persone'));

        chart.draw(data, options);
      }
 
        </script>
                                        </telerik:RadScriptBlock>
            </ContentTemplate>
        </asp:UpdatePanel>
     
    </form>
</body>
</html>