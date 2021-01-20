<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaportPrezenteDepartament.aspx.cs" Inherits="RaportPrezenteDepartament" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="hRaportPrezenteDepartament" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes"/>

    <title>Analisi presenze</title>
    <link rel="stylesheet" href="../../css/bootstrap/css/bootstrap.min.css" />

    <link href="~/css/Content/overflow.css" rel="stylesheet" type="text/css" />
    <link href="~/Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="~/Css/jquery-ui-1.8.18.custom.css" rel="stylesheet" />

    <style type="text/css">
        .top-icons{
           cursor:pointer;
        }

        body{
            height: 850px;
            background-color:#f4f4f4;
        }

        .peki{
            width: 300px!important;
            /*display: -webkit-inline-box;*/
            margin-left:8px;
        }
        #tblPrezenze{
            background-color:#f4f4f4;
        }

        td.rAntet{
            padding-left:0px; 
            padding-right:0px; 
            
            background-color: #c7c7c7;
                letter-spacing: 0.5px;
                    line-height: 25px;

        }

        td.rAntet span{
                box-shadow: 1px 2px 2px 0px rgba(0, 0, 0, 0.33);
                display: inline-block;
                width: 100%;
        }

        td.rAntentSecund{
                background-color: #f4f4f4;
                    letter-spacing: 0.5px;
        }

        .peki > table{
                box-shadow: 1px 1px 3px #949494;
        }

        td.rAntetSecund{
            background-color:#c7c7c7;
        }

        td.rAntetSecundRosu{
            width:10px;
        }

        td.rAntetSecundRosu {
            background-color: #ff0000;
            font: 9px/12px Arial, Helvetica, sans-serif;
            color: #ffffff;
            border: 1px solid #ffffff;
           /* font-weight: 600;
            text-align: left;
             padding-left:5px;*/
        }

        td.rAntetSecundAlb {
            background-color: #e2e2e2;
            /*font: 10px/15px Arial, Helvetica, sans-serif;*/
            /* color: #294460; */
            color: black;
            border: 1px solid #ffffff;
            /*font-weight: 600;*/
            text-align: left;
            padding-left:5px;
            padding-right:5px;
            font-weight:400;
        }

        #myTable .rAntet{
            padding-left:5px;
            padding-right:5px;
        }

        #tPrezenteDepartament {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
        /*cursor: move;*/
         cursor: grab; 
         cursor: -o-grab; 
         cursor: -moz-grab; 
         cursor: -webkit-grab;
    }

        #tbFiltruDepartament{
            width:auto!important;
        }
        .ui-datepicker-trigger{
                position: relative;
                top: 0px;
                left: 4px;
        }
        .ui-datepicker-trigger:hover{
            cursor:pointer;
        }
        input{
                border: 1px solid #f4f4f4;
                border-bottom: 1px solid black;
             background: #f4f4f4;
               pointer-events: none;

        }
        .continut{
            margin-left:10px;
            letter-spacing: 0.3px;
                font-weight: 600;
        }
        .legend{
            width: 15px;
            height: 15px;
            line-height: 15px;
            border-radius: 45px;
            margin-bottom: 5px;
            display: inline-block;

        }

        .legend-text{
                font-size: 12px;
                letter-spacing: 0.3px;
                font-weight: 600;
                position: relative;
                
                top: -3px;
                left: 5px;

        }

        .red,.green,.silver,.rAntetSecundRosu,.{
            width: 15px;
            height: 15px;
            line-height: 15px;
            border-radius: 45px;
            color:none;
        }

        .tbl-first-row{
            border-top:0px;
        }
    </style>
</head>
<body>
    <form id="fRaportPrezenteDepartament" runat="server" method="post" enctype="multipart/form-data" target="upload_target">
        <asp:ScriptManager ID="smRaportPrezenteDepartament" runat="server">
            <Services>
                <asp:ServiceReference Path="RaportPrezenteDepartamentWS.asmx" />
            </Services>
            <Scripts>
                <asp:ScriptReference Path="../../js/RaportPrezenteDepartament.js" />
                <asp:ScriptReference Path="../../js/jquery-1.7.1.min.js" />
                <asp:ScriptReference Path="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js" />
                <asp:ScriptReference Path="../../js/jquery.maskedinput-1.3.js" />
                <asp:ScriptReference Path="../../js/draggablescroll.js" />
                <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>--%>

                <%-- Exporting Libs --%>
                <asp:ScriptReference Path="../../js/printThis.js" />
                <asp:ScriptReference Path="../../js/jspdf.min.js" />
                <asp:ScriptReference Path="../../js/html2canvas.js" />
            </Scripts>
        </asp:ScriptManager>
        <div class="container-fluid">
        <div class="blog-header">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1  text-uppercase"> 
            <h4 class="blog-header-logo text-dark">Analisi Presenze</h4>

          </div>
          <div class="col-4 text-center">
              <asp:UpdateProgress ID="up" runat="server">
                <ProgressTemplate>
                    <img src="../../Images/Image/loading.gif" alt="Loading ..."/> Loading ...</ProgressTemplate>
            </asp:UpdateProgress>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
           <a class="top-iconss btn" onclick="printExcel();" href="#" >Excel</a>
              <a class="top-iconss btn" onclick="printPDF();"  href="#">PDF</a>
              <a class="top-iconss btn" onclick="printData();" href="#">Print</a>
          </div>
        </div>
      </div>

        <table cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td valign="middle" align="center" style="height:50px;" colspan="2">
                    <table cellpadding="0" cellspacing="0" class="principal">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lFiltruData" runat="server" CssClass="continut" Text="GIORNO"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruData" runat="server" ReadOnly="True" Width="75px"></asp:TextBox>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lFiltruDepartament" runat="server" CssClass="continut" Text="Reparto"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFiltruDepartament" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                        </td>
                                        <td style="width: 40px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <input runat="server" id="bExcel" visible="false" value="Export" type="button" onclick="bExcel_Click()" class="xls" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
        <table id="tblPrezenze" >

            <tr>
                <td style="width: 475px" align="center">
                    <table id="tTotal">
                        <tr> 
                            <td valign="top">
                                &nbsp;
                            </td> 
                        </tr>
                      
                    </table>

                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td class="legend" style="background-color: red;"></td>
                            <td class="legend-text"><span id="idassenti"></span>  ASSENTI</td>
                        </tr>
                        <tr>
                            <td class="legend" style="background-color: forestgreen;"></td>
                            <td class="legend-text"><span id="idferie"></span>  FERIE</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td valign="top">
                                <table cellspacing="5" cellpadding="5" class="dragscroll" id="tPrezenteDepartament" width="1560px" style="display:block;">
                                    <tr>
                                        <td align="center">&nbsp;</td>
                                    </tr>
                                </table>

                                 <table cellspacing="5" cellpadding="5" class="dragscroll" id="tPrezenteDepartament1" width="1560px" style="display:none;">
                                    <tr>
                                        <td align="center">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="hfId" runat="server" />
                    <asp:HiddenField ID="hfRowIndex" runat="server" />
                </td>
            </tr>
            
        </table>
        </div>
        <script type="text/javascript">
            $(document).ajaxComplete(function () {
                console.log('ovde ajaxComplete');
                $('#idassenti').text($('.inAssenti').text());
            });

            $(document).load(function () {
                console.log('ovde Load');
                $('#idassenti').text($('.inAssenti').text());
            });
        </script>
 
    </form>
</body>
</html>