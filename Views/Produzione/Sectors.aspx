<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Sectors.aspx.vb" Inherits="Sectors" %>

<!DOCTYPE html>

<html>
<head>
    <title>Select Department</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/Content/profile.css"/>
    <link rel="stylesheet" href="../../css/loader.css"/>
    <script src="../../js/jquery-1.12.4.min.js"></script>
    <script src="../../js/jquery-ui.min.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/2.1.19/css/materialdesignicons.min.css"/>

 
    <script src="../../js/Scripts/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="../../css/sectors.css"/>
    <script src="../../js/sectors.js"></script>



</head>
<body onbeforeunload="return document.getElementById('LoginStatus1').click();">

    <form id="form1" runat="server">
        
        
        <%-- HEADER START--%>
        <div id="header">
            <a class="navbar-brand" href="../../Dashboard.aspx">
                <img alt="logo" class="logo" src="../../images/logo.svg" />
            </a>
            <div class="container">
                <div class="half">
                    <label for="profile2" class="profile-dropdown">
                        <input type="checkbox" id="profile2">
                        <img src="https://cdn0.iconfinder.com/data/Images/icons/avatars-3/512/avatar_hipster_guy-512.png">
                        <span>
                            <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" style="color: white;" />
                        </span>
                        <label for="profile2"><i class="mdi mdi-menu" style="color: white;"></i></label>
                        <ul>
                            <li><a href="#"><i class="mdi mdi-email-outline"></i>Messages</a></li>
                            <li><a href="../../profil.aspx"><i class="mdi mdi-account"></i>Account</a></li>
                            <li><a href="#"><i class="mdi mdi-settings"></i>Settings</a></li>
                            <li><a href="javascript:document.getElementById('LoginStatus1').click();" id="logout" ><i class="mdi mdi-logout"></i>Logout</a></li>
                        </ul>
                        <asp:LoginStatus ID="LoginStatus1" ClientIDMode="static" runat="server" CssClass="" style="color: silver;display:none;" />                           
                    </label>
                </div>
            </div>
                
            <br />
        </div>
        

        
        <%-- HEADER END --%>
        <br />
        <br />
        

    </form>
    
    <%-- LEVEL 1: AIO --%>
    <asp:Panel runat="server" ID="lvl_jedan_aio">
        
        <%-- Controllo di Gestione --%>
        <div class="card-wrapper" id="cont">
            <div class="card-1 card-object card-object-hf ">
                <a class="face front" href="#">
                    <div class="title-wrapper">
                        <div class="title">Controllo di Gestione</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
                
            </div>
        </div>
        
        <%-- Produzione --%>
        <div class="card-wrapper " id="prod">
            <div class="card-1 card-object card-object-hf">
                <a class="face front" href="#">
                    <div class="title-wrapper">
                        <div class="title">Produzione</div>
                        <div class="subtitle">Tessitura - Confezione - Lavanderia - Sartoria - Stiro</div>
                    </div>
                </a>
            </div>
        </div>
        
        <%-- Risorse Umane --%>
        <div class="card-wrapper " id="riso">
            <div class="card-1 card-object card-object-hf">
                <a class="face front" href="#">
                    <div class="title-wrapper">
                        <div class="title">Risorse Umane</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
            </div>
        </div>
        
        <%-- Smart Factory --%>
        <div class="card-wrapper " id="smart">
            <div class="card-1 card-object card-object-hf">
                <a class="face front" href="#">
                    <div class="title-wrapper">
                        <div class="title">Smart Factory</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
            </div>
        </div>
      
    </asp:Panel>
    
    <%-- LEVEL 2: AIO --%>
    <asp:Panel runat="server" ID="lvldva">
       
      <%-- LEVEL 2: Controlo Di Gestione --%>
        <asp:panel runat="server" ID="controlo_di_gestione"></asp:panel>

        <%-- LEVEL 2: Produzione --%>

        <asp:Panel runat="server" ID="lvl_dva_produzione">
            <a href="#" id="bread_lvldva" class="breadcrmp">Back</a>
         
            

            <div class="cards-wrapper">
        
        <%-- Tessitura --%>
        <div class="card-wrapper" id="tess">
            <div class="card-3 card-object card-object-hf">
                <a class="face front disabled" href="#">
                    <div class="title-wrapper">
                        <div class="title">Tessitura</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
            </div>
        </div>
        
        <%-- Confezione --%>
        <div class="card-wrapper" id="conf">
            <div class="card-3 card-object card-object-hf">
                <a class="face front" href="#">
                    <div class="title-wrapper">
                        <div class="title">Confezione</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
            </div>
        </div>
                
                <%-- Lavandaria --%>
                <div class="card-wrapper" id="lava">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front disabled" href="#">
                            <div class="title-wrapper">
                                <div class="title">Lavandaria</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
       
     
   
    </div>
        <br />
            <div class="cards-wrapper">
        <%-- Sartoria --%>
        <div class="card-wrapper" id="sart">
            <div class="card-3 card-object card-object-hf">
                <a class="face front disabled" href="#">
                    <div class="title-wrapper">
                        <div class="title">Sartoria</div>
                        <div class="subtitle"></div>
                    </div>
                </a>
            </div>
        </div>
        
                <%-- Stiro --%>
                <div class="card-wrapper" id="stir">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#">
                            <div class="title-wrapper">
                                <div class="title">Stiro</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
           
    </div>
    </asp:Panel>
        
        <%-- LEVEL 2: Risorse Umane --%>
        <asp:Panel runat="server" ID="risorse_umane"></asp:Panel>
        
        <%-- Level 2: Smart Factory --%>
        <asp:Panel runat="server" ID="smart_factory"></asp:Panel>
    

      </asp:Panel>
    
    <%-- LEVEL 3: Confezione --%>

    <asp:panel runat="server" id="conf_dva">

        <a href="#" id="bread_lvlconf" class="breadcrmp">Back To Produzione</a>
        
        <div class="dtdb">
            <a href="#" id="db_lvldva">Dati Base</a> / <a href="#" id="dt_lvldva">Dati Produzione</a>
            <a href="#" id="exit_frame_confezione" class="exit_frame">Close frame</a>

        </div>
        
        <div id="dati_produzione">

            <div id="frame_confezione_div">
      
                    <div id="loader-wrapper-confezione" >
                        <div id="loader-confezione"></div>        
                        <div class="loader-section section-left"></div>
                        <div class="loader-section section-right"></div>
                    </div>
                <iframe runat="server" id="frame_confezione" frameBorder="0" style="overflow:hidden;height:90vh; width: 105%" height="100%" width="100%"></iframe>
            </div>
        <div class="cards-wrapper">
        <%-- Confezione A: Layout --%>
        <div class="card-wrapper" id="conf_a_layout">
            <div class="card-3 card-object card-object-hf">
                <a class="face front" href="#" id="confezionea_frame_start">
                    <div class="title-wrapper">
                        <div class="title">Confezione A Layout</div>
                        <div class="subtitle">68 Persons - 6 Lines</div>
                    </div>
                </a>
            </div>
        </div>
        <%-- Confezione B: Layout --%>
        <div class="card-wrapper" id="conf_b_layout">
            <div class="card-3 card-object card-object-hf">
                <a class="face front" href="#" id="confezioneb_frame_start">
                    <div class="title-wrapper">
                        <div class="title">Confezione B Layout</div>
                        <div class="subtitle">152 Persons - 12 Lines</div>
                    </div>
                </a>
            </div>
        </div>
            <%-- ORGANIGRAMA CONF Layout --%>
            <div class="card-wrapper" id="conf_organigrama">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front" href="#" id="organigrama_conf_frame_start">
                        <div class="title-wrapper">
                            <div class="title">Organigramma</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
    </div>
        
        <div class="cards-wrapper">
            <%--EFFICIENZA--%>
            <div class="card-wrapper" id="conf_eff">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Efficienza</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%--EFFICIENZA MENSILLE--%>
            <div class="card-wrapper" id="conf_eff_mens">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Efficienza mensille</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%-- INTERVALI --%>
            <div class="card-wrapper" id="conf_intervali">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Intervali</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%--STATISTICHE DI PRODUZIONE--%>
            <div class="card-wrapper" id="conf_stat_di_prod">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Statistiche di produzione</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        </div>
        
        <div id="dati_base">
            <div id="frame_confezione_div_db">
                <iframe runat="server" id="frame_confezione_db" frameBorder="0" style="overflow:hidden;height:90vh; width: 105%" height="100%" width="100%"></iframe>
            </div>
            <div class="cards-wrapper">


                <%--COMMESSE--%>
                <div class="card-wrapper" id="conf_commesse">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front disabled" href="#" >
                            <div class="title-wrapper">
                                <div class="title">Commesse</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%-- FAZE --%>
                <div class="card-wrapper" id="conf_faze">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="faze_conf_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Faze</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>

                 <%-- Article --%>
                 <div class="card-wrapper" id="conf_article">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="article_conf_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Gestione archivio articoli</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
               
            </div>
            
            <div class="cards-wrapper">
                <%-- CLIENTI --%>
                 <div class="card-wrapper" id="conf_clienti">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="clienti_conf_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Gestione ordini clienti</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>

                <%-- MACHINES --%>
                <div class="card-wrapper" id="conf_machine">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="machine_conf_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Macchine</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--PERSONE--%>
                <div class="card-wrapper" id="conf_persons">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="persons_conf_frame_start" >
                            <div class="title-wrapper">
                                <div class="title">Persone</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--TABLET--%>
                <div class="card-wrapper" id="conf_tablets">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="tablets_conf_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Tablet</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </asp:panel>
    
    <%-- LEVEL 3: Stiro --%>
    <asp:Panel runat="server" ID="stir_dva">
        <a href="#" id="bread_lvldvastir" class="breadcrmp">Back To Produzione</a>
        
        <div  class="dtdb">
            <a href="#" id="db_lvldvastiro">Dati Base</a> / <a href="#" id="dt_lvldvastiro">Dati Produzione</a>
            <a href="#" id="exit_frame_stiro" class="exit_frame">Close frame</a>
        </div>
        
        <div id="dati_produzione_stiro">
            <div id="frame_stiro_div">
                      <div id="loader-wrapper" >
                        <div id="loader"></div>        
                        <div class="loader-section section-left"></div>
                        <div class="loader-section section-right"></div>
                    </div>
                <iframe runat="server" id="frame_stiro" frameBorder="0" style="overflow:hidden;height:90vh; width: 105%" height="100%" width="100%"></iframe>
            </div>
        <div class="cards-wrapper">
        <%-- Stiro: Layout --%>
            <div class="card-wrapper" id="stiro_layout">
            <div class="card-3 card-object card-object-hf">
                <a class="face front" href="#" id="stiro_frame_start" >
                    <div class="title-wrapper">
                        <div class="title">Stiro Layout</div>
                        <div class="subtitle">3 Lines - 55 persons</div>
                    </div>
                </a>
            </div>
        </div>
            
            <%-- Stiro: Layout --%>
            <div class="card-wrapper" id="stiro_organigrama">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front" href="#" id="stiro_organigrama_frame_start" >
                        <div class="title-wrapper">
                            <div class="title">Organigramma</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
       
        <div class="cards-wrapper">
            <%--EFFICIENZA--%>
            <div class="card-wrapper" id="stiro_eff">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Efficienza</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%--EFFICIENZA MENSILLE--%>
            <div class="card-wrapper" id="stiro_eff_mens">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Efficienza mensille</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%-- STIRO INTERVALS --%>
            <div class="card-wrapper" id="stiro_intervals">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front" href="#" id="stiro_intervals_frame_start">
                        <div class="title-wrapper">
                            <div class="title">Intervali</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
            <%--STATISTICHE DI PRODUZIONE--%>
            <div class="card-wrapper" id="stiro_stat_di_prod">
                <div class="card-3 card-object card-object-hf">
                    <a class="face front disabled" href="#">
                        <div class="title-wrapper">
                            <div class="title">Statistiche di produzione</div>
                            <div class="subtitle"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
       </div>
        
        <div id="dati_base_stiro">
            <div id="frame_stiro_div_db">
                <iframe runat="server" id="frame_stiro_db" frameBorder="0" style="overflow:hidden;height:90vh; width: 105%" height="100%" width="100%"></iframe>
            </div>

            <div class="cards-wrapper">

                <%--COMMESSE--%>
                <div class="card-wrapper" id="stiro_commesse">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front disabled" href="#">
                            <div class="title-wrapper">
                                <div class="title">Commesse</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--FAZE--%>
                <div class="card-wrapper" id="stiro_faze">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="stiro_faze_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Faze</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>     
                
                 <%-- ARTICLE --%>
                <div class="card-wrapper" id="stiro_article">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="stiro_article_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Gestione archivio articoli</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
            
            <div class="cards-wrapper">
                <%--CLIENTS--%>
                <div class="card-wrapper" id="stiro_clienti">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front " href="#" id="clieti_stiro_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Gestione ordini clienti</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%-- MACHINE --%>
                <div class="card-wrapper" id="stiro_machine">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="machine_stiro_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Macchine</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--PERSONE--%>
                <div class="card-wrapper" id="stiro_persons">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="persons_stiro_frame_start" >
                            <div class="title-wrapper">
                                <div class="title">Persone</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <%--TABLETS--%>
                <div class="card-wrapper" id="stiro_tablets">
                    <div class="card-3 card-object card-object-hf">
                        <a class="face front" href="#" id="tablets_stiro_frame_start">
                            <div class="title-wrapper">
                                <div class="title">Tablet</div>
                                <div class="subtitle"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    
</body>

 
</html>
