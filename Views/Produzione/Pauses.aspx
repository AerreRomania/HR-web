<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Pauses.aspx.vb" Inherits="Stats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Statistics</title>
    	<meta charset="UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge" />


    <link runat="server" rel="shortcut icon" href="../../images/favicon.ico" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="../../images/favicon.ico" type="Images/Image/ico" />

    <link href="../../css/Content/bootstrap-theme.css" rel="stylesheet" />
    <link href="../../css/Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fonts/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/jquery-ui.min.js"></script>
    <script src="../../js/Scripts/bootstrap.min.js"></script>
    <script src="../../js/ui-bootstrap-tpls-0.11.0.js"></script>
    <script src="../../js/Scripts/app.js"></script>
    <link rel="stylesheet" href="../../css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../css/jquery-ui.css" />
    <script src="../../js/Chart.min.js"></script>

    <style>
        .results tr[visible='false'],
        .no-result {
            display: none;
        }

        .results tr[visible='true'] {
            display: table-row;
        }

        .counter {
            padding: 8px;
            color: #ccc;
        }

        #tbl-header a {
            color: white;
        }

        h1 {
            font-size: 30px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 300;
            text-align: center;
            margin-bottom: 15px;
        }

        .tbl-content table {
            width: 100%;
            table-layout: fixed;
        }

        .tbl-header table {
            width: 100%;
            table-layout: fixed;
        }

        .tbl-header {
            background-color: rgba(255,255,255,0.3);
        }

        .tbl-content {
            height: 300px;
            overflow-x: auto;
            margin-top: 0px;
            border: 1px solid rgba(255,255,255,0.3);
        }

            .tbl-content th {
                padding: 20px 15px;
                text-align: left;
                font-weight: 500;
                font-size: 12px;
                color: #fff;
                text-transform: uppercase;
            }

            .tbl-content td {
                padding: 15px;
                text-align: left;
                vertical-align: middle;
                font-weight: 300;
                font-size: 12px;
                color: #fff;
                border-bottom: solid 1px rgba(255,255,255,0.1);
            }

        .tbl-header th {
            padding: 20px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 12px;
            color: #fff;
            text-transform: uppercase;
        }

        .tbl-header td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 12px;
            color: #fff;
            border-bottom: solid 1px rgba(255,255,255,0.1);
        }


        /* demo styles */

        @import url(http://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

        section {
            margin: 50px;
        }


        .FixedHeader {
            position: absolute;
            font-weight: bold;
        }


        .calendar {
            height: 60px;
            width: 100px;
        }

        .pause-report {
            /*box-shadow: 9px 7px 40px 5px rgba(0,0,0,0.25);*/
            overflow: hidden;
            /*width: 1200px;*/
            padding: 0;
            margin-top: 50px;
            /*height: 1000px;*/
            /*min-height: 500px;*/
            margin: 0 auto;
            border-radius: 5px;
            position: relative;
        }



        @import url(https://fonts.googleapis.com/css?family=Roboto:300,500);

        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font: inherit;
            font-size: 100%;
            vertical-align: baseline;
        }

        html {
            line-height: 1;
        }

        ol, ul {
            list-style: none;
        }


        q, blockquote {
            quotes: none;
        }

            q:before, q:after, blockquote:before, blockquote:after {
                content: "";
                content: none;
            }

        a img {
            border: none;
        }

        article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
            display: block;
        }

        * {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            background-color: #69787b;
            font-family: 'Roboto', sans-serif;
            font-size: 1em;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 15px;
        }

        header {
            /*padding: 3.5rem 10%;*/
            background-color: rgba(74,74,74, 0.8);
            margin-bottom: 1.5rem;
            text-align: center;
            /*position:absolute;*/
        }

            header svg {
                max-width: 20px;
                display: inline-block;
                fill: #1abc9c;
                vertical-align: -2px;
            }

            header h1,
            header h2,
            header p {
                color: #2c3e50;
                margin-bottom: 1rem;
            }

            header h1 {
                font-weight: 300;
                color: #1abc9c;
                letter-spacing: -0.1rem;
                font-size: 2rem;
                text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);
            }

            header h2 {
                font-size: .8rem;
                margin-bottom: 0;
            }

                header h2 span {
                    font-weight: 300;
                    display: inlie-block;
                    padding: 0 8px;
                    font-size: 80%;
                    color: #fff;
                    -moz-border-radius: 4px;
                    -webkit-border-radius: 4px;
                    border-radius: 4px;
                }

                    header h2 span.js {
                        background-color: #E4A128;
                    }

                    header h2 span.css {
                        background-color: #0070BB;
                    }

                    header h2 span.heart {
                        background-color: #EB304A;
                    }

                p {
                    line-height: 1.5;
                    text-align: left;
                    font-weight: 300;
                    font-size: 1rem;
                }

                .card-drop {
                    position: relative;
                    margin: 0 auto;
                    z-index: 9;
                    -moz-perspective: 800px;
                    -webkit-perspective: 800px;
                    perspective: 800px;
                    background: rgba(0, 0, 0, 0.1);
                    margin-bottom: 100px;
                }

            .card-drop a {
                display: block;
                width: 100%;
                padding: 20px 0 20px 20px;
                height: 60px;
                text-decoration: none;
                color: #504c46;
                background-color: #fafafa;
                border: 1px solid #ddd;
                -moz-transition: all 0.3s ease-out;
                -o-transition: all 0.3s ease-out;
                -webkit-transition: all 0.3s ease-out;
                transition: all 0.3s ease-out;
            }

                .card-drop a i {
                    display: inline-block;
                    width: 20px;
                }

            .card-drop > a.toggle {
                position: relative;
                z-index: 100;
                -moz-backface-visibility: hidden;
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                -moz-transform-style: preserve-3d;
                -webkit-transform-style: preserve-3d;
                transform-style: preserve-3d;
                -moz-transform-origin: 50% 0%;
                -ms-transform-origin: 50% 0%;
                -webkit-transform-origin: 50% 0%;
                transform-origin: 50% 0%;
                -moz-transition: linear 0.1s;
                -o-transition: linear 0.1s;
                -webkit-transition: linear 0.1s;
                transition: linear 0.1s;
            }

                .card-drop > a.toggle:active {
                    -moz-transform: rotateX(60deg);
                    -webkit-transform: rotateX(60deg);
                    transform: rotateX(60deg);
                }

                    .card-drop > a.toggle:active:after {
                        -moz-transform: rotateX(180deg);
                        -webkit-transform: rotateX(180deg);
                        transform: rotateX(180deg);
                    }

                .card-drop > a.toggle:before, .card-drop > a.toggle:after {
                    content: "";
                    position: absolute;
                }

                .card-drop > a.toggle:before {
                    right: 25px;
                    top: 50%;
                    margin-top: -2.5px;
                    border-left: 6px solid transparent;
                    border-right: 6px solid transparent;
                    border-top: 6px solid rgba(0, 0, 0, 0.8);
                }

                .card-drop > a.toggle.active:before {
                    transform: rotate(180deg);
                }

            .card-drop ul {
                position: absolute;
                height: 100%;
                top: 0;
                display: block;
                width: 100%;
            }

                .card-drop ul li {
                    margin: 0 auto;
                    -moz-transition: all, ease-out 0.3s;
                    -o-transition: all, ease-out 0.3s;
                    -webkit-transition: all, ease-out 0.3s;
                    transition: all, ease-out 0.3s;
                    position: absolute;
                    top: 0;
                    z-index: 0;
                    width: 100%;
                }

                    .card-drop ul li a {
                        border-top: none;
                    }

                        .card-drop ul li a:hover {
                            background-color: #96a0a2;
                            color: #f3f9fd;
                        }

                    .card-drop ul li.active a {
                        color: #fff;
                        background-color: #505354;
                        cursor: default;
                    }

                    .card-drop ul li.closed a:hover {
                        cursor: default;
                        background-color: #3498db;
                    }


        /* for custom scrollbar for webkit browser*/

        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }

        ::-webkit-scrollbar-thumb {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }


        .ui-datepicker,
        .ui-datepicker-material-header {
            font-family: 'Roboto';
        }

        .ui-datepicker-material-header {
            display: block;
            background-color: #284B72;
            color: white;
            text-align: center;
            width: 325px;
        }

            .ui-datepicker-material-header .ui-datepicker-material-day {
                background-color: #1F3A58;
                padding: 10px;
                font-size: 1rem;
            }

            .ui-datepicker-material-header .ui-datepicker-material-date {
                padding: 20px;
            }

                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-month,
                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-day-num,
                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-year {
                    padding: 5px;
                }

                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-month {
                    font-size: 2rem;
                    text-transform: uppercase;
                }

                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-day-num {
                    font-size: 4.5rem;
                }

                .ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-year {
                    font-size: 1.8rem;
                    font-weight: 200;
                    color: rgba(255, 255, 255, 0.4);
                }

        .ui-datepicker {
            padding: 0;
            border: none;
            box-shadow: 0 12px 36px 16px rgba(0, 0, 0, 0.24);
            width: 325px;
        }

        .ui-corner-all {
            border-radius: 0;
        }

        .ui-widget-header {
            border: 0;
        }

        .ui-datepicker-header {
            text-align: center;
            background: white;
            padding-bottom: 15px;
            font-weight: 300;
        }

            .ui-datepicker-header .ui-datepicker-prev,
            .ui-datepicker-header .ui-datepicker-next,
            .ui-datepicker-header .ui-datepicker-title {
                border: none;
                outline: none;
                margin: 5px;
            }

        .ui-datepicker-prev.ui-state-hover,
        .ui-datepicker-next.ui-state-hover {
            border: none;
            outline: none;
            background: #b4cbe5;
        }

        .ui-datepicker-calendar .ui-state-default {
            background: none;
            border: none;
            text-align: center;
            height: 33px;
            width: 33px;
            line-height: 36px;
        }

        .ui-datepicker-calendar .ui-state-highlight {
            color: #284B72;
        }

        .ui-datepicker-calendar .ui-state-active {
            border-radius: 50%;
            background-color: #284B72;
            color: white;
        }

        .ui-datepicker-calendar thead th {
            color: #999999;
            font-weight: 200;
        }

        .ui-datepicker-buttonpane {
            border: none;
        }

            .ui-datepicker-buttonpane .ui-state-default {
                background: white;
                border: none;
            }

            .ui-datepicker-buttonpane .ui-datepicker-close,
            .ui-datepicker-buttonpane .ui-datepicker-current {
                background: white;
                color: #284B72;
                text-transform: uppercase;
                border: none;
                opacity: 1;
                font-weight: 200;
                outline: none;
            }

                .ui-datepicker-buttonpane .ui-datepicker-close:hover,
                .ui-datepicker-buttonpane .ui-datepicker-current:hover {
                    background: #b4cbe5;
                }


        .gridheader {
            font-weight: 900;
            color: #ffffff;
            background: #ea6153;
            position: absolute;
            /*width:1080px;*/
        }


        .logo {
            height: 100px;
        }


        .wrapper {
            margin: 0 auto;
            padding: 40px;
        }

        .showkalendar {
            position: absolute;
            /*top: 20px;*/
            left: 20px;
            text-transform: uppercase;
            padding: 5px 10px;
            outline: none;
            font-size: .6em;
            background-color: transparent;
            color: #fff;
            border: 1px solid #fff;
            letter-spacing: 1px;
            -webkit-transition: all 250ms;
            transition: all 250ms;
        }

            .showkalendar:hover {
                background-color: #fff;
                color: #0d0d0d;
                box-shadow: 0 0 2px #fff;
            }

            .showkalendar:active {
                opacity: 0.5;
            }

        /*CHART*/
        *:before,
        *:after {
            box-sizing: inherit;
        }

        /*html {
            box-sizing: border-box;
            background: #252329;
        }*/

        .l-chart {
            padding: 20px;
            /*background: #252329;*/
            color: white;
        }

        .aspect-ratio {
            height: 0;
            padding-bottom: 50%;
            /* 495h / 990w : The Intended dimensions */
        }

        
    </style>
