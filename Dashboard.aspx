<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" ClientIDMode="Static" Inherits="Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <title>Olimpias Knitting</title>
    <link rel="shortcut icon" type="Images/Image/png" href="./Images/ok-icon.png" />
    <link rel="apple-touch-icon" href="./Images/ok-icon.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="./Images/ok-icon.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="./Images/ok-icon.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="./Images/ok-icon.png" />
    <!-- CSS  -->
    <link rel="stylesheet" href="./css/font-awesome.min.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/animate.min.css" />
    <link rel="stylesheet" href="./css/new/style3.min.css" />
    <link rel="stylesheet" href="./css/loader.css" />
    <link rel="stylesheet" href="./css/jquery-ui.css" />
    <link rel="stylesheet" href="./dashboard/css/peki-style.min.css" />
    <%--<link rel="stylesheet" href="./dashboard/css/messages.css" />--%>
    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
    <link rel="stylesheet" href="./css/mobile/dashboard_rework.css" />
    <style>
        .blur{display:none!important;}
        .peki{display:none;}
        .loader {
  position: fixed;
  top: 50%;
  left: 50%;
  width: 160px;
  height: 160px;
  margin: -80px 0px 0px -80px;
  background-color: transparent;
  border-radius: 50%;
  border: 2px solid #e3e4dc;
}
.loader:before {
  content: "";
  width: 164px;
  height: 164px;
  display: block;
  position: absolute;
  border: 2px solid #898a86;
  border-radius: 50%;
  top: -2px;
  left: -2px;
  box-sizing: border-box;
  clip: rect(0px, 35px, 35px, 0px);
  z-index: 10;
  -webkit-animation: rotate infinite;
          animation: rotate infinite;
  -webkit-animation-duration: 3s;
          animation-duration: 3s;
  -webkit-animation-timing-function: linear;
          animation-timing-function: linear;
}
.loader:after {
  content: "";
  width: 164px;
  height: 164px;
  display: block;
  position: absolute;
  border: 2px solid #c1bebb;
  border-radius: 50%;
  top: -2px;
  left: -2px;
  box-sizing: border-box;
  clip: rect(0px, 164px, 150px, 0px);
  z-index: 9;
  -webkit-animation: rotate2 3s linear infinite;
          animation: rotate2 3s linear infinite;
}

.hexagon-container {
  position: relative;
  top: 33px;
  left: 41px;
  border-radius: 50%;
}

.hexagon {
  position: absolute;
  width: 40px;
  height: 23px;
  background-color: #556c82;
}
.hexagon:before {
  content: "";
  position: absolute;
  top: -11px;
  left: 0;
  width: 0;
  height: 0;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-bottom: 11.5px solid #556c82;
}
.hexagon:after {
  content: "";
  position: absolute;
  top: 23px;
  left: 0;
  width: 0;
  height: 0;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-top: 11.5px solid #556c82;
}

.hexagon.hex_1 {
  top: 0px;
  left: 0px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 0.2142857143s;
          animation-delay: 0.2142857143s;
}

.hexagon.hex_2 {
  top: 0px;
  left: 42px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 0.4285714286s;
          animation-delay: 0.4285714286s;
}

.hexagon.hex_3 {
  top: 36px;
  left: 63px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 0.6428571429s;
          animation-delay: 0.6428571429s;
}

.hexagon.hex_4 {
  top: 72px;
  left: 42px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 0.8571428571s;
          animation-delay: 0.8571428571s;
}

.hexagon.hex_5 {
  top: 72px;
  left: 0px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 1.0714285714s;
          animation-delay: 1.0714285714s;
}

.hexagon.hex_6 {
  top: 36px;
  left: -21px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 1.2857142857s;
          animation-delay: 1.2857142857s;
}

.hexagon.hex_7 {
  top: 36px;
  left: 21px;
  -webkit-animation: Animasearch 3s ease-in-out infinite;
          animation: Animasearch 3s ease-in-out infinite;
  -webkit-animation-delay: 1.5s;
          animation-delay: 1.5s;
}

@-webkit-keyframes Animasearch {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1;
  }
  15%,
  50% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
    opacity: 0;
  }
  65% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1;
  }
}

@keyframes Animasearch {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1;
  }
  15%,
  50% {
    -webkit-transform: scale(0.5);
            transform: scale(0.5);
    opacity: 0;
  }
  65% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1;
  }
}
@-webkit-keyframes rotate {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
    clip: rect(0px, 35px, 35px, 0px);
  }
  50% {
    clip: rect(0px, 40px, 40px, 0px);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
    clip: rect(0px, 35px, 35px, 0px);
  }
}
@keyframes rotate {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
    clip: rect(0px, 35px, 35px, 0px);
  }
  50% {
    clip: rect(0px, 40px, 40px, 0px);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
    clip: rect(0px, 35px, 35px, 0px);
  }
}
@-webkit-keyframes rotate2 {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
    clip: rect(0px, 164px, 150px, 0px);
  }
  50% {
    clip: rect(0px, 164px, 0px, 0px);
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
  100% {
    -webkit-transform: rotate(720deg);
            transform: rotate(720deg);
    clip: rect(0px, 164px, 150px, 0px);
  }
}
@keyframes rotate2 {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
    clip: rect(0px, 164px, 150px, 0px);
  }
  50% {
    clip: rect(0px, 164px, 0px, 0px);
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
  100% {
    -webkit-transform: rotate(720deg);
            transform: rotate(720deg);
    clip: rect(0px, 164px, 150px, 0px);
  }
}
@-webkit-keyframes rotate3 {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}
@keyframes rotate3 {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
  }
}

    </style>
