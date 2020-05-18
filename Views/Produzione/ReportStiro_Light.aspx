<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReportStiro_Light.aspx.vb" Inherits="ReportStiro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Stiro - Report</title>
    <%-- CSS --%>
    <link runat="server" rel="shortcut icon" href="../../images/./Images/navR.png" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="../../images/./Images/navR.png" type="Images/Image/ico" />
    <link rel="stylesheet" href="../../css/font-awesome.css" />
    <link href="../../css/Content/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="css/Content/bootstrap-theme.css" rel="stylesheet" />--%>
    <link href="../../css/animate.css" rel="stylesheet" />

    <%-- JS --%>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <%--<script src="js/ui-bootstrap-tpls-0.11.0.js"></script>--%>
    <script src="../../js/Scripts/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet"/>



    <style>
                 body{
                    height:750px;
                }
        * {
            font-family: 'Exo', sans-serif!important;
        }
        .grid {
            box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
            -webkit-box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
            -moz-box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
        }   

        .footerrow {
            margin: 0 auto;
            width: 327px;
            text-align: left;
            background-color: #fff;
            color: orange;
            border-right: silver 2px double;
            border-left: silver 2px double;
            border-bottom: silver 2px double;
            box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
            -webkit-box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
            -moz-box-shadow: 4px 4px 4px 0 rgba(0,0,0,0.16),0 2px 3px 0 rgba(0,0,0,0.12) !important;
        }

        .desnibox {
            display: inline;
            font-size: 12px;
            line-height: 20px;
            text-transform: uppercase;
            margin-left: 5%;
            margin-top: 30px;
        }


        h1 {
            font-size: 26px;
            line-height: 45px;
            margin-left: 5%;
            margin-top: 30px;
        }

        .wrapper {
            width: 400px;
            margin: 10% auto;
        }

        .content {
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            width: 400px;
        }

        .date {
            color: #2c387b;
            font-weight: 300;
            font-size: 1.5em;
            padding: 20px;
            line-height: 0px;
            width: 230px;
        }

        .date {
            border-bottom: 2px solid #eee;
        }

        input[type=checkbox], input[type=radio] {
            margin: -5px 0px 0px -6px;
            margin-top: 1px\9;
            line-height: normal;
            position: absolute;
        }

        body {
            /*background: #caced2;*/
            overflow-x: hidden;
        }

        .confA {
            height: 100vh;
        }

        .confB {
            height: 100vh;
        }

        .confC {
            height: 100vh;
        }

        #gridsA {
            margin: 0 auto;
            position: absolute;
            display: flex;
        }

        .grid {
            margin-left: 10px;
            margin-right: 10px;
            font-size: 12px;
            width: 325px;
            background: #fefefe;
        }

            .grid td {
                border-style: dotted;
            }

        .grid_other {
            margin-top: 20px;
            margin-left: 10px;
            margin-right: 10px;
            background: #fff;
            height: 158px;
            font-size: 12px;
        }

        caption {
            padding-top: 4px;
            padding-bottom: 4px;
            color: #000;
            text-align: center;
            background: white;
            border: #fefefe groove 1px;
        }

        .header {
            border-top-style: hidden;
            border-left-style: hidden;
            border-right-style: hidden;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            border-bottom-color: silver;
            text-align: center;
        }

            .header td {
                font-weight: 600;
                border-right-style: hidden;
                border-left-style: hidden;
            }

        th {
            text-align: left;
        }

        th, td {
            padding: 0px 3px 3px 3px;
            /*border-style: dotted;*/
            border-color: #c3c3c3;
            text-align: center;
        }

        table {
            /*border-color:#202129;*/
        }

        h2 {
            margin-left: 35px;
            margin-top: 35px;
        }


        .headerconfA {
            width: 100%;
            color: orange;
        }

        .GvGrid td {
            border-style: dotted !important;
        }

        .GvGrid:hover {
            background: rgb(59,103,158); /* Old browsers */
            background: -moz-linear-gradient(-45deg, rgba(59,103,158,1) 0%, rgba(43,136,217,1) 50%, rgba(32,124,202,1) 51%, rgba(125,185,232,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(-45deg, rgba(59,103,158,1) 0%,rgba(43,136,217,1) 50%,rgba(32,124,202,1) 51%,rgba(125,185,232,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(135deg, rgba(59,103,158,1) 0%,rgba(43,136,217,1) 50%,rgba(32,124,202,1) 51%,rgba(125,185,232,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3b679e', endColorstr='#7db9e8',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
            color: white;
            cursor: pointer;
        }




        .infospan {
            font-size: 9pt;
            float: left;
        }


        arrow,
        .arrow:before {
            position: absolute;
            left: 50%;
        }

        .arrow:hover {
            cursor: pointer;
        }

        .arrow {
            width: 40px;
            height: 40px;
            /* top: 61%; */
            position: absolute;
            bottom: 25px;
            left: 50%;
            margin: -20px 0 0 -20px;
            -webkit-transform: rotate(45deg);
            border-left: none;
            border-top: none;
            border-right: 2px gray solid;
            border-bottom: 2px gray solid;
        }

            .arrow:before {
                content: "";
                width: 20px;
                height: 20px;
                top: 50%;
                margin: -10px 0 0 -10px;
                border-left: none;
                border-top: none;
                border-right: 1px gray solid;
                border-bottom: 1px gray solid;
                animation-duration: 2s;
                animation-iteration-count: infinite;
                animation-name: arrow;
            }

        @keyframes arrow {
            0% {
                opacity: 1;
            }

            100% {
                opacity: 0;
                transform: translate(-10px, -10px);
            }
        }

        arrowgore,
        .arrowgore:before {
            position: absolute;
            left: 50%;
        }

        .arrowgore:hover {
            cursor: pointer;
        }

        .arrowgore {
            width: 40px;
            height: 40px;
            /* top: 61%; */
            position: relative;
            top: 88vh;
            left: 50%;
            margin: -20px 0 0 -20px;
            -webkit-transform: rotate(45deg);
            border-left: none;
            border-top: none;
            border-right: 2px gray solid;
            border-bottom: 2px gray solid;
            -webkit-transform: rotate(225deg);
            -moz-transform: rotate(225deg);
            -o-transform: rotate(225deg);
            -ms-transform: rotate(225deg);
            transform: rotate(225deg);
        }

            .arrowgore:before {
                content: "";
                width: 20px;
                height: 20px;
                top: 50%;
                margin: -10px 0 0 -10px;
                border-left: none;
                border-top: none;
                border-right: 1px gray solid;
                border-bottom: 1px gray solid;
                animation-duration: 2s;
                animation-iteration-count: infinite;
                animation-name: arrowgore;
            }

        @keyframes arrowgore {
            0% {
                opacity: 1;
            }

            100% {
                opacity: 0;
                transform: translate(-10px, -10px);
            }
        }


        @media only screen and (max-height: 900px) {
            #gridsA {
                margin: 0 auto;
                position: absolute;
                /*zoom: 0.85;*/
                display: flex;
            }

            #OtherStatA {
                /*bottom: 13%;
                zoom: 0.8;*/
            }

            #mainConfB1 {
                margin: 0 auto;
                position: absolute;
                display: flex;
                padding-top: 50px;
                /*zoom: 0.83;*/
            }


            #mainConfB2 {
                margin: 0 auto;
                position: absolute;
                display: flex;
                padding-top: 450px;
                /*zoom: 0.83;*/
            }

            .arrowgore {
                top: 84vh;
            }
        }

        @media only screen and (max-height: 768px) {

            #gridsA {
                margin: 0 auto;
                position: absolute;
                zoom:1;
                display: flex;
            }

            #OtherStatA {
                bottom: 13%;
                zoom: 1;
            }

            #mainConfB1 {
                margin: 0 auto;
                position: absolute;
                display: flex;
                padding-top: 50px;
                zoom: 1;
            }


            #mainConfB2 {
                margin: 0 auto;
                position: absolute;
                display: flex;
                padding-top: 450px;
                zoom: 1;
            }

            .arrowgore {
                top: 84vh;
            }
        }



        @import url(https://fonts.googleapis.com/css?family=Abel);

        *, *:after, *:before {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            font-weight: 500;
            margin: 0;
            outline: 0 none;
            padding: 0;
        }

        .menu {
            cursor: pointer;
            padding: 15px;
            max-height: 100%;
            overflow: hidden;
            top: 20px;
            position: absolute;
            z-index: 999;
        }

            .menu .line {
                height: 3px;
                display: block;
                width: 30px;
                background: rgb(97, 96, 96);
                margin: 5px;
                opacity: 1;
                transition: all 500ms ease;
            }

            .menu.active .line:nth-child(1) {
                height: 34vh;
                width: 260px;
                margin-top: -5px;
                margin-left: -5px;
                z-index: 9;
                left: 0;
            }

            .menu.active .line:nth-child(2),
            .menu.active .line:nth-child(3) {
                opacity: 0;
            }
            

        .nav {
            padding: 20px;
        }

        .menu:not(.active) .nav li {
            opacity: 0;
            margin-bottom: -10px;
        }

        .menu .nav li {
            opacity: 1;
            font-size: 12px;
            transition: opacity 500ms ease, margin-bottom 500ms ease, padding-left 250ms ease;
        }

            .menu .nav li:hover {
                padding-left: 5px;
            }

        .menuas {
            font-size: larger;
            color: orange;
            font-style: normal;
        }

        h1 {
            font-size: 26px;
            line-height: 45px;
            /*text-transform: uppercase;*/
            margin-left: 5%;
            /* margin-bottom: 20px; */
            margin-top: 30px;
        }
    </style>

    <%-- Arrow Scroll to Down --%>
    <script>
        $(document).ready(function () {
            $("#arrow").click(function () {
                $('html, body').animate({
                    scrollTop: $("#confB").offset().top
                }, 2000);
            });

            $("#arrowgore").click(function () {
                $('html, body').animate({
                    scrollTop: $("#confA").offset().top
                }, 2000);
            });

            $(".menu").click(function () {
                $(this).toggleClass("active");
            });
        });
    </script>

    <script>

        $(document).ready(function () {

       

            var d = new Date();
            var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

            var date = document.getElementById("date");
            var time = document.getElementById("time");
            var date1 = document.getElementById("date1");

            function getDate() {
                date.innerHTML = monthNames[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
                date1.innerHTML = monthNames[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();

            }

            getDate();

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">

        <div class="container-fluid confA">

            <%-- MAIN STATISTIC CONF A --%>
            <div id="confA">
                <div class="row animated fadeInDown" style="animation-delay: 0.3s;">
                    <div class="">
                        <h1><span style="color: #2c387b; font-weight: 600;">PERSONALE ASSENTE</span> - <span style="color: red; font-weight: 600;">Reparto STIRO</span></h1>

                        <div style="position: absolute; top: 0px; right: 40px;">

                            <h1 id="date" class="date" style="width: 255px;"></h1>
                            <ul style="width: 255px;">
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="tt">Totale:</asp:Label><asp:Label runat="server" ID="lbltotConfAPT"></asp:Label></li>
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="pp">Presenti:</asp:Label><asp:Label runat="server" ID="lbltotConfAPP"></asp:Label></li>
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="as">Assenti:</asp:Label><asp:Label runat="server" ID="lbltotConfAASS"></asp:Label></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--          <br />
                <br />--%>

            <div class="menu animated fadeIn" style="animation-delay: 0.4s;">
                <%-- Small Menu --%>
                <i class="line">
                    <ul class="nav">
                        <li><a href="form-addemployee.aspx" target="_blank" class="menuas" style="margin-top: 50px;">Manage Organigramma</a></li>
                        <li><a href="form-angajati.aspx" target="_blank" class="menuas">Manage Tablet</a></li>
                        <hr style="background: #e4e4e4;" />
                        <li><a href="ConfezioneA.aspx" target="_blank" class="menuas">Confezione A</a></li>
                        <li><a href="ConfezioneB.aspx" target="_blank" class="menuas">Confezione B</a></li>
                        <li><a href="Stiro.aspx" target="_blank" class="menuas">Stiro</a></li>
                    </ul>
                </i><i class="line"></i><i class="line"></i>
            </div>
            <br />
            <br />

            <br />
            <br />

            <div class="row animated fadeIn text-center" style="animation-delay: 0.4s">
                <div class="container">
                    <div id="gridsA">

                        <%-- L1 A --%>
                        <div>
                            <asp:Table runat="server" CssClass="grid" Style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" Style="border: none!important; padding: 5px; font-weight: 600;">LINEA1</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell Style="width: 55%; border-color: silver; border-top-style: dotted; border-top-width: 2px; border-right-style: dotted; border-right-width: 2px; padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Style="border-color: silver; border-top-width: 2px; padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <asp:DataGrid runat="server" CssClass="grid" ID="dgvA1" OnItemDataBound="Grid_DataBound" ShowHeader="false"></asp:DataGrid>
                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL1A" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL1A" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL1A" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>

                        <%-- L2 A --%>
                        <div>
                            <asp:Table runat="server" CssClass="grid" Style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" Style="border: none!important; padding: 5px; font-weight: 600;">LINEA2</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell Style="width: 55%; border-color: silver; border-top-style: dotted; border-top-width: 2px; border-right-style: dotted; border-right-width: 2px; padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Style="border-color: silver; border-top-width: 2px; padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />

                            <asp:DataGrid runat="server" CssClass="grid" ID="dgvA2" OnItemDataBound="Grid_DataBound" ShowHeader="false"></asp:DataGrid>
                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL2A" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL2A" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL2A" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>

                        <%-- L3 A --%>
                        <div>
                            <asp:Table runat="server" CssClass="grid" Style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" Style="border: none!important; padding: 5px; font-weight: 600;">LINEA3</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell Style="width: 55%; border-color: silver; border-top-style: dotted; border-top-width: 2px; border-right-style: dotted; border-right-width: 2px; padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell Style="border-color: silver; border-top-width: 2px; padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <asp:DataGrid runat="server" CssClass="grid" ID="dgvA3" OnItemDataBound="Grid_DataBound" ShowHeader="false"></asp:DataGrid>

                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL3A" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL3A" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL3A" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>

                        </div>

                    </div>
                </div>
            </div>


            <div class="arrow" id="arrow"></div>
        </div>



        <div class="container-fluid confB">

            <div id="confB">
                <div class="row">
                    <div class="">
                        <h1><span style="color: #2c387b; font-weight: 600;">PERSONALE ASSENTE</span> - <span style="color: red; font-weight: 600;">Reparto STIRO B</span></h1>
                        <div style="top: 100vh; right: 0px; width: 285px; position: absolute;">
                            <h1 id="date1" class="date"></h1>

                            <ul>
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="ttt">Totale:</asp:Label><asp:Label runat="server" ID="lbltotConfBPT"></asp:Label></li>
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="ppp">Presenti:</asp:Label><asp:Label runat="server" ID="lbltotConfBPP"></asp:Label></li>
                                <li class="desnibox">
                                    <asp:Label runat="server" ID="asas">Assenti:</asp:Label><asp:Label runat="server" ID="lbltotConfBAS"></asp:Label></li>
                            </ul>


                        </div>
                    </div>
                </div>

                <div class="container">

                    <div class="row" id="mainConfB1" style="margin: 0 auto; position: absolute; display: flex; padding-top: 50px;">
                        <%-- L1 B --%>
                        <div>
                            <%-- L1 B --%>
                             <asp:Table runat="server" CssClass="grid" style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" style="border:none!important;padding: 5px;font-weight: 600;">LINEA1</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell style="width:52%;border-color:silver;border-top-style:dotted;border-top-width:2px;border-right-style:dotted;border-right-width:2px;padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell style="border-color:silver;border-top-width:2px;padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <asp:DataGrid runat="server" CssClass="grid"  ID="dgvB1" OnItemDataBound="Grid_DataBound" ShowHeader="false"></asp:DataGrid>
                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL1B" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL1B" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL1B" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <%-- L2 B--%>
                        <div>
                             <asp:Table runat="server" CssClass="grid" style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" style="border:none!important;padding: 5px;font-weight: 600;">LINEA2</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell style="width:52%;border-color:silver;border-top-style:dotted;border-top-width:2px;border-right-style:dotted;border-right-width:2px;padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell style="border-color:silver;border-top-width:2px;padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <asp:DataGrid runat="server" CssClass="grid" ID="dgvB2" OnItemDataBound="Grid_DataBound" ShowHeader="false" ></asp:DataGrid>
                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL2B" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL2B" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL2B" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                        <%-- L3 B --%>
                        <div>
                             <asp:Table runat="server" CssClass="grid" style="border: silver 2px double;">
                                <asp:TableRow>
                                    <asp:TableCell CssClass="" ColumnSpan="2" style="border:none!important;padding: 5px;font-weight: 600;">LINEA3</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableHeaderCell style="width:52%;border-color:silver;border-top-style:dotted;border-top-width:2px;border-right-style:dotted;border-right-width:2px;padding: 2px;">
                                        Cognome e Nome
                                    </asp:TableHeaderCell>
                                    <asp:TableHeaderCell style="border-color:silver;border-top-width:2px;padding: 2px;">
                                        Fase
                                    </asp:TableHeaderCell>
                                </asp:TableRow>
                            </asp:Table>
                            <br />
                            <asp:DataGrid runat="server" CssClass="grid"  ID="dgvB3" OnItemDataBound="Grid_DataBound" ShowHeader="false"></asp:DataGrid>

                            <asp:Table runat="server" CssClass="footerrow">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblPTL3B" CssClass="infospan" Style="padding-left: 5px; color: DarkSlateGray;">tes</asp:Label>
                                        <asp:Label runat="server" ID="lblPPL3B" CssClass="infospan" Style="padding-left: 5px;">tes</asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblASL3B" CssClass="infospan" Style="float: right;">tes</asp:Label>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>

                    <%-- OTHER STATISTIC CONF A --%>
                    <div class="row animated fadeInUp" id="OtherStatA" style="animation-delay: 0.3s; background: rgb(228, 228, 228); height: 250px; bottom: 8%; width: 100%; position: absolute; display: none;">
                        <div style="margin: 0 auto; display: flex;">

                            <%-- TECHNICHI --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="TECCHNICE" ID="dgvTechnicheA" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- UFFICO --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="UFFICIO" ID="dgvUffico" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- Controllo qualita --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="CONTROLLO QUALITA" ID="dgvCQA" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- Rammendo --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="RAMMENDO" ID="dgvRamA" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- Meccanico --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="MECCANICO" ID="dgvMeccanico" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- Maggazioneri --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="MAGAZZIONERI" ID="dgvMagazioneri" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>

                            <%-- PULIZIA --%>
                            <asp:DataGrid runat="server" CssClass="grid_other" Caption="PULIZIE" ID="dgvPulizia" OnItemDataBound="Grid_DataBound_Other_A" RowStyle-CssClass="GvGrid" HeaderStyle-CssClass="header"></asp:DataGrid>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
