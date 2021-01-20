<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-timbrature.aspx.vb" Inherits="form_timbrature_new" %>

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
        .results tr[visible='false'], .no-result {
            display: none;
        }
        .results tr[visible='true'] {
            display: table-row;
        }

        body{
            height:750px;
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
            height:10px;
        }
        .RadGrid_Default .rgHeader {
            color: #333;
            font-weight: 600;
            letter-spacing: 0.3px;
        }

        .rgHeader{
            font-weight:600!important;
        }

        .rgRow, .rgAltRow{
            height:10px!important;
        }

        .anchor {
            display: inline;
            font-size: 12pt;
            box-shadow: 1px 1px 2px 0px #949494;
            padding: 3px;
            text-decoration: none;
            line-height: 30px;
        }
        .anchor:hover {
            text-decoration: none;
        }
     </style>
        <link rel="stylesheet" href="../../css/form-timbrature.css" />
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="../../css/PrintTimbrature.css" media="print"/>
    <link rel="stylesheet" type="text/css" href="../../css/mobile/HR/timbrature.css" />
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
                <br />
                <br />
                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                    <script type="text/javascript"> 
                        function OnDateSelected(sender, eventArgs) {
                            var date1 = sender.get_selectedDate();
                            date1.setDate(date1.getDate() + 31);
                            var datepicker = $find("<%= RadDatePicker2.ClientID %>");
                            datepicker.set_maxDate(date1);
                        }
                    </script>
 
                </telerik:RadScriptBlock>
                    <telerik:RadFormDecorator RenderMode="Lightweight" runat="server" DecorationZoneID="containerDiv"></telerik:RadFormDecorator>
                    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
 
                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="ConfigurationPanel1">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="containerDiv" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="ConfigurationPanel1"></telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                    <div class="demo-container size-thin container-fluid" runat="server" id="containerDiv">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-2">
                                <telerik:RadDatePicker RenderMode="Lightweight" DateInput-DateFormat="dd/MM/yyyy" ID="RadDatePicker1" Width="90%" ClientEvents-OnDateSelected="OnDateSelected" runat="server" DateInput-Label="From Date">
                                <DateInput runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                </telerik:RadDatePicker>
                            </div>
                            <div class="col-lg-2">
                                    <telerik:RadDatePicker RenderMode="Lightweight" DateInput-DateFormat="dd/MM/yyyy"  ID="RadDatePicker2" CssClass="toDate" Width="90%" runat="server" DateInput-Label="To Date">
                                                   <DateInput runat="server" DateFormat="dd/MM/yyyy"></DateInput>
                                        </telerik:RadDatePicker>
                            </div>
                            <div class="col-md-2">
                                <telerik:RadButton RenderMode="Lightweight" ID="btnLoad" runat="server" Text="Load" Width="90px"></telerik:RadButton>
                                <asp:Button runat="server" Text="Print" OnClientClick="printData();" />
                            </div> 
                            <div class="col-md-2">
                                <a href="#" id="btn_show_inactive" class="anchor">Show - Late View</a>
                                <a href="#" id="btn_show_default" class="anchor" style="display:none;">Show - Default View</a>
                            </div>
                            <div class="col-lg-3">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        Loading Data... 
                                        <img src="../../css/resources/Images/img/gifLoading.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </div>
                    </div>
                    <hr class="demo-separator" />
                </div>
                    <div class="container-fluid" id="scallableDiv">
                    <telerik:RadGrid ID="RadGrid1" style="overflow: auto;max-width:1560px;" CssClass="rGrid"  ExportSettings-IgnorePaging="true" autos AllowMultiRowSelection="true"   runat="server" RenderMode="Lightweight"  ShowGroupPanel="True" GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="false" AllowPaging="True" PageSize="500"  OnRowDataBound="RadGrid1_DataBound" >
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowDragToGroup="true" AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                            <Selecting AllowRowSelect="True" />
                            <Scrolling AllowScroll="True" ScrollHeight="500px" UseStaticHeaders="True" />
                        </ClientSettings>

                         <MasterTableView AutoGenerateColumns="false" AllowFilteringByColumn="True" ShowFooter="True" >


                              <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <SelectFields>
                            <telerik:GridGroupByField FieldAlias="Departament" FieldName="Departament" FormatString="{0:D}"
                               ></telerik:GridGroupByField>
                        </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="Departament" SortOrder="Ascending"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
                                  </GroupByExpressions>


                    <Columns>

                        <telerik:GridDateTimeColumn DataField="Date" HeaderText="Date:" FilterControlWidth="110px"
                            SortExpression="OrderDate" PickerType="DatePicker" EnableTimeIndependentFiltering="true"
                            DataFormatString="{0:dd/MM/yyyy}">
                        </telerik:GridDateTimeColumn>


                        <telerik:GridBoundColumn FilterControlWidth="60px" DataField="IdRnum" HeaderText="R-CODE:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlWidth="180px" DataField="FullName"  HeaderText="NOME E COGNOME:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                         <telerik:GridBoundColumn FilterControlWidth="100px" DataField="Departament" HeaderText="REPARTO:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlWidth="180px" DataField="Mansione" HeaderText="MANSIONE:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" 
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn FilterControlWidth="80px" DataField="Linie" HeaderText="LINEA:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn FilterControlWidth="120px" DataField="Time" HeaderText="TIME:"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" AllowFiltering="false"
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>

                      <telerik:GridBoundColumn FilterControlWidth="120px" DataField="IO" HeaderText="STATUS:" AllowFiltering="false"
                            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                            ShowFilterIcon="false">
                        </telerik:GridBoundColumn>
                        
                        <telerik:GridBoundColumn FilterControlWidth="120px" UniqueName="IsLate"  DataField="IsLate" HeaderText="IsLate:" AllowFiltering="false"
                                                 AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                                 ShowFilterIcon="false">
                        </telerik:GridBoundColumn>
                        
                        <%--<telerik:GridBoundColumn FilterControlWidth="120px" UniqueName="isPausaAndLate"  DataField="IsPausaAndLate" HeaderText="IsPausaAndLate:" AllowFiltering="false"
                                                 AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                                                 ShowFilterIcon="false">
                        </telerik:GridBoundColumn>--%>
                       
                    </Columns>
                </MasterTableView>


                    </telerik:RadGrid>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WbmOlimpiasConnectionString %>" SelectCommand="TimbratureSelectByDate" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadDatePicker1" DbType="Date" Name="startTime" PropertyName="SelectedDate" />
                            <asp:ControlParameter ControlID="RadDatePicker2" DbType="Date" Name="stopTime" PropertyName="SelectedDate" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
  

                    <script src="../../js/jquery-1.12.4.min.js"></script>
                     <script src="../../js/bootstrap.min.js"></script>
                <script src="../../js/printThis.js"></script>


                <script type="text/javascript">

                    //rgMasterTable 
                    $(function () { 
                        $('.rgMasterTable > tbody  > tr').each(function() {
                             
                            if ($(this).find('td').eq(9).text() == '1' || $(this).find('td').eq(10).text() == '5') {
                                $(this).find('td').eq(7).css('color', 'red'); 
                                $(this).find('td').eq(7).closest('tr').addClass('tr_inactive');
                            } 
                        });
                         

                        $('#btn_show_inactive').click(function () {
                            $('#btn_show_inactive').hide();
                            $('#btn_show_default').show();

                            $('.rgMasterTable > tbody  > tr').each(function () {
                                $(this).hide();
                                $('.rgGroupHeader').show();
                                $('.tr_inactive').show();
                            });
                        });
                        $('#btn_show_default').click(function () {
                            $('#btn_show_inactive').show();
                            $('#btn_show_default').hide();

                            $('.rgMasterTable > tbody  > tr').each(function () {
                                $(this).show(); 
                            });
                        });




                        var parameter = Sys.WebForms.PageRequestManager.getInstance();

                        parameter.add_endRequest(function () { 
                            $('.rgMasterTable > tbody  > tr').each(function () {

                                if ($(this).find('td').eq(9).text() == '1' || $(this).find('td').eq(10).text() == '5') {
                                    $(this).find('td').eq(7).css('color', 'red');
                                    $(this).find('td').eq(7).closest('tr').addClass('tr_inactive');
                                }
                            });



                            $('#btn_show_inactive').click(function () {
                                $('#btn_show_inactive').hide();
                                $('#btn_show_default').show();

                                $('.rgMasterTable > tbody  > tr').each(function () {
                                    $(this).hide();
                                    $('.rgGroupHeader').show();
                                    $('.tr_inactive').show();
                                });
                            });
                            $('#btn_show_default').click(function () {
                                $('#btn_show_inactive').show();
                                $('#btn_show_default').hide();

                                $('.rgMasterTable > tbody  > tr').each(function () {
                                    $(this).show();
                                });
                            });
                        });

                    });

                        function printData() {

                            $('#RadGrid1_ctl00').printThis({
                                pageTitle: "Timbrature",
                                importCSS: true,
                                ImportStyle: true,
                                copyTagClasses: true,
                                    header: "<h1>Timbrature</h1>",
                                loadCSS: "../../css/PrintTimbrature.css"

                            });
                    }


                </script>
             </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