</head>
<body onbeforeunload="return document.getElementById('LoginStatus1').click();" id="bodyid" class="animated fadeIn">
    <form id="form1"   runat="server" >
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="js/jquery-1.12.4.min.js" />
                <asp:ScriptReference Path="dashboard/js/main_controler5.7.js" />
                <asp:ScriptReference Path="js/bootstrap.min.js" />
                <asp:ScriptReference Path="js/modernizr.min.js" />
                <asp:ScriptReference Path="js/notify.min.js" />
            </Scripts>
        </asp:ScriptManager>


         <div class="container-fluid" >
            <div id="left-navi" onmouseover="openClose()" onmouseout="openClose()">
                <nav class="main-nav" id="left_navi" runat="server">
                    <div id="menu">
                        <ul>
                            <li>
                                <a href="#!" id="menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_cont">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_controlo.png" class="radius" alt="icon" />
                                    <span>Controlo di gestione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_prod">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_produzione.png" class="radius" alt="icon" />
                                    <span>Produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso">
                                    <img src="./dashboard/images/menu/m_risorso.png" class="radius" alt="icon" />
                                    <span>Risorse umane</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_smart.png" class="radius" alt="icon" />
                                    <span>Smart factory</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_tess">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tessitura.png" class="radius" alt="icon" />
                                    <span>Tessitura</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_confezione.png" class="radius" alt="icon" />
                                    <span>Confezione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_lavanderia.png" class="radius" alt="icon" />
                                    <span>Lavanderia</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_sartoria.png" class="radius" alt="icon" />
                                    <span>Sartoria</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro">
                                    <img src="./dashboard/images/menu/m_stiro.png" class="radius" alt="icon" />
                                    <span>Stiro</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_timbrature">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_timbrature.png" class="radius" alt="icon" />
                                    <span>Giusti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>



                            <li>
                                <a href="#!" class="" id="m_statistiche">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_statistiche.png" class="radius" alt="icon" />
                                    <span>Reportistica</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="" id="m_organigrammi">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_organigrammi.png" class="radius" alt="icon" />
                                    <span>Organigrammi</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_database">
                                    <img src="./dashboard/images/menu/m_database.png" class="radius" alt="icon" />
                                    <span>Database</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_chat_interna">
                                    <img src="./dashboard/images/menu/m_chat_interna.png" class="radius" alt="icon" />
                                    <span>Chat interna</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_smart">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_porte">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_smart-porte.png" class="radius" alt="icon" />
                                    <span>Porte</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_luci">
                                    <img src="./dashboard/images/menu/m_smart-luci.png" class="radius" alt="icon" />
                                    <span>Luci</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="" id="m_temperature">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_smart-temperature.png" class="radius" alt="icon" />
                                    <span>Temperature</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="" id="m_allarmi">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_smart-allarmi.png" class="radius" alt="icon" />
                                    <span>Allarmi</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_macchine">
                                    <img src="./dashboard/images/menu/m_smart-macchine.png" class="radius" alt="icon" />
                                    <span>Macchine</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_musica">
                                    <img src="./dashboard/images/menu/m_smart-musica.png" class="radius" alt="icon" />
                                    <span>Musica</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_scheda_dipedente">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_scheda_dipedente">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-scheda-dipedente.png" class="radius" alt="icon" />
                                    <span>Scheda Dipedente</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_lettere">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-lettere.png" class="radius" alt="icon" />
                                    <span>Lettere ai Dipendenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_efficienze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-efficienza.png" class="radius" alt="icon" />
                                    <span>Efficienze Dipendenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_ore_assenza">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-ore.png" class="radius" alt="icon" />
                                    <span>Ore assenza / Staordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_buste_paga">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-buste.png" class="radius" alt="icon" />
                                    <span>Buste paga</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_ferie">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-ferie.png" class="radius" alt="icon" />
                                    <span>Ferie / Previdenza</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_lista">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-scheda-lista.png" class="radius" alt="icon" />
                                    <span>Lista Dipendenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_generale">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Report Generale</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_tessitura">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-tess.png" class="radius" alt="icon" />
                                    <span>Report Tessitura</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confezione">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Report Confezione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_lavanderia">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-lava.png" class="radius" alt="icon" />
                                    <span>Report Lavanderia</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stiro">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-stiro.png" class="radius" alt="icon" />
                                    <span>Report Stiro</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_strut">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-structura.png" class="radius" alt="icon" />
                                    <span>Report Struttura</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_org">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_org_tessitura">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-org-tess.png" class="radius" alt="icon" />
                                    <span>Organigramma Tessitura</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_org_confezione">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-org-conf.png" class="radius" alt="icon" />
                                    <span>Organigramma Confezione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_org_lavanderia">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-org-lava.png" class="radius" alt="icon" />
                                    <span>Organigramma Lavanderia</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_org_sart">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-org-sart.png" class="radius" alt="icon" />
                                    <span>Organigramma Sartoria</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_org_stiro">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-org-stiro.png" class="radius" alt="icon" />
                                    <span>Organigramma Stiro</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_db">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_scheda_dipedenti">
                                    <img src="./dashboard/images/menu/m_scheda_dipedenti.png" class="radius" alt="icon" />
                                    <span>Scheda Dipendenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_db_anagrafiche">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-db-anagrafiche.png" class="radius" alt="icon" />
                                    <span>Anagrafiche Dipendenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_db_centri">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-db-centri.png" class="radius" alt="icon" />
                                    <span>Centri di lavoro</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_db_tabelle">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-db-tabelle.png" class="radius" alt="icon" />
                                    <span>Tabelle causali</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_chat">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_chat_buste">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-chat-comunicazioni.png" class="radius" alt="icon" />
                                    <span>Buste paga</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_chat_comunicazioni">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-chat-posizione.png" class="radius" alt="icon" />
                                    <span>Comunicazioni</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_chat_posizione">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-chat-busta.png" class="radius" alt="icon" />
                                    <span>Posizione Dipendente</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat_generale">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_generale_organico">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Organico Generale</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_generale_reparti">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Reparti / Mansione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_generale_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Assenteismo Generale</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>

                            <li>
                                <a href="#!" id="m_riso_generale_assenteismo_giornaliero">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Assenteismo Giornaliero</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>

                            <li>
                                <a href="#!" id="m_riso_generale_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-generale.png" class="radius" alt="icon" />
                                    <span>Straordinario Generale</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat_tessitura">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_tess_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-tess.png" class="radius" alt="icon" />
                                    <span>Tessitura - Assenteismo</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_tess_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-tess.png" class="radius" alt="icon" />
                                    <span>Tessitura - Straordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_tess_presenze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-tess.png" class="radius" alt="icon" />
                                    <span>Tessitura - Presenze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_tess_efficienze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-tess.png" class="radius" alt="icon" />
                                    <span>Tessitura - Efficienze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat_confezione">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confa_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione A - Assenteismo</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confa_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione A - Straordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confa_presenze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione A - Presenze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confa_eff">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione A - Efficienze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confb_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione B - Assenteismo</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confb_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione B - Straordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confb_presenze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione B - Presenze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_confb_eff">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-conf.png" class="radius" alt="icon" />
                                    <span>Confezione B - Efficienze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat_stiro">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stiro_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-stiro.png" class="radius" alt="icon" />
                                    <span>Stiro - Assenteismo</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stiro_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-stiro.png" class="radius" alt="icon" />
                                    <span>Stiro - Straordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stiro_presenze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-stiro.png" class="radius" alt="icon" />
                                    <span>Stiro - Presenze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stiro_eff">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-stiro.png" class="radius" alt="icon" />
                                    <span>Stiro - Presenze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_riso_stat_strutura">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" class="radius" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stat_assenteismo">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-structura.png" class="radius" alt="icon" />
                                    <span>Struttura - Assenteismo</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_riso_stat_straordinario">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_riso-stat-structura.png" class="radius" alt="icon" />
                                    <span>Struttura - Straordinario</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_conf">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_prod_dp">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Dati Produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_prod_db">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Dati Base</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_stiro">
                        <ul>
                            <li>
                                <a href="#!" class="menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_prod_dp">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Dati Produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_prod_db">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Dati Base</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_tess">
                        <ul>
                            <li>
                                <a href="#!" class="menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_tess_prod_dp">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Dati Produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_tess_prod_db">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_db.png" class="radius" alt="icon" />
                                    <span>Dati Base</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_conf_dp">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_confa">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Confezione A - Layout</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_confb">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Confezione B - Layout</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_org">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Organigramma</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Efficienza</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Efficienza Mensille</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Intervali</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_conf_dp.png" class="radius" alt="icon" />
                                    <span>Statistiche di produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_conf_db">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Commesse</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_faze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Faze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_article">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Gestione archivio articoli</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_clienti">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Gestione ordini clienti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_machine">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Machines</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_persons">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Persone</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_conf_tablets">
                                    <img src="./dashboard/images/menu/m_conf_db.png" class="radius" alt="icon" />
                                    <span>Tablets</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_stiro_dp">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_lay">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Stiro - Layout</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_org">
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Organigramma</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:document.getElementById('').dispatchEvent(event);" class="disabled">
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Efficienza</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:document.getElementById('').dispatchEvent(event);" class="disabled">
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Efficienza Mensille</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_intervali">
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Intervali</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:document.getElementById('').dispatchEvent(event);" class="disabled">
                                    <img src="./dashboard/images/menu/m_stiro_dp.png" class="radius" alt="icon" />
                                    <span>Statistiche di produzione</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_stiro_db">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:document.getElementById('').dispatchEvent(event);" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Commesse</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_faze">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Faze</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_article">
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Gestione archivio articoli</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>

                            <li>
                                <a href="#!" id="m_stiro_clienti">
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Gestione ordini clienti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_machine">
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Machines</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" id="m_stiro_persons">
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Persone</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>

                            <li>
                                <a href="#!" id="m_stiro_tablets">
                                    <img src="./dashboard/images/menu/m_stiro_db.png" class="radius" alt="icon" />
                                    <span>Tablets</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_tess_dp">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>

                            <li>
                                <a href="#!" id="m_sinotico">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Sinotico</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>


                            <li>
                                <a href="#!"  class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Clienti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Articoli</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Commesse</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Fasi</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Dipedenti</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_tess_dp.png" class="radius" alt="icon" />
                                    <span>Machine</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="menu_prod_tess_db">
                        <ul>
                            <li>
                                <a href="#!" class="m_menu_all">
                                    <img src="./dashboard/images/navicon/all.svg" alt="icon" />
                                    <span>Tutti</span>
                                    <span class="pull-right"><</span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_db.png" class="radius" alt="icon" />
                                    <span>Programma Programatori</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!"  class="disabled">
                                    <img class="notification" src="./dashboard/images/miscicon/notify.svg" alt="icon" />
                                    <img src="./dashboard/images/menu/m_tess_db.png" class="radius" alt="icon" />
                                    <span>Programma tessitura</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                            <li>
                                <a href="#!" class="disabled">
                                    <img src="./dashboard/images/menu/m_tess_db.png" class="radius" alt="icon" />
                                    <span>Sinotico</span>
                                    <span class="pull-right">></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <%-- BREADCRUMPS --%>
            <div class="container-fluid" id="dbdpmenu" runat="server" >
                <div class="row">
                    <div class="col-sm-12 mob-header">
                        <div id="default_bread">
                            <button id="prior" type="button" class="filter active">In primo piano</button>
                            <button id="all" type="button" class="filter">Tutti</button>
                        </div>
                        <div id="produzione_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word">PRODUZIONE</div>
                            </div>
                            <button id="btn_back_prod" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">RISORSE UMANE</div>
                            </div>
                        <button id="btn_back_riso" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="smart_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #0671cc;">SMART FACTORY</div>
                            </div>
                            <button id="btn_back_smart" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_scheda_dipedenti" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">SCHEDA DIPEDENTI</div>
                            </div>
                            <button id="btn_back_to_riso" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_stat" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">STATISTICHE</div>
                            </div>
                            <button id="btn_back_to_riso_u" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_org" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">ORGANIGRAMMI</div>
                            </div>
                         <button id="btn_back_to_riso_uorg" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_db" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">DATABASE</div>
                            </div>
                         <button id="btn_back_to_riso_udb" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_chat" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #732c7b;">CHAT INTERNA</div>
                            </div>
                        <button id="btn_back_to_riso_uchat" type="button" class="filter active btnback">BACK</button>

                        </div>
                        <div id="riso_bread_stat_bck" style="display:none;">
                            <button id="btn_back_to_riso_stat" type="button" class="filter active btnback">BACK</button>
                        </div>
                        <div id="conf_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #af1d1d;">CONFEZIONE</div>
                            </div>
                            <img src="./dashboard/images/back_icon.png" id="btn_back_conf" class="btnback" style="height: 25px; cursor: pointer; padding-bottom: 3px;" />
                            <button id="dp_conf" type="button" class="filter active">Dati produzione</button>
                            <button id="db_conf" type="button" class="filter">Dati Base</button>
                        </div>
                        <div id="sart_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #af1d1d;">SARTORIA</div>
                            </div>
                            <img src="./dashboard/images/back_icon.png" id="btn_back_sart" class="btnback" style="height: 25px; cursor: pointer; padding-bottom: 3px;" />
                            <button id="dp_sart" type="button" class="filter active">Dati produzione</button>
                            <button id="db_sart" type="button" class="filter">Dati Base</button>
                        </div>
                        <div id="stiro_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #259f11;">STIRO</div>
                            </div>
                            <img src="./dashboard/images/back_icon.png" id="btn_back_stiro" class="btnback" style="height: 25px; cursor: pointer; padding-bottom: 3px;" />
                            <button id="dp_stiro" type="button" class="filter active">Dati produzione</button>
                            <button id="db_stiro" type="button" class="filter">Dati Base</button>
                        </div>
                        <div id="tess_bread" style="display:none;">
                            <div class="title">
                                <div class="title-word" style="color: #98604c;">TESSITURA</div>
                            </div>
                            <img src="./dashboard/images/back_icon.png" id="btn_back_tess" class="btnback" style="height: 25px; cursor: pointer; padding-bottom: 3px;" />
                            <button id="dp_tess" type="button" class="filter active">Dati produzione</button>
                            <button id="db_tess" type="button" class="filter">Dati Base</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--TABS AND FRAME CREATOR--%>
            <div class="container-fluid">
                <div class="tab">
                    <ul class="tabs">
                    </ul>
                    <div class="tab_content">
                             <%--   <asp:UpdateProgress id="updateProgress" runat="server">
                                    <ProgressTemplate>
                                        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="lds-gears" width="159px" height="159px" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" style="background: none;"><g transform="translate(50 50)"> <g transform="translate(-19 -19) scale(0.6)"> <g transform="rotate(238.763)">
