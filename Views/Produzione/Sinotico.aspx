<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sinotico.aspx.cs" Inherits="Sinotico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../css/myStylesheet.css" />
    <link rel="stylesheet" href="../../css/resources/bootstrap-3.3.7-dist/css/bootstrap.css" />

    <style type="text/css">
        .customDiv {
            text-align: center;
            min-width: 140px;
        }

        .cal {
            max-width: 130px;
        }

        @media only screen and (max-width:800px) {
            #btn_GetData{
                width:75px;
            }

            .btnsss{
                    margin-top: 10px;
                        margin-left: 10px;
            }

            .totalll{
    right: 145px;
    height: 44px;
    top: 75px;
    margin-bottom: 80px;
    float:left;
            }

            .shiftss{
                    padding-left: 0px;
                    padding-right: 0px;
                    width: 300px;
                    height: 65px;
                   margin-left: 10px;
            }

            .col-lg-4{
                padding-left:0!important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/js/jquery-3.1.1.min.js" />
                <asp:ScriptReference Path="~/css/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js" />
            </Scripts>
        </asp:ScriptManager>
        <div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    Loading Data... 
                    <img src="../../css/resources/img/gifLoading.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container-fluid">
                    
<%--                        <div class="col-lg-4 col-md-4 col-sm-8 col-xs-8">
                            <div class="col-lg-6 col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; width: 200px; height: 44px">
                                <table style="width: inherit">
                                    <tr>
                                        <td style="width: 30px">
                                            <asp:Label ID="lblFromDate" runat="server">From:</asp:Label></td>
                                        <td style="width: 114px">
                                            </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6 col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 13px; width: 210px; height: 44px">
                                <table style="width: inherit">
                                    <tr>
                                        <td style="width: 30px; padding-right: 12px;">
                                            <asp:Label ID="lblToDate" runat="server">To:</asp:Label></td>
                                        <td  style="width: 114px">
                                            </td>
                                        <td class="col-sm-12 col-xs-12" style="width: 20px">
                                           </td>
                                        <td class="col-sm-12 col-xs-12">
                                            </td>
                                    </tr>
                                </table>
                            </div>
                        </div>--%>
                    <div class="row" style="padding-top: 10px;">
                            <div class="col-lg-12">
                                <div class="col-lg-5">
                                    <div class="col-lg-4 ">
                                        <div class="col-lg-4 col-sm-4 col-xs-4"><asp:Label ID="lblFromDate" runat="server">From:</asp:Label></div>
                                        <div class="col-lg-8 col-sm-8 col-xs-8"><asp:TextBox ID="fromDateCalendar" runat="server" TextMode="Date" CssClass="cal"></asp:TextBox></div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="col-lg-4 col-sm-4 col-xs-4"> <asp:Label ID="lblToDate" runat="server">To:</asp:Label></div>
                                        <div class="col-lg-8 col-sm-8 col-xs-8"><asp:TextBox ID="toDateCalendar" runat="server" TextMode="Date" CssClass="cal"></asp:TextBox></div>
                                    </div>
                                    <div class="col-lg-4 col-sm-12 col-xs-12 btnsss">
                                        <div class="col-lg-4 col-sm-6 col-xs-6"> <asp:Button ID="btn_GetData" runat="server" Text="GO" OnClick="getData" /></div>
                                        <div class="col-lg-8 col-sm-6 col-xs-6"><asp:Button ID="btn_CurrentDate" runat="server" Text="Curr.Date" OnClick="getCurrentDateData" OnClientClick="changeBackground()" UseSubmitBehavior="false" /></div>
                                    </div>
                            </div>
                        </div>
                        </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-11 col-md-3 col-sm-4 col-xs-12 shiftss" style="padding-left: 0px; padding-right: 0px; width: 210px; height: 65px">

                                <table>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbNight" Text="Shift1" runat="server" AutoPostBack="true" Checked="false" />
                                            <asp:Button ID="btn_cbNight" CssClass="shiftStyle" runat="server" Width="70px" Height="44px" AutoPostBack="false" />
                                        </td>
                                        <td style="text-align: center">

                                            <asp:CheckBox ID="cbMorning" Text="Shift2" runat="server" AutoPostBack="true" Checked="false" />
                                            <asp:Button ID="btn_cbMorning" CssClass="shiftStyle" runat="server" Width="70px" Height="44px" AutoPostBack="false" />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:CheckBox ID="cbAfternoon" Text="Shift3" runat="server" AutoPostBack="true" Checked="false" />
                                            <asp:Button ID="btn_cbAfternoon" CssClass="shiftStyle" runat="server" Width="70px" Height="44px" AutoPostBack="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Label ID="lbl_cbNight" runat="server">Night</asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="lbl_cbMorning" runat="server">Morning</asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="lbl_cbAfternoon" runat="server">Afternoon</asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-lg-1 col-md-3 col-sm-2 col-xs-12 totalll" style="float: right; width: 70px; height: 44px">
                                <div class="row">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="lbl_TotDept" CssClass="totalButtonStyle" runat="server" Width="70px" Height="44px" AutoPostBack="false" ToolTip="Total" /></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center">
                                                <label for="lbl_TotDept" runat="server">Total</label></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>


                <hr style="width: 100%">
                <div class="container" id="Container" runat="server" style="margin-left: 5px;">
                    <asp:Panel ID="Panel1" runat="server" Height="424px" CssClass="panelStyle" display="inline">
                        <div class="row">
                            <div class="col-lg-10" style="padding-left: 0px">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px">
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL1">
                                                <tr>
                                                    <td class="tdStyle">

                                                        <div class="tooltip1">
                                                            <asp:Button ID="P1" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP1" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P14" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP14" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P2" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP2" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P13" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP13" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P3" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP3" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P12" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP12" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P4" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP4" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P11" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP11" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P5" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP5" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P10" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP10" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P6" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP6" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P9" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP9" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P7" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP7" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P8" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP8" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L1" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L1" class="labelTextStyle" runat="server">L1</label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL2">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P15" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP15" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P28" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP28" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P16" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP16" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P27" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP27" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P17" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP17" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P26" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP26" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P18" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP18" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P25" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP25" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P19" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP19" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P24" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP24" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P20" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP20" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P23" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP23" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P21" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP21" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P22" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP22" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L2" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L2" class="labelTextStyle" runat="server">L2</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL3">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P29" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP29" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P42" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP42" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P30" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP30" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P41" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP41" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P31" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP31" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P40" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP40" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P32" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP32" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P39" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP39" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P33" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP33" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P38" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP38" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P34" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP34" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P37" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP37" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P35" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP35" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P36" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP36" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L3" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L3" class="labelTextStyle" runat="server">L3</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL4">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P43" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP43" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P56" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP56" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P44" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP44" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P55" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP55" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P45" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP45" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P54" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP54" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P46" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP46" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P53" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP53" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P47" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP47" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P52" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP52" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P48" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP48" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P51" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP51" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P49" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP49" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P50" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP50" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L4" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L4" class="labelTextStyle" runat="server">L4</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-2 col-sm-6 col-xs-12" style="width: 280px; padding-left: 10px; padding-right: 0px">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 150px; padding-left: 0px; padding-right: 0px">
                                            <div class="customDiv" style="padding-left: 5px">
                                                <table id="tableL5">
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P57" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP57" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>

                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P70" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP70" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P58" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP58" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P69" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP69" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P59" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP59" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P68" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP68" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P60" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP60" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P67" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP67" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P61" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP61" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P66" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP66" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P62" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP62" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P65" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP65" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P63" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP63" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P64" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP64" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lineStyle" colspan="2" style="text-align: center">
                                                            <table style="padding-left: 20%; width: 140px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="L5" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="L5" class="labelTextStyle" runat="server">L5</label></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 100px">
                                            <div class="customDiv" style="height: 417px; width: 70px">
                                                <table style="width: 70px; height: inherit">
                                                    <tr>
                                                        <td style="align-content: center">
                                                            <table style="width: 70px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="S1" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center">
                                                                        <label for="S1" runat="server">Squadra1</label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel2" runat="server" Height="424px" CssClass="panelStyle" display="inline">
                        <div class="row">
                            <div class="col-lg-10" style="padding-left: 0px">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px">
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL6">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P71" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP71" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P84" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP84" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P72" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP72" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P83" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP83" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P73" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP73" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P82" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP82" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P74" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP74" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P81" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP81" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P75" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP75" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P80" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP80" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P76" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP76" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P79" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP79" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P77" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP77" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P78" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP78" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L6" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L6" class="labelTextStyle" runat="server">L6</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL7">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P85" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP85" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P98" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP98" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P86" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP86" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P97" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP97" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P87" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP87" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P96" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP96" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P88" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP88" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P95" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP95" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P89" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP89" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P94" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP94" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P90" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP90" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P93" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP93" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P91" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP91" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P92" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP92" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L7" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L7" class="labelTextStyle" runat="server">L7</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL8">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P99" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP99" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P112" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP112" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P100" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP100" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P111" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP111" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P101" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP101" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P110" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP110" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P102" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP102" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P109" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP109" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P103" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP103" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P108" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP108" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P104" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP104" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P107" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP107" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P105" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP105" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P106" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP106" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L8" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L8" class="labelTextStyle" runat="server">L8</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL9">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P113" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP113" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P126" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP126" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P114" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP114" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P125" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP125" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P115" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP115" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P124" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP124" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P116" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP116" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P123" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP123" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P117" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP117" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P122" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP122" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P118" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP118" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P121" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP121" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P119" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP119" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P120" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP120" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L9" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L9" class="labelTextStyle" runat="server">L9</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-2 col-sm-6 col-xs-12" style="width: 280px; padding-left: 10px; padding-right: 0px">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 150px; padding-left: 0px; padding-right: 0px">
                                            <div class="customDiv" style="padding-left: 5px">
                                                <table id="tableL10">
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P127" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP127" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>

                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P140" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP140" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P128" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP128" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P139" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP139" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P129" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP129" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P138" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP138" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P130" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP130" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P137" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP137" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P131" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP131" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P136" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP136" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P132" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP132" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P135" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP135" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P133" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP133" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P134" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP134" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lineStyle" colspan="2" style="text-align: center">
                                                            <table style="padding-left: 20%; width: 140px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="L10" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="L10" class="labelTextStyle" runat="server">L10</label></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 100px">
                                            <div class="customDiv" style="height: 417px; width: 70px">
                                                <table style="width: 70px; height: inherit">
                                                    <tr>
                                                        <td style="align-content: center">
                                                            <table style="width: 70px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="S2" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center">
                                                                        <label for="S2" runat="server">Squadra2</label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel3" runat="server" Height="424px" CssClass="panelStyle" display="inline">
                        <div class="row">
                            <div class="col-lg-10" style="padding-left: 0px">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px">
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL11">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P141" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP141" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P154" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP154" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P142" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP142" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P153" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP153" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P143" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP143" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P152" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP152" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P144" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP144" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P151" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP151" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P145" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP145" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P150" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP150" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P146" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP146" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P149" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP149" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P147" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP147" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P148" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP148" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L11" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L11" class="labelTextStyle" runat="server">L11</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL12">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P155" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP155" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P168" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP168" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P156" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP156" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P167" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP167" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P157" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP157" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P166" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP166" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P158" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP158" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P165" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP165" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P159" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP159" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P164" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP164" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P160" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP160" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P163" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP163" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P161" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP161" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P162" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP162" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L12" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L12" class="labelTextStyle" runat="server">L12</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL13">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P169" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP169" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P182" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP182" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P170" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP170" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P181" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP181" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P171" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP171" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P180" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP180" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P172" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP172" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P179" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP179" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P173" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP173" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P178" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP178" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P174" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP174" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P177" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP177" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P175" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP175" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P176" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP176" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L13" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L13" class="labelTextStyle" runat="server">L13</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="width: 165px; padding-left: 10px; padding-right: 5px;">
                                        <div class="customDiv" style="padding-left: 5px">
                                            <table id="tableL14">
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P183" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP183" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>

                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P196" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP196" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P184" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                            <asp:Label ID="LP184" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P195" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP195" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P185" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP185" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P194" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP194" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P186" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP186" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P193" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP193" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P187" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP187" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P192" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP192" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P188" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP188" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P191" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP191" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P189" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP189" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td class="tdStyle">
                                                        <div class="tooltip1">
                                                            <asp:Button ID="P190" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                            <asp:Label ID="LP190" runat="server" CssClass="tooltiptext"></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lineStyle" colspan="2" style="text-align: center">
                                                        <table style="padding-left: 20%; width: 140px">
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="L14" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="L14" class="labelTextStyle" runat="server">L14</label></td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-2 col-sm-6 col-xs-12" style="width: 280px; padding-left: 10px; padding-right: 0px">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 150px; padding-left: 0px; padding-right: 0px">
                                            <div class="customDiv" style="padding-left: 5px">
                                                <table id="tableL15">
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P197" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP197" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>

                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P210" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP210" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P198" runat="server" CssClass="buttonStyle" Width="70px" Height="44px" AutoPostBack="false" />
                                                                <asp:Label ID="LP198" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P209" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP209" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P199" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP199" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P208" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP208" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P200" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP200" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P207" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP207" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P201" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP201" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P206" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP206" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P202" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP202" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P205" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP205" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P203" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP203" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="tdStyle">
                                                            <div class="tooltip1">
                                                                <asp:Button ID="P204" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" />
                                                                <asp:Label ID="LP204" runat="server" CssClass="tooltiptext"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="lineStyle" colspan="2" style="text-align: center">
                                                            <table style="padding-left: 20%; width: 140px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="L15" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="78px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="L15" class="labelTextStyle" runat="server">L15</label></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="width: 100px">
                                            <div class="customDiv" style="height: 417px; width: 70px">
                                                <table style="width: 70px; height: inherit">
                                                    <tr>
                                                        <td style="align-content: center">
                                                            <table style="width: 70px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="S3" runat="server" AutoPostBack="false" CssClass="buttonStyle" Height="44px" Width="70px" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center">
                                                                        <label for="S3" runat="server">Squadra3</label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <script>
            function changeBackground() {
                document.getElementById("btn_cbNight").disabled = true;
                document.getElementById("btn_cbMorning").disabled = true;
                document.getElementById("btn_cbAfternoon").disabled = true;
                document.getElementById("btn_GetData").disabled = true;
                document.getElementById("Container").style.background = "#f1eeee";
            }
        </script>
    </form>
</body>

</html>


