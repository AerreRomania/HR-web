<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Stiro.aspx.vb" Inherits="Stiro" MasterPageFile="~/Views/Produzione/Site.master" %>

<asp:Content runat="server" ID="Stiro" ContentPlaceHolderID="MainStiro" >

    <header runat="server">

        <link rel="stylesheet" runat="server" type="text/css" href="../../css/Content/Stiro-css.css" />
        <link href="../../css/stiro-internal2.css" rel="stylesheet" />

        <link href="css/animate.css" rel="stylesheet" />
        <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fonts/font-awesome/4.7.0/css/font-awesome.min.css">--%>
        <link rel="stylesheet" media="screen and (min-width: 900px)" href="../../css/stiro/stiro-widescreen.css">
        <link rel="stylesheet" media="screen and (max-width: 600px)" href="../../css/stiro/stiro-smallscreen.css">
        <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
        <%--<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fonts/font-awesome/4.7.0/css/font-awesome.min.css"/>--%>
        <link href="https://maxcdn.bootstrapcdn.com/fonts/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <style>
            *:not(.fa):not(.docktitlesimagestd) {
                font-family: 'Exo', sans-serif !important;
            }

            body {
                overflow: hidden;
                height:550px!important;
            }

            .gridheader {
                background: gray;
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
                font-size: 14px;
                font-weight: 400;
            }

            .mdl_intervali_total {
                float: right;
                top: 90px;
                right: 10px;
                color: white;
                position: relative;
            }

                .mdl_intervali_total td {
                    padding-right: 10px;
                }

            #checkboxWrapper td {
                font-size: 14px !important;
                padding-left: 5px;
            }

            .panel {
                box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px;
                margin-bottom: 20px;
                background-color: rgb(255, 255, 255);
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-color: transparent;
                border-right-color: transparent;
                border-bottom-color: transparent;
                border-left-color: transparent;
                border-image-source: initial;
                border-image-slice: initial;
                border-image-width: initial;
                border-image-outset: initial;
                border-image-repeat: initial;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                border-bottom-right-radius: 4px;
                border-bottom-left-radius: 4px;
            }

            .panel-group .panel {
                margin-bottom: 0px;
                overflow-x: hidden;
                overflow-y: hidden;
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
                border-bottom-right-radius: 4px;
                border-bottom-left-radius: 4px;
            }

            .panel-default {
                border-top-color: rgb(221, 221, 221);
                border-right-color: rgb(221, 221, 221);
                border-bottom-color: rgb(221, 221, 221);
                border-left-color: rgb(221, 221, 221);
            }

                .panel-default > .panel-heading {
                    background-image: linear-gradient(rgb(245, 245, 245) 0%, rgb(232, 232, 232) 100%);
                    /*background-repeat-x: repeat;
                background-repeat-y: no-repeat;*/
                    color: rgb(51, 51, 51);
                    background-color: rgb(245, 245, 245);
                    border-top-color: rgb(221, 221, 221);
                    border-right-color: rgb(221, 221, 221);
                    border-bottom-color: rgb(221, 221, 221);
                    border-left-color: rgb(221, 221, 221);
                }

            .panel-heading {
                padding-top: 10px;
                padding-right: 15px;
                padding-bottom: 10px;
                padding-left: 15px;
                border-bottom-width: 1px;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                border-top-right-radius: 3px;
                border-top-left-radius: 3px;
            }

            .panel-group .panel-heading {
                border-bottom-width: 0px;
                border-bottom-style: initial;
                border-bottom-color: initial;
                height: 15px;
            }


            .panel-title {
                margin-top: 0px;
                margin-bottom: 0px;
                font-size: 12px;
            }

            .loyality, h4 {
                position: relative;
            }

            h4 {
                z-index: 1;
            }

            .ThreeObjBoxAccordianPiego span {
                padding-right: 10px;
            }

            .bordo {
                color: rgb(169, 68, 66);
                float: right;
            }

            .green {
                color: forestgreen;
                float: left;
            }

            .collapse {
                display: none;
            }

            .panel-body {
                padding-top: 15px;
                padding-right: 15px;
                padding-bottom: 15px;
                padding-left: 15px;
                font-size: 12px;
            }

                .panel-body td {
                    padding-right: 13px;
                }

                .panel-body::after {
                    clear: both;
                }

            .panel-collapse {
                position: absolute;
                z-index: 9999;
                background: white;
                width: 100%;
                border-color: rgb(221, 221, 221);
                border-width: 1px;
                border-style: solid;
                border-radius: 5px;
                margin-left: -1px;
            }

            .panel-group .panel-heading + .panel-collapse .panel-body {
                border-top-width: 1px;
                border-top-style: solid;
                border-top-color: rgb(221, 221, 221);
            }

            .panel-default > .panel-heading + .panel-collapse .panel-body {
                border-top-color: rgb(221, 221, 221);
            }


            .ThreeObjBoxAccordianPiego {
                width: 360px;
                position: fixed;
                display: inline-block;
                float: left;
                margin-left: 10px;
                margin-right: 20px;
            }

            .ThreeObjBoxAccordianPressa {
                width: 300px;
                position: fixed;
                display: inline-block;
                float: left;
                margin-right: 23px;
            }



            .ThreeObjBoxAccordianPiego a {
                color: #6e6e6e;
                text-decoration: none;
            }


                .ThreeObjBoxAccordianPiego a:hover {
                    text-decoration: none;
                }

            .ThreeObjBoxAccordianPiego span {
                padding-right: 10px;
            }

            .ThreeObjBoxAccordianPressa span {
                padding-right: 10px;
            }

            .ThreeObjBoxAccordianPressa a {
                color: #6e6e6e;
                text-decoration: none;
            }


                .ThreeObjBoxAccordianPressa a:hover {
                    text-decoration: none;
                }

            .bordo {
                color: #a94442;
            }


            .loader {
                position: fixed;
                left: 100px;
                bottom: 30px;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                perspective: 800px;
            }

            .loader-text {
                position: fixed;
                margin: 0 auto;
                perspective: 900px;
                color: white;
                font-size: medium;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-family: 'Fira Sans', sans-serif;
                z-index: 99999;
                bottom: 30px;
                left: 150px;
                text-align: left;
            }

            .inner {
                position: absolute;
                box-sizing: border-box;
                width: 100%;
                height: 100%;
                border-radius: 50%;
            }

                .inner.one {
                    left: 0%;
                    top: 0%;
                    animation: rotate-one 1s linear infinite;
                    border-bottom: 3px solid #3c3c3e;
                }

                .inner.two {
                    right: 0%;
                    top: 0%;
                    animation: rotate-two 1s linear infinite;
                    border-right: 3px solid #3c3c3e;
                }

                .inner.three {
                    right: 0%;
                    bottom: 0%;
                    animation: rotate-three 1s linear infinite;
                    border-top: 3px solid #3c3c3e;
                }

            @keyframes rotate-one {
                0% {
                    transform: rotateX(35deg) rotateY(-45deg) rotateZ(0deg);
                }

                100% {
                    transform: rotateX(35deg) rotateY(-45deg) rotateZ(360deg);
                }
            }

            @keyframes rotate-two {
                0% {
                    transform: rotateX(50deg) rotateY(10deg) rotateZ(0deg);
                }

                100% {
                    transform: rotateX(50deg) rotateY(10deg) rotateZ(360deg);
                }
            }

            @keyframes rotate-three {
                0% {
                    transform: rotateX(35deg) rotateY(55deg) rotateZ(0deg);
                }

                100% {
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

            .GvGrid {
                /*background-color: gray;
                border-color: silver;*/
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
    </header>

    <asp:UpdatePanel runat="server" UpdateMode="Conditional"   ID="upd_stiro" ClientIDMode="Static">
        <ContentTemplate>
                    <asp:Timer ID="Timer_db_update2" runat="server" Interval="60000" OnTick="Timer_db_update_Tick1"></asp:Timer>

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



            <div class="scroll-container">
                <asp:TableCell Style="display: none; float: none; text-align: center; position: relative; padding-right: 30px; padding-top: 15px;">
                    <asp:ImageButton ID="cmdDownload" ImageUrl="../../images/geteff.png" runat="server" OnClick="cmdDownload_click" /><p style="color: white;">Efficiency</p>
                    <asp:ImageButton ID="ppptDownload" runat="server" OnClick="BtnDownload_pppt_click" />
                    <asp:ImageButton ID="getcappi" runat="server" OnClick="BtnDownload_capi_click" />
                    <asp:ImageButton ID="getmachine" runat="server" OnClick="BtnMachine_click" />
                    <asp:ImageButton ID="getreparto" runat="server" OnClick="BtnReparto_click" />
                    <asp:ImageButton ID="btn_pdf" runat="server" />
                    <asp:ImageButton ID="btn_print" runat="server" />
                </asp:TableCell>

                <div class="scroll-container">
                    <asp:Table runat="server">

                        <%-- SPANS WITH NAMES --%>
                        <asp:TableRow CssClass="docktitlesrow">

                            <asp:TableCell>
                                <span class="docktitles" id="report1">Report</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles" id="organigrama">Org.</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles" id="pausesspan">Pause</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                  <span class="docktitles">Zoom-In</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                 <span class="docktitles">Zoom-Out</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                  <span class="docktitles">Print</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles">Share</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles">Get PDF</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles">Sorting</span>
                            </asp:TableCell>

                            <asp:TableCell>
                                <span class="docktitles">Highlight</span>
                            </asp:TableCell>

                        </asp:TableRow>

                    </asp:Table>
                </div>
            </div>

            <%-- Report - Intervali - Modal Panel --%>
            <asp:Panel ID="modalintervali" runat="server" ClientIDMode="Static">
                <div id="modalblurdiv1" style="background-color: rgba(0, 0, 0, 0.93); z-index: 999999999999; height: 100vh; width: auto; top: 0; left: 0; bottom: 0; right: 0; margin: 0 auto; box-shadow: 0px 0px 400px 50px;">
                    <div id="modaldiv1" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 99999; height: 100vh;">

                        <div class="popup">

                            <%-- X Button - Close Modal --%>
                            <asp:LinkButton runat="server" ID="btn_close_intervali" OnClick="Cancel1_click" CssClass="close" Text="X" OnClientClick="this.disabled=true;" UseSubmitBehavior="true"></asp:LinkButton>
                            <div class="content">
                                <asp:Button runat="server" ID="btnintervali" OnClick="btnintervali_Click" Style="display: none;" Text="Load Table" ClientIDMode="Static" />

                                <asp:Table runat="server">
                                    <%-- BUTTONS ROW --%>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <%-- DATE PICKER --%>
                                            <asp:TextBox ID="cal_intervali" TextMode="Date" runat="server" placeholder="Date" Style="padding: 4.5px;"></asp:TextBox>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <%-- SHIFT --%>
                                            <asp:DropDownList ID="cal_turno1" runat="server" Style="padding: 7px;">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                            </asp:DropDownList>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <%-- LOAD DATA --%>
                                            <asp:Button ID="cal_button" runat="server" Text="Load data" ClientIDMode="Static" Style="padding: 7px;" />
                                        </asp:TableCell>
                                        <asp:TableCell Style="padding-right: 20px;">
                                    <%-- SPINNER --%>
                                            <img src="../../Images/spinner.gif" id="spinner"  />
                                        </asp:TableCell>

                                        <asp:TableCell>
                                             <%-- PRINT BUTTON --%>
                                             <button id="btnintervaliprint" class="btn btn-1 btn-1e" onclick="PrintPage()">Print</button>
                                        </asp:TableCell>

                                        <asp:TableCell>
                                            <%-- EXPORT TO EXCEL --%>
                                            <asp:Button runat="server" ID="btnexcel" Style="display: none" ClientIDMode="Static" CssClass="btn btn-1 btn-1e" Text="Export To Excel" OnClick="ExportToExcel" />
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <%-- EXPORT TO PDF --%>
                                            <asp:Button runat="server" ID="get_pdf_intervali" Style="display: none" ClientIDMode="Static" CssClass="btn btn-1 btn-1e" Text="Export To PDF" OnClick="ExportToPDF" />
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
                </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnlglavni">
                <div class="glavnipaneli" id="svipaneli">


                    <asp:Panel ID="hoverpanel" runat="server">
                        <asp:Label ID="lblhovername" runat="server"></asp:Label>
                    </asp:Panel>

                    <asp:Label runat="server" Style="padding-left: 100px;" ID="lbldb_update"></asp:Label>


    
                    <asp:Panel runat="server" ID="pnlReparto" Style="margin-top: 100px; margin-left: 250px;" CssClass="">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-4">
                                    <h4>Linea 1</h4>
                                    <asp:GridView runat="server" ID="dgv_l1" OnRowDataBound="Reparto_Bound_gv1" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                                <div class="col-sm-4">
                                    <h4>Linea 2</h4>
                                    <asp:GridView runat="server" ID="dgv_l2" OnRowDataBound="Reparto_Bound_gv2" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                                <div class="col-sm-4">
                                    <h4>Linea 3</h4>
                                    <asp:GridView runat="server" ID="dgv_l3" OnRowDataBound="Reparto_Bound_gv3" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-4">
                                    <h4>Linea 4</h4>
                                    <asp:GridView runat="server" ID="dgv_l4" OnRowDataBound="Reparto_Bound_gv4" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                                <div class="col-sm-4">
                                    <h4>Linea 5</h4>
                                    <asp:GridView runat="server" ID="dgv_l5" OnRowDataBound="Reparto_Bound_gv5" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                                <div class="col-sm-4">
                                    <h4>Linea 6</h4>
                                    <asp:GridView runat="server" ID="dgv_l6" OnRowDataBound="Reparto_Bound_gv6" HeaderStyle-CssClass="gridheaderrepart" CssClass="gvreparto"></asp:GridView>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                    <br />
                    <asp:Button ID="cmdLogOut" runat="server" Text="Log out/End session" Style="margin-right: 40px; margin-top: 20px; width: 120pt; display: none; height: 30pt; background-color: crimson" ForeColor="White" OnClick="cmdLogOut_Click" />

                    <asp:Table runat="server" Style="border-collapse: inherit; display: block;">
                        <asp:TableRow>
                            <asp:TableCell>

                                <asp:Panel ID="l1" runat="server" Width="355px" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PIEGO_LINEA1" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPg1" runat="server" />
                                        <%--      <a href="#popup1">
                                            <asp:Image ID="cam1" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn45" runat="server" CssClass="PiegoBox" TabIndex="2301" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn46" runat="server" CssClass="PiegoBox" TabIndex="2302" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn47" runat="server" CssClass="PiegoBox" TabIndex="2303" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn48" runat="server" CssClass="PiegoBox" TabIndex="2304" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>

                                <asp:Panel ID="l2" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PRESSA_LINEA1" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPress1" runat="server" />
                                        <%--          <a href="#popup1">
                                            <asp:Image ID="cam2" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn42" runat="server" CssClass="PresaBox" TabIndex="2037" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn43" runat="server" CssClass="PresaBox" TabIndex="2032" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn44" runat="server" CssClass="PresaBox" TabIndex="2182" OnClick="Buttons_Click" /></span>
                                </asp:Panel>

                                <asp:Panel ID="l3" runat="server" CssClass="ThreeObjBox " Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="RAMMENDO_LINEA1" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblRam1" runat="server" />

                                    </asp:Panel>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn39" runat="server" CssClass="RammendoBox" TabIndex="2313" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn40" runat="server" CssClass="RammendoBox" TabIndex="2314" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn41" runat="server" CssClass="RammendoBox" TabIndex="2315" OnClick="Buttons_Click" /></span>
                                </asp:Panel>


                                <asp:Panel ID="l4" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="MANICHINO_LINEA1" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblMan1" runat="server" />

                                    </asp:Panel>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn4" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="2" OnClick="ButtonsMan_Click" /></span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn5" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="3" OnClick="ButtonsMan_Click" /></span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn6" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="4" OnClick="ButtonsMan_Click" /></span>
                                </asp:Panel>

                                <asp:Panel ID="l5" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="ETICHETTE_LINEA1" runat="server" CssClass="pnTitles" ClientIDMode="Static">

                                        <asp:Label ID="lblEt1" runat="server" />
                                    </asp:Panel>
                                    <span runat="server" class="EticheteCircle">
                                        <asp:Button ID="btn33" runat="server" CssClass="EticheteBox" TabIndex="2321" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn34" runat="server" CssClass="EticheteBox" TabIndex="2322" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn35" runat="server" CssClass="EticheteBox" TabIndex="2323" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>
                            </asp:TableCell>

                            <asp:TableCell>
                            </asp:TableCell>

                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Panel ID="l6" runat="server" Width="355px" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PIEGO_LINEA2" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPg2" runat="server" />
                                        <%-- <a href="#popup1">
                                            <asp:ImageButton ID="cam6" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn29" runat="server" CssClass="PiegoBox" TabIndex="2305" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn30" runat="server" CssClass="PiegoBox" TabIndex="2306" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn31" runat="server" CssClass="PiegoBox" TabIndex="2307" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn32" runat="server" CssClass="PiegoBox" TabIndex="2308" OnClick="Buttons_Click" /></span>
                                </asp:Panel>
                                <asp:Panel ID="l7" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PRESSA_LINEA2" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPress2" runat="server" />
                                        <%--        <a href="#popup1">
                                            <asp:Image ID="cam7" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn26" runat="server" CssClass="PresaBox" TabIndex="2151" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn27" runat="server" CssClass="PresaBox" TabIndex="2079" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn28" runat="server" CssClass="PresaBox" TabIndex="2038" OnClick="Buttons_Click" /></span>
                                </asp:Panel>
                                <asp:Panel ID="l8" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="RAMMENDO_LINEA2" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblRam2" runat="server" />

                                    </asp:Panel>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn23" runat="server" CssClass="RammendoBox" TabIndex="1000" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn24" runat="server" CssClass="RammendoBox" TabIndex="2316" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn25" runat="server" CssClass="RammendoBox" TabIndex="2317" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>
                                <asp:Panel ID="l9" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="MANICHINO_LINEA2" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblMan2" runat="server" />
                                    </asp:Panel>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn20" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="5" OnClick="ButtonsMan_Click" />
                                    </span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn21" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="6" OnClick="ButtonsMan_Click" />
                                    </span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn22" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="7" OnClick="ButtonsMan_Click" />
                                    </span>
                                </asp:Panel>
                                <asp:Panel ID="l10" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="ETICHETTE_LINEA2" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblEt2" runat="server" />

                                    </asp:Panel>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn17" runat="server" CssClass="EticheteBox" TabIndex="2324" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn18" runat="server" CssClass="EticheteBox" TabIndex="2325" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn19" runat="server" CssClass="EticheteBox" TabIndex="2326" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Panel ID="l11" runat="server" Width="355px" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PIEGO_LINEA3" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPg3" runat="server" />
                                        <%--     <a href="#popup1">
                                            <asp:Image ID="cam11" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn13" runat="server" CssClass="PiegoBox" TabIndex="2309" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn14" runat="server" CssClass="PiegoBox" TabIndex="2310" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn15" runat="server" CssClass="PiegoBox" TabIndex="2311" OnClick="Buttons_Click" /></span>
                                    <span class="PiegoCircle">
                                        <asp:Button ID="btn16" runat="server" CssClass="PiegoBox" TabIndex="2312" OnClick="Buttons_Click" /></span>
                                </asp:Panel>

                                <asp:Panel ID="l12" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="PRESSA_LINEA3" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblPress3" runat="server" />
                                        <%--           <a href="#popup1">
                                            <asp:Image ID="cam12" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn10" runat="server" CssClass="PresaBox" TabIndex="2081" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn11" runat="server" CssClass="PresaBox" TabIndex="2071" OnClick="Buttons_Click" /></span>
                                    <span class="PressaCircle">
                                        <asp:Button ID="btn12" runat="server" CssClass="PresaBox" TabIndex="2074" OnClick="Buttons_Click" /></span>
                                </asp:Panel>

                                <asp:Panel ID="l13" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="RAMMENDO_LINEA3" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblRam3" runat="server" />
                                        <%--              <a href="#popup1">
                                            <asp:Image ID="cam15" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn7" runat="server" CssClass="RammendoBox" TabIndex="2318" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn8" runat="server" CssClass="RammendoBox" TabIndex="2319" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="RammendoCircle">
                                        <asp:Button ID="btn9" runat="server" CssClass="RammendoBox" TabIndex="2320" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>


                                <asp:Panel ID="l14" runat="server" CssClass="ThreeObjBox" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="MANICHINO_LINEA3" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblMan3" runat="server" />
                                        <%--             <a href="#popup1">
                                            <asp:Image ID="cam13" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn36" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="8" OnClick="ButtonsMan_Click" />
                                    </span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn37" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="9" OnClick="ButtonsMan_Click" />
                                    </span>
                                    <span class="ManichinoCircle">
                                        <asp:Button ID="btn38" runat="server" CssClass="ManichinoBox" Style="border-radius: 100%; float: left;" TabIndex="10" OnClick="ButtonsMan_Click" />
                                    </span>
                                </asp:Panel>

                                <asp:Panel ID="l15" runat="server" CssClass="ThreeObjBox" Wrap="True" Style="position: relative;" ClientIDMode="Static">
                                    <asp:Panel ID="ETICHETTE_LINEA3" runat="server" CssClass="pnTitles" ClientIDMode="Static">
                                        <asp:Label ID="lblEt3" runat="server" />
                                        <%--              <a href="#popup1">
                                            <asp:Image ID="cam14" runat="server" ImageUrl="~/images/video.png" Style="float: right; padding-right: 2px; height: 20px;" /></a>--%>
                                    </asp:Panel>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn1" runat="server" CssClass="EticheteBox" TabIndex="2327" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn2" runat="server" CssClass="EticheteBox" TabIndex="2328" OnClick="Buttons_Click" />
                                    </span>
                                    <span class="EticheteCircle">
                                        <asp:Button ID="btn3" runat="server" CssClass="EticheteBox" TabIndex="2329" OnClick="Buttons_Click" />
                                    </span>
                                </asp:Panel>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lblPiegoTotale" CssClass="txtcolor" Style="margin-left: 10px; float: left; width: 355px;"></asp:Label>
                                <asp:Label runat="server" ID="lblPressaTotale" CssClass="txtcolor" Style="margin-left: 20px; float: left; width: 300px;"></asp:Label>
                                <asp:Label runat="server" ID="lblRammendoTotale" CssClass="txtcolor" Style="margin-left: 20px; float: left; width: 300px;"></asp:Label>
                                <asp:Label runat="server" ID="lblManichinototale" CssClass="txtcolor" Style="margin-left: 20px; float: left; width: 300px;"></asp:Label>
                                <asp:Label runat="server" ID="lblEticheteTOtale" CssClass="txtcolor" Style="margin-left: 20px; float: left; width: 300px;"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

                        <%-- ACCORDIAN --%>
                        <asp:TableRow>
                            <asp:TableCell CssClass="">
                                <asp:Panel ID="Panel1" runat="server" CssClass="ThreeObjBoxAccordianPiego" Style="position: relative;">
                                    <div class="panel-group ">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" href="#collapse1">
                                                    <h4 class="panel-title">
                                                        <asp:Label ID="wcline1" runat="server" CssClass="bordo"></asp:Label>
                                                        <span>PIEGO</span>
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:GridView ID="gv_piego" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel2" runat="server" CssClass="ThreeObjBoxAccordianPressa" Style="position: relative;">

                                    <div class="panel-group">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" href="#collapse2">
                                                    <h4 class="panel-title">
                                                        <asp:Label ID="wcline2" runat="server" CssClass="bordo"></asp:Label>
                                                        <span>PRESSA</span>
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:GridView ID="gv_pressa" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel3" runat="server" CssClass="ThreeObjBoxAccordianPressa" Style="position: relative;">

                                    <div class="panel-group ">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" href="#collapse3">
                                                    <h4 class="panel-title">
                                                        <asp:Label ID="wcline3" runat="server" CssClass="bordo"></asp:Label>
                                                        <span>RAMMENDO</span>
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:GridView ID="gv_rammendo" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel4" runat="server" CssClass="ThreeObjBoxAccordianPressa" Style="position: relative;">

                                    <div class="panel-group">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" href="#collapse4">
                                                    <h4 class="panel-title">

                                                        <asp:Label ID="wcline4" runat="server" CssClass="bordo"></asp:Label>
                                                        <span>MANICHINO</span>
                                                    </h4>
                                                </a>

                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:GridView ID="gv_manichino" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="Panel5" runat="server" CssClass="ThreeObjBoxAccordianPressa" Style="position: relative; padding-right: 0px; margin-right: 0px;">
                                    <div class="panel-group ">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" href="#collapse5">
                                                    <h4 class="panel-title">
                                                        <asp:Label ID="wcline5" runat="server" CssClass="bordo"></asp:Label>
                                                        <span>ETICHETTE</span>
                                                    </h4>
                                                </a>

                                            </div>
                                            <div id="collapse5" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:GridView ID="gv_ettichete" runat="server" AutoGenerateColumns="true" ShowHeader="false" BorderStyle="None" BorderColor="Transparent"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <%--<asp:Button runat="server" ID="btn_Camera" />--%>

                    <%-- MODAL PANEL --%>
                    <asp:Panel ID="ModalPanel" runat="server" ClientIDMode="Static">
                        <div id="modalblurdiv" class="" style="background-color: rgba(0, 0, 0, 0.81); z-index: 999; height: 100%; width: 100%; position: fixed; top: 0; left: 0; bottom: 0">
                            <div id="modaldiv" style="display: block; position: absolute; height: auto; border-radius: 10px; z-index: 15; top: 13%; left: 33%; margin: 0 0 0 -150px;">
                                <%--<asp:ImageButton ID="OKButton" runat="server" OnClick="Cancel_Click" ImageUrl="~/images/cancel.png" Style="float: right; padding-top: 10px; padding-right: 10px;" />--%>

                                <section id="mobilescreen" class="" style="">
                                    <div id="speaker"></div>
                                    <section id="maincontainer">

                                        <nav id="mainmenu">
                                            <ul>
                                                <li id="backmenu">Back</li>
                                                <li></li>
                                                <li id="firstpage">First Page</li>
                                                <li id="secondpage">Second Page</li>
                                            </ul>
                                        </nav>

                                        <section id="mainscreen">
                                            <header style="animation-delay: 0.3s;" class="">
                                                <i class="fa fa-align-justify" id="menu"></i>
                                                <h1 style="font-size: 1.5em; color: white; padding-top: 10px; text-align: center;">
                                                    <asp:Label ID="lblName" runat="server" Style="line-height: 27px;"></asp:Label>
                                                    <asp:Label ID="lblfasechecker" runat="server" Style="float: right; line-height: 27px; padding-right: 15px; font-size: initial; position: absolute; right: 1%; color: white;"></asp:Label>
                                                </h1>
                                            </header>

                                            <section id="container">
                                                <%--<p class="intro">User, your current status is...</p>--%>
                                                <%-- FIRST PAGE --%>
                                                <ul id="listlink">
                                                    <li>
                                                        <div></div>
                                                        <span class="titles "><i class="fa fa-bar-chart-o"></i>Articole: </span><span class="offdata">
                                                            <asp:Label ID="lblArticole" runat="server"></asp:Label></span></li>
                                                    <li>
                                                        <div></div>
                                                        <span class="titles "><i class="fa fa-tags"></i>Phase:</span><span class="offdata"><asp:Label ID="lblPhase" runat="server"></asp:Label></span></li>
                                                    <li>
                                                        <div></div>
                                                        <span class="titles"><i class="fa fa-plus-square"></i>C/Ora DB:</span><span class="offdata">
                                                            <asp:Label ID="lblNorm" runat="server"></asp:Label></span></li>
                                                    <li>
                                                        <div></div>
                                                        <span class="titles"><i class="fa fa-tag"></i>Fatto nella fase attuale: </span><span class="offdata">
                                                            <asp:Label ID="lblQty" runat="server"></asp:Label></span></li>
                                                    <li>
                                                        <div></div>
                                                        <span class="titles"><i class="fa fa-bullhorn"></i>Tempo:</span><span class="offdata"><asp:Label ID="lblTempo" runat="server"></asp:Label></span></li>
                                                    <li style="margin-bottom: 10px;">
                                                        <div></div>
                                                        <span class="titles"><i class="fa fa-bookmark"></i>Code Machine:</span><span class="offdata"><asp:Label ID="lblCode" runat="server"></asp:Label></span></li>
                                                </ul>
                                                <%-- SECOND PAGE --%>
                                                <div id="listlink2" style="">
                                                    <asp:Button ID="showmore" OnClick="ShowDetailedStats_Click" ClientIDMode="static" runat="server" Text="Importa dati da DB" Style="padding: 5px;" />
                                                    <asp:GridView runat="server" ID="dgv1" AutoGenerateColumns="true" ClientIDMode="static" OnRowDataBound="Strasnafunkcija" />
                                                </div>
                                            </section>
                                        </section>
                                    </section>
                                    <asp:ImageButton ID="powerbutton" ImageUrl="../../images/poweroff.png" runat="server" ClientIDMode="static" Style="height: 45px; left: 0%;" OnClick="Cancel_Click" />
                                    <asp:ImageButton ID="powerbutton1" ImageUrl="../../images/poweroff.png" runat="server" ClientIDMode="static" OnClick="Cancel1_click" Style="display: none" />
                                </section>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <div style="display: none;">
                    <asp:Label runat="server" ID="lblTotEfficiency"></asp:Label>
                    <asp:Label runat="server" ID="lbltoteffStiro"></asp:Label>
                    <asp:Label runat="server" ID="lbl1"></asp:Label>
                    <asp:Button runat="server" ID="Button1" Style="width: 26px; height: 26px; border-radius: 4px; background-color: white;" />
                </div>
            </asp:Panel>

            <asp:Panel runat="server" ID="pnl_sort_by_line_stiro" ClientIDMode="static">
                <%--<br />--%>
                <h5 class="h5_sort">Sort by Line:</h5>
                <%--<hr style="line-height:1px;margin:10px;" />--%>
                <asp:Table runat="server" ID="checkboxWrapper">
                    <asp:TableRow>
                    </asp:TableRow>
                    <%-- Piego 1 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check1" type="checkbox" checked="checked" name="check1" class="checkbox"  /> 
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Piego L1
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Piego 2 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check6" type="checkbox" checked="checked" name="check6" class="checkbox"  />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Piego L2
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Piego 3 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check11" type="checkbox" checked="checked" name="check11" class="checkbox"  />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Piego L3
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Pressa 1 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check2" type="checkbox" checked="checked" name="check2" class="checkbox"  />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Pressa L1
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Pressa 2 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check7" type="checkbox" checked="checked" name="check7" class="checkbox"  />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Pressa L2
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Pressa 3 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check12" type="checkbox" checked="checked" class="checkbox" name="check12" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Pressa L3
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Rammendo 1 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check3" type="checkbox" checked="checked" class="checkbox" name="check3" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Rammendo L1
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Rammendo 2 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check8" type="checkbox" checked="checked" class="checkbox" name="check8" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Rammendo L2
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Rammendo 3 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check13" type="checkbox" checked="checked" class="checkbox" name="check13" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Rammendo L3
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Manichino 1 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check4" type="checkbox" checked="checked" class="checkbox" name="check4" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Manichino L1
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Manichino 2 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check9" type="checkbox" checked="checked" class="checkbox" name="check9" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Manichino L2
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Manichino 3 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check14" type="checkbox" checked="checked" class="checkbox" name="check14" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Manichino L3
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Etichete 1 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check5" type="checkbox" checked="checked" class="checkbox" name="check5" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Etichette L1
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Etichete 2 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check10" type="checkbox" checked="checked" class="checkbox" name="check10" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                            Etichette L2
                        </asp:TableCell>
                    </asp:TableRow>
                    <%-- Etichete 3 --%>
                    <asp:TableRow>
                        <asp:TableCell>
                                                            <input id="check15" type="checkbox" checked="checked" class="checkbox" name="check15" />
                        </asp:TableCell>
                        <asp:TableCell>
                                                           Etichette L3
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell><input type="checkbox" class="check" checked="checked" id="select_all" style="margin-top:10px;" /></asp:TableCell>
                        <asp:TableCell Style="color: darkred; padding-top: 5px;">Check/Uncheck All</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--<script src="js/conf-stiro.js"></script>--%>
        <script type="text/javascript">
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                if (args.get_error() != undefined) {
                    args.set_errorHandled(true);
                }
            }
    </script>
    <%-- MODALPANEL SHOW/HIDE MENU --%>
    <script>
        function PrintPage() {
            var panel = document.getElementById("<%=gv_intervali.ClientID %>");
            var printWindow = window.open('', '', 'height=2600,width=1000');
            printWindow.document.write('<table>');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</table>');
            printWindow.document.close();
            printWindow.print();

            return false;
        };


    </script>

    <script type="text/javascript"> 

        // bind the events (jQuery way)
        $(document).ready(function () {

            $("#favicon").attr("href", "./Images/navS.png");
            bindEvents();


        });

        // attach the event binding function to every partial update
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
            bindEvents();
        });

        function closeme() {
            $("#closeme").click();
        };

        $("#closee").click(function () {
            $("#closeme").click();

        });

        function bindEvents() {
            $("#menu").click(function () {
                $("#mainmenu").toggleClass("showmenu");
                $("#mainscreen").toggleClass("movemaincontainer");
            });

            $("#cal_button").click(function () {
                $("#spinner").css("display", "block");
            });

            $("#spinner").hide();


            $("#backmenu").click(function () {
                $("#mainmenu").hide();
            });

            $("#secondpage").click(function () {
                //$("#showmore").click();
                $("#listlink").hide();
                $("#mainmenu").hide();
                $("#listlink2").show();
                $("#loadingbar").show();
            });


            $("#firstpage").click(function () {
                $("#listlink2").hide();
                $("#listlink").show();
                $("#mainmenu").hide();
            });

            $("#menu").click(function () {
                $("#mainmenu").show();
                $("#mainmenu2").toggleClass("showmenu2");
                $("#mainscreen").toggleClass("movemaincontainer");
            });

            $("#showmore").click(function () {
                //$("#loadingbar").show();
                $("#listlink").hide();
                $("#mainmenu").hide();
                $("#listlink2").show();
                $("#loadingbar").show();
                $("#secondpage").click();
            });
            //select all checkboxes
            $("#select_all").change(function () {  //"select all" change 
                $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status

                if ($('#check1').is(':checked')) {
                    $('#l1').css('visibility', 'visible');
                } else {
                    $('#l1').css('visibility', 'hidden');
                }


                if ($('#check2').is(':checked')) {
                    $('#l2').css('visibility', 'visible');
                } else {
                    $('#l2').css('visibility', 'hidden');
                }


                if ($('#check3').is(':checked')) {
                    $('#l3').css('visibility', 'visible');
                } else {
                    $('#l3').css('visibility', 'hidden');
                }


                if ($('#check4').is(':checked')) {
                    $('#l4').css('visibility', 'visible');
                } else {
                    $('#l4').css('visibility', 'hidden');
                }


                if ($('#check5').is(':checked')) {
                    $('#l5').css('visibility', 'visible');
                } else {
                    $('#l5').css('visibility', 'hidden');
                }


                if ($('#check6').is(':checked')) {
                    $('#l6').css('visibility', 'visible');
                } else {
                    $('#l6').css('visibility', 'hidden');
                }

                if ($('#check7').is(':checked')) {
                    $('#l7').css('visibility', 'visible');
                } else {
                    $('#l7').css('visibility', 'hidden');
                }

                if ($('#check8').is(':checked')) {
                    $('#l8').css('visibility', 'visible');
                } else {
                    $('#l8').css('visibility', 'hidden');
                }

                if ($('#check9').is(':checked')) {
                    $('#l9').css('visibility', 'visible');
                } else {
                    $('#l9').css('visibility', 'hidden');
                }

                if ($('#check10').is(':checked')) {
                    $('#l10').css('visibility', 'visible');
                } else {
                    $('#l10').css('visibility', 'hidden');
                }

                if ($('#check11').is(':checked')) {
                    $('#l11').css('visibility', 'visible');
                } else {
                    $('#l11').css('visibility', 'hidden');
                }
                if ($('#check12').is(':checked')) {
                    $('#l12').css('visibility', 'visible');
                } else {
                    $('#l12').css('visibility', 'hidden');
                }
                if ($('#check13').is(':checked')) {
                    $('#l13').css('visibility', 'visible');
                } else {
                    $('#l13').css('visibility', 'hidden');
                }
                if ($('#check14').is(':checked')) {
                    $('#l14').css('visibility', 'visible');
                } else {
                    $('#l14').css('visibility', 'hidden');
                }
                if ($('#check15').is(':checked')) {
                    $('#l15').css('visibility', 'visible');
                } else {
                    $('#l15').css('visibility', 'hidden');
                }
            });

            //".checkbox" change 
            $('.checkbox').change(function () {
                //uncheck "select all", if one of the listed checkbox item is unchecked
                if (false == $(this).prop("checked")) { //if this item is unchecked
                    $("#select_all").prop('checked', false); //change "select all" checked status to false
                }
                //check "select all" if all checkbox items are checked
                if ($('.checkbox:checked').length === $('.checkbox').length) {
                    $("#select_all").prop('checked', true);
                }
            });

        };

        $("#novo").click(function () {
            $("#novo1").click();
        });

        $("#close1").click(function () {
            $("#powerbutton1").click();
        });



        function showsecondpage() {
            $("#loadingbar").hide();
            $("#listlink").hide();
            $("#mainmenu").hide();
            $("#listlink2").show();
        };





            <%-- STAMPA I ZOOM IN OUT --%>

            $("#btn_print").click(function () {
                $('body').css({ zoom: 0.54 });
                window.print();
                $('body').css({ zoom: 1 });
            });

            $("#btn_pdf").click(function () {
                getPDF();
                geteff();
            });

            $("#get_pdf_intervali").click(function () {
                getPDF_intervali();
            });

            function getPDF() {
                var pdf = new jsPDF('p', 'pt', 'a2');
                $("input, button, p").addClass("nijekrugnegokocka");
                $("span").addClass("KoferceKruzicNone");
                pdf.addHTML(document.body, function () {
                    pdf.save('Stiro.pdf');
                });
            };

            function getPDF_intervali() {
                var pdf = new jsPDF('p', 'pt', 'a2');
                pdf.addHTML($("#popup"), function () {
                    pdf.save('Stiro_interval.pdf');
                });
            };


            $('#zoom-in').click(function () {
                updateZoom(0.1);
            });

            $('#zoom-out').click(function () {
                updateZoom(-0.1);
            });


            zoomLevel = 1;

            var updateZoom = function (zoom) {
                zoomLevel += zoom;
                $('body').css({ zoom: zoomLevel, '-moz-transform': 'scale(' + zoomLevel + ')' });
            };


            <%-- LEFT-NAVI --%>

            function mouseOver() {
                document.getElementById("left-navi").className = "ng-scope hover";
            };
            function mouseOut() {
                document.getElementById("left-navi").className = "ng-scope";
            };

            function rgtForce() {

                var e = document.getElementById('right-navi');
                if (e.className === 'ng-scope hover') {
                    e.className = 'ng-scope';
                }
                else {
                    e.className = 'ng-scope hover';
                }
            };

            function priorView() {
                var collection = document.getElementsByClassName('cats');

                document.getElementById('prior').className = 'filter active';
                document.getElementById('all').className = 'filter';

                for (var i = 0, len = collection.length; i < len; i++) {
                    collection[i].classList.remove("show");
                }
            };
            function allView() {
                var collection = document.getElementsByClassName('cats');

                document.getElementById('prior').className = 'filter';
                document.getElementById('all').className = 'filter active';

                for (var i = 0, len = collection.length; i < len; i++) {

                    collection[i].classList.add("show");
                }
            };
            <%-- RIGHT-ASSNAVI --%>

            function mouseOverRight() {
                document.getElementById("right-assnavi").className = "ng-scope hover";
            };
            function mouseOutRight() {
                document.getElementById("right-assnavi").className = "ng-scope";
            };

            function zoominoutstampa() {
                $("#stampa").click(function () {
                    $('body').css({ zoom: 0.54 });

                    window.print();
                    $('body').css({ zoom: 1 });

                });

                $('#zoom-in').click(function () {
                    updateZoom(0.1);
                });



                $('#zoom-out').click(function () {
                    updateZoom(-0.1);
                });

                zoomLevel = 1;

                var updateZoom = function (zoom) {
                    zoomLevel += zoom;
                    $('body').css({ zoom: zoomLevel, '-moz-transform': 'scale(' + zoomLevel + ')' });
                };
            };




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
                    $('#ampm').text(ampm);
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

            $(document).ready(function () {

                $('#check1').change(function () {
                    if ($('#check1').is(':checked')) {
                        $('#l1').css('visibility', 'visible');
                    } else {
                        $('#l1').css('visibility', 'hidden');
                    }
                });


                $('#check2').change(function () {
                    if ($('#check2').is(':checked')) {
                        $('#l2').css('visibility', 'visible');
                    } else {
                        $('#l2').css('visibility', 'hidden');
                    }
                });


                $('#check3').change(function () {
                    if ($('#check3').is(':checked')) {
                        $('#l3').css('visibility', 'visible');
                    } else {
                        $('#l3').css('visibility', 'hidden');
                    }
                });


                $('#check4').change(function () {
                    if ($('#check4').is(':checked')) {
                        $('#l4').css('visibility', 'visible');
                    } else {
                        $('#l4').css('visibility', 'hidden');
                    }
                });

                $('#check5').change(function () {
                    if ($('#check5').is(':checked')) {
                        $('#l5').css('visibility', 'visible');
                    } else {
                        $('#l5').css('visibility', 'hidden');
                    }
                });

                $('#check6').change(function () {
                    if ($('#check6').is(':checked')) {
                        $('#l6').css('visibility', 'visible');
                    } else {
                        $('#l6').css('visibility', 'hidden');
                    }
                });

                $('#check7').change(function () {
                    if ($('#check7').is(':checked')) {
                        $('#l7').css('visibility', 'visible');
                    } else {
                        $('#l7').css('visibility', 'hidden');
                    }
                });

                $('#check8').change(function () {
                    if ($('#check8').is(':checked')) {
                        $('#l8').css('visibility', 'visible');
                    } else {
                        $('#l8').css('visibility', 'hidden');
                    }
                });


                $('#check9').change(function () {
                    if ($('#check9').is(':checked')) {
                        $('#l9').css('visibility', 'visible');
                    } else {
                        $('#l9').css('visibility', 'hidden');
                    }
                });


                $('#check10').change(function () {
                    if ($('#check10').is(':checked')) {
                        $('#l10').css('visibility', 'visible');
                    } else {
                        $('#l10').css('visibility', 'hidden');
                    }
                });


                $('#check11').change(function () {
                    if ($('#check11').is(':checked')) {
                        $('#l11').css('visibility', 'visible');
                    } else {
                        $('#l11').css('visibility', 'hidden');
                    }
                });


                $('#check12').change(function () {
                    if ($('#check12').is(':checked')) {
                        $('#l12').css('visibility', 'visible');
                    } else {
                        $('#l12').css('visibility', 'hidden');
                    }
                });

                $('#check13').change(function () {
                    if ($('#check13').is(':checked')) {
                        $('#l13').css('visibility', 'visible');
                    } else {
                        $('#l13').css('visibility', 'hidden');
                    }
                });

                $('#check14').change(function () {
                    if ($('#check14').is(':checked')) {
                        $('#l14').css('visibility', 'visible');
                    } else {
                        $('#l14').css('visibility', 'hidden');
                    }
                });

                $('#check15').change(function () {
                    if ($('#check15').is(':checked')) {
                        $('#l15').css('visibility', 'visible');
                    } else {
                        $('#l15').css('visibility', 'hidden');
                    }
                });
            });

            function GetNameByHover1() {
                document.getElementById("GetName").click();
            };
    </script>
    <script src="../../js/jspdf.min.js"></script>

</asp:Content>

