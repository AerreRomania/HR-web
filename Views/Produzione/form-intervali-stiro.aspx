<%@ Page Language="VB" AutoEventWireup="false" CodeFile="form-intervali-stiro.aspx.vb" Inherits="form_intervali_stiro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stiro Intervals</title>
    <script src="../../js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="../../js/jquery-ui.js" type="text/javascript"></script>
    <script src="../../js/stiro_intervals.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../../js/jspdf.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />


    <style>
        *:not(.icon-th):not(.icon) {
            font-family: 'Exo', sans-serif!important;
        }
        a.export,
        a.export:visited {
            display: inline-block;
            text-decoration: none;
            color: #000;
            background-color: #ddd;
            border: 1px solid #ccc;
            padding: 8px;
        }

        body {
            background: #f4f4f4;
            font-family: 'Quicksand', serif;
            font-size: 1rem;
        }

        .gvintervali {
            margin-bottom: 50px;
        }

        .line-chart {
            -webkit-animation: fadeIn 600ms cubic-bezier(0.57, 0.25, 0.65, 1) 1 forwards;
            animation: fadeIn 600ms cubic-bezier(0.57, 0.25, 0.65, 1) 1 forwards;
            opacity: 0;
            /*max-height: 350px;
               max-width: 700px;*/
            display: block;
            z-index: 9999999999;
        }

        .hidden {
            display: none;
        }

        .aspect-ratio {
            height: 0;
            /*padding-bottom: 50%;*/
        }

        @-webkit-keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }


        #spinner {
            display: none;
            height: 30px;
        }

        .gridheader {
            background: #333333;
            color: white;
            /*height: 40px;*/
        }

        .gridheader th {
            padding-left: 5px;
            padding-right: 5px;
        }

        .GvGrid td {
            font-size: 12px;
            font-family: 'Quicksand', serif;
            padding-right: 3px;
            padding-left: 3px;
        }

        .GvGrid:hover {
            background-color: darkgray;
            color: #ffffff;
        }

        .h5_sort {
            line-height: 24px;
            background: #ababab;
            width: 204px;
            padding-right: 0px !important;
            padding-left: 0px !important;
            margin-left: -16px;
            margin-right: -16px;
            color: white;
            font-size: 12px;
            font-weight: 400;
        }

        .mdl_intervali_total {
            float: right;
            top: 90px;
            /*right: 100px;*/
            color: #333333;
            position: relative;
            display: none;
        }

        .mdl_intervali_total td {
            padding-right: 10px;
            color: #333333;
        }

        #checkboxWrapper td {
            font-size: 12px !important;
            padding-left: 5px;
            color: #333333;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        </asp:UpdateProgress>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <%-- Report - Intervali - Modal Panel --%>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                  
                            <div class="line-chart hidden">
                                <div class="aspect-ratio">
                                    <canvas id="chart"></canvas>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Panel ID="modalintervali" runat="server" ClientIDMode="Static">

                                <div id="modaldiv1" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 99999;">

                                    <div class="popup">
                                        <div class="content">
                                            <asp:Button runat="server" ID="btnintervali"  UseSubmitBehavior="false" Style="display: none;" Text="Load Table" ClientIDMode="Static" />

                                            <asp:Table runat="server">
                                                <%-- TITLE ROW --%>
                                                <asp:TableRow Style="position: absolute; padding-left: 0px; padding-top: 15px; color: forestgreen;">
                                                    
                                                    
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="cal_intervali"  TextMode="Date" runat="server" CssClass="col-xs-3" placeholder="Date" Style="padding: 3px; border-style: groove;"></asp:TextBox>

                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:DropDownList ID="cal_turno1" CssClass="col-xs-1" runat="server" Style="padding: 5px;">
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button ID="cal_button" runat="server" CssClass="col-xs-1" Text="Load data" ClientIDMode="Static" Style="padding: 4px;" />

                                                    </asp:TableCell>
                                                    
                                                    <asp:TableCell>
                                                        <span class="col-xs-5"></span>

                                                    </asp:TableCell>

                                                    <asp:TableCell>
                                                        <asp:Label runat="server" ID="intervali_current_date" Style="padding-right: 10px;"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Label runat="server" ID="intervali_current_turno"></asp:Label>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <button id="btnintervaliprint" class="btn btn-1 btn-1e" onclick="PrintPage()" style="display: block;">Print</button>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button runat="server" ID="btnexcel" ClientIDMode="Static"  CssClass="export btn btn-1 btn-1e" Text="Export To Excel" OnClick="ExportToEXC"  Style="display: block;" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button runat="server" ID="get_pdf_intervali" ClientIDMode="Static" CssClass="btn btn-1 btn-1e" Text="Export To PDF" OnClick="ExportToPDF" Style="display: block;" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>                                                        
                                                        <img src="Images/spinner.gif" id="spinner" class="col-xs-1" />
                                                    </asp:TableCell>
                                                    <asp:TableCell></asp:TableCell>

                                                </asp:TableRow>
                                            </asp:Table>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <%-- GRID VIEW --%>
                                            <asp:GridView runat="server" ID="gv_intervali" ClientIDMode="Static" AutoGenerateColumns="true" CssClass="gvintervali results" OnRowDataBound="Strasnafunkcijaintervali" HeaderStyle-CssClass="gridheader" RowStyle-CssClass="GvGrid" Height="500" PageSize="20"></asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div id="modal_intervali_totale" class="mdl_intervali_total">

                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">ET.COPP</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_copp_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">ET.COMP:</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_comp_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">MANICHINO:</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_manichino_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">RAMMENDO:</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_rammendo_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">PRESSA:</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_pressa_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                        <asp:Label runat="server">PIEGO:</asp:Label>
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="lbl_et_piego_tot"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="dtlista1"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>

                                    </asp:Table>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