</head>
<body class="forhtml">
    <form id="form1" runat="server">
        <%-- HEADER --%>
        <header>
            <div class="container">
                <img alt="logo" id="logo" class="logo" src="images/logo.svg" />
            </div>
        </header>

        <%-- DROPDOWN Selector --%>
        <div class="container">
            <div class="card-drop">
                <a class='toggle' href="#">
                    <i class='fa fa-pause'></i>
                    <span class='label-active'>Pause Report</span>
                </a>
                <ul>
                    <li class='active'>
                        <a data-label="Pause Report" href="#" onclick="show('Page1');"><i class='fa fa-pause'></i>Pause Report</a>
                    </li>
                    <li>
                        <a data-label="Assenteismo Report" href="#" onclick="show('Page2');"><i class='fa fa-thermometer-half'></i>Assenteismo Report</a>
                    </li>
                    <li>
                        <a data-label="Employee Report" href="#" onclick="show('Page3');"><i class='fa fa-address-book-o'></i>Employee Report</a>
                    </li>
                    <li>
                        <a data-label="Capi Report" href="#" onclick="show('Page4');"><i class='fa fa-check-square-o'></i>Capi Report</a>
                    </li>

                </ul>
            </div>
        </div>

        <div id="Page1" class="page col-md-12 pause-report">
            <%-- KALENDAR --%>
            <div class="row">
                <div class="col-md-2">
                    <span><a href="ConfezioneA.aspx" id="showkal1" class="showkalendar" >Confezione A</a><br /></span><br />
                    <span><a href="ConfezioneB.aspx" id="showkal2" class="showkalendar" >Confezione B</a></span><br /><br />
                    <span><a href="Stiro.aspx" id="showkal3" class="showkalendar" >Stiro</a></span><br /><br /><br />

                    <a href="#" id="showkal" class="showkalendar" onclick="javascript:$('#datetimecalendar').show();">Select Date</a>
                    <br />
                    <br />
                    <br />

                    <asp:Calendar ID="datetimecalendar" runat="server" Style="border: 1px solid rgba(255,255,255,0.3);" ShowGridLines="true" Width="200" BorderStyle="None" ForeColor="white" TitleStyle-BackColor="#96a0a2" ShowDayHeader="false"></asp:Calendar>

                </div>
                <div class="col-md-8">
                    <section>
                        <%-- SEARCH TOP RIGHT --%>
                        <div class="form-group pull-right">
                            <input type="text" class="search form-control" placeholder="What you looking for?">
                        </div>
                        <%-- COUNTER --%>
                        <span class="counter pull-right"></span>



                        <%-- GRID VIEW HEADER --%>
                        <div class="tbl-header">
                            <%-- H1 Naslov Tabele --%>
                            <p style="line-height: 1.5; text-align: left; font-weight: 500; font-size: 2rem; padding-left: 13px; color: white;">Pause employee report</p>
                            <table id="tbl-header" cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>
                                            <asp:LinkButton ID="wrkname" Text="Worker Name" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkpausetype" Text="Pause Type" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkduration" Text="Duration" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkstarttime" Text="Start" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkstoptime" Text="Stop" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkdate" Text="Date" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrkcount" Text="Count" runat="server" /></th>
                                        <th>
                                            <asp:LinkButton ID="wrklinea" Text="Linea" runat="server" /></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>

                        <%-- GRID VIEW --%>
                        <div class="tbl-content">
                            <table id="tbl-content" cellpadding="0" cellspacing="0" border="0">
                                <tbody>
                                    <asp:GridView runat="server" ID="wcgrid" ShowHeader="false" CssClass="results" OnPageIndexChanging="SubmitAppraisalGrid_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HorizontalAlign="Center" AllowSorting="false"></asp:GridView>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
                <div class="col-md-2"></div>
            </div>

            <%-- CHART --%>
            <div class="chart row">
                <div class="col-md-1"></div>
                <div class="charts col-md-5" style="margin-top: 80px;">
                    <h1>Totaly Employee WC Pause - Line and Day</h1>
                    <section>
                        <div class="l-chart">
                            <div class="aspect-ratio">
                                <canvas id="chart"></canvas>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="charts col-md-5" style="margin-top: 80px;">
                    <h1>Maximum numbers pause break per person</h1>
                    <section>
                        <div class="l-chart">
                            <div class="aspect-ratio">
                                <canvas id="chart1" ></canvas>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="col-md-1">
                <asp:Label ID="linea1m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea2m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea3m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea4m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea5m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea6m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea7m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea8m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea9m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea10m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea11m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea12m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea13m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea14m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea15m" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="linea16m" runat="server" style="display:none"></asp:Label>

            </div>
        </div>

        <div id="Page2" class="page"></div>
        <div id="Page3" class="page"></div>
        <div id="Page4" class="page"></div>
        <div id="Page5" class="page"></div>

        <asp:HiddenField ID="checker1" Value="true" runat="server" />
        <asp:HiddenField ID="checker2" Value="true" runat="server" />
        <asp:HiddenField ID="checker3" Value="true" runat="server" />
        <asp:HiddenField ID="checker4" Value="true" runat="server" />
        <asp:HiddenField ID="checker5" Value="true" runat="server" />
        <asp:HiddenField ID="checker6" Value="true" runat="server" />
        <asp:HiddenField ID="checker7" Value="true" runat="server" />
        <asp:HiddenField ID="checker8" Value="true" runat="server" />
        <asp:HiddenField ID="checkerdate" Value="false" runat="server" />

    </form>

    <%-- Dropdown --%>
    <script>
        (function ($) {

            var cards = $(".card-drop"),
                toggler = cards.find(".toggle"),
                links = cards.find("ul>li>a"),
                li = links.parent('li'),
                count = links.length,
                width = 100;

            //set z-Index of drop Items
            li.each(function (i) {
                $(this).css("z-index", count - i); //invert the index values
            });

            //set top margins & widths of li elements
            function setClosed() {
                li.each(function (index) {
                    $(this).css("top", index * 4)
                        .css("width", (width - index * .5) + "%")
                        .css("margin-left", (index * .25) + "%")
                });
                li.addClass('closed');
                toggler.removeClass("active");
            }
            setClosed();

            /* -------------------------------------------------------- */
            /*	Toggler Click handler
            /* -------------------------------------------------------- */
            toggler.on("mousedown", function () {
                var $this = $(this); //cache $(this)
                //if the menu is active:
                if ($this.is(".active")) {
                    setClosed();
                } else {
                    //if the menu is un-active:
                    $this.addClass("active");
                    li.removeClass('closed');
                    //set top margins
                    li.each(function (index) {
                        $(this).css("top", 60 * (index + 1))
                            .css("width", "100%")
                            .css("margin-left", "0px");
                    });
                }
            });

            /* -------------------------------------------------------- */
            /*	Links Click handler
            /* -------------------------------------------------------- */
            links.on("click", function (e) {
                var $this = $(this),
                    label = $this.data("label");
                icon = $this.children("i").attr("class");

                li.removeClass('active');
                if ($this.parent("li").is("active")) {
                    $this.parent('li').removeClass("active");
                } else {
                    $this.parent("li").addClass("active");
                }
                toggler.children("span").text(label);
                toggler.children("i").removeClass().addClass(icon);
                setClosed();
                e.preventDefault;
            });

        })(jQuery);
    </script>

    <%-- Show / Hide Pages --%>
    <script>
        // show the given page, hide the rest
        function show(elementID) {
            // try to find the requested page and alert if it's not found
            var ele = document.getElementById(elementID);
            if (!ele) {
                alert("no such element");
                return;
            }

            // get all pages, loop through them and hide them
            var pages = document.getElementsByClassName('page');
            var charts = document.getElementsByClassName('chart');
            for (var i = 0; i < pages.length; i++) {
                pages[i].style.display = 'none';
            }

            for (var i = 0; i < charts.length; i++) {
                charts[i].style.display = 'none';
            }

            // then show the requested page
            ele.style.display = 'block';
            charts.style.display = 'block';
            //'charts[i].style.display = 'block';
        }

    </script>

    <%-- GRID VIEW --%>
    <script>
        // '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
        $(window).on("load resize ", function () {
            var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
            $('.tbl-header').css({ 'padding-right': scrollWidth });
        }).resize();

    </script>

    <%-- SEARCH --%>
    <script>
        $(document).ready(function () {
            $(".search").keyup(function () {
                var searchTerm = $(".search").val();
                var listItem = $('.results tbody').children('tr');
                var searchSplit = searchTerm.replace(/ /g, "'):containsi('")

                $.extend($.expr[':'], {
                    'containsi': function (elem, i, match, array) {
                        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
                    }
                });

                $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function (e) {
                    $(this).attr('visible', 'false');
                });

                $(".results tbody tr:containsi('" + searchSplit + "')").each(function (e) {
                    $(this).attr('visible', 'true');
                });

                var jobCount = $('.results tbody tr[visible="true"]').length;
                $('.counter').text(jobCount + ' item');

                if (jobCount == '0') { $('.no-result').show(); }
                else { $('.no-result').hide(); }
            });
        });
    </script>

    <%-- CHART LEVI --%>
    <script>
        Chart.defaults.global.animationEasing = 'easeInOutQuad',
        Chart.defaults.global.responsive = true;
        Chart.defaults.global.scaleOverride = true;
        Chart.defaults.global.scaleShowLabels = true;
        Chart.defaults.global.scaleSteps = 10;
        Chart.defaults.global.scaleStepWidth = 6;
        Chart.defaults.global.scaleStartValue = 0;
        Chart.defaults.global.tooltipFontFamily = 'Open Sans';
        Chart.defaults.global.tooltipFillColor = '#FFFFFF';
        Chart.defaults.global.tooltipFontColor = '#6E6E6E';
        Chart.defaults.global.tooltipCaretSize = 0;
        Chart.defaults.global.maintainAspectRatio = true;
        Chart.defaults.global.scaleFontColor = '#fff';        

        Chart.defaults.Line.scaleShowHorizontalLines = false;
        Chart.defaults.Line.scaleShowHorizontalLines = false;
        Chart.defaults.Line.scaleGridLineColor = '#55505C';
        Chart.defaults.Line.scaleLineColor = '#fff';

        var chart = document.getElementById('chart').getContext('2d'),
            gradient = chart.createLinearGradient(0, 0, 0, 450);

        var data = {
            labels: ['Linea 1', 'Linea 2', 'Linea 3', 'Linea 4', 'Linea 5', 'Linea 6', 'Linea 7', 'Linea 8', 'Linea 9', 'Linea 10', 'Linea 11', 'Linea 12','Linea 13', 'Linea 14', 'Linea 15', 'Linea 16'],

            datasets: [
                {
                    label: 'Max Count per pause per linea',
                    fillColor: gradient,
                    strokeColor: '#505354',
                    pointColor: 'white',
                    pointStrokeColor: 'rgba(220,220,220,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: [document.getElementById('linea1m').textContent, document.getElementById('linea2m').textContent, document.getElementById('linea3m').textContent, document.getElementById('linea4m').textContent, document.getElementById('linea5m').textContent, document.getElementById('linea6m').textContent, document.getElementById('linea7m').textContent, document.getElementById('linea8m').textContent, document.getElementById('linea9m').textContent, document.getElementById('linea10m').textContent, document.getElementById('linea11m').textContent, document.getElementById('linea12m').textContent, document.getElementById('linea13m').textContent, document.getElementById('linea14m').textContent, document.getElementById('linea15m').textContent, document.getElementById('linea16m').textContent,]
                }
            ]
        };

        gradient.addColorStop(0, 'rgba(85,85,85, 0.5)');
        gradient.addColorStop(0.5, 'rgba(85, 85, 85, 0.25)');
        gradient.addColorStop(1, 'rgba(85, 85, 85, 0)');

        var chart = new Chart(chart).Line(data);
    </script>

    <%-- CHART DESNI --%>
    <script>
        Chart.defaults.global.animationEasing = 'easeInOutQuad',
        Chart.defaults.global.responsive = true;
        Chart.defaults.global.scaleOverride = true;
        Chart.defaults.global.scaleShowLabels = false;
        Chart.defaults.global.scaleSteps = 10;
        Chart.defaults.global.scaleStepWidth = 10;
        Chart.defaults.global.scaleStartValue = 0;
        Chart.defaults.global.tooltipFontFamily = 'Open Sans';
        Chart.defaults.global.tooltipFillColor = '#FFFFFF';
        Chart.defaults.global.tooltipFontColor = '#6E6E6E';
        Chart.defaults.global.tooltipCaretSize = 0;
        Chart.defaults.global.maintainAspectRatio = true;
        Chart.defaults.global.scaleFontColor = '#fff';        


        Chart.defaults.Line.scaleShowHorizontalLines = false;
        Chart.defaults.Line.scaleShowHorizontalLines = false;
        Chart.defaults.Line.scaleGridLineColor = '#55505C';
        Chart.defaults.Line.scaleLineColor = '#fff';
        Chart.defaults.Line.labelColor = '#fff';

        var chart = document.getElementById('chart1').getContext('2d'),
            gradient = chart.createLinearGradient(0, 0, 0, 450);

        var data = {
            labels: ['text1', 'text2', 'text3', 'text4', 'text5', 'text6', 'text7', 'text8', 'text9', 'text10', 'text11', 'text12'],
            
            datasets: [
                {
                    label: 'Max Count per pause per linea',
                    fillColor: gradient,
                    strokeColor: '#505354',
                    pointColor: 'white',
                    pointStrokeColor: 'rgba(220,220,220,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,]
                }
            ]
        };

        gradient.addColorStop(0, 'rgba(74,74,74, 0.5)');
        gradient.addColorStop(0.5, 'rgba(74,74,74, 0.25)');
        gradient.addColorStop(1, 'rgba(74,74,74, 0)');

        var chart = new Chart(chart).Line(data);
    </script>
    <%-- HIDE KALENDAR --%>
    <script>
        $(document).ready(function (){
            $('#datetimecalendar').hide();
        });
    </script>

</body>
</html>
