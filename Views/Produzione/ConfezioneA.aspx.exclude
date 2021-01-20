<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ConfezioneA.aspx.vb" Async="true" ValidateRequest="false"  Inherits="Views.Produzione.ConfezioneA" MasterPageFile="~/Views/Produzione/Site.master" %>

<%--<link rel="shortcut icon" type="Images/Image/ico"  href="@Url.Content("~/favicon.ico")">--%>

<asp:Content runat="server" ID="ConfezioneA" ContentPlaceHolderID="MainConfA">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../css/Content/ConfA-css.css" />
    <link rel="stylesheet" href="../../css/Content/confa-internal.css" />

    <link rel="stylesheet" href="../../css/desktop/layout-confa.css" />
    <link rel="stylesheet" href="../../css/mobile/layout-confa.css" />

    <script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<%--    <script>
        $(document).ready(function () {
            var upd = $('.upd_confa');
            var scroll = $('.EachLineTB');
            $(upd).css = ('height', $(scroll).scrollHeight);
        });
    </script>--%>

    <style>
        .container-fluid{
            width:100%!important;
        }
        *:not(.fa):not(.docktitlesimagestd) {
            font-family: 'Exo', sans-serif!important;
        }
        table td[class*=col-], table th[class*=col-]{
            float:left!important;
        }

            body {
                overflow: auto;
                height:700px;
            }

         #left-navi {
             position: fixed;
             z-index: 12;
             background: #fff;
             height: 100%;
             width: 100%;
             max-width: 50px;
             left: 0;
             top: 75px;
             -webkit-box-shadow: 1px 1px 1px #dad7d7;
             box-shadow: 1px 1px 1px #dad7d7;
             -webkit-transition: all .4s ease .4s;
             -o-transition: all .4s ease .4s;
             transition: all .4s ease .4s;
         }

        .green-title {
            text-align: center;
            border-color: #2aab2a;
            line-height: 30px;
            font-weight: 500;
            font-size: initial;
            color: white !important;
            background: -webkit-linear-gradient(135deg, #2aab2a, LimeGreen, Green, LimeGreen);
            background: -o-linear-gradient(135deg, #2aab2a, LimeGreen, Green, LimeGreen);
            background: linear-gradient(-45deg, #2aab2a, LimeGreen, Green, LimeGreen);
            background: -o-linear-gradient(-45deg, #2aab2a, LimeGreen, Green, LimeGreen); 
            background: linear-gradient(-45deg, #2aab2a, LimeGreen, Green, LimeGreen); 
            background-size: 400% 400%;
            -webkit-animation: Gradient 15s ease infinite;
            animation: Gradient 15s ease infinite;
        }

        .red-title {
            background: -webkit-linear-gradient(135deg, red, red, #ab0020, #ab0020);
            background: -o-linear-gradient(135deg, red, red, #ab0020, #ab0020);
            background: linear-gradient(-45deg, red, red, #ab0020, #ab0020);
            background: -o-linear-gradient(-45deg, red, red, #ab0020, #ab0020);
            background: linear-gradient(-45deg, red, red, #ab0020, #ab0020); 
            background-size: 400% 400%;
            -webkit-animation: Gradient 15s ease infinite;
            animation: Gradient 15s ease infinite;
            text-align: center;
            border-color: Crimson;
            line-height: 30px;
            font-weight: 500;
            font-size: initial;
            color:white!important;
        }

        .yellow-title {
            background: -webkit-linear-gradient(-45deg,gold ,yellow, gold, Goldenrod);
            background: -o-linear-gradient(-45deg, gold, yellow, gold, Goldenrod); /* For Opera 11.1 to 12.0 */ /* For Firefox 3.6 to 15 */
            background: -webkit-linear-gradient(135deg,gold,yellow, gold, Goldenrod);
            background: -o-linear-gradient(135deg,gold,yellow, gold, Goldenrod);
            background: linear-gradient(-45deg,gold,yellow, gold, Goldenrod); /* Standard syntax */
            background-size: 400% 400%;
            -webkit-animation: Gradient 15s ease infinite;
            animation: Gradient 15s ease infinite;
            border-color: #f0ad4e;
            line-height: 30px;
            font-weight: 500;
            font-size: initial;
            color:black!important;
        }

        
        .silver-title {
            background: silver;
            background: -webkit-linear-gradient(-45deg,gray , silver, silver, gray);
            background: -o-linear-gradient(-45deg,gray ,silver, silver, gray); /* For Opera 11.1 to 12.0 */ /* For Firefox 3.6 to 15 */
            background: -webkit-linear-gradient(135deg,gray ,silver, silver, gray);
            background: -o-linear-gradient(135deg,gray ,silver, silver, gray);
            background: linear-gradient(-45deg,gray ,silver, silver, gray); /* Standard syntax */
            background-size: 400% 400%;
            -webkit-animation: Gradient 15s ease infinite;
            animation: Gradient 15s ease infinite;
            border-color: gray;
            line-height: 30px;
            font-weight: 500;
            font-size: initial;
        }



        @-webkit-keyframes Gradient {
            0% {
                background-position: 0% 50%
            }
            50% {
                background-position: 100% 50%
            }
            100% {
                background-position: 0% 50%
            }
        }

        @keyframes Gradient {
            0% {
                background-position: 0% 50%
            }

            50% {
                background-position: 100% 50%
            }

            100% {
                background-position: 0% 50%
            }
        }

        .h5_sort {
            line-height: 24px;
            background: #ababab;
            width: 173px;
            padding-right: 0px !important;
            padding-left: 0px !important;
            margin-left: -16px;
            margin-right: -16px;
            color: white;
        }

        .ManichinoCircleRotated {
            display: none;
        }

        .ManichinoCircle {
            display: none;
        }

        #tbl_fase td {
            font-size: 14px !important;
        }

        #checkboxWrapper td {
            font-size: 14px !important;
        }

        .loader {
            position: fixed;
            /*top: calc(50% - 32px);
            left: calc(50% - 32px);*/
            left: 100px;
            bottom: 30px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            -webkit-perspective: 800px;
            perspective: 800px;
        }

        .loader-text {
            position: fixed;
            margin: 0 auto;
            /*width: 400px;*/
            /*height: 64px;*/
            -webkit-perspective: 900px;
            perspective: 900px;
            color: white;
            font-size: medium;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            /*padding-top: 85px;*/
            font-family: 'Fira Sans', sans-serif;
            z-index: 99999;
            bottom: 30px;
            left: 150px;
            /*padding-left:30px;*/
            text-align: left;
        }

        .inner {
            position: absolute;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }

        .inner.one {
            left: 0%;
            top: 0%;
            -webkit-animation: rotate-one 1s linear infinite;
            animation: rotate-one 1s linear infinite;
            border-bottom: 3px solid #3c3c3e;
        }

        .inner.two {
            right: 0%;
            top: 0%;
            -webkit-animation: rotate-two 1s linear infinite;
            animation: rotate-two 1s linear infinite;
            border-right: 3px solid #3c3c3e;
        }

        .inner.three {
            right: 0%;
            bottom: 0%;
            -webkit-animation: rotate-three 1s linear infinite;
            animation: rotate-three 1s linear infinite;
            border-top: 3px solid #3c3c3e;
        }

        @-webkit-keyframes rotate-one {
            0% {
                -webkit-transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);
                transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);
                transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);
            }
        }

        @keyframes rotate-one {
            0% {
                -webkit-transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);
                transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);
                transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);
            }
        }

        @-webkit-keyframes rotate-two {
            0% {
                -webkit-transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);
                transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);
                transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);
            }
        }

        @keyframes rotate-two {
            0% {
                -webkit-transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);
                transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);
                transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);
            }
        }

        @-webkit-keyframes rotate-three {
            0% {
                -webkit-transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);
                transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(35deg) rotateY(55deg) rotateZ(360deg);
                transform: rotateX(35deg) rotateY(55deg) rotateZ(360deg);
            }
        }

        @keyframes rotate-three {
            0% {
                -webkit-transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);
                transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);
            }

            100% {
                -webkit-transform: rotateX(35deg) rotateY(55deg) rotateZ(360deg);
                transform: rotateX(35deg) rotateY(55deg) rotateZ(360deg);
            }
        }

        @-webkit-keyframes animationgradienttitle {
            0% {
                background-position: 0 1600px;
            }

            100% {
                background-position: 1600px 0;
            }
        }

        @keyframes animationgradienttitle {
            0% {
                background-position: 0 1600px;
            }

            100% {
                background-position: 1600px 0;
            }
        }

        .c-article {
            margin-top: 10rem;
            text-align: center;
        }

        .c-article__header {
            position: relative;
        }

        .c-article__title {
            font-size: 1.2em;
            background: -webkit-linear-gradient(left, #ffffff, #505050, #bdbdbd);
            background-size: 1600px 200px;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            -webkit-animation-duration: 3s;
            animation-duration: 3s;
            -webkit-animation-name: animationgradienttitle;
            animation-name: animationgradienttitle;
            -webkit-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
            -webkit-animation-fill-mode: forwards;
            animation-fill-mode: forwards;
        }
    </style>
  
        <asp:Panel runat="server" ID="pnl_main_confA" CssClass="confa_panel" Style="top: 100px; position: absolute;">

        <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="upd_confa"  ClientIDMode="Static" >
            <ContentTemplate>

                <asp:Timer ID="Timer_db_update" runat="server" Interval="60000" OnTick="Timer_db_update_Tick"></asp:Timer>
                <asp:Label runat="server" Style="padding-left: 100px;" ID="lbldb_update"></asp:Label>

                <div style="display: none;">
                    <asp:Label runat="server" ID="lblTotEfficiency"></asp:Label>
                    <asp:Label runat="server" ID="lbltoteffConfA"></asp:Label>
                    <asp:Label runat="server" ID="lbl1"></asp:Label>
                    <asp:Button runat="server" ID="btndefault" Style="width: 26px; height: 26px; border-radius: 4px; background-color: white;" />

                    <asp:ImageButton ID="btn_pdf" runat="server" />
                    <asp:ImageButton ID="btn_print" runat="server" />
                </div>

                <%-- Report - Intervali - Modal Panel --%>
                <asp:Panel ID="modalintervali" runat="server">
                    <div id="modalblurdiv1" style="background-color: rgba(0, 0, 0, 0.93); z-index: 999999999; height: 100vh; width: auto; top: 0; left: 0; bottom: 0; right: 0; margin: 0 auto; box-shadow: 0px 0px 400px 50px;">
                        <div id="modaldiv1" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 99999; height: 100vh;">

                            <div class="popup">

                                <%-- X Button - Close Modal --%>
                                <asp:LinkButton runat="server" ID="btn_close_intervali" OnClick="Cancel1_click" CssClass="close" Text="X" OnClientClick="this.disabled=true;" UseSubmitBehavior="true"></asp:LinkButton>
                                <div class="content">
                                    <asp:Button runat="server" ID="btnintervali" Style="display: none;" Text="Load Table" ClientIDMode="Static" />

                                    <asp:Table runat="server">
                                        <%-- BUTTONS ROW --%>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <%-- DATE PICKER --%>
                                                <asp:TextBox ID="cal_intervali" TextMode="Date" runat="server" placeholder="Date" Style="padding: 4.5px;"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>

                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%-- LOAD DATA --%>
                                                <asp:Button ID="cal_button" runat="server" Text="Load data" ClientIDMode="Static" Style="padding: 7px;" />
                                            </asp:TableCell>
                                            <asp:TableCell Style="padding-right: 20px;">
                                                <%-- SPINNER --%>
                                                    <img src="../../Images/spinner.gif" id="spinner" />
                                            </asp:TableCell>

                                            <asp:TableCell>
                                                <%-- PRINT BUTTON --%>
                                                    <%--<button id="btnintervaliprint" class="btn btn-1 btn-1e" onclick="PrintPage()">Print</button>--%>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%-- EXPORT TO EXCEL --%>
                                                    <%--<asp:Button ID="btnexcel" runat="server" CssClass="btn btn-1 btn-1e" Text="Export To Excel" OnClick="ExportToExcel" />--%>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%-- EXPORT TO PDF --%>
                                                    <%--<asp:Button ID="btnExport" runat="server" CssClass="btn btn-1 btn-1e" Text="Export To PDF" OnClick="ExportToPdf" />--%>
                                            </asp:TableCell>
                                        </asp:TableRow>


                                        <%-- TITLE ROW --%>
                                        <asp:TableRow Style="position: absolute; padding-left: 0px; padding-top: 15px; color: forestgreen;">
                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="intervali_current_date" Style="padding-right: 10px;"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Label runat="server" ID="intervali_current_turno"></asp:Label>
                                            </asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>
                                            <asp:TableCell></asp:TableCell>

                                        </asp:TableRow>
                                    </asp:Table>


                                    <%-- GRID VIEW --%>
                                    <asp:GridView runat="server" ID="gv_intervali" ClientIDMode="Static" AutoGenerateColumns="true" CssClass="gvintervali results" OnRowDataBound="Strasnafunkcijaintervali" HeaderStyle-CssClass="gridheader" RowStyle-CssClass="GvGrid"></asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

             <div class="upd_confa">

                    <asp:Table runat="server" ID="EachLineTable" CssClass="EachLineTB">
                        <asp:TableRow CssClass="row">
                            <asp:TableCell ID="item" CssClass="col-sm-2" Style="position: inherit;    display: table;">
                                <!-- LINE 1 -->
                                <asp:Panel ID="contLine13" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA13" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle1" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine1" CssClass="right" runat="server" Text="Linea 1" />
                                    </asp:Panel>
                                    <div id="jednatrecina" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn17" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn18" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn19" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn20" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man13" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="313" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine" style="width: 66%; float: right;">
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn1" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn9" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <br />
                                        <hr style="width: 100%;" />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn2" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" />
                                        </span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn10" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" />
                                        </span>
                                        <br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn3" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn11" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn4" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn12" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn5" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn13" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn6" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn14" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn7" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn15" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn8" runat="server" CssClass="KoferceBox" OnClick="buttons_click" />
                                        </span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn16" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel1" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                        <div class="panel-group ">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse1">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline13" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort1" runat="server" CssClass="green"></asp:Label>
                                                        </h4>
                                                    </div>
                                                </a>
                                                <div id="collapse1" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <asp:GridView ID="gv_l13" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                </asp:Panel>

                            </asp:TableCell>


                            <asp:TableCell ID="item1" CssClass="col-sm-2" Style="position: inherit;    display: table;">
                                <!-- LINE 2 -->
                                <asp:Panel ID="contLine14" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA14" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle2" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine2" CssClass="right" runat="server" Text="Linea 2" />
                                    </asp:Panel>

                                    <div id="jednatrecina1" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn37" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn38" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn39" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn40" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man14" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="314" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine1" style="width: 66%; float: right;">
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn21" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn29" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <br />
                                        <hr style="width: 100%;" />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn22" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn30" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn23" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn31" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn24" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn32" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn25" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn33" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn26" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn34" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn27" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn35" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn28" runat="server" CssClass="KoferceBox" OnClick="buttons_click" />
                                        </span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn36" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel2" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                        <div class="panel-group">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse2">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline14" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort2" runat="server" CssClass="green"></asp:Label>
                                                        </h4>
                                                    </div>
                                                </a>

                                                <div id="collapse2" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <asp:GridView ID="gv_l14" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>


                            </asp:TableCell>

                            <asp:TableCell ID="item2" CssClass="col-sm-2" Style="position: inherit;    display: table;">
                                <!-- LINE 3 -->
                                <asp:Panel ID="contLine15" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA15" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle3" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine3" CssClass="right" runat="server" Text="Linea 3" />
                                    </asp:Panel>

                                    <div id="jednatrecina2" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn57" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn58" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn59" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn60" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man15" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="315" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine2" style="width: 66%; float: right;">
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn41" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn49" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn42" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn50" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn43" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn51" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn44" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn52" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn45" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn53" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn46" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn54" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn47" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn55" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn48" runat="server" CssClass="KoferceBox" OnClick="buttons_click" />
                                        </span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn56" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel3" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                        <div class="panel-group ">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse3">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline15" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort3" runat="server" CssClass="green"></asp:Label>
                                                        </h4>
                                                    </div>
                                                </a>

                                                <div id="collapse3" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <asp:GridView ID="gv_l15" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>


                            </asp:TableCell>

                            <asp:TableCell ID="item3" CssClass="col-sm-2" Style="position: inherit;    display: table;">
                                <!-- LINE 4 -->
                                <asp:Panel ID="contLine16" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA16" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle4" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine4" CssClass="right" runat="server" Text="Linea 4" />
                                    </asp:Panel>

                                    <div id="jednatrecina3" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn77" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn78" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn69" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn80" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man16" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="316" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine3" style="width: 66%; float: right;">
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn61" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn79" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn62" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn70" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn63" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn71" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn64" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn72" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn65" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn73" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn66" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn74" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn67" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn75" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn68" runat="server" CssClass="KoferceBox" OnClick="buttons_click" />
                                        </span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn76" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel4" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                        <div class="panel-group">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse4">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline16" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort4" runat="server" CssClass="green"></asp:Label>
                                                        </h4>
                                                    </div>
                                                </a>

                                                <div id="collapse4" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <asp:GridView ID="gv_l16" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>


                            </asp:TableCell>
                            <asp:TableCell ID="item4" CssClass="col-sm-2" Style="position: inherit;    display: table;">
                                <!-- LINE 5 -->
                                <asp:Panel ID="contLine17" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA17" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle5" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine5" CssClass="right" runat="server" Text="Linea 5" />
                                    </asp:Panel>

                                    <div id="jednatrecina4" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn97" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn98" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn89" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn100" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man17" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="317" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine4" style="width: 66%; float: right;">

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn81" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn99" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn82" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn90" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn83" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn91" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn84" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn92" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn85" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn93" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn86" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn94" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn87" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn95" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn88" runat="server" CssClass="KoferceBox" OnClick="buttons_click" />
                                        </span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn96" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel5" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                        <div class="panel-group ">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse5">
                                                    <div class="panel-heading">

                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline17" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort5" runat="server" CssClass="green"></asp:Label>
                                                        </h4>

                                                    </div>
                                                </a>
                                                <div id="collapse5" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <asp:GridView ID="gv_l17" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>


                            </asp:TableCell>

                            <asp:TableCell ID="item5" CssClass="col-sm-2" Style="position: inherit; ">
                                <!-- LINE 6 -->
                                <asp:Panel ID="contLine18" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                    <asp:Panel ID="LINEA18" runat="server" CssClass="simexTitles">
                                        <asp:Label ID="lbltitle6" CssClass="left" runat="server"></asp:Label>
                                        <asp:Label ID="lblLine6" CssClass="right" runat="server" Text="Linea 6" />
                                    </asp:Panel>

                                    <div id="jednatrecina5" style="width: 33%; float: left; margin-top: 100px;">
                                        <asp:Button ID="btn117" runat="server" CssClass="stolovi" OnClick="Buttons_Click" AccessKey="5" />
                                        <asp:Button ID="btn118" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn109" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <asp:Button ID="btn120" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                        <span class="ManichinoCircleRotated">
                                            <asp:Button ID="Man18" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="318" Style="margin-top: 0px;" />
                                        </span>
                                    </div>

                                    <div id="dvetrecine5" style="width: 66%; float: right;">
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn101" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn119" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn102" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn110" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn103" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn111" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn104" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn112" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn105" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn113" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn106" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                        <span class="KoferceKruzic">
                                            <asp:Button ID="btn114" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                        <hr style="width: 100%;" />

                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn107" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn115" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn108" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                        <span class="KoferceCircle">
                                            <asp:Button ID="btn116" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>
                                    </div>

                                    <asp:Panel ID="Panel6" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                        <div class="panel-group ">
                                            <div class="panel panel-default">
                                                <a data-toggle="collapse" href="#collapse6">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <asp:Label ID="wcline18" runat="server" CssClass="bordo"></asp:Label>
                                                            <asp:Label ID="lblshort6" runat="server" CssClass="green"></asp:Label>
                                                            <span style="color: #a94442; font-size: 12px; float: right;">LINEA18 - offline</span>
                                                        </h4>
                                                    </div>
                                                </a>

                                                <div id="collapse6" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                </div>

                <%-- MODAL PANEL --%>
                <asp:Panel ID="ModalPanel" runat="server">
                    <div id="modalblurdiv" class="" style="background-color: rgba(0, 0, 0, 0.81); width: 100%; position: fixed; top: -100px; z-index: 999; left: 0; bottom: -100px;">
                        <%-- modal div width: 950px; --%>
                        <div id="modaldiv" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 15; top: 33%; left: 33%; margin: -150px  0 0 -150px;">
                            <%--<asp:ImageButton ID="OKButton" runat="server" OnClick="Cancel_Click" ImageUrl="~/images/cancel.png" Style="float: right; padding-top: 10px; padding-right: 10px;" />--%>

                            <section id="mobilescreen" class="">
                                <div id="speaker"></div>
                                <section id="maincontainer">

                                    <nav id="mainmenu">
                                        <h2 id="backmenu">Back</h2>
                                        <ul>
                                            <li id="firstpage">First Page</li>
                                            <li id="secondpage">Second Page</li>
                                        </ul>
                                    </nav>

                                    <section id="mainscreen">
                                        <header>
                                            <i class="fa fa-align-justify" id="menu" style="padding-top: 17px;"></i>
                                            <h1 style="font-size: 1.2em; color: white; padding-top: 15px; text-align: center;">
                                                <asp:Label ID="lblName" runat="server" CssClass=""></asp:Label>
                                            </h1>
                                            <asp:Label ID="lblusrlinea" runat="server" CssClass="" Style="float: right; font-size: larger; margin-top: -25px; padding-right: 20px; font-weight: 400; color: #ffffff!important;"></asp:Label>

                                        </header>

                                        <section id="container">
                                            <%-- FIRST PAGE --%>
                                            <ul id="listlink">

                                                <li>
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-bar-chart-o"></i>Article: </span><span class="offdata">
                                                        <asp:Label ID="lblArticle" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-tags"></i>Phase:</span><span class="offdata"><asp:Label ID="lblPhase" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-plus-square"></i>C/Ora DB:</span><span class="offdata ">
                                                        <asp:Label ID="lblNorm" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-tag"></i>Fatto: </span><span class="offdata">
                                                        <asp:Label ID="lblQty" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-bullhorn"></i>Tempo:</span><span class="offdata"><asp:Label ID="lblTempo" runat="server"></asp:Label></span></li>
                                                <li style="margin-bottom: 10px;">
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-bookmark"></i>Code Machine:</span><span class="offdata"><asp:Label ID="lblCode" runat="server"></asp:Label></span></li>

                                                <%--      <li style="margin-bottom: 10px;">
                                                    <div></div>
                                                    <span class="titles"><i class="fa fa-bookmark"></i>Efficiency:</span><span class="offdata"><asp:Label ID="lblEfficiency" runat="server"></asp:Label></span></li>--%>
                                            </ul>

                                            <%-- SECOND PAGE --%>
                                            <div id="listlink2">
                                                <div class="loader loader--style8" id="loadingbar" title="Loading...">
                                                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="24px" height="30px" viewBox="0 0 24 30" style="enable-background: new 0 0 50 50;" xml:space="preserve">
                                                        <rect x="0" y="10" width="4" height="10" fill="#333" opacity="0.2">
                                                            <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />
                                                        </rect>
                                                        <rect x="8" y="10" width="4" height="10" fill="#333" opacity="0.2">
                                                            <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />
                                                        </rect>
                                                        <rect x="16" y="10" width="4" height="10" fill="#333" opacity="0.2">
                                                            <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                                                            <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />
                                                        </rect>
                                                    </svg>
                                                </div>

                                                <asp:Button ID="showmore" OnClick="ShowDetailedStats_Click" runat="server" Style="padding: 7px;" Text="Importa dati da DB" />
                                                <asp:GridView runat="server" ID="dgv1" ClientIDMode="Static" AutoGenerateColumns="true" />

                                            </div>
                                        </section>
                                    </section>
                                </section>
                                <asp:ImageButton ID="powerbutton" Style="height: 60px; left: 48%;" ImageUrl="../../images/poweroff.png" runat="server" OnClick="Cancel_Click" />
                            </section>
                        </div>
                </asp:Panel>

                <asp:UpdateProgress runat="server" ID="PageUpdateProgress">
                    <ProgressTemplate>
                        <div class="wrap">
                            <div class="bg">
                                <div class="loader" id="loader3">
                                    <div class="inner one"></div>
                                    <div class="inner two"></div>
                                    <div class="inner three"></div>
                                </div>
                                <span class="loader-text c-article__title" id="loader3text">Refreshing data - Loading...</span>
                                <div class="blur"></div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <asp:Label runat="server" ID="refreshtext" Style="bottom: -140px; left: 10px; position: absolute; display: block;"></asp:Label>


                <%-- Sorting Panels --%>
                <asp:Panel runat="server" ID="pnl_sort_by_phase_confa" ClientIDMode="Static">
                    <h5 class="h5_sort">Sort by Fase:</h5>
                    <%--<hr style="line-height:1px;margin:10px;" />--%>
                    <asp:Table runat="server" ID="tbl_fase">
                        <asp:TableRow>
                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                <asp:ImageButton runat="server" ID="tagliacuci" Style="width: 24px; height: 24px;" ImageUrl="~/images/trav.jpg" />
                            </asp:TableCell>
                            <asp:TableCell>Tagliacuci</asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                <asp:ImageButton runat="server" ID="rimagli" Style="width: 24px; height: 24px;" ImageUrl="~/images/rim.jpg" />
                            </asp:TableCell>
                            <asp:TableCell>Rimaglo</asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                <asp:ImageButton runat="server" ID="ov" Style="width: 24px; height: 24px;" ImageUrl="~/images/trav.jpg" />
                            </asp:TableCell>
                            <asp:TableCell>OV</asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                <asp:ImageButton runat="server" ID="traveta" Style="width: 24px; height: 24px;" ImageUrl="~/images/trav.jpg" />
                            </asp:TableCell>
                            <asp:TableCell>Traveta</asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                <asp:ImageButton runat="server" ID="rifinitura" Style="width: 24px; height: 24px;" ImageUrl="~/images/tab.jpg" />
                            </asp:TableCell>
                            <asp:TableCell>Rifinitura</asp:TableCell>
                        </asp:TableRow>


                    </asp:Table>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnl_sort_by_line_confa" ClientIDMode="static">

                    <h5 class="h5_sort">Sort by Line:</h5>

                    <asp:Table runat="server" ID="checkboxWrapper" ClientIDMode="Static">
                        <asp:TableRow>
                        </asp:TableRow>
                        <%-- LINE 1 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                  <input id="check1" type="checkbox" checked="checked" name="check1" class="checkbox" />
                            </asp:TableCell>
                            <asp:TableCell>
                                  Linea 13
                            </asp:TableCell>
                        </asp:TableRow>
                        <%-- LINE 2 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                 <input id="check2" type="checkbox" checked="checked" name="check2" class="checkbox" />
                            </asp:TableCell>
                            <asp:TableCell>
                                  Linea 14
                            </asp:TableCell>
                        </asp:TableRow>
                        <%-- LINE 3 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                   <input id="check3" type="checkbox" checked="checked" name="check3" class="checkbox" />
                            </asp:TableCell>
                            <asp:TableCell>
                                   Linea 15
                            </asp:TableCell>
                        </asp:TableRow>
                        <%-- LINE 4 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                <input id="check4" type="checkbox" checked="checked" name="check4" class="checkbox" />
                            </asp:TableCell>
                            <asp:TableCell>
                                 Linea 16
                            </asp:TableCell>
                        </asp:TableRow>
                        <%-- LINE 5 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                 <input id="check5" type="checkbox" checked="checked" name="check5" class="checkbox" />
                            </asp:TableCell>
                            <asp:TableCell>
                                 Linea 17
                            </asp:TableCell>
                        </asp:TableRow>
                        <%-- LINE 6 --%>
                        <asp:TableRow>
                            <asp:TableCell>
                                <input id="check6" type="checkbox" checked="checked" class="checkbox" name="check6" />
                            </asp:TableCell>
                            <asp:TableCell>
                                  Linea 18
                            </asp:TableCell>
                        </asp:TableRow>

                        <%-- SELECT ALL --%>

                        <asp:TableRow>
                            <asp:TableCell>
                                 <input type="checkbox" class="check" checked="checked" id="select_all" style="margin-top:10px;" />
                            </asp:TableCell>
                            <asp:TableCell Style="color: darkred; padding-top: 5px; font-size: 14px; padding-left: 10px;">
                                                                                Check/Uncheck All
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
<%--                
                <script type="text/javascript">
                    function showsecondpage() {
                        $("#loadingbar").hide();
                        $("#listlink").hide();
                        $("#mainmenu").hide();
                        $("#listlink2").show();
                    };
                </script>--%>

            </ContentTemplate>
        </asp:UpdatePanel>


    </asp:Panel>
      
</asp:Content>
