<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exacta.aspx.cs" Inherits="Views.Produzione.Exacta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../css/bootstrap-3.4.1.min.css" />


    <style>
        @media only screen and ( max-width: 768px ) {
            #intervalli {
                margin: 100px 10px 0 10px !important;
            }
        }

        @media only screen and ( max-width: 768px ) {
            #sinottico > #row1, #sinottico > #row2 {
                padding: 0px 50px 0 50px !important;
            }
        }

        @media only screen and ( max-width: 768px ) {
            #produzione {
            }
        }

        .h100 {
            height: 50px;
            background-color: #d3d3d3;
            color: white;
            font-size: 14px;
            border-bottom: 2px solid #f36a3b;
        }

        #header {
            -webkit-box-shadow: 0px 10px 34px -8px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 10px 34px -8px rgba(0,0,0,0.75);
            box-shadow: 0px 10px 34px -8px rgba(0,0,0,0.75);
        }

        #efftext {
            font-size: 30px;
            margin-top: 10px;
            color: green;
        }

        .h300 {
            height: 300px;
            margin-bottom: 30px;
        }

        .columninside {
            height: 320px;
            width: 100%;
            background-color: white;
            border: 1px solid #bbbbbb;
        }

        .column1 {
            margin: 10px 0 10px 0;
            width: 48.5%;
            height: 280px;
            display: inline-block;
        }

        .column2 {
            margin: 10px 0 10px 0;
            width: 49%;
            height: 280px;
            display: inline-block;
        }

        .circle {
            height: 40px;
            width: 40px;
            border-radius: 50%;
            background: black;
            margin: 5px auto;
            box-shadow: 0 0 10px grey;
        }

        .rectangle {
            height: 40px;
            width: 40px;
            background: black;
            margin: 5px auto;
            box-shadow: 0 0 10px grey;
        }

        .lineHeader {
            width: 100%;
            height: 20px;
            background-color: black;
            color: white;
            text-align: center;
        }

        .lineSpan {
            text-align: center;
        }

        .hover {
            width: 200px !important;
            color: black !important;
        }

        .none > ul > li > div > span {
            display: none;
        }

        ul {
            padding: 0px;
        }

        .hover + #sinottico {
            display: none;
        }

        li > div > span {
            position: fixed;
            font-size: 25px;
            margin-top: 12px;
            margin-left: 15px;
        }

        li > div {
            cursor: pointer;
        }

            li > div:hover {
                background-color: #e2e2e2;
            }

        #sinottico, #titleSinottico {
            display: none;
        }

        #produzione, #titleProduzione {
            display: none;
        }

        #intervalli, #titleIntervalli {
        }

        body {
            overflow-x: hidden;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="../../js/jquery-3.1.1.min.js" />
                <asp:ScriptReference Path="https://www.gstatic.com/charts/loader.js" />
            </Scripts>
        </asp:ScriptManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div>

                    <div class="container-fluid">
                        <div id="header" class="row" style="position: fixed; width: 100%; z-index: 999;">
                            <div class="hidden-sm hidden-xs  col-md-2 h100">

                                <div id="time">

                                    <span id="hours"></span><span id="min"></span><span id="sec"></span><span id="ampm"></span>

                                </div>

                                <div id="fullDate">

                                    <span id="month"></span>&nbsp;<span id="date"></span>&nbsp;<span id="year"></span>

                                </div>



                            </div>
                            <div class="col-xs-7 col-md-7 h100" style="text-align: center;">

                                <span id="titleSinottico" style="float: left; font-size: 20px; margin-top: 8px; color: yellow;">Sinottico</span>
                                <span id="titleIntervalli" style="float: left; font-size: 20px; margin-top: 8px; color: yellow;">Intervalli</span>
                                <span id="titleProduzione" style="float: left; font-size: 20px; margin-top: 8px; color: yellow;">Produzione</span>

                                <span id="efftext">Efficiency<asp:Label runat="server" ID="effproc"></asp:Label></span>
                            </div>



                            <div id="desktopButtons" class="hidden-xs hidden-sm col-md-3 h100">

                                <asp:Panel Style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/fullscreen.png); background-size: 40px; background-position: center center; background-repeat: no-repeat; border-radius: 5px; float: right;" runat="server"></asp:Panel>
                                <asp:Panel Style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/printer.svg); background-size: 40px; background-position: center center; background-repeat: no-repeat; background-color: gray; border-radius: 5px; float: right;" runat="server"></asp:Panel>
                                <asp:Panel Style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/report.svg); background-size: 40px; background-position: center center; background-repeat: no-repeat; background-color: gray; border-radius: 5px; float: right;" runat="server"></asp:Panel>
                                <asp:Panel Style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/download.svg); background-size: 40px; background-position: center center; background-repeat: no-repeat; background-color: gray; border-radius: 5px; float: right;" runat="server"></asp:Panel>


                            </div>

                            <div id="mobileButtons" class="col-xs-5 hidden-md hidden-lg h100">
                                <div class="btnSinottico" style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/sinotticoimgsmol.png); background-size: contain; border-radius: 5px; float: right;"></div>
                                <div class="btnIntervalli" style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/intervalliimgsmol.png); background-size: contain; border-radius: 5px; float: right;"></div>
                                <div class="btnProduzione" style="display: inline-block; width: 40px; height: 40px; margin-top: 5px; margin-right: 10px; background-image: url(../../images/produzioneimgsmol.png); background-size: contain; border-radius: 5px; float: right;"></div>



                            </div>

                        </div>


                        <div id="sinottico">
                            <div id="row1" class="row" style="margin-top: 100px; padding: 0px 50px 0 100px;">
                                <div class="col-md-3 col-sm-6 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 1 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 2 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 3 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 4 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="row2" class="row" style="margin-top: 0px; padding: 0px 50px 0px 100px;">
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 5 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 6 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 7 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 h300 ">
                                    <div class="columninside">
                                        <asp:Panel CssClass="lineHeader" runat="server">
                                            <asp:Label CssClass="lineSpan" runat="server"> Line 8 </asp:Label></asp:Panel>
                                        <div class="column1">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                        </div>
                                        <div class="column2">
                                            <asp:Panel CssClass="rectangle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>
                                            <asp:Panel CssClass="circle" runat="server"></asp:Panel>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="intervalli" style="margin: 100px 0 0 100px;">
                            <asp:DropDownList Style="position: fixed; top: 70px; left: 100px;" runat="server">
                                <asp:ListItem Text="line1"></asp:ListItem>
                                <asp:ListItem Text="line2"></asp:ListItem>
                                <asp:ListItem Text="line3"></asp:ListItem>
                                <asp:ListItem Text="line4"></asp:ListItem>
                                <asp:ListItem Text="line5"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="row">
                                <div class="col-xs-6 col-md-2 " style="height: 550px; background: #d3d3d3; margin-bottom: 30px;">
                                    <div id="chart_div" style="width: 150%; height: 150px; margin-left: -30px;"></div>
                                    <div id="chart_div2" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                    <div id="chart_div3" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                    <div id="chart_div4" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                </div>
                                <div class="col-xs-6 col-md-2" style="height: 550px; background: #d3d3d3; margin-bottom: 30px;">
                                    <div id="chart_div5" style="width: 150%; height: 150px; margin-left: -30px;"></div>
                                    <div id="chart_div6" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                    <div id="chart_div7" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                    <div id="chart_div8" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>
                                    <div id="chart_div9" style="width: 150%; height: 150px; margin-left: -30px; margin-top: -50px;"></div>


                                </div>
                                <div class="col-xs-12 col-md-8">
                                    <asp:DataGrid ID="intervalliGrid" runat="server"></asp:DataGrid>
                                    <div style="height: 200px; background: blue; color: white; font-weight: bold; font-size: 20px;">
                                        asp:DataGrid
                id=intervalliGrid
                                    </div>
                                    <div style="height: 200px; max-width: 100%; overflow-y: hidden; overflow-x: auto;">

                                        <div id="hourchart" style="min-width: 100%; max-width: 101%;"></div>


                                    </div>
                                    <div style="height: 150px; max-width: 100%; overflow-y: hidden; overflow-x: auto;">

                                        <div id="totalchart" style="min-width: 15%; max-width: 16%; margin-left: 10%;"></div>


                                    </div>
                                </div>
                            </div>


                        </div>


                        <div id="produzione" style="margin: 100px 0 0 100px; height: 200px; width: 200px; background-color: saddlebrown; color: white; font-weight: bold; font-size: 20px;">
                            asp:DataGrid
                    id=produzioneGrid
                    <asp:DataGrid ID="produzioneGrid" runat="server"></asp:DataGrid>

                        </div>



                        <div id="leftMenu" onmouseover="mouseOver()" onmouseout="mouseOut()" onclick="" style="height: 900px; width: 50px; position: fixed; top: 50px; left: 0px; background: white; border-right: 1px solid #bbbbbb; z-index: 999;" class="hidden-sm hidden-xs none">
                            <ul style="list-style: none;">
                                <li>
                                    <div class="btnSinottico">
                                        <div style="width: 40px; height: 40px; margin-top: 10px; margin-left: 5px; background-image: url(../../images/sinotticoimgsmol.png); background-size: contain; border-radius: 5px; display: inline-block;"></div>
                                        <span>Sinottico</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="btnIntervalli">
                                        <div style="width: 40px; height: 40px; margin-top: 10px; margin-left: 5px; background-image: url(../../images/intervalliimgsmol.png); background-size: contain; border-radius: 5px; display: inline-block;"></div>
                                        <span>Intervalli</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="btnProduzione">
                                        <div style="width: 40px; height: 40px; margin-top: 10px; margin-left: 5px; background-image: url(../../images/produzioneimgsmol.png); background-size: contain; border-radius: 5px; display: inline-block;"></div>
                                        <span>Produzione</span>
                                    </div>
                                </li>
                            </ul>
                        </div>


                    </div>
                    </br></br>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <script type="text/javascript">

            // Load the Visualization API and the piechart package.
            google.charts.load("current", { packages: ["corechart"] });
            google.charts.setOnLoadCallback(drawChart);


            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {


                // Create the data table.
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);


                // Create the data table.
                var data2 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data3 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data4 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data5 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data6 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data7 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                var data8 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);
                var data9 = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['On', 11],
                    ['Off', 7]
                ]);

                // Set chart options
                var options = {
                    'title': 'Donut Chart',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };


                // Set chart options
                var options2 = {
                    'title': 'How Much Pizza You Ate Last Night',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };

                // Set chart options
                var options3 = {
                    'title': 'Line chart',

                    pieHole: 0.4,

                    titlePosition: 'none',
                    legend: { position: 'none' },

                    backgroundColor: 'transparent',
                };

                var options4 = {
                    'title': 'How Much Pizza You Ate Last Night',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };
                // Set chart options
                var options5 = {
                    'title': 'Donut Chart',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };


                // Set chart options
                var options6 = {
                    'title': 'How Much Pizza You Ate Last Night',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };

                // Set chart options
                var options7 = {
                    'title': 'Line chart',

                    pieHole: 0.4,

                    titlePosition: 'none',
                    legend: { position: 'none' },

                    backgroundColor: 'transparent',
                };

                var options8 = {
                    'title': 'How Much Pizza You Ate Last Night',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };

                var options9 = {
                    'title': 'How Much Pizza You Ate Last Night',
                    pieHole: 0.4,
                    backgroundColor: 'transparent',
                    titlePosition: 'none',
                    legend: { position: 'none' }
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
                var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
                chart2.draw(data2, options2);
                var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
                chart3.draw(data3, options3);
                var chart4 = new google.visualization.PieChart(document.getElementById('chart_div4'));
                chart4.draw(data4, options4);
                var chart5 = new google.visualization.PieChart(document.getElementById('chart_div5'));
                chart5.draw(data5, options5);
                var chart6 = new google.visualization.PieChart(document.getElementById('chart_div6'));
                chart6.draw(data6, options6);
                var chart7 = new google.visualization.PieChart(document.getElementById('chart_div7'));
                chart7.draw(data7, options7);
                var chart8 = new google.visualization.PieChart(document.getElementById('chart_div8'));
                chart8.draw(data8, options8);
                var chart9 = new google.visualization.PieChart(document.getElementById('chart_div9'));
                chart9.draw(data9, options9);
            }

        </script>
        <script type="text/javascript">

            google.charts.load('current', { packages: ['corechart', 'bar'] });
            google.charts.setOnLoadCallback(drawAnnotations);

            function drawAnnotations() {
                var data = google.visualization.arrayToDataTable([
                    ['State', 'Knit Time', 'Prepatation Time', 'Stop Time', { role: 'style' }],
                    ['7h', 10, 24, 20, ''],
                    ['8h', 16, 22, 23, ''],
                    ['9h', 28, 19, 29, ''],
                    ['10h', 12, 14, 17, ''],
                    ['11h', 14, 7, 20, ''],
                    ['12h', 10, 14, 13, ''],
                    ['13h', 11, 16, 20, ''],
                    ['14h', 8, 25, 10, ''],
                    ['15h', 12, 24, 24, ''],
                    ['16h', 17, 14, 18, ''],
                    ['17h', 10, 24, 26, ''],

                ]);

                var options = {
                    height: 190,
                    legend: { position: 'top', maxLines: 3 },
                    bar: { groupWidth: '75%' },
                    isStacked: true,
                    series: {
                        0: { color: 'green' },
                        1: { color: '#ead1a2' },
                        2: { color: '#ffc100' }
                    }
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('hourchart'));
                chart.draw(data, options);
            }


        </script>
        <script type="text/javascript">

            google.charts.load('current', { packages: ['corechart', 'bar'] });
            google.charts.setOnLoadCallback(drawAnnotations);

            function drawAnnotations() {
                var data = google.visualization.arrayToDataTable([
                    ['State', 'Knit Time', 'Prepatation Time', 'Stop Time', { role: 'style' }],
                    ['Total', 25, 9, 6, ''],


                ]);

                var options = {
                    height: 150,
                    legend: { position: 'top', maxLines: 3 },
                    bar: { groupWidth: '75%' },
                    isStacked: true,
                    series: {
                        0: { color: 'green' },
                        1: { color: '#ead1a2' },
                        2: { color: '#ffc100' }
                    }
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('totalchart'));
                chart.draw(data, options);
            }


        </script>
        <script>

            $(function () {

                setInterval(function () {

                    var seconds = new Date().getTime() / 1000;

                    var time = new Date(),

                        hours = time.getHours(),

                        min = time.getMinutes(),

                        sec = time.getSeconds(),

                        millSec = time.getMilliseconds(),

                        millString = millSec.toString().slice(0, -2),

                        day = time.getDay(),

                        ampm = hours >= 12 ? 'PM' : 'AM',

                        month = time.getMonth(),

                        date = time.getDate(),

                        year = time.getFullYear(),

                        monthShortNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",

                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"

                        ];

                    //convert hours from military time and add the am or pm

                    //if (hours > 11) $('#ampm').text(ampm);

                    $('#ampm').text(ampm)

                    if (hours > 12) hours = hours % 12;

                    if (hours == 0) hours = 12;



                    //add leading zero for min and sec 

                    if (sec <= 9) sec = "0" + sec;

                    if (min <= 9) min = "0" + min;



                    $('#hours').text(hours);

                    $('#min').text(":" + min + ":");

                    $('#sec').text(sec);

                    //$("#test").text(day);

                    // $('#millSec').text(millString);

                    $('.days:nth-child(' + (day + 1) + ')').addClass('active');

                    $("#month").text(monthShortNames[month]);

                    $('#date').text(date);

                    $('#year').text(year);

                }, 100);

            });



        </script>
        <script type="text/javascript">

            //<![CDATA[

            Sys.Application.add_init(function () {

                $create(Sys.UI._Timer, { "enabled": true, "interval": 60000, "uniqueID": "ctl00$MainConfB$Timer_db_update" }, null, null, $get("MainConfB_Timer_db_update"));

            });

            Sys.Application.add_init(function () {

                $create(Sys.UI._UpdateProgress, { "associatedUpdatePanelId": null, "displayAfter": 500, "dynamicLayout": true }, null, null, $get("PageUpdateProgress"));

            });



            function mouseOver() {

                document.getElementById("leftMenu").className = " hover";
                // document.getElementById("sinottico").style.display = 'none';

            };

            function mouseOut() {

                document.getElementById("leftMenu").className = " none ";
                // document.getElementById("sinottico").style.display = 'block';

            };


            function sinottico() {
                document.getElementById("sinottico").style.backgroundColor = "red";


            }
            function intervalli() {
                document.getElementById("sinottico").style.backgroundColor = "green";


            }
            function produzione() {
                document.getElementById("sinottico").style.backgroundColor = "blue";


            }


        </script>
        <!-- switcharoo -->
        <script type="text/javascript">
            $(document).ready(function () {


                $(".btnSinottico").click(function () {
                    $('#sinottico').show();
                    $('#intervalli').hide();
                    $('#produzione').hide();

                    $('#titleSinottico').show();
                    $('#titleIntervalli').hide();
                    $('#titleProduzione').hide();
                });

                $(".btnIntervalli").click(function () {
                    $('#sinottico').hide();
                    $('#intervalli').show();
                    $('#produzione').hide();

                    $('#titleSinottico').hide();
                    $('#titleIntervalli').show();
                    $('#titleProduzione').hide();
                });

                $(".btnProduzione").click(function () {
                    $('#sinottico').hide();
                    $('#intervalli').hide();
                    $('#produzione').show();

                    $('#titleSinottico').hide();
                    $('#titleIntervalli').hide();
                    $('#titleProduzione').show();
                });
            });
        </script>
    </form>
</body>
</html>
