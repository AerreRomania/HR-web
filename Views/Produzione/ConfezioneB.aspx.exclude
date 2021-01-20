<%@ Page Language="VB" AutoEventWireup="true" CodeFile="ConfezioneB.aspx.vb" Inherits="Views.Produzione.ConfezioneB" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="ConfezioneB" ContentPlaceHolderID="MainConfB">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../../css/Content/ConfB-css.css" />
    <link rel="stylesheet" href="../../css/confb-internal.css" />
    <link rel="stylesheet" href="../../css/Content/confa-internal.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fonts/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet"/>


    <style>
        *:not(.fa):not(.docktitlesimagestd) {
            font-family: 'Exo', sans-serif!important;
        }

        #mobilescreen{
            height:510px;
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

        .tcelassent {
            width: 285px!important;
        }

        .h5_sort {
            line-height: 24px;
            background: #ababab;
            width: 173px;
            padding-right: 0px!important;
            padding-left: 0px!important;
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

        #tbl_fase td{
            font-size:14px!important;
        }

        #checkboxWrapper td{
            font-size:14px!important;
        }

        .loader {
            position: fixed;
            /*top: calc(50% - 32px);
            left: calc(50% - 32px);*/
            left: 100px;
            bottom: 23px;
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
            position: fixed;
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
            /*font-family: 'Scope One', serif;*/
            font-size: 1.2em;
            /*color: #fc3735;*/
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

    <div style="top: 50px; margin: 0 auto; zoom: 0.73; display: table; position: relative; -moz-transform: scale(0.73);">

        <asp:UpdatePanel runat="server" ID="upd_confb" UpdateMode="Conditional" ClientIDMode="Static">
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
                <div id="glavnipaneliconfb">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Panel ID="contLine1" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static" >
                                <asp:Panel ID="LINEA1" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine1" runat="server" CssClass="right" Text="Linea 1" />
                                    <asp:Label ID="lbltitle1" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>

                                <div id="jednatrecina" style="width: 33%; float: left;">
                                    <asp:Button ID="btn17" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn18" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn19" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn20" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man1" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="301" Style="margin-top: 0px;" />
                                    </span>
                                </div>


                                <div id="dvetrecine" style="width: 66%; float: right;">

                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn1" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" />
                                    </span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn9" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn2" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn10" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn6" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn14" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />

                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn7" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn15" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"> <asp:Button ID="btn8" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /> </span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn16" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                </div>

                                 <asp:Panel ID="Panel1" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse1">

                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wcline1" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP1" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>

                                        <div id="collapse1" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l1" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>

                        <asp:TableCell>
                            <asp:Panel ID="contLine2" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA2" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine2" runat="server" CssClass="right" Text="Linea 2" />
                                     <asp:Label ID="lblTitle2" runat="server" CssClass="left" ></asp:Label>

                                </asp:Panel>

                                <div id="jednatrecina1" style="width: 33%; float: left;">

                                    <asp:Button ID="btn37" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn38" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn39" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn40" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man2" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="302" Style="margin-top: 0px;" />
                                    </span>
                                </div>

                                <div id="dvetrecine1" style="width: 66%; float: right;">

                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn21" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn29" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="1" /></span><br />
                                    <hr style="width: 100%;" />

                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn22" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn30" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn26" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn34" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />

                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn27" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn35" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn28" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn36" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                </div>
                                 <asp:Panel ID="Panel2" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse2">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wcline2" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP2" runat="server" CssClass="green"></asp:Label>
                                                </h4>

                                            </div>
                                        </a>
                                        <div id="collapse2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l2" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>

                        <asp:TableCell>
                            <asp:Panel ID="contLine3" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA3" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine3" runat="server" CssClass="right" Text="Linea 3" />
                                    <asp:Label ID="lblTitle3" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>

                                <div id="jednatrecina2" style="width: 33%; float: left;">

                                    <asp:Button ID="btn57" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn58" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn59" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn60" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man3" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="303" Style="margin-top: 0px;" />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn46" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn54" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />

                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn47" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn55" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn48" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn56" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>--%>
                                </div>
                                 <asp:Panel ID="Panel3" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse3">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wcline3" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP3" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l3" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>

                        <asp:TableCell>
                            <asp:Panel ID="contLine4" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA4" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine4" runat="server" CssClass="right" Text="Linea 4" />
                                    <asp:Label ID="lblTitle4" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina3" style="width: 33%; float: left;">

                                    <asp:Button ID="btn77" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn78" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn69" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn80" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man4" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="304" Style="margin-top: 0px;" />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn66" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn74" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn67" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn75" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn68" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn76" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>--%>
                                </div>
                                 <asp:Panel ID="Panel4" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse4">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">

                                                    <asp:Label ID="wcline4" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP4" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse4" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l4" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine5" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA5" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine5" runat="server" CssClass="right" Text="Linea 5" />
                                    <asp:Label ID="lblTitle5" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>

                                <div id="jednatrecina4" style="width: 33%; float: left;">

                                    <asp:Button ID="btn97" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn98" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn89" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn100" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man5" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="305" Style="margin-top: 0px;" />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn86" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn94" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn87" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn95" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn88" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn96" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>--%>
                                </div>

                                  <asp:Panel ID="Panel5" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse5">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wcline5" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP5" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse5" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l5" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine6" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA6" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine6" runat="server" CssClass="right" Text="Linea 6" />
                                    <asp:Label ID="lblTitle6" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina5" style="width: 33%; float: left;">

                                    <asp:Button ID="btn117" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn118" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn109" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn120" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <span class="ManichinoCircleRotated">
                                        <asp:Button ID="Man6" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="306" Style="margin-top: 0px;" />
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
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn106" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic">
                                        <asp:Button ID="btn114" runat="server" CssClass="KoferceKruzicBox" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn107" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle">
                                        <asp:Button ID="btn115" runat="server" CssClass="KoferceBox" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn108" runat="server" CssClass="KoferceBox"  OnClick="buttons_click"/></span>--%>
                                    <%--<span class="KoferceCircle"><asp:Button ID="btn116" runat="server" CssClass="KoferceBox" OnClick="buttons_click" /></span>--%>
                                </div>
                                   <asp:Panel ID="Panel6" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse6">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wcline6" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP6" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l6" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                    </asp:TableRow>

                     <asp:TableRow><asp:TableCell><br /></asp:TableCell></asp:TableRow>
                    <%--PRESENT L7 - L18 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Panel ID="contLine12" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA12" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine12" runat="server" CssClass="right" Text="Linea 12" />
                                    <asp:Label ID="lblTitle12" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina6" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man12" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="312" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn237" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn238" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn229" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn240" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />


                                </div>
                                <div id="dvetrecine6" style="width: 66%; float: right;">
                                    <%--<span class="KoferceCircle1"><asp:Button ID="btn236" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>--%>
                                    <%--<span class="KoferceCircle1"><asp:Button ID="btn228" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn227" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn235" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn226" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn234" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn233" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn225" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn232" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn224" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn231" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn223" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn230" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn222" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn239" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn221" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>
                                 <asp:Panel ID="Panel12" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse12">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wclinel12" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP12" runat="server" CssClass="green"></asp:Label>
                                                    <%--<span style="color:#a94442;font-size:12px;">LINEA18 - offline</span>--%>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse12" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l12" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine11" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA11" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine11" runat="server" CssClass="right" Text="Linea 11" />
                                    <asp:Label ID="lblTitle11" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina7" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man11" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="311" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn217" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn218" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn209" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn220" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />

                                </div>
                                <div id="dvetrecine7" style="width: 66%; float: right;">
                                    <%--  <span class="KoferceCircle1"><asp:Button ID="btn216" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>
                         <span class="KoferceCircle1"><asp:Button ID="btn208" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn207" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn215" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn206" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn214" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn213" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn205" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn212" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn204" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn211" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn203" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn210" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn202" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn219" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn201" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>
                                <asp:Panel ID="Panel11" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse11">

                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wclinel11" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP11" runat="server" CssClass="green"></asp:Label>
                                                    <%--<span>LINEA17</span>--%>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse11" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l11" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine10" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA10" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine10" runat="server" CssClass="right" Text="Linea 10" />
                                    <asp:Label ID="lblTitle10" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina8" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man10" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="310" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn197" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn198" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn189" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn200" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />

                                </div>
                                <div id="dvetrecine8" style="width: 66%; float: right;">

                                    <%--  <span class="KoferceCircle1"><asp:Button ID="btn196" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>
                         <span class="KoferceCircle1"><asp:Button ID="btn188" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn187" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn195" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn186" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn194" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn193" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn185" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn192" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn184" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn191" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn183" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn190" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn182" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn199" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn181" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>

                                 <asp:Panel ID="Panel10" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse10">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">

                                                    <asp:Label ID="wcline10" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP10" runat="server" CssClass="green"></asp:Label>
                                                    <%--<span>LINEA16</span>--%>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse10" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l10" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine9" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA9" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine9" runat="server" CssClass="right" Text="Linea 9" />
                                    <asp:Label ID="lblTitle9" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina9" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man9" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="309" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn177" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn178" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn169" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn180" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />

                                </div>
                                <div id="dvetrecine9" style="width: 66%; float: right;">
                                    <%-- <span class="KoferceCircle1"><asp:Button ID="btn176" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>
                         <span class="KoferceCircle1"><asp:Button ID="btn168" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn167" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn175" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn166" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn174" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn173" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn165" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn172" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn164" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn171" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn163" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn170" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn162" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn179" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn161" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>

                                 <asp:Panel ID="Panel9" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse9">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wclinel9" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP9" runat="server" CssClass="green"></asp:Label>
                                                    <%--<span>LINEA15</span>--%>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse9" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l9" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine8" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA8" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine8" runat="server" CssClass="right" Text="Linea 8" />
                                    <asp:Label ID="lblTitle8" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina11" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man8" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="308" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn157" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn158" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn149" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn160" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />

                                </div>
                                <div id="dvetrecine11" style="width: 66%; float: right;">
                                    <%-- <span class="KoferceCircle1"><asp:Button ID="btn156" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>
                         <span class="KoferceCircle1"><asp:Button ID="btn148" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn147" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn155" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn146" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn154" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn153" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn145" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn152" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn144" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn151" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn143" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn150" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn142" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn159" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn141" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>

                                 <asp:Panel ID="Panel8" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">

                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse8">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wclinel8" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP8" runat="server" CssClass="green"></asp:Label>
                                                    <%--<span>LINEA14</span>--%>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse8" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l8" runat="server" AutoGenerateColumns="true" ShowHeader="false" OnRowDataBound="Assent_DataBound" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            </asp:Panel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Panel ID="contLine7" runat="server" CssClass="simexContainers" BorderWidth="1px" Style="position: relative" ClientIDMode="Static">
                                <asp:Panel ID="LINEA7" runat="server" CssClass="simexTitles">
                                    <asp:Label ID="lblLine7" runat="server" CssClass="right" Text="Linea 7" />
                                    <asp:Label ID="lblTitle7" runat="server" CssClass="left" ></asp:Label>
                                </asp:Panel>
                                <div id="jednatrecina12" style="width: 33%; float: left;">
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="Man7" runat="server" CssClass="KoferceKruzicBox" OnClick="buttonsMan_click" AccessKey="5" TabIndex="307" Style="margin-top: 0px;" />
                                    </span>
                                    <asp:Button ID="btn137" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn138" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn129" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />
                                    <asp:Button ID="btn140" runat="server" CssClass="stolovi" OnClick="buttons_click" AccessKey="5" />

                                </div>
                                <div id="dvetrecine12" style="width: 66%; float: right;">
                                    <%--  <span class="KoferceCircle1"><asp:Button ID="btn136" runat="server" CssClass="KoferceBox1" OnClick="buttons_click"/></span>
                         <span class="KoferceCircle1"><asp:Button ID="btn128" runat="server" CssClass="KoferceBox1"  OnClick="buttons_click"/></span><br />--%>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn127" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="4" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn135" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span><br />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn126" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="3" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn134" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn133" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn125" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn132" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn124" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn131" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn123" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn130" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span>
                                    <span class="KoferceKruzic1">
                                        <asp:Button ID="btn122" runat="server" CssClass="KoferceKruzicBox1" OnClick="buttons_click" AccessKey="2" /></span><br />
                                    <hr style="width: 100%;" />
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn139" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                    <span class="KoferceCircle1">
                                        <asp:Button ID="btn121" runat="server" CssClass="KoferceBox1" OnClick="buttons_click" AccessKey="1" /></span>
                                </div>

                                <asp:Panel ID="Panel7" runat="server" CssClass="tcelassent" Style="position: relative;" ClientIDMode="Static">
                                <div class="panel-group ">
                                    <div class="panel panel-default">
                                        <a data-toggle="collapse" href="#collapse7">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <asp:Label ID="wclinel7" runat="server" CssClass="bordo"></asp:Label>
                                                    <asp:Label ID="wclineP7" runat="server" CssClass="green"></asp:Label>
                                                </h4>
                                            </div>
                                        </a>
                                        <div id="collapse7" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <asp:GridView ID="gv_l7" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" OnRowDataBound="Assent_DataBound" BorderColor="Transparent"></asp:GridView>
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
                    <div id="modalblurdiv" class="animated fadeIn" style="background-color: rgba(0, 0, 0, 0.93); width: 100%; position: fixed; top: -100px; left: 0; z-index: 999; bottom: -100px;">
                        <div id="modaldiv" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 15; top: 33%; left: 33%; margin: -150px  0 0 -150px;">

                            <section id="mobilescreen" class="animated fadeInDown" style="zoom: 1.35;">
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
                                        <header style="animation-delay: 0.3s;" class="animated slideInLeft">
                                            <i class="fa fa-align-justify animated fadeIn animationdelay" style="padding-top: 16px;" id="menu"></i>
                                            <h1 style="font-size: 1.2em; color: white; text-align: center; padding-top: 16px!important;">
                                                <asp:Label ID="lblName" CssClass="animated fadeInLeft animationdelay" runat="server"></asp:Label>
                                            </h1>
                                            <asp:Label ID="lblusrlinea" runat="server" CssClass="animated fadeInLeft animationdelay" Style="float: right; font-size: larger; margin-top: -25px; padding-right: 20px; font-weight: 400; color: #ffffff!important;"></asp:Label>

                                        </header>

                                        <section id="container">
                                            <%--<p class="intro">User, your current status is...</p>--%>
                                            <%--                                        <asp:Label ID="lblusrlinea" runat="server" Class="intro"></asp:Label>
                                        <asp:Label ID="lblusrlineacurrent" runat="server" Class="intro"></asp:Label>--%>


                                            <%-- FIRST PAGE --%>
                                            <ul id="listlink">
                                                <li>
                                                    <div></div>
                                                    <span class="titles animated fadeInLeft animationdelay"><i class="fa fa-bar-chart-o"></i>Articole: </span><span class="offdata animated fadeInRight animationdelay">
                                                        <asp:Label ID="lblArticole" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles  animated fadeInLeft animationdelay"><i class="fa fa-tags"></i>Phase:</span><span class="offdata animated fadeInRight animationdelay"><asp:Label ID="lblPhase" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles  animated fadeInLeft animationdelay"><i class="fa fa-plus-square"></i>C/Ora DB:</span><span class="offdata animated fadeInRight animationdelay">
                                                        <asp:Label ID="lblNorm" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles  animated fadeInLeft animationdelay"><i class="fa fa-tag"></i>Fatto: </span><span class="offdata animated fadeInRight animationdelay">
                                                        <asp:Label ID="lblQty" runat="server"></asp:Label></span></li>
                                                <li>
                                                    <div></div>
                                                    <span class="titles  animated fadeInLeft animationdelay"><i class="fa fa-bullhorn"></i>Tempo:</span><span class="offdata animated fadeInRight animationdelay"><asp:Label ID="lblTempo" runat="server"></asp:Label></span></li>
                                                <li style="margin-bottom: 10px;">
                                                    <div></div>
                                                    <span class="titles  animated fadeInLeft animationdelay"><i class="fa fa-bookmark"></i>Code Machine:</span><span class="offdata animated fadeInRight animationdelay"><asp:Label ID="lblCode" runat="server"></asp:Label></span></li>
                                            </ul>
                                            <%-- SECOND PAGE --%>
                                            <div id="listlink2" style="">
                                                <asp:Button ID="showmore" OnClick="ShowDetailedStats_Click" ClientIDMode="Static" runat="server" Style="padding: 7px;" Text="Importa dati da DB" />
                                                <asp:GridView runat="server" ID="dgv1" AutoGenerateColumns="true" ClientIDMode="Static" />
                                            </div>

                                        </section>
                                    </section>
                                </section>
                                <asp:ImageButton ID="powerbutton" Style="height: 60px; left: 48%;" ImageUrl="../../images/poweroff.png" runat="server" OnClick="Cancel_Click" />
                                <asp:ImageButton ID="powerbuttonblur" Style="display: none;" runat="server" OnClick="Cancel_Click" />
                            </section>
                        </div>
                    </div>
                </asp:Panel>

                <asp:UpdateProgress runat="server" ID="PageUpdateProgress" ClientIDMode="Static">
                    <ProgressTemplate>
                        <div class="wrap">
                            <div class="bg">
                                <div class="loader" id="loader3">
                                    <div class="inner one"></div>
                                    <div class="inner two"></div>
                                    <div class="inner three"></div>
                                </div>
                                <span class="loader-text c-article__title" id="loader3text">Refreshing data - Loading...</span>
                                <%--                                <asp:Label runat="server" ID="loadinginfo"></asp:Label>--%>
                                <div class="blur1"></div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>


                                <%-- Sorting Panels --%>
                <asp:Panel runat="server" ID="pnl_sort_by_phase_confb" ClientIDMode="Static">
                    <h5 class="h5_sort">Sort by Fase:</h5>
                                        <%--<hr style="line-height:1px;margin:10px;" />--%>

                    <asp:Table runat="server" ID="tbl_fase" ClientIDMode="Static">
                                                        <asp:TableRow>
                                                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                                                <asp:ImageButton runat="server" ID="tagliacuci" Style="width: 24px; height: 24px;" ImageUrl="../../images/trav.jpg" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>Tagliacuci</asp:TableCell>
                                                        </asp:TableRow>

                                                        <asp:TableRow>
                                                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                                                <asp:ImageButton runat="server" ID="rimagli" Style="width: 24px; height: 24px;" ImageUrl="../../images/rim.jpg" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>Rimaglo</asp:TableCell>
                                                        </asp:TableRow>

                                                        <asp:TableRow>
                                                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                                                <asp:ImageButton runat="server" ID="ov" Style="width: 24px; height: 24px;" ImageUrl="../../images/trav.jpg" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>OV</asp:TableCell>
                                                        </asp:TableRow>

                                                        <asp:TableRow>
                                                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                                                <asp:ImageButton runat="server" ID="traveta" Style="width: 24px; height: 24px;" ImageUrl="../../images/trav.jpg" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>Traveta</asp:TableCell>
                                                        </asp:TableRow>

                                                        <asp:TableRow>
                                                            <asp:TableCell Style="padding-right: 20px; padding-bottom: 0px;">
                                                                <asp:ImageButton runat="server" ID="rifinitura" Style="width: 24px; height: 24px;" ImageUrl="../../images/tab.jpg" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>Rifinitura</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnl_sort_by_line_confb" ClientIDMode="static">
                    <%--<br />--%>
                     <h5 class="h5_sort">Sort by Line:</h5>
                                        <%--<hr style="line-height:1px;margin:10px;" />--%>

                                                         <asp:Table runat="server" ID="checkboxWrapper" ClientIDMode="Static" >
                                                        <asp:TableRow>
                                                        </asp:TableRow>
                                                        <%-- LINE 1 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check1" type="checkbox" checked="checked" name="check1" class="checkbox"  /> 
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 1
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 2 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check2" type="checkbox" checked="checked" name="check2" class="checkbox"  />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 2
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 3 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check3" type="checkbox" checked="checked" name="check3" class="checkbox"  />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 3
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 4 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check4" type="checkbox" checked="checked" name="check4" class="checkbox"  />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 4
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 5 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check5" type="checkbox" checked="checked" name="check5" class="checkbox"  />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 5
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 6 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check6" type="checkbox" checked="checked" class="checkbox" name="check6" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 6
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 7 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check7" type="checkbox" checked="checked" class="checkbox" name="check7" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 7
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 8 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check8" type="checkbox" checked="checked" class="checkbox" name="check8" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 8
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 9 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check9" type="checkbox" checked="checked" class="checkbox" name="check9" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 9
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                          <%-- LINE 10 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check10" type="checkbox" checked="checked" class="checkbox" name="check10" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 10
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 11 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check11" type="checkbox" checked="checked" class="checkbox" name="check11" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 11
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <%-- LINE 12 --%>
                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                            <input id="check12" type="checkbox" checked="checked" class="checkbox" name="check12" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                            Linea 12
                                                            </asp:TableCell>
                                                        </asp:TableRow>

                                                        <%-- SELECT ALL --%>

                                                        <asp:TableRow>
                                                            <asp:TableCell>
                                                    <input type="checkbox" class="check" checked="checked" id="select_all" style="margin-top:0px;" />
                                                            </asp:TableCell>
                                                            <asp:TableCell Style="color: darkred; padding-top: 0px;font-size:12px;padding-left: 10px;">
                                                            Check/Uncheck All
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
     
    </div>

</asp:Content>
