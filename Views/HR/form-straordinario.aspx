<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form-straordinario.aspx.cs" Inherits="Views.HR.form_straordinario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <meta charset="utf-8" />
    <title>Straordinario Departament</title>
    <link rel="stylesheet" href="~/css/bootstrap.min.css" />
    <style>
        .greenme{
                background-color: #FFEB3B!important;
        }
        .grid_style{
            border:none;
            /*margin-bottom:5px;*/
        }
        .grid_style td{
            width:55px;
            display: inline-block;
            text-align:center;
            border:none;
            padding-left:5px;
            padding-right:5px;
            background: #eaeaea;
            border: 2px solid white;
            font-size: 9pt;
        }

        .pekitotal{
            width:55px;
            display: inline-block;
            text-align:center;
            border:none;
            padding-left:5px;
            padding-right:5px;
            background: #eaeaea;
            border: 2px solid white;
            background: #ffc107;
            font-size: 9pt;

        }

        .tblhead th{
            text-align: center!important;
            width: 100px;
            background: #ffc107;
            color: black;
            border: 2px solid white;
            text-transform: uppercase;
            font-size: 9pt;
        }

        .orandzade{
            background: #ffc107;
        }

        .orandzade td{
             border: 2px solid white;
             width:60px;
             text-align:center;
             font-size: 10pt;
        }

        .tblhead{
            background:#ffffff;
        }

        .btn_class{
            /*font-size: 14px;*/
            line-height: 16px;
            padding-top: 0px;
            margin-top: 0px;
            margin-bottom: 0px;
            letter-spacing: 0.5px;
            font-size: 9pt;
        }
        .bolded{
            font-weight:700;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
                <Scripts>
                    <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                    <asp:ScriptReference Path="~/js/bootstrap.min.js" />
                    <asp:ScriptReference Path="~/js/jsapi.js" />
                </Scripts>
        </asp:ScriptManager>
        <div class="container-fluid">
            <%-- Header --%>
            <div class="row">
                <div class="col-md-12" align="center">
                    <h2>STRAORDINARIO <asp:Label runat="server" ID="lblDepName"></asp:Label></h2>
                </div>
            </div>
            <%-- Year Picker --%>
            <div class="row">
                <span style="margin-left: 15px;">Select year:</span>
                <asp:DropDownList runat="server" ID="ddlYearPicker" CssClass="ddlyear" ToolTip="Select a year" onchange="yearchanged();" OnSelectedIndexChanged="Page_Load" AutoPostBack="true">
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                </asp:DropDownList>
                <input type="button" id="btn_add" class="btn_class" value="Add/Edit Values" />
            </div>
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="row" id="cruder" style="display:none;">
                        <div class="col-xs-3">
                            <span>Departament:</span>
                            <asp:DropDownList runat="server" ID="ddp_dep">
                                <asp:ListItem>TESSITURA</asp:ListItem>
                                <asp:ListItem>CONFEZIONE A</asp:ListItem>
                                <asp:ListItem>CONFEZIONE B</asp:ListItem>
                                <asp:ListItem>STIRO</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-xs-2">
                            <span>Status:</span>
                            <asp:DropDownList runat="server" ID="ddp_status">
                                <asp:ListItem>DIRETTI</asp:ListItem>
                                <asp:ListItem>INDIRETTI</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-xs-2">
                            <span>Year:</span>
                            <asp:DropDownList runat="server" ID="ddp_year">
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2019</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-xs-2">
                            <span>Month:</span>
                            <asp:DropDownList runat="server" ID="ddp_month">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-xs-2">
                            <span>Value:</span>
                            <asp:TextBox runat="server" ID="txt_value"></asp:TextBox>
                        </div>
                        <div class="col-xs-2">
                            <asp:Button runat="server" ID="btn_insert" Text="Add" OnClick="InsertData" />
                            <input type="button" value="Hide" id="btn_hide" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <div class="row">
                <asp:GridView runat="server" ID="grid_test"></asp:GridView>
            </div>
            <br />
            <%-- Body --%>
            <br />
            <div class="row" style="height:120px;">
                 <div class="col-sm-12" style="display: -webkit-box;">
                     <asp:table runat="server" CssClass="tblhead">
                         <asp:TableRow CssClass="orandzade"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="orandzade"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="orandzade"><asp:TableCell>INDIRETTI</asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="orandzade"><asp:TableCell>DIRETTI</asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="orandzade"><asp:TableCell>TOTALE</asp:TableCell></asp:TableRow>
                     </asp:table>
                        <asp:table runat="server" CssClass="tblhead" ID="tblJan" ToolTip="January">
                         <asp:TableHeaderRow><asp:TableHeaderCell>January <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_jan" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_jan"   CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_jan"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server" ID="tot_jan_val"></asp:Label></asp:TableCell></asp:TableRow>
                        </asp:table>
                       <asp:table runat="server" CssClass="tblhead" ID="tblFeb" ToolTip="February">
                         <asp:TableHeaderRow><asp:TableHeaderCell>February <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_feb" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_feb" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                        <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_feb"></asp:Label></asp:TableCell><asp:TableCell  CssClass="greenme"><asp:Label runat="server"  ID="tot_feb_val"></asp:Label></asp:TableCell></asp:TableRow>
                     </asp:table>
                        <asp:table runat="server" CssClass="tblhead" ID="tblMar" ToolTip="March">
                         <asp:TableHeaderRow><asp:TableHeaderCell>March <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_mar" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_mar" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_mar"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_mar_val"></asp:Label></asp:TableCell></asp:TableRow>
                     </asp:table>
                             <asp:table runat="server" CssClass="tblhead" ID="tblApr" ToolTip="Aprile">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Aprile <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_apr" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_apr" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_apr"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_apr_val"></asp:Label></asp:TableCell></asp:TableRow>
                    </asp:table>
                       <asp:table runat="server" CssClass="tblhead" ID="tblMay" ToolTip="May">
                         <asp:TableHeaderRow><asp:TableHeaderCell>May <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                        <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_may" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_may" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                        <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_may"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_may_val"></asp:Label></asp:TableCell></asp:TableRow>
                       </asp:table>
                         <asp:table runat="server" CssClass="tblhead" ID="tblJun" ToolTip="Jun">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Jun <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_jun" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_jun" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                          <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_jun"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_jun_val"></asp:Label></asp:TableCell></asp:TableRow>
                    </asp:table>
                           <asp:table runat="server" CssClass="tblhead" ID="tblJuly" ToolTip="July">
                         <asp:TableHeaderRow><asp:TableHeaderCell>July <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_jul" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_jul" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                          <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_jul"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_jul_val"></asp:Label></asp:TableCell></asp:TableRow>
                     </asp:table>
                     <asp:table runat="server" CssClass="tblhead" ID="tblAvg" ToolTip="Avgust">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Avgust <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_avg" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_avg" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_avg"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_avg_val"></asp:Label></asp:TableCell></asp:TableRow>
                     </asp:table>
                      <asp:table runat="server" CssClass="tblhead" ID="tblSep" ToolTip="September">
                         <asp:TableHeaderRow><asp:TableHeaderCell>September <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_sep" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_sep" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_sep"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_sep_val"></asp:Label></asp:TableCell></asp:TableRow>
                      </asp:table>
                      <asp:table runat="server" CssClass="tblhead" ID="tblOct" ToolTip="Octobre">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Octobre <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow ><asp:TableCell><asp:GridView runat="server" ID="grid_oct" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_oct" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                        <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_oct"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_oct_val"></asp:Label></asp:TableCell></asp:TableRow>
                      </asp:table>
                        <asp:table runat="server" CssClass="tblhead" ID="tblNov" ToolTip="Novembre">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Novembre <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_nov" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_nov" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_nov"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_nov_val"></asp:Label></asp:TableCell></asp:TableRow>
                        </asp:table>
                      <asp:table runat="server" CssClass="tblhead" ID="tblDec" ToolTip="Decembre">
                         <asp:TableHeaderRow><asp:TableHeaderCell>Decembre <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell><asp:GridView runat="server" ID="grid_dec" ShowHeader="false" OnRowDataBound="Dg_Source_RowDataBound_dec" CssClass="grid_style"></asp:GridView></asp:TableCell></asp:TableRow>
                         <asp:TableRow CssClass="grid_style"><asp:TableCell><asp:Label runat="server" ID="tot_dec"></asp:Label></asp:TableCell><asp:TableCell CssClass="greenme"><asp:Label runat="server"  ID="tot_dec_val"></asp:Label></asp:TableCell></asp:TableRow>
                      </asp:table>
                   
                     <asp:table runat="server" CssClass="tblhead" ID="Table1" ToolTip="Totale">
                         <asp:TableHeaderRow><asp:TableHeaderCell>TOTALE <span class="spn_selectedyear"></span></asp:TableHeaderCell></asp:TableHeaderRow>
                         <asp:TableRow><asp:TableCell CssClass="pekitotal">HOURS</asp:TableCell><asp:TableCell CssClass="pekitotal">VALUES</asp:TableCell></asp:TableRow>

                      <asp:TableRow CssClass="grid_style">
                          <asp:TableCell CssClass="pekitotal"><asp:Label runat="server" ID="lbl_tot_hour_indiretti">&nbsp;</asp:Label></asp:TableCell>
                          <asp:TableCell CssClass="pekitotal greenme"><asp:Label runat="server"  ID="lbl_tot_values_indiretti">&nbsp;</asp:Label></asp:TableCell>
                      </asp:TableRow>
                         
                       <asp:TableRow CssClass="grid_style">
                          <asp:TableCell CssClass="pekitotal"><asp:Label runat="server" ID="lbl_tot_hour_diretti">&nbsp;</asp:Label></asp:TableCell>
                          <asp:TableCell CssClass="pekitotal greenme"><asp:Label runat="server"  ID="lbl_tot_values_diretti">&nbsp;</asp:Label></asp:TableCell>
                      </asp:TableRow>
                            
                        <asp:TableRow CssClass="grid_style" style="margin-bottom:10px;">
                          <asp:TableCell CssClass="pekitotal"><asp:Label runat="server" ID="lbl_tot_hour_tot">&nbsp;</asp:Label></asp:TableCell>
                          <asp:TableCell CssClass="pekitotal greenme"><asp:Label runat="server"  ID="lbl_tot_values_tot">&nbsp;</asp:Label></asp:TableCell>
                      </asp:TableRow>
                      </asp:table>
                 </div>
            </div>
            <br />

            <%-- Bar Chart --%>
            <div class="col-xs-6">
                    <h4>Graphic by Hours</h4>
                    <div id="bar-chart"></div>
            </div>

            <div class="col-xs-6">
                <h4>Graphic by Values</h4>
                <div id="bar-values"></div>
            </div>
            <br />
        </div>

        <script type="text/javascript">
            $(function () {
                $('#tot_jan').css('font-weight', '600');
                $('#tot_mar').css('font-weight', '600');
                $('#tot_may').css('font-weight', '600');
                $('#tot_jul').css('font-weight', '600');
                $('#tot_sep').css('font-weight', '600');
                $('#tot_nov').css('font-weight', '600');
                $('#tot_feb').css('font-weight', '600');
                $('#tot_apr').css('font-weight', '600');
                $('#tot_jun').css('font-weight', '600');
                $('#tot_avg').css('font-weight', '600');
                $('#tot_oct').css('font-weight', '600');
                $('#tot_dec').css('font-weight', '600');
                $('#tot_jan_val').css('font-weight', '600');
                $('#tot_mar_val').css('font-weight', '600');
                $('#tot_may_val').css('font-weight', '600');
                $('#tot_jul_val').css('font-weight', '600');
                $('#tot_sep_val').css('font-weight', '600');
                $('#tot_nov_val').css('font-weight', '600');
                $('#tot_feb_val').css('font-weight', '600');
                $('#tot_apr_val').css('font-weight', '600');
                $('#tot_jun_val').css('font-weight', '600');
                $('#tot_avg_val').css('font-weight', '600');
                $('#tot_oct_val').css('font-weight', '600');
                $('#tot_dec_val').css('font-weight', '600');
                $('#lbl_tot_hour_tot').css('font-weight', '600');
                $('#lbl_tot_values_tot').css('font-weight', '600');

                setTimeout(calculatetotals, 30);

                $('.spn_selectedyear').text($('.ddlyear').val());
                 $("#btn_add").click(function(){
                     $("#cruder").show();
                }); 
                 $("#btn_hide").click(function(){
                     $("#cruder").hide();
                 }); 

                $('.grid_style > tbody').prepend('<tr><td style="border: 2px solid white;background:#ffc107!important;">HOURS</td><td style="border: 2px solid white;background:#ffc107!important;">VALUES</td></tr>');
                
            })

            function yearchanged() {
                $('.spn_selectedyear').text($('.ddlyear').val());
                setTimeout(setToDefault(), 10);
                setTimeout(drawCharts(), 20);
                setTimeout(calculatetotals, 30);
            }

            function setToDefault() {
                $('.grid_style').find('td').each(function () {
                    $(this).text(' ');
                });  

            }

            function calculatetotals() {

                var diretti_hours =
                    (parseFloat($('#grid_jan tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_feb tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_may tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_jun tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_mar tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_apr tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_jul tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_avg tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_sep tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_oct tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_nov tbody tr:nth-child(3) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_dec tbody tr:nth-child(3) td:nth-child(1)').text()) || 0);
                     $('#lbl_tot_hour_diretti').text(diretti_hours); 

                var indiretti_hours = 
                    (parseFloat($('#grid_jan tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_feb tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_may tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_jun tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_mar tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_apr tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_jul tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_avg tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_sep tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_oct tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) +
                    (parseFloat($('#grid_nov tbody tr:nth-child(2) td:nth-child(1)').text()) || 0) + (parseFloat($('#grid_dec tbody tr:nth-child(2) td:nth-child(1)').text()) || 0);
                    $('#lbl_tot_hour_indiretti').text(indiretti_hours); 

                var direti_values = 
                    (parseFloat($('#grid_jan tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_feb tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_may tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_jun tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_mar tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_apr tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_jul tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_avg tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_sep tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_oct tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_nov tbody tr:nth-child(3) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_dec tbody tr:nth-child(3) td:nth-child(2)').text()) || 0);
                    $('#lbl_tot_values_diretti').text(direti_values); 

                var indiretti_values =
                    (parseFloat($('#grid_jan tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_feb tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_may tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_jun tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_mar tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_apr tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_jul tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_avg tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_sep tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_oct tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) +
                    (parseFloat($('#grid_nov tbody tr:nth-child(2) td:nth-child(2)').text()) || 0) + (parseFloat($('#grid_dec tbody tr:nth-child(2) td:nth-child(2)').text()) || 0);
                    $('#lbl_tot_values_indiretti').text(indiretti_values); 

                var totale_hours = 
                    (parseFloat($('#tot_jan').text()) || 0) + (parseFloat($('#tot_feb').text()) || 0) +
                    (parseFloat($('#tot_mar').text()) || 0) + (parseFloat($('#tot_apr').text()) || 0) +
                    (parseFloat($('#tot_may').text()) || 0) + (parseFloat($('#tot_jun').text()) || 0) +
                    (parseFloat($('#tot_jul').text()) || 0) + (parseFloat($('#tot_avg').text()) || 0) +
                    (parseFloat($('#tot_sep').text()) || 0) + (parseFloat($('#tot_oct').text()) || 0) +
                    (parseFloat($('#tot_nov').text()) || 0) + (parseFloat($('#tot_dec').text()) || 0);
                    $('#lbl_tot_hour_tot').text(totale_hours); 

                var totale_values =
                    (parseFloat($('#tot_jan_val').text()) || 0) + (parseFloat($('#tot_feb_val').text()) || 0) +
                    (parseFloat($('#tot_mar_val').text()) || 0) + (parseFloat($('#tot_apr_val').text()) || 0) +
                    (parseFloat($('#tot_may_val').text()) || 0) + (parseFloat($('#tot_jun_val').text()) || 0) +
                    (parseFloat($('#tot_jul_val').text()) || 0) + (parseFloat($('#tot_avg_val').text()) || 0) +
                    (parseFloat($('#tot_sep_val').text()) || 0) + (parseFloat($('#tot_oct_val').text()) || 0) +
                    (parseFloat($('#tot_nov_val').text()) || 0) + (parseFloat($('#tot_dec_val').text()) || 0);
                $('#lbl_tot_values_tot').text(totale_values); 

                if ($('#tot_jan_val').html() !== '&nbsp;') {
                    $('#tot_jan_val').append(' €');
                }

                if ($('#tot_feb_val').html() !== '&nbsp;') {
                    $('#tot_feb_val').append(' €');
                }

                if ($('#tot_mar_val').html() !== '&nbsp;') {
                    $('#tot_mar_val').append(' €');
                }

                if ($('#tot_apr_val').html() !== '&nbsp;') {
                    $('#tot_apr_val').append(' €');
                }

                if ($('#tot_may_val').html() !== '&nbsp;') {
                    $('#tot_may_val').append(' €');
                }

                if ($('#tot_jun_val').html() !== '&nbsp;') {
                    $('#tot_jun_val').append(' €');
                }

                if ($('#tot_jul_val').html() !== '&nbsp;') {
                    $('#tot_jul_val').append(' €');
                }

                if ($('#tot_avg_val').html() !== '&nbsp;') {
                    $('#tot_avg_val').append(' €');
                }

                if ($('#tot_sep_val').html() !== '&nbsp;') {
                    $('#tot_sep_val').append(' €');
                }

                if ($('#tot_oct_val').html() !== '&nbsp;') {
                    $('#tot_oct_val').append(' €');
                }

                if ($('#tot_nov_val').html() !== '&nbsp;') {
                    $('#tot_nov_val').append(' €');
                }
                                
                if ($('#tot_dec_val').html() !== '&nbsp;') {
                    $('#tot_dec_val').append(' €');
                }

                if ($('#lbl_tot_values_indiretti').html() !== '&nbsp;') {
                    $('#lbl_tot_values_indiretti').append(' €');
                }

                if ($('#lbl_tot_values_diretti').html() !== '&nbsp;') {
                    $('#lbl_tot_values_diretti').append(' €');
                }

                if ($('#lbl_tot_values_tot').html() !== '&nbsp;') {
                    $('#lbl_tot_values_tot').append(' €');
                }
                
                $('#tot_jan').css('font-weight', '600');
                $('#tot_mar').css('font-weight', '600');
                $('#tot_may').css('font-weight', '600');
                $('#tot_jul').css('font-weight', '600');
                $('#tot_sep').css('font-weight', '600');
                $('#tot_nov').css('font-weight', '600');
                $('#tot_feb').css('font-weight', '600');
                $('#tot_apr').css('font-weight', '600');
                $('#tot_jun').css('font-weight', '600');
                $('#tot_avg').css('font-weight', '600');
                $('#tot_oct').css('font-weight', '600');
                $('#tot_dec').css('font-weight', '600');
                $('#tot_jan_val').css('font-weight', '600');
                $('#tot_mar_val').css('font-weight', '600');
                $('#tot_may_val').css('font-weight', '600');
                $('#tot_jul_val').css('font-weight', '600');
                $('#tot_sep_val').css('font-weight', '600');
                $('#tot_nov_val').css('font-weight', '600');
                $('#tot_feb_val').css('font-weight', '600');
                $('#tot_apr_val').css('font-weight', '600');
                $('#tot_jun_val').css('font-weight', '600');
                $('#tot_avg_val').css('font-weight', '600');
                $('#tot_oct_val').css('font-weight', '600');
                $('#tot_dec_val').css('font-weight', '600');
                $('#lbl_tot_hour_tot').css('font-weight', '600');
                $('#lbl_tot_values_tot').css('font-weight', '600');
            }
            
    google.load("visualization", "1", {packages:["corechart"]});

    function drawCharts() {
      var barData = google.visualization.arrayToDataTable([
            ['Months', 'Diretti', 'Indiretti', 'Totale Hours'],
            ['January', parseFloat($('#grid_jan tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_jan tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_jan').text()) || 0],
            ['February', parseFloat($('#grid_feb tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_feb tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_feb').text()) || 0],
            ['March', parseFloat($('#grid_mar tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_mar tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_mar').text()) || 0],
            ['Aprile', parseFloat($('#grid_apr tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_apr tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_apr').text()) || 0],
            ['May', parseFloat($('#grid_may tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_may tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_may').text()) || 0],
            ['Jun', parseFloat($('#grid_jun tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_jun tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_jun').text()) || 0],
            ['July', parseFloat($('#grid_jul tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_jul tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_jul').text()) || 0],
            ['August', parseFloat($('#grid_avg tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_avg tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_avg').text()) || 0],
            ['September', parseFloat($('#grid_sep tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_sep tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_sep').text()) || 0],
            ['Octobre', parseFloat($('#grid_oct tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_oct tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_oct').text()) || 0],
            ['Novembre', parseFloat($('#grid_nov tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_nov tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_nov').text()) || 0],
            ['Decembre',parseFloat($('#grid_dec tbody tr:nth-child(2) td:nth-child(1)').text()) || 0, parseFloat($('#grid_dec tbody tr:nth-child(1) td:nth-child(1)').text()) ||0 , parseFloat($('#tot_dec').text()) || 0]
      ]);
      var barOptions = {       
        focusTarget: 'category',
        backgroundColor: 'transparent',
        colors: ['orange', 'tomato','cornflowerblue'],
    
        chartArea: {
          left: 50,
          top: 10,
          width: '90%',
          height: '70%'
        },
        bar: {
          groupWidth: '70%'
        },
        hAxis: {
          textStyle: {
            fontSize: 11
          }
        },
        vAxis: {
          minValue: 0,
          maxValue: 1500,
          baselineColor: '#DDD',
          gridlines: {
            color: '#DDD',
            count: 4
          },
          textStyle: {
            fontSize: 11
          }
        },
        legend: {
          position: 'bottom',
          textStyle: {
            fontSize: 12
          }
        },
        animation: {
          duration: 1200,
          easing: 'out',
			    startup: true
        }
      };
      var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
      barChart.draw(barData, barOptions);

      //CHART FOR VALUES
      var barData = google.visualization.arrayToDataTable([
            ['Months', 'Totale Values €'],
            ['January', parseFloat($('#tot_jan_val').text()) || 0],
            ['February', parseFloat($('#tot_feb_val').text()) || 0],
            ['March', parseFloat($('#tot_mar_val').text()) || 0],
            ['Aprile', parseFloat($('#tot_apr_val').text()) || 0],
            ['May', parseFloat($('#tot_may_val').text()) || 0],
            ['Jun', parseFloat($('#tot_jun_val').text()) || 0],
            ['July', parseFloat($('#tot_jul_val').text()) || 0],
            ['August', parseFloat($('#tot_avg_val').text()) || 0],
            ['September', parseFloat($('#tot_sep_val').text()) || 0],
            ['Octobre', parseFloat($('#tot_oct_val').text()) || 0],
            ['Novembre', parseFloat($('#tot_nov_val').text()) || 0],
            ['Decembre',parseFloat($('#tot_dec_val').text()) || 0]
      ]);
      var barOptions = {       
        focusTarget: 'category',
        backgroundColor: 'transparent',
        colors: ['orange', 'tomato','cornflowerblue'],
    
        chartArea: {
          left: 50,
          top: 10,
          width: '90%',
          height: '70%'
        },
        bar: {
          groupWidth: '70%'
        },
        hAxis: {
          textStyle: {
            fontSize: 11
          }
        },
        vAxis: {
          minValue: 0,
          maxValue: 1500,
          baselineColor: '#DDD',
          gridlines: {
            color: '#DDD',
            count: 4
          },
          textStyle: {
            fontSize: 11
          }
        },
        legend: {
          position: 'bottom',
          textStyle: {
            fontSize: 12
          }
        },
        animation: {
          duration: 1200,
          easing: 'out',
			    startup: true
        }
      };
      var barChart = new google.visualization.ColumnChart(document.getElementById('bar-values'));
        barChart.draw(barData, barOptions);
    }
        </script>
    </form>
</body>
</html>