<animateTransform attributeName="transform" type="rotate" values="0;360" keyTimes="0;1" dur="2.3s" begin="0s" repeatCount="indefinite"/><path d="M37.3496987939662 -7 L47.3496987939662 -7 L47.3496987939662 7 L37.3496987939662 7 A38 38 0 0 1 31.359972760794346 21.46047782418268 L31.359972760794346 21.46047782418268 L38.431040572659825 28.531545636048154 L28.531545636048154 38.431040572659825 L21.46047782418268 31.359972760794346 A38 38 0 0 1 7.0000000000000036 37.3496987939662 L7.0000000000000036 37.3496987939662 L7.000000000000004 47.3496987939662 L-6.999999999999999 47.3496987939662 L-7 37.3496987939662 A38 38 0 0 1 -21.46047782418268 31.35997276079435 L-21.46047782418268 31.35997276079435 L-28.531545636048154 38.431040572659825 L-38.43104057265982 28.531545636048158 L-31.359972760794346 21.460477824182682 A38 38 0 0 1 -37.3496987939662 7.000000000000007 L-37.3496987939662 7.000000000000007 L-47.3496987939662 7.000000000000008 L-47.3496987939662 -6.9999999999999964 L-37.3496987939662 -6.999999999999997 A38 38 0 0 1 -31.35997276079435 -21.460477824182675 L-31.35997276079435 -21.460477824182675 L-38.431040572659825 -28.531545636048147 L-28.53154563604818 -38.4310405726598 L-21.4604778241827 -31.35997276079433 A38 38 0 0 1 -6.999999999999992 -37.3496987939662 L-6.999999999999992 -37.3496987939662 L-6.999999999999994 -47.3496987939662 L6.999999999999977 -47.3496987939662 L6.999999999999979 -37.3496987939662 A38 38 0 0 1 21.460477824182686 -31.359972760794342 L21.460477824182686 -31.359972760794342 L28.531545636048158 -38.43104057265982 L38.4310405726598 -28.53154563604818 L31.35997276079433 -21.4604778241827 A38 38 0 0 1 37.3496987939662 -6.999999999999995 M0 -23A23 23 0 1 0 0 23 A23 23 0 1 0 0 -23" fill="#fbca00"/></g></g> <g transform="translate(19 19) scale(0.6)"> <g transform="rotate(98.7369)">
<animateTransform attributeName="transform" type="rotate" values="360;0" keyTimes="0;1" dur="2.3s" begin="-0.14375s" repeatCount="indefinite"/><path d="M37.3496987939662 -7 L47.3496987939662 -7 L47.3496987939662 7 L37.3496987939662 7 A38 38 0 0 1 31.359972760794346 21.46047782418268 L31.359972760794346 21.46047782418268 L38.431040572659825 28.531545636048154 L28.531545636048154 38.431040572659825 L21.46047782418268 31.359972760794346 A38 38 0 0 1 7.0000000000000036 37.3496987939662 L7.0000000000000036 37.3496987939662 L7.000000000000004 47.3496987939662 L-6.999999999999999 47.3496987939662 L-7 37.3496987939662 A38 38 0 0 1 -21.46047782418268 31.35997276079435 L-21.46047782418268 31.35997276079435 L-28.531545636048154 38.431040572659825 L-38.43104057265982 28.531545636048158 L-31.359972760794346 21.460477824182682 A38 38 0 0 1 -37.3496987939662 7.000000000000007 L-37.3496987939662 7.000000000000007 L-47.3496987939662 7.000000000000008 L-47.3496987939662 -6.9999999999999964 L-37.3496987939662 -6.999999999999997 A38 38 0 0 1 -31.35997276079435 -21.460477824182675 L-31.35997276079435 -21.460477824182675 L-38.431040572659825 -28.531545636048147 L-28.53154563604818 -38.4310405726598 L-21.4604778241827 -31.35997276079433 A38 38 0 0 1 -6.999999999999992 -37.3496987939662 L-6.999999999999992 -37.3496987939662 L-6.999999999999994 -47.3496987939662 L6.999999999999977 -47.3496987939662 L6.999999999999979 -37.3496987939662 A38 38 0 0 1 21.460477824182686 -31.359972760794342 L21.460477824182686 -31.359972760794342 L28.531545636048158 -38.43104057265982 L38.4310405726598 -28.53154563604818 L31.35997276079433 -21.4604778241827 A38 38 0 0 1 37.3496987939662 -6.999999999999995 M0 -23A23 23 0 1 0 0 23 A23 23 0 1 0 0 -23" fill="#d77452"/></g></g></g></svg>
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>--%>
                        <div id="loader-wrapper-confezione"> 
                            <div class="loader">
                                <ul class="hexagon-container">
                                    <li class="hexagon hex_1"></li>
                                    <li class="hexagon hex_2"></li>
                                    <li class="hexagon hex_3"></li>
                                    <li class="hexagon hex_4"></li>
                                    <li class="hexagon hex_5"></li>
                                    <li class="hexagon hex_6"></li>
                                    <li class="hexagon hex_7"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <!-- IN PRIMO PIANO -->
            <div id="lvl_zero" class="align-middle" style="padding:0 15px 0px 15px">
                <div class="row">
                    <%-- LEVEL 0 - CONTROLO DI GESTIONE --%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                        <article id="cont" runat="server">
                            <a href="#!" class="img-container" style="background-image: url('./dashboard/images/controlo-di-gestione.png');"></a>
                            <div class="article-lgreen">
                                <h2>
                                    <a href="#!" style="background: #369747;"><i class="icon-refresh"></i>Controlo di gestione</a>
                                </h2>
                            </div>
                        </article>
                    </div>
                    <%-- LEVEL 0 - PRODUZIONE --%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                        <article id="prod" runat="server">
                            <a href="#!" class="img-container" style="background-image: url('./dashboard/images/produzioni.png');"></a>
                            <div class="article-orange">
                                <h2>
                                    <a href="#!" style="background: #e0511d;"><i class="icon-refresh"></i>Produzione</a>
                                </h2>
                            </div>
                        </article>
                    </div>
                    <%-- LEVEL 0 - RISORSE UMANE --%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                        <article class="" id="riso" runat="server">
                            <a href="#!" class="img-container " style="background-image: url('./dashboard/images/risorso-umanei.png');"></a>
                            <div class="article-lpurple">
                                <h2>
                                    <a href="#!"><i class="icon-refresh"></i>Risorse umane</a>
                                </h2>
                            </div>
                        </article>
                    </div>
                    <%-- LEVEL 0 - SMART FACTORY --%>
                    <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                        <article class="disabled" id="smart" runat="server">
                            <a href="#!" class="img-container " style="background-image: url('./dashboard/images/smart-factory.png');"></a>
                            <div class="article-lblue">
                                <h2>
                                    <a href="#!"><i class="icon-refresh"></i>Smart factory</a>
                                </h2>
                            </div>
                        </article>
                    </div>
                </div>
                <%-- MSG TEST --%>
                <asp:Label runat="server" ID="recived_msg"></asp:Label>
            </div>
            <asp:Panel runat="server" ID="not_activated">
                <h1>Your account is not activated yet.</h1>
                <h2>Please try again later or contact system administrator.</h2>
            </asp:Panel>
            <%-- LEVEl 1 - PRODUZIONE --%>
            <div id="lvl_one_prod" class="animated fadeIn">
                <%-- LEVEL 1 - TESSITURA --%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="tess" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/tessitura1.png');"></a>
                        <div class="article-braon">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <%-- LEVEL 1 - CONFEZIONE --%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="conf" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione1.png');"></a>
                        <div class="article-bordo">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <%-- LEVEL 1 - LAVANDERIA --%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important">
                    <article class="disabled" id="lava" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/LAVANDERIA1.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <%-- LEVEL 1 - SARTORIA --%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article class="disabled" id="sart" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                        <div class="article-orange">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Sartoria</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <%-- LEVEL 1 - STIRO --%>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="stiro" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro1.png');"></a>
                        <div class="article-lgreen">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 1 - RISORSE UMANE --%>
            <div id="lvl_one_riso" class="animated fadeIn">

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Timbrature" data-link="./Views/HR/form-timbrature.aspx" data-img="./dashboard/images/timbratura.png" runat="server" id="Div56">★</div>
                    </div>
                    <article id="riso_timb" class="nekaKlasa" data-name="Timbrature" data-link="./Views/HR/form-timbrature.aspx" data-image="./dashboard/images/timbratura.png" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/timbratura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Timbrature</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_scheda" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/scheda-dipedenti.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Scheda Dipendenti</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/statistiche.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Reportistica</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_organigrammi" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/riso-organigrami.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigrammi</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_database" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/riso-database.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Database</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_chat" runat="server">
                        <a href="#!" class="img-container " style="background-image: url('./dashboard/images/chat-interna.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Chat interna</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 1 - SMART FACTORY --%>
            <div id="lvl_one_smart" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Porte" data-link="" data-img="" runat="server" id="Div36">★</div>
                    </div>
                    <article id="smart_porte" class="nekaKlasa" data-name="Smart - Porte" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-porte.png');"></a>
                        <div class="article-lblue">

                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Porte</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Luci" data-link="" data-img="" runat="server" id="Div37">★</div>
                    </div>
                    <article id="smart_luci" class="nekaKlasa" data-name="Smart - Luci" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-luci.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Luci</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Temperature" data-link="" runat="server" id="Div38">★</div>
                    </div>
                    <article id="smart_temp" class="nekaKlasa" data-name="Smart - Temperature" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-temperature.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Temperature</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Allarmi" data-link="" data-img="" runat="server" id="Div39">★</div>
                    </div>
                    <article id="smart_allarmi" class="nekaKlasa" data-name="Smart - Allarmi" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-allarmi.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Allarmi</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Macchine" data-link="" data-img="" runat="server" id="Div40">★</div>
                    </div>
                    <article id="smart_machine" class="nekaKlasa" data-name="Smart - Macchine" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-macchine.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Macchine</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Musica" data-link="" data-img="" runat="server" id="Div41">★</div>
                    </div>
                    <article id="smart_musica" class="nekaKlasa" data-name="Smart - Musica" data-link="" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/smart-musica.png');"></a>
                        <div class="article-lblue">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Musica</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 1/2 - CONFEZIONE CHOOSER --%>
            <div id="conf_chooser" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="conf_dp_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                        <div class="article-bordo">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione - Dati Produzioni</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="conf_db_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                        <div class="article-bordo">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione - Dati Base</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 1/2 - STIRO CHOOSER --%>
            <div id="stiro_chooser" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="stiro_dp_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                        <div class="article-lgreen">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Stiro - Dati Produzioni</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="stiro_db_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                        <div class="article-lgreen">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Stiro - Dati Base</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 1/2 - TESSITURA CHOOSER --%>
            <div id="tess_chooser" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="tess_dp_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                        <div class="article-braon">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Tessitura - Dati Produzioni</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="tess_db_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                        <div class="article-braon">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Tessitura - Dati Base</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
             <%-- LVL 2 - SARTORIA --%>
            <div id="sartoria_chooser" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="sart_dp_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                        <div class="article-orange">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Sartoria - Dati Produzioni</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="sart_db_start">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                        <div class="article-orange">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Sartoria - Dati Base</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - CONFZIONE --%>
            <div id="lvl_two_conf" class="animated fadeIn">
                <div id="dp_conf_bread">
                    <div id="frame_confezione_div_hide">
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione A - Layout" data-link="./Views/Produzione/_confezioneA.aspx" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="bm_conf_a_layout">★</div>
                            </div>
                            <article id="conf_a_layout" class="nekaKlasa" data-name="Confezione A - Layout" data-link="./Views/Produzione/_confezioneA.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Confezione A - Layout</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione B - Layout" data-link="./Views/Produzione/_confezioneB.aspx" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="bm_conf_b_layout">★</div>
                            </div>
                            <article id="conf_b_layout" class="nekaKlasa" data-name="Confezione B - Layout" data-link="./Views/Produzione/_confezioneB.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Confezione B - Layout</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Efficienza" data-link="./Views/Produzione/_efficienze.aspx?departament=1" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="Div76">★</div>
                            </div>
                            <article id="Article35" class="nekaKlasa" data-name="Efficienza" data-link="./Views/Produzione/_efficienze.aspx?departament=1" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                         <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                        <div class="ribbon">
                            <div class="nekaKlasa1" data-name="Intervali" data-link="./Views/Produzione/_intervali.aspx?Departament=1" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="Div726">★</div>
                        </div>
                        <article id="Article353" class="nekaKlasa" data-name="Intervali" data-link="./Views/Produzione/_intervali.aspx?Departament=1" runat="server">
                            <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                            <div class="article-bordo">
                                <h2>
                                    <a href="#!"><i class="icon-refresh"></i>Intervali</a>
                                </h2>
                            </div>
                        </article>
                    </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="opacity:0.3">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione - Organigramma" data-link="./Views/Produzione/Report_Light.aspx" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="bm_conf_organigrama">★</div>
                            </div>
                            <article id="conf_organigramma" class="nekaKlasa" data-name="Confezione - Organigramma" data-link="./Views/Produzione/Report_Light.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Organigramma</a>
                                    </h2>
                                </div>
                            </article>
                        </div>

                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="opacity:0.3">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Exacta" data-link="https://loexacta.olimpias.it/" data-img="./dashboard/images/confezione-data-produzione.png" runat="server" id="bm_conf_exacta">★</div>
                            </div>
                            <article id="conf_exacta" class="nekaKlasa" data-name="Exacta" data-link="https://loexacta.olimpias.it/" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Exacta</a>
                                    </h2>
                                </div>
                            </article>
                        </div>


                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" data-img="" runat="server" id="bm_conf_eff">★</div>
                            </div>
                            <article class="disabled" id="conf_eff" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" data-img="" runat="server" id="bm_conf_eff_mens">★</div>
                            </div>
                            <article class="disabled" id="conf_eff_mens" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza Mensille</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" data-img="" runat="server" id="bm_conf_intervali">★</div>
                            </div>
                            <article class="disabled" id="conf_intervali" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Intervali</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" data-img="" runat="server" id="bm_conf_stat_di_prod">★</div>
                            </div>
                            <article class="disabled" id="conf_stat_di_prod" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-produzione.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Statistiche di produzione</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>

                <div id="db_conf_bread">
                    <div id="frame_confezione_div_db_hide">
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=1" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_commesse">★</div>
                            </div>
                            <article id="conf_commesse" class="nekaKlasa" runat="server" data-name="Confezione commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=1">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Commesse</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione - Faze" data-link="./Views/Produzione/_fase.aspx?Departament=1.aspx" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_faze">★</div>
                            </div>
                            <article id="conf_faze" class="nekaKlasa" data-name="Confezione fase" data-link="./Views/Produzione/_fase.aspx?Departament=1" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Faze</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione article" data-link="./Views/Produzione/_articles.aspx?Departament=1" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_article">★</div>
                            </div>
                            <article id="conf_article" class="nekaKlasa" data-name="Confezione article" data-link="./Views/Produzione/_articles.aspx?Departament=1" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione archivio articoli</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione - Clienti" data-link="./Views/Produzione/_clients.aspx" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_clienti">★</div>
                            </div>
                            <article id="conf_clienti" class="nekaKlasa" data-name="Confezione - Clienti" data-link="./Views/Produzione/_clients.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione ordini clienti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione machines" data-link="./Views/Produzione/_machines.aspx?Departament=1" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_machines">★</div>
                            </div>
                            <article id="conf_machines" class="nekaKlasa" data-name="Confezione machines" data-link="./Views/Produzione/_machines.aspx?Departament=1" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Machines</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=1" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_persons">★</div>
                            </div>
                            <article id="conf_persons" class="nekaKlasa" data-name="Confezione persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=1" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Persone</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione - Tablets" data-link="./Views/Produzione/form-angajati.aspx" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="bm_conf_tablets">★</div>
                            </div>
                            <article id="conf_tablets" class="nekaKlasa" data-name="Confezione - Tablets" data-link="./Views/Produzione/form-angajati.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablets</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior"  style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Confezione - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" data-img="./dashboard/images/confezione-data-base.png" runat="server" id="Div54">★</div>
                            </div>
                            <article id="Article40" class="nekaKlasa" data-name="Confezione - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/confezione-data-base.png');"></a>
                                <div class="article-bordo">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablet Serials</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <%-- LEVEL 2 - RISORSO UMANE - SCHEDA DIPEDENTI --%>
            <div id="lvl_two_riso_scheda_dipedenti" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Scheda Dipendente" data-link="./Views/HR/_schieda.aspx" data-img="./dashboard/images/riso-scheda-dipedente.png" runat="server" id="bm_riso_scheda_dipedente">★</div>
                    </div>
                    <article id="riso_scheda_dip" class="nekaKlasa" data-name="Scheda Dipendente" data-link="./Views/HR/_schieda.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-scheda-dipedente.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Scheda Dipedente</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Lettere" data-link="./#!" data-img="" runat="server" id="Div2">★</div>
                    </div>
                    <article id="Article7" class="nekaKlasa" data-name="Lettere" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-lettere.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Lettere ai Dipendenti</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Efficienze" data-link="./Views/HR/_effDipendente.aspx" data-img="" runat="server" id="Div1">★</div>
                    </div>
                    <article id="Article8" class="nekaKlasa" data-name="Efficienze" data-link="./Views/HR/_effDipendente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-efficienze.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Efficienze Dipendenti</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Ore assenza / Straordinario" data-link="./#!" data-img="./dashboard/images/riso-ore-assenza.png" runat="server" id="Div3">★</div>
                    </div>
                    <article id="Article9" class="nekaKlasa" data-name="Ore assenza / Straordinario" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-ore-assenza.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Ore assenza / Straordinario</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Buste paga" data-link="./Views/HR/_bustaPaga.aspx" data-img="./dashboard/images/riso-buste-paga.png" runat="server" id="Div4">★</div>
                    </div>
                    <article id="Article10" class="nekaKlasa" data-name="Buste paga" data-link="./Views/HR/_bustaPaga.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-buste-paga.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Buste paga</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Ferie / Previdenza" data-link="./Views/HR/_ferie.aspx" data-img="./dashboard/images/riso-ferie.png" runat="server" id="Div5">★</div>
                    </div>
                    <article id="Article11" class="nekaKlasa" data-name="Ferie / Previdenza" data-link="./Views/HR/_ferie.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-ferie.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Ferie / Previdenza</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Lista Dipendenti" data-link="./#!" data-img="./dashboard/images/riso-lista-dipedenti.png" runat="server" id="Div6">★</div>
                    </div>
                    <article id="Article12" class="nekaKlasa" data-name="Lista Dipendenti" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-lista-dipedenti.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Lista Dipendenti</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - RISORSO UMANE - STATISTICHE --%>
            <div id="lvl_two_riso_statistiche" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat_generale">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Generale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat_tess">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat_conf">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Confezione</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                    <article id="riso_stat_lava">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-lavanderia.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat_stiro">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <article id="riso_stat_strut">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-struturra.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Report Struttura</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 3 - RISORSO UMANE - STATISTICHE - GENERALE --%>
            <div id="lvl_three_riso_statistiche_generale" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organico Generale" data-link="./Views/HR/RaportNumarAngajati.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div14">★</div>
                    </div>
                    <article id="riso_org_generale" class="nekaKlasa" data-name="Organico Generale" data-link="./Views/HR/RaportNumarAngajati.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organico Generale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Reparti / Mansione" data-link="./Views/HR/RaportNumarAngajatiDetaliat.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div15">★</div>
                    </div>
                    <article id="riso_stat_gene_reparti" class="nekaKlasa" data-name="Reparti / Mansione" data-link="./Views/HR/RaportNumarAngajatiDetaliat.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Reparti / Mansione</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo" data-link="./Views/HR/RaportAbsente.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div16">★</div>
                    </div>
                    <article id="riso_assenteismo" class="nekaKlasa" data-name="Assenteismo Generale" data-link="./Views/HR/RaportAbsente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo generale</a>
                            </h2>
                        </div>
                    </article>
                </div>

                  <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="AssenteismoGiornaliero" data-link="./Views/HR/RaportAbsenteGiornaliero.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div58">★</div>
                    </div>
                    <article id="riso_giornaliero" class="nekaKlasa" data-name="Assenteismo Giornaliero" data-link="./Views/HR/RaportAbsenteGiornaliero.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Giornaliero</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario" data-link="./Views/HR/RaportSuplimentare.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div17">★</div>
                    </div>
                    <article id="riso_stat_gene_stra" class="nekaKlasa" data-name="Straordinario Generale" data-link="./Views/HR/RaportSuplimentare.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario generale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="OreLavorate" data-link="./Views/HR/OreLavorate.aspx" data-img="./dashboard/images/riso-stat-generale.png" runat="server" id="Div65">★</div>
                    </div>
                    <article id="Article19" class="nekaKlasa" data-name="Ore Lavorate" data-link="./Views/HR/OreLavorate.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-generale.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Ore Lavorate</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 3 - RISORSO UMANE - STATISTICHE - TESSITURA --%>
            <div id="lvl_three_riso_statistiche_tessitura" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Tessitura" data-link="./Views/HR/_assDepartMonth.aspx?Departament=TESSITURA" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div18">★</div>
                    </div>
                    <article id="riso_stat_tess_ass" class="nekaKlasa" data-name="Assenteismo Tessitura" data-link="./Views/HR/_assDepartMonth.aspx?Departament=TESSITURA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Mensile Tessitura" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Tessitura" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div60">★</div>
                    </div>
                    <article id="Article2" class="nekaKlasa" data-name="Assenteismo Mensile Tessitura" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Tessitura" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Mensile Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario Tessitura" data-link="./Views/HR/_straDepartMonth.aspx?Departament=TESSITURA" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div19">★</div>
                    </div>
                    <article id="riso_stat_tess_stra" class="nekaKlasa" data-name="Straordinario Tessitura" data-link="./Views/HR/_straDepartMonth.aspx?Departament=TESSITURA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Presenze Tessitura" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=TESSITURA" runat="server" data-img="./dashboard/images/riso-stat-tessitura.png" id="Div20">★</div>
                    </div>
                    <article id="riso_stat_tess_presenze" class="nekaKlasa" data-name="Presenze Tessitura" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=TESSITURA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Presenze Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Efficienze Tessitura" data-link="./Views/HR/RaportEficiente.aspx?Departament=TESSITURA" runat="server" data-img="./dashboard/images/riso-stat-tessitura.png" id="Div57">★</div>
                    </div>
                    <article id="riso_stat_tess_eff" class="nekaKlasa" data-name="Efficienze Tessitura" data-link="./Views/HR/RaportEficiente.aspx?Departament=TESSITURA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Efficienze Personale Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 3 - RISORSO UMANE - STATISTICHE - CONFEZIONE --%>
            <div id="lvl_three_riso_statistiche_confezione" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione A - Assenteismo" data-link="./Views/HR/_assDepartMonth.aspx?Departament=CONFEZIONE%20A" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div21">★</div>
                    </div>
                    <article id="riso_confa_ass" class="nekaKlasa" data-name="Confezione A - Assenteismo" data-link="./Views/HR/_assDepartMonth.aspx?Departament=CONFEZIONE%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione A - Assenteismo</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Mensile Confezione A" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Confezione%20A" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div61">★</div>
                    </div>
                    <article id="Article6" class="nekaKlasa" data-name="Assenteismo Mensile Confezione A" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Confezione%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Mensile Confezione A</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione A - Straordinario" data-link="./Views/HR/_straDepartMonth.aspx?Departament=CONFEZIONE%20A" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div22">★</div>
                    </div>
                    <article id="riso_confa_stra" class="nekaKlasa" data-name="Confezione A - Straordinario" data-link="./Views/HR/_straDepartMonth.aspx?Departament=CONFEZIONE%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione A - Straordinario</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior " runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione A - Presenze" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=CONFEZIONE%20A" runat="server" data-img="./dashboard/images/riso-stat-confezione.png" id="Div23">★</div>
                    </div>
                    <article id="riso_confa_presenze" class="nekaKlasa" data-name="Confezione A - Presenze" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=CONFEZIONE%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione A - Presenze</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server" style="display: none!important;">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario per causale" data-link="./#!" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div24">★</div>
                    </div>
                    <article id="Article25" class="nekaKlasa" data-name="Straordinario per causale" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario per causale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione A - Efficienze" data-link="./Views/HR/RaportEficiente.aspx?Departament=CONFEZIONE%20A" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div25">★</div>
                    </div>
                    <article id="riso_confa_eff" class="nekaKlasa" data-name="Confezione A - Efficienze" data-link="./Views/HR/RaportEficiente.aspx?Departament=CONFEZIONE%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Efficienze Personale Conf.A</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione B - Assenteismo" data-link="./Views/HR/_assDepartMonth.aspx?Departament=CONFEZIONE%20B" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div48">★</div>
                    </div>
                    <article id="riso_confb_ass" class="nekaKlasa" data-name="Confezione B - Assenteismo" data-link="./Views/HR/_assDepartMonth.aspx?Departament=CONFEZIONE%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione B - Assenteismo</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Mensile Confezione B" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Confezione%20B" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div62">★</div>
                    </div>
                    <article id="Article16" class="nekaKlasa" data-name="Assenteismo Mensile Confezione B" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Confezione%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Mensile Confezione B</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione B - Straordinario" data-link="./Views/HR/_straDepartMonth.aspx?Departament=CONFEZIONE%20B" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div49">★</div>
                    </div>
                    <article id="riso_stat_confb_stra" class="nekaKlasa" data-name="Confezione B - Straordinario" data-link="./Views/HR/_straDepartMonth.aspx?Departament=CONFEZIONE%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione B - Straordinario</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior " runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione B - Presenze" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=CONFEZIONE%20B" runat="server" data-img="./dashboard/images/riso-stat-confezione.png" id="Div50">★</div>
                    </div>
                    <article id="riso_confb_presenze" class="nekaKlasa" data-name="Confezione B - Presenze" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=CONFEZIONE%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Confezione B - Presenze</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server" style="display: none!important;">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario per causale" data-link="./#!" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div51">★</div>
                    </div>
                    <article id="Article37" class="nekaKlasa" data-name="Straordinario per causale" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario per causale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Confezione B - Efficienze" data-link="./Views/HR/RaportEficiente.aspx?Departament=CONFEZIONE%20B" data-img="./dashboard/images/riso-stat-confezione.png" runat="server" id="Div52">★</div>
                    </div>
                    <article id="riso_confb_eff" class="nekaKlasa" data-name="Confezione B - Efficienze" data-link="./Views/HR/RaportEficiente.aspx?Departament=CONFEZIONE%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Efficienze Personale Conf.B</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <div id="lvl_three_riso_statistiche_lavanderia" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo" data-link="./#!" data-img="./dashboard/images/riso-stat-lavanderia.png" runat="server" id="Div26">★</div>
                    </div>
                    <article id="Article27" class="nekaKlasa" data-name="Assenteismo" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-lavanderia.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario" data-link="./#!" runat="server" data-img="./dashboard/images/riso-stat-lavanderia.png" id="Div27">★</div>
                    </div>
                    <article id="Article28" class="nekaKlasa" data-name="Straordinario" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-lavanderia.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Presenze" data-link="./#!" data-img="./dashboard/images/riso-stat-lavanderia.png" runat="server" id="Div28">★</div>
                    </div>
                    <article id="Article29" class="nekaKlasa" data-name="Presenze" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-lavanderia.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Presenze Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 3 - RISORSO UMANE - STATISTICHE - STIRO --%>
            <div id="lvl_three_riso_statistiche_stiro" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior " runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Stiro" data-link="./Views/HR/_assDepartMonth.aspx?Departament=STIRO" data-img="./dashboard/images/riso-stat-stiro.png" runat="server" id="Div29">★</div>
                    </div>
                    <article id="riso_stat_stiro_assenteismo" class="nekaKlasa" data-name="Assenteismo Stiro" data-link="./Views/HR/_assDepartMonth.aspx?Departament=STIRO" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Mensile Stiro" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Tessitura" data-img="./dashboard/images/riso-stat-tessitura.png" runat="server" id="Div63">★</div>
                    </div>
                    <article id="Article17" class="nekaKlasa" data-name="Assenteismo Mensile Stiro" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Stiro" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Mensile Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario Stiro" data-link="./Views/HR/_straDepartMonth.aspx?Departament=STIRO" data-img="./dashboard/images/riso-stat-stiro.png" runat="server" id="Div30">★</div>
                    </div>
                    <article id="riso_stat_stiro_stra" class="nekaKlasa" data-name="Straordinario Stiro" data-link="./Views/HR/_straDepartMonth.aspx?Departament=STIRO" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Presenze Stiro" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=STIRO" data-img="./dashboard/images/riso-stat-stiro.png" runat="server" id="Div31">★</div>
                    </div>
                    <article id="riso_stat_stiro_presenze" class="nekaKlasa" data-name="Presenze Stiro" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=STIRO" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Presenze Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario per causale" data-link="./#!" data-img="./dashboard/images/riso-stat-stiro.png" runat="server" id="Div32">★</div>
                    </div>
                    <article id="Article33" class="nekaKlasa" data-name="Straordinario per causale" data-link="./#!" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario per causale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Efficienze Stiro" data-link="./Views/HR/RaportEficiente.aspx?Departament=STIRO" data-img="./dashboard/images/riso-stat-stiro.png" runat="server" id="Div33">★</div>
                    </div>
                    <article id="riso_stat_stiro_eff" class="nekaKlasa" data-name="Efficienze Stiro" data-link="./Views/HR/RaportEficiente.aspx?Departament=STIRO" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Efficienze Personale Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 3 - RISORSO UMANE - STATISTICHE - STRUTURRA --%>
            <div id="lvl_three_riso_statistiche_struttura" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Struturra" data-link="./Views/HR/_assDepartMonth.aspx?Departament=Amministrazione" data-img="./dashboard/images/riso-stat-struturra.png" runat="server" id="Div34">★</div>
                    </div>
                    <article id="riso_stat_stru_ass" class="nekaKlasa" data-name="Assenteismo Struturra" data-link="./Views/HR/_assDepartMonth.aspx?Departament=Amministrazione" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-struturra.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Struttura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Assenteismo Struturra" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Amministrazione" data-img="./dashboard/images/riso-stat-struturra.png" runat="server" id="Div64">★</div>
                    </div>
                    <article id="Article18" class="nekaKlasa" data-name="Assenteismo Mensile Struturra" data-link="./Views/HR/_assMensileDepartYear.aspx?Departament=Amministrazione" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-struturra.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Assenteismo Mensile Struttura</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Straordinario Struturra" data-link="./Views/HR/_straDepartMonth.aspx?Departament=Amministrazione" data-img="./dashboard/images/riso-stat-struturra.png" runat="server" id="Div35">★</div>
                    </div>
                    <article id="riso_stat_stru_stra" class="nekaKlasa" data-name="Straordinario Struturra" data-link="./Views/HR/_straDepartMonth.aspx?Departament=Amministrazione" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-struturra.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Straordinario Struttura</a>
                            </h2>
                        </div> 
                    </article>
                </div>

                   <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Presenze Struturra" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=Amministrazione" data-img="./dashboard/images/riso-stat-struturra.png" runat="server" id="Div67">★</div>
                    </div>
                    <article id="Article21" class="nekaKlasa" data-name="Presenze Struturra" data-link="./Views/HR/RaportPrezenteDepartament.aspx?Departament=Amministrazione" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-stat-struturra.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Presenze Struturra</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - RISORSO UMANE - ORGANIGRAMMI --%>
            <div id="lvl_two_riso_organigrammi" class="animated fadeIn">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Generale" data-link="./Views/HR/OrganigramaGenerala.aspx" data-img="./dashboard/images/riso-organigrami.png" runat="server" id="Div42">★</div>
                    </div>
                    <article id="Article13" class="nekaKlasa" data-name="Organigrammi Generale" data-link="./Views/HR/OrganigramaGenerala.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-organigrami.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Generale</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Tessitura" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=TESSITURA" data-img="./dashboard/images/riso-org-tessitura.png" runat="server" id="Div43">★</div>
                    </div>
                    <article id="riso_stat_generale_tess" class="nekaKlasa" data-name="Organigrammi Tessitura" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=TESSITURA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-tessitura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Tessitura</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Confezione A" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=CONFEZIONE%20A" data-img="./dashboard/images/riso-org-confezione.png" runat="server" id="Div44">★</div>
                    </div>
                    <article id="riso_stat_generale_conf" class="nekaKlasa" data-name="Organigrammi Confezione A" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=CONFEZIONE%20A" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Confezione A</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Confezione B" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=CONFEZIONE%20B" data-img="./dashboard/images/riso-org-confezione.png" runat="server" id="Div53">★</div>
                    </div>
                    <article id="Article39" class="nekaKlasa" data-name="Organigrammi Confezione B" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=CONFEZIONE%20B" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-confezione.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Confezione B</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Lavanderia" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=LAVANDERIA" data-img="./dashboard/images/riso-org-lavanderia.png" runat="server" id="Div45">★</div>
                    </div>
                    <article id="riso_stat_generale_lava" class="nekaKlasa" data-name="Organigrammi Lavanderia" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=LAVANDERIA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-lavanderia.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Lavanderia</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Sartoria" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=SARTORIA" data-img="./dashboard/images/riso-org-sartoria.png" runat="server" id="Div46">★</div>
                    </div>
                    <article id="riso_stat_generale_sart" class="nekaKlasa" data-name="Organigrammi Sartoria" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=SARTORIA" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-sartoria.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Sartoria</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Stiro" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=STIRO" data-img="./dashboard/images/riso-org-stiro.png" runat="server" id="Div47">★</div>
                    </div>
                    <article id="riso_stat_generale_stiro" class="nekaKlasa" data-name="Organigrammi Stiro" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=STIRO" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-org-stiro.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Stiro</a>
                            </h2>
                        </div>
                    </article>
                </div>

                  <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Organigrammi Struttura" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=AMMINISTRAZIONE" data-img="./dashboard/images/riso-organigrami.png" runat="server" id="Div66">★</div>
                    </div>
                    <article id="Article20" class="nekaKlasa" data-name="Organigrammi Struttura" data-link="./Views/HR/OrganigramaDepartament.aspx?Departament=AMMINISTRAZIONE" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-organigrami.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Organigramma Struttura</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - RISORSO UMANE - DATABASE --%>
            <div id="lvl_two_riso_database" class="animated fadeIn">

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Gusti" data-link="./form-gusti.aspx" data-img="./dashboard/images/timbratura.png" runat="server" id="Div7">★</div>
                    </div>
                    <article id="riso_gusti" class="nekaKlasa" data-name="Gusti" data-link="./Views/HR/form-gusti.aspx" data-image="./dashboard/images/timbratura.png" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/timbratura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Giusti</a>
                            </h2>
                        </div>
                    </article>
                </div>


                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Turni" data-link="./Views/HR/TessituraCalendar.aspx" data-img="./dashboard/images/timbratura.png" runat="server" id="Div59">★</div>
                    </div>
                    <article id="riso_turni" class="nekaKlasa" data-name="Turni" data-link="./Views/HR/TessituraCalendar.aspx" data-image="./dashboard/images/timbratura.png" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/timbratura.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Turni</a>
                            </h2>
                        </div>
                    </article>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Anagrafiche Dipendenti" data-link="./Views/HR/Prezente.aspx" data-img="./dashboard/images/riso-db-anagrfafiche.png" runat="server" id="Div8">★</div>
                    </div>
                    <article id="Article1" class="nekaKlasa" data-name="Anagrafiche Dipendenti" data-link="./Views/HR/Prezente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-db-anagrfafiche.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Anagrafiche Dipendenti</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Centri di lavoro" data-link="./Views/HR/Prezente.aspx" data-img="./dashboard/images/riso-db-centri.png" runat="server" id="Div9">★</div>
                    </div>
                    <article id="Article3" class="nekaKlasa" data-name="Centri di lavoro" data-link="./Views/HR/Prezente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-db-centri.png');"></a>
                        <div class="article-lpurple">

                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Centri di lavoro</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Tabelle causali" data-link="./Views/HR/Prezente.aspx" data-img="./dashboard/images/riso-db-tabelle.png" runat="server" id="Div10">★</div>
                    </div>
                    <article id="Article4" class="nekaKlasa" data-name="Tabelle causali" data-link="./Views/HR/Prezente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-db-tabelle.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Tabelle causali</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - RISORSO UMANE - CHAT --%>
            <div id="lvl_two_riso_chat" class="animated j">
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Busta paga" data-link="./Views/HR/_bustaPaga.aspx" data-img="./dashboard/images/riso-chat-buste.png" runat="server" id="Div11">★</div>
                    </div>
                    <article id="Article5" class="nekaKlasa" data-name="Busta paga" data-link="./Views/HR/_bustaPaga.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-chat-buste.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Busta paga</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Posizione Dipendente" data-link="./Views/HR/Prezente.aspx" data-img="./dashboard/images/riso-chat-pozdip.png" runat="server" id="Div12">★</div>
                    </div>
                    <article id="Article14" class="nekaKlasa" data-name="Posizione Dipendente" data-link="./Views/HR/Prezente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-chat-pozdip.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Posizione Dipendente</a>
                            </h2>
                        </div>
                    </article>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" runat="server">
                    <div class="ribbon">
                        <div class="nekaKlasa1" data-name="Comunicazioni" data-link="./Views/HR/Prezente.aspx" data-img="./dashboard/images/riso-chat-comunicazioni.png" runat="server" id="Div13">★</div>
                    </div>
                    <article id="Article15" class="nekaKlasa" data-name="Comunicazioni" data-link="./Views/HR/Prezente.aspx" runat="server">
                        <a href="#!" class="img-container" style="background-image: url('./dashboard/images/riso-chat-comunicazioni.png');"></a>
                        <div class="article-lpurple">
                            <h2>
                                <a href="#!"><i class="icon-refresh"></i>Comunicazioni</a>
                            </h2>
                        </div>
                    </article>
                </div>
            </div>
            <%-- LEVEL 2 - STIRO --%>
            <div id="lvl_two_stiro" class="animated fadeIn">
                <div id="dp_stiro_bread">
                    <%-- STIRO DP KONTROLE --%>
                    <div id="frame_stiro_div_hide">
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro - Layout" data-link="./Views/Produzione/_Stiro.aspx" data-img="./dashboard/images/stiro_data_produzione.png" runat="server" id="bm_stiro_layout">★</div>
                            </div>
                            <article id="stiro_layout" class="nekaKlasa" data-name="Stiro - Layout" data-link="./Views/Produzione/_Stiro.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Stiro - Layout</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                            <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Efficienza" data-link="./Views/Produzione/_efficienze.aspx?departament=2" data-img="./dashboard/images/stiro_data_produzione.png" runat="server" id="Div85">★</div>
                            </div>
                            <article id="Article36" class="nekaKlasa" data-name="Efficienza" data-link="./Views/Produzione/_efficienze.aspx?departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                         <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Intervali" data-link="./Views/Produzione/_intervali.aspx?Departament=2" data-img="./dashboard/images/stiro_data_produzione.png" runat="server" id="Div852">★</div>
                            </div>
                            <article id="Article326" class="nekaKlasa" data-name="Intervali" data-link="./Views/Produzione/_intervali.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Intervali</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="opacity:0.3">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro - Organigramma" data-link="./Views/Produzione/ReportStiro_Light.aspx" data-img="./dashboard/images/stiro_data_produzione.png" runat="server" id="bm_stiro_organigramma">★</div>
                            </div>
                            <article id="stiro_organigramma" class="nekaKlasa" data-name="Stiro - Organigramma" data-link="./Views/Produzione/ReportStiro_Light.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Stiro - Organigramma</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="opacity:0.3">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro - Intervals" data-link="./Views/Produzione/form-intervali-stiro.aspx" data-img="./dashboard/images/stiro_data_produzione.png" runat="server" id="bm_stiro_intervals">★</div>
                            </div>
                            <article id="stiro_intervals" class="nekaKlasa" data-name="Stiro - Intervals" data-link="./Views/Produzione/form-intervali-stiro.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Intervali</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" runat="server" data-img="./dashboard/images/stiro_data_produzione.png" id="bm_stiro_eff">★</div>
                            </div>
                            <article class="disabled" id="stiro_eff" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" runat="server" data-img="./dashboard/images/stiro_data_produzione.png" id="bm_stiro_eff_mens">★</div>
                            </div>
                            <article class="disabled" id="stiro_eff_mens" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Efficienza mensille</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="" data-link="" runat="server" data-img="./dashboard/images/stiro_data_produzione.png" id="bm_stiro_stat_di_prod">★</div>
                            </div>
                            <article class="disabled" id="stiro_stat_di_prod" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro_data_produzione.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Statistiche di produzione</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div id="db_stiro_bread">
                    <%-- STIRO DB KONTROLE --%>
                    <div id="frame_stiro_div_db_hide">
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=2" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_commesse">★</div>
                            </div>
                            <article id="stiro_commesse" class="nekaKlasa" data-name="Stiro commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Commesse</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro fase" data-link="./Views/Produzione/_fase.aspx?Departament=2" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_faze">★</div>
                            </div>
                            <article id="stiro_faze" class="nekaKlasa" data-name="Stiro fase" data-link="./Views/Produzione/_fase.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Faze</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro articles" data-link="./Views/Produzione/_articles.aspx?Departament=2" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_article">★</div>
                            </div>
                            <article id="stiro_article" class="nekaKlasa" data-name="Stiro articles" data-link="./Views/Produzione/_articles.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione archivio articoli</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro clienti" data-link="./Views/Produzione/_clients.aspx" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_clienti">★</div>
                            </div>
                            <article id="stiro_clienti" class="nekaKlasa" data-name="Stiro clienti" data-link="./Views/Produzione/_clients.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione ordini clienti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro machines" data-link="./Views/Produzione/_machines.aspx?Departament=2" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_machines">★</div>
                            </div>
                            <article id="stiro_machines" class="nekaKlasa" data-name="Stiro machines" data-link="./Views/Produzione/_machines.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Machines</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro persons" data-link="./Views/Produzione/_dipendenti.aspx?Departament=2" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_persons">★</div>
                            </div>
                            <article id="stiro_persons" class="nekaKlasa" data-name="Stiro persons" data-link="./Views/Produzione/_dipendenti.aspx?Departament=2" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Persone</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro - Tablets" data-link="./Views/Produzione/form-angajati-stiro.aspx" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="bm_stiro_tablets">★</div>
                            </div>
                            <article id="stiro_tablets" class="nekaKlasa" data-name="Stiro - Tablets" data-link="./Views/Produzione/form-angajati-stiro.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablets</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Stiro - Tablet Serials" data-link="./Views/Produzione/form-tabletserials-stiro.aspx" data-img="./dashboard/images/stiro-data-base.png" runat="server" id="Div55">★</div>
                            </div>
                            <article id="Article41" class="nekaKlasa" data-name="Stiro - Tablet Serials" data-link="./Views/Produzione/form-tabletserials-stiro.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/stiro-data-base.png');"></a>
                                <div class="article-lgreen">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablet Serials</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <%-- LEVEL 2 - TESSITURA --%>
            <div id="lvl_two_tess" class="animated fadeIn">
                <%-- TESSITURA DP KONTROLE --%>
                <div id="dp_tess_bread">
                    <%-- TESSITURA DP KONTROLE --%>
                    <div id="frame_tess_div_hide">

                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">

                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sinotico" data-link="./Views/Produzione/Sinotico.aspx" data-img="./dashboard/images/tessitura-data-produzione.png" runat="server" id="bm_tess_sinotico">★</div>
                            </div>
                            <article id="tess_sinotico" class="nekaKlasa" data-name="Sinotico" data-link="./Views/Produzione/Sinotico.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Sinotico</a>
                                    </h2>
                                </div>
                            </article>
                        </div>



                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div id="bm_tess_clienti" class="nekaKlasa1 booknone" data-name="Tessitura - Clienti" data-img="./dashboard/images/tessitura-data-produzione.png" data-link="">★</div>
                            </div>
                            <article id="tess_clienti" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Clienti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" >
                            <div class="ribbon">
                                <div id="bm_tess_articoli" class="nekaKlasa1 booknone" data-name="Tessitura - Articoli" data-img="./dashboard/images/tessitura-data-produzione.png" data-link="">★</div>
                            </div>
                            <article id="tess_articoli" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Articoli</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" >
                            <div class="ribbon">
                                <div id="bm_tess_commesse" class="nekaKlasa1 booknone" data-name="Tessitura - Commesse" data-img="./dashboard/images/tessitura-data-produzione.png" data-link="">★</div>
                            </div>
                            <article id="tess_commesse" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Commesse</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" >
                            <div class="ribbon">
                                <div id="bm_tess_fasi" class="nekaKlasa1 booknone" data-name="Tessitura - Fasi" data-img="./dashboard/images/tessitura-data-produzione.png" data-link="">★</div>
                            </div>
                            <article id="tess_fasi" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Fasi</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div id="bm_tess_dipendenti" class="nekaKlasa1 booknone" data-name="Tessitura - Dipedenti" data-img="./dashboard/images/tessitura-data-produzione.png" data-link="">★</div>
                            </div>
                            <article id="tess_dipendenti" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Dipedenti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur">
                            <div class="ribbon">
                                <div id="bm_tess_machine" class="nekaKlasa1 booknone" data-img="./dashboard/images/tessitura-data-produzione.png" data-name="Tessitura - Machine" data-link="">★</div>
                            </div>
                            <article id="tess_machine" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-produzione.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Machine</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>

                <div id="db_tess_bread">
                    <%-- TESSITURA DB KONTROLE --%>
                    <div id="frame_tess_div_db_hide">
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" >
                            <div class="ribbon">
                                <div id="bm_tess_programma_programatori" class="nekaKlasa1 booknone" data-img="./dashboard/images/tessitura-data-base.png" data-name="Tessitura - Programma programatori" data-link="">★</div>
                            </div>
                            <article id="tess_programma_programatori" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Programma programatori</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior blur" >
                            <div class="ribbon">
                                <div id="bm_tess_programma_tessitura" class="nekaKlasa1 booknone" data-img="./dashboard/images/tessitura-data-base.png" data-name="Tessitura - Programma tessitura" data-link="">★</div>
                            </div>
                            <article id="tess_programma_tessitura" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Programma tessitura</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <%-- OVDE!!! --%>
                          <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=7" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div68">★</div>
                            </div>
                            <article id="Article22" class="nekaKlasa" runat="server" data-name="Tessitura commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=7">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Commesse</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura - Faze" data-link="./Views/Produzione/_fase.aspx?Departament=7.aspx" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div69">★</div>
                            </div>
                            <article id="Article23" class="nekaKlasa" data-name="Tessitura fase" data-link="./Views/Produzione/_fase.aspx?Departament=7" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Faze</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura article" data-link="./Views/Produzione/_articles.aspx?Departament=7" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div70">★</div>
                            </div>
                            <article id="Article24" class="nekaKlasa" data-name="Tessitura article" data-link="./Views/Produzione/_articles.aspx?Departament=7" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione archivio articoli</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura - Clienti" data-link="./Views/Produzione/_clients.aspx" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div71">★</div>
                            </div>
                            <article id="Article26" class="nekaKlasa" data-name="Tessitura - Clienti" data-link="./Views/Produzione/_clients.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione ordini clienti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura machines" data-link="./Views/Produzione/_machines.aspx?Departament=7" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div72">★</div>
                            </div>
                            <article id="Article30" class="nekaKlasa" data-name="Tessitura machines" data-link="./Views/Produzione/_machines.aspx?Departament=7" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Machines</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=7" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div73">★</div>
                            </div>
                            <article id="Article31" class="nekaKlasa" data-name="Tessitura persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=7" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Persone</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura - Tablets" data-link="./Views/Produzione/form-angajati.aspx" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div74">★</div>
                            </div>
                            <article id="Article32" class="nekaKlasa" data-name="Tessitura - Tablets" data-link="./Views/Produzione/form-angajati.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablets</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior"  style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Tessitura - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" data-img="./dashboard/images/tessitura-data-base.png" runat="server" id="Div75">★</div>
                            </div>
                            <article id="Article34" class="nekaKlasa" data-name="Tessitura - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/tessitura-data-base.png');"></a>
                                <div class="article-braon">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablet Serials</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>

            </div>

             <%-- LEVEL 2 - SARTORIA --%>
            <div id="lvl_two_sart" class="animated fadeIn">

                <div id="dp_sart_bread">
                    <div id="frame_sart_div_hide">

                    </div>
                </div>

                <div id="db_sart_bread">
                    <div id="frame_sart_div_db_hide">
                        <%-- OVDE!!! --%>
                          <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=8" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div77">★</div>
                            </div>
                            <article id="Article48" class="nekaKlasa" runat="server" data-name="Sartoria commesse" data-link="./Views/Produzione/_commesse.aspx?Departament=8">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Commesse</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria - Faze" data-link="./Views/Produzione/_fase.aspx?Departament=8.aspx" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div78">★</div>
                            </div>
                            <article id="Article49" class="nekaKlasa" data-name="Sartoria fase" data-link="./Views/Produzione/_fase.aspx?Departament=8" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Faze</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria article" data-link="./Views/Produzione/_articles.aspx?Departament=8" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div79">★</div>
                            </div>
                            <article id="Article50" class="nekaKlasa" data-name="Sartoria article" data-link="./Views/Produzione/_articles.aspx?Departament=8" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione archivio articoli</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria - Clienti" data-link="./Views/Produzione/_clients.aspx" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div80">★</div>
                            </div>
                            <article id="Article51" class="nekaKlasa" data-name="Sartoria - Clienti" data-link="./Views/Produzione/_clients.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Gestione ordini clienti</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria machines" data-link="./Views/Produzione/_machines.aspx?Departament=8" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div81">★</div>
                            </div>
                            <article id="Article52" class="nekaKlasa" data-name="Sartoria machines" data-link="./Views/Produzione/_machines.aspx?Departament=8" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Machines</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=8" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div82">★</div>
                            </div>
                            <article id="Article53" class="nekaKlasa" data-name="Sartoria persone" data-link="./Views/Produzione/_dipendenti.aspx?Departament=8" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Persone</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior" style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria - Tablets" data-link="./Views/Produzione/form-angajati.aspx" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div83">★</div>
                            </div>
                            <article id="Article54" class="nekaKlasa" data-name="Sartoria - Tablets" data-link="./Views/Produzione/form-angajati.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablets</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 col-xs-3 prior"  style="display:none!important;">
                            <div class="ribbon">
                                <div class="nekaKlasa1" data-name="Sartoria - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" data-img="./dashboard/images/SARTORIA.png" runat="server" id="Div84">★</div>
                            </div>
                            <article id="Article55" class="nekaKlasa" data-name="Sartoria - Tablets Serials" data-link="./Views/Produzione/form-tabletserials-conf.aspx" runat="server">
                                <a href="#!" class="img-container" style="background-image: url('./dashboard/images/SARTORIA.png');"></a>
                                <div class="article-orange">
                                    <h2>
                                        <a href="#!"><i class="icon-refresh"></i>Tablet Serials</a>
                                    </h2>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                </div>
        </div>
        <%-- FAVORITE LIST --%>
        <div class="favorite-list" runat="server" id="fav_list">
            <button type='button' class='btn_nav btn--menu'>
                <span class='x__piece'></span>
                <span class='not--x__piece not--x__piece--1'></span>
                <span class='x__piece'></span>
                <span class='not--x__piece not--x__piece--2'></span>
                <span class='x__piece'></span>
                <span class='not--x__piece not--x__piece--3'></span>
                <span class='x__piece'></span>
                <span class='not--x__piece not--x__piece--4'></span>
                <span class='x__piece'></span>
                <span>FAV </span>
            </button>
            <nav class='nav' id="favnav" runat="server"></nav>
        </div>
        <%-- PROFILE - MODAL --%>
        <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">User Account - Details</h4>
                        <br />
                        <asp:Image runat="server" ID="profile_image" CssClass="profile-photo" />
                        <br />
                        <div class="container" id="profile_upload_buttons">
                            <div class="col-xs-6" style="font-weight: 600;">Upload profile picture:</div>
                            <div class="col-xs-6">
                                <asp:FileUpload ID="FileUpload1" runat="server" Text="File uploaded successfully." ForeColor="Green" Visible="true" />
                            </div>
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Style="display: none" />
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <hr />

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <span style="font-weight: 600;"><i class="icon-align-justify"></i><span style="padding-left: 10px;">Profile Details:</span></span>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Username:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_username"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Full Name:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_fullname"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Type of Job:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_job"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Account Created:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_createddate"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Last Login:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_lastlogin"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">Telephone:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_telephone"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-6"><span class="bold">E-mail:</span></div>
                                            <div class="col-md-6">
                                                <asp:Label runat="server" CssClass="labelpadding" ID="profil_email"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblMessage" CssClass="labelpadding" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <hr />

                                                <br />
                                                <span style="font-weight: 600;"><i class="icon-align-justify"></i><span style="padding-left: 10px;">Available access:</span></span>
                                                <hr />
                                                <asp:GridView runat="server" ID="gv_permissions" OnRowDataBound="gv_permission_dbound" CssClass="gv_permission"></asp:GridView>
                                            </div>
                                        </div>
                                        <hr />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <%-- REQ ACTIVATION PAGE --%>
        <div id="req_activation" class="req_hidden" runat="server">
            <a href="#!" id="req_close" style="font-size: 25px; position: absolute; right: 30px; top: 10px; text-decoration: none;">X</a>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h3>Unauthorized Users <span runat="server" id="req_h1"></span>
                            <asp:Button runat="server" Text="Save and Proced" ID="req_save_proced" Style="float: right; font-size: 16px; margin-top: 5px;" /></h3>
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-1"><span style="font-size: 16px;">Select user:</span></div>
                    <div class="col-xs-2">
                        <asp:DropDownList ID="req_user_drop_down" runat="server" Style="font-size: 16px; border-style: dashed;"></asp:DropDownList>
                    </div>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-2"></div>
                </div>
                <br />
                <br />
                <div id="req_checkboxes_all">
                    <div class="row">
                        <div class="col-xs-3">
                            <asp:CheckBox runat="server" CssClass="role_check" ID="check_cont" data-name="cont" Text="Controlo di Gestione" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                        </div>
                        <div class="col-xs-3">
                            <asp:CheckBox runat="server" CssClass="role_check" ID="check_prod" data-name="prod" Text="Produzione" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                        </div>
                        <div class="col-xs-3">
                            <asp:CheckBox runat="server" CssClass="role_check" ID="check_riso" data-name="riso" Text="Risorse Umane" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                        </div>
                        <div class="col-xs-3">
                            <asp:CheckBox runat="server" CssClass="role_check" ID="check_smart" data-name="smart" Text="Smart Factory" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="vendite" ID="check_cont_vendite" Text="Vendite" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="tess" ID="check_prod_tess" Text="Tessitura" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_timb" ID="check_riso_timb" Text="Timbrature" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_porte" ID="check_smart_porte" Text="Porte" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_situazione" ID="check_cont_situazione" Text="Situazione Echonomiche" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="conf" ID="check_prod_conf" Text="Confezione" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_scheda" ID="check_riso_scheda" Text="Scheda Dipendenti" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_luci" ID="check_smart_luci" Text="Luci" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_costi" ID="check_cont_costi" Text="Costi" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="lava" ID="check_prod_lava" Text="Lavanderia" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_stat" ID="check_riso_stat" Text="Statistiche" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_temp" ID="check_smart_temp" Text="Temperature" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_prod" ID="check_cont_prod" Text="Produzione" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="sart" ID="check_prod_sart" Text="Sartoria" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_organigrammi" ID="check_riso_org" Text="Organigrammi" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_allarmi" ID="check_smart_allarmi" Text="Allarmi" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_personale" ID="check_cont_personale" Text="Personale" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="stiro" ID="check_prod_stiro" Text="Stiro" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_database" ID="check_riso_database" Text="Database" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_macchine" ID="check_smart_machine" Text="Macchine" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_finanza" ID="check_cont_finanza" Text="Finanza" />
                        </div>
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_chat" ID="check_riso_chat" Text="Chat Interna" />
                        </div>
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_musica" ID="check_smart_musica" Text="Musica" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3 req_sm_list">
                            <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_varie" ID="check_cont_varie" Text="Varie" />
                        </div>
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3"></div>
                        <div class="col-xs-3"></div>
                    </div>
                </div>
                <br />
                <br />




                <div class="row">
                    <div class="col-xs-12">
                        <h3>Authorized Users - <span runat="server" id="req_all"></span><span style="color: green">Approved Requests</span></h3>
                        <hr />
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>



                        <div class="row">
                            <div class="col-xs-1"><span style="font-size: 16px;">Select user:</span></div>
                            <div class="col-xs-2">

                                <asp:DropDownList ID="req_userAll_drop_down" runat="server" AutoPostBack="true" AppendDataBoundItems="True" Style="font-size: 16px; border-style: dashed;" DataSourceID="SqlDataSourceUsers" DataTextField="FullName" DataValueField="UserID" OnSelectedIndexChanged="ddl_allusr_SelectedIndexChanged"> </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserID], [FullName] FROM [Users]"></asp:SqlDataSource>
                                <br />
                                <br />
                            </div>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-2"></div>
                        </div>

                        <div id="req_All_checkboxes_all">
                            <div class="row">
                                <div class="col-xs-3">
                                    <asp:CheckBox runat="server" CssClass="role_check" ID="cbx_cont" data-name="cont" Text="Controlo di Gestione" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                                </div>
                                <div class="col-xs-3">
                                    <asp:CheckBox runat="server" CssClass="role_check" ID="cbx_prod" data-name="prod" Text="Produzione" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                                </div>
                                <div class="col-xs-3">
                                    <asp:CheckBox runat="server" CssClass="role_check" ID="cbx_riso" data-name="riso" Text="Risorse Umane" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                                </div>
                                <div class="col-xs-3">
                                    <asp:CheckBox runat="server" CssClass="role_check" ID="cbx_smart" data-name="smart" Text="Smart Factory" Style="font-size: 18px;" /><hr style="margin-bottom: 10px; margin-top: 10px;" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="vendite" ID="cbx_vend" Text="Vendite" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="tess" ID="cbx_tess" Text="Tessitura" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_timb" ID="cbx_timb" Text="Timbrature" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_porte" ID="cbx_porte" Text="Porte" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_situazione" ID="cbx_sit_ech" Text="Situazione Echonomiche" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="conf" ID="cbx_conf" Text="Confezione" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_scheda" ID="cbx_scheda_dip" Text="Scheda Dipendenti" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_luci" ID="cbx_luci" Text="Luci" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_costi" ID="cbx_costi" Text="Costi" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="lava" ID="cbx_lava" Text="Lavanderia" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_stat" ID="cbx_stat" Text="Statistiche" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_temp" ID="cbx_temp" Text="Temperature" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_prod" ID="cbx_prod_riso" Text="Produzione" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="sart" ID="cbx_sart" Text="Sartoria" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_organigrammi" ID="cbx_organigrami" Text="Organigrammi" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_allarmi" ID="cbx_alarm" Text="Allarmi" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_personale" ID="cbx_personale" Text="Personale" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="stiro" ID="cbx_stiro" Text="Stiro" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_database" ID="cbx_db" Text="Database" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_macchine" ID="cbx_machine" Text="Macchine" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_finanza" ID="cbx_finanza" Text="Finanza" />
                                </div>
                                <div class="col-xs-3"></div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="riso_chat" ID="cbx_chat_int" Text="Chat Interna" />
                                </div>
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="smart_musica" ID="cbx_musica" Text="Musica" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3 req_sm_list">
                                    <asp:CheckBox runat="server" CssClass="role_check" data-name="cont_varie" ID="cbx_varie" Text="Varie" />
                                </div>
                                <div class="col-xs-3"></div>
                                <div class="col-xs-3"></div>
                                <div class="col-xs-3"></div>
                            </div>
                        </div>

                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="req_userAll_drop_down" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>

           
        </div>
        <div class="notification-bell notify show-count" id="reg_notification_control" runat="server"></div>
        <%-- CHAT --%>
        <div id="popup_chat" class="chat_hidden">
            <span id="close_popup_chat" style="cursor: pointer; width: 100%; position: absolute; background: #0671cc; color: white;">
                <span style="display: block; float: left; padding-left: 5px;">Online Users: </span>
                <span style="float: right; padding-right: 5px;">X</span>
            </span>
            <br />
            <asp:GridView
                runat="server"
                CssClass="table table-bordered results"
                AutoGenerateColumns="true"
                AllowPaging="false"
                AllowSorting="false"
                ID="OnlineUsers_Grid"
                ShowHeader="false"
                OnRowDataBound="online_users_data_bound"
                RowStyle-CssClass="online_user_td">
            </asp:GridView>
        </div>
        <div id="chat_control_icon" class="notification-message notify show-count" runat="server"></div>
        <%-- RIGHT NAVIGATION --%>
        <div id="right-navi">
            <button type="button" class="right-toggle" onclick="rgtForce();return false;">
                <span class="bullet one"></span>
                <span class="bullet two"></span>
                <span class="bullet three"></span>
            </button>
            <div class="user">
                <asp:Image runat="server" ID="small_profile" style="display: none;" />
                <span>
                    <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" Style="color: black; font-size: 14pt;" />
                </span>
            </div>
            <div id="user-hidden">
                <nav class="user-navi">
                    <ul>
                        <li>
                            <a href="javascript:document.getElementById('LoginStatus1').click();" id="logout" class="btn btn-wire">Logout</a>
                        </li>
                        <li></li>
                        <li>
                            <asp:LoginStatus ID="LoginStatus1" ClientIDMode="static" runat="server" CssClass="" Style="color: silver; display: none;" />
                        </li>
                        <li>
                            <a href="#!" data-toggle="modal" data-target="#largeModal">Il mio profilo</a>
                        </li>

                    </ul>
                </nav>
                <%--<footer>
                    <img src="images/logo.svg" id="logo-svg" style="height: 90px; margin-top: -20px; margin-bottom: 35px;" />
                </footer>--%>
            </div>
        </div>
    </form>

   <%-- <script>
        document.getElementById("vid").controls = false;
        document.getElementById('vid').play();
    </script>--%>

    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(beginRequest);

        function beginRequest() {
            prm._scrollPosition = null;
        }
    </script>

    <script>
        var collection_prior = document.getElementsByClassName('prior');
        for (var i = 0, len = collection_prior.length; i < len; i++) {
            collection_prior[i].classList.add("show");
        }
        function UploadFile(fileUpload) {
            if (fileUpload.value !== '') {
                document.getElementById("<%=btnUpload.ClientID %>").click();
            }
        }

        function rgtForce() {
            var e = document.getElementById('right-navi');
            if (e.className === 'ng-scope hover') {
                e.className = 'ng-scope';
                $("#user-hidden").hide();
            } else {
                e.className = 'ng-scope hover';
                $("#user-hidden").show();
            }
        }

        function openClose() {
            var e = document.getElementById('left-navi');
            if (e.className === 'ng-scope hover') {
                e.className = 'ng-scope';
            } else {
                e.className = 'ng-scope hover';
            }
        }
        var $li = $('#menu li a').click(function () {
            $li.removeClass('active');
            $(this).addClass('active');
        });
    </script>
</body>
</html>
