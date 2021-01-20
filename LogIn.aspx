<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LogIn.aspx.vb" Inherits="LogIn" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Olimpias Knitting</title>
	<meta charset="UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link runat="server" rel="shortcut icon" href="./images/favicon.ico" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="./images/favicon.ico" type="Images/Image/ico" />

    <script src="./js/login/jquery-2.2.2.min.js"></script>
    <script src="./js/Scripts/bootstrap.min.js"></script>
    <script src="./js/index.js"></script>
    <script src="./js/login/TweenMax.min.js"></script>
    <script src=".js/login/TimelineMax.min.js"></script> 

    <link rel="stylesheet" href="./css/login/reset.min.css"/>
    <%--<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/fonts/font-awesome/4.3.0/css/font-awesome.min.css'/>--%>
     <link href="./css/login/poppins.css" rel="stylesheet"/> 
    <link rel="stylesheet" href="css/style-login_rework.css"/>
    <link rel="stylesheet" href="./css/mobile/login.css"/>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />--%>


    <script type="text/javascript">
        function clickButton(e, loginbutton) {
            var evt = e ? e : window.event;
            var bt = document.getElementById(loginbutton);
            if (bt) {
                if (evt.keyCode === 13) {
                    bt.click();
                    return false;
                }
            }
        }
    </script>
    <style>

        .hidden{
            display:none;
        }

        @import url(https://fonts.googleapis.com/css?family=Noto+Sans:400,700);
        body {
          /*background-color: #3c3c3c;*/
          /*margin: 50px 0;*/
          font-family: 'Noto Sans', sans-serif;
          text-align: center;
        }

        .container {
          background-color: white;
          /*background-image: url(./img/background_log.svg);*/
          margin: 50px auto;
          width: 100%;
          max-width: 320px;
          min-height: 568px;
          margin: 0 auto;
          border-radius: 8px;
          position: relative;
          overflow: hidden;
          -webkit-box-shadow: 0px 9px 13px 0px rgba(0, 0, 0, 0.3);
          -moz-box-shadow: 0px 9px 13px 0px rgba(0, 0, 0, 0.3);
          box-shadow: 0px 9px 13px 0px rgba(0, 0, 0, 0.3);
          -webkit-transform: scale(1);
          border-radius: 10px;
        }

        .menu-trigger, .close-trigger {
          position: absolute;
          top: 32px;
          right: 20px;
          display: block;
          width: 42px;
          height: 42px;
          cursor: pointer;
          z-index: 333;
        }
        .menu-trigger:hover .menu-trigger-bar:before, .close-trigger:hover .menu-trigger-bar:before {
          width: 100%;
        }
        .menu-trigger:hover .close-trigger-bar:before, .close-trigger:hover .close-trigger-bar:before {
          width: 100%;
        }

        .close-trigger {
          z-index: 5;
          top: 25px;
        }

        .menu-trigger-bar {
          display: block;
          width: 100%;
          height: 4px;
          background-color: #3855a5;
          margin-bottom: 6px;
          transform: rotate(-45deg);
          position: relative;
        }
        .menu-trigger-bar:before {
          content: "";
          position: absolute;
          top: 0;
          left: 0;
          display: block;
          width: 0%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.2);
          transition: all 0.3s cubic-bezier(0.55, 0, 0.1, 1);
        }
        .menu-trigger-bar.top {
          width: 50%;
        }
        .menu-trigger-bar.middle:before {
          left: auto;
          right: 0;
        }
        .menu-trigger-bar.bottom {
          width: 50%;
          margin-left: 50%;
        }

        .close-trigger-bar {
          display: block;
          width: 100%;
          height: 4px;
          background-color: #3855a5;
          position: relative;
        }
        .close-trigger-bar:before {
          content: "";
          position: absolute;
          top: 0;
          left: 0;
          display: block;
          width: 0%;
          height: 100%;
          background-color: rgba(255, 255, 255, 0.2);
          transition: all 0.3s cubic-bezier(0.55, 0, 0.1, 1);
        }
        .close-trigger-bar.left {
          transform: translateX(100px) translateY(-100px) rotate(-45deg);
        }
        .close-trigger-bar.right {
          transform: translateX(-100px) translateY(-100px) rotate(45deg);
          top: -3px;
        }

        .logo {
          display: block;
          width: 64px;
          height: 64px;
          position: absolute;
          top: 50%;
          left: 50%;
          margin-top: -52px;
          margin-left: -32px;
          text-align: center;
          z-index: 10;
        }
        .logo span {
          display: block;
          text-align: center;
          line-height: 62px;
          font-size: 72px;
          color: white;
        }

        .logo-title {
          position: absolute;
          top: 10px;
          left: 0;
          width: 100%;
          height: 100%;
          color: #222222;
          font-size: 32px;
          line-height: 82x;
        }

        .logo-badge {
          position: absolute;
          display: block;
          width: 24px;
          height: 24px;
          top: 6px;
          right: -6px;
          border-radius: 100%;
          background-color: #6295ca;
          font-size: 12px;
          line-height: 2;
          text-align: center;
        }

        .inner-container, .menu-container {
          position: absolute;
          height: 100%;
          width: 100%;
          left: 0;
          top: 0;
        }

        .inner-container {
          z-index: 20;
        }

        .menu-container {
          display: flex;
          align-items: center;
        }

        .menu {
          display: block;
          width: 100%;
          padding: 20%;
        }
        .menu li {
          text-align: left;
          display: block;
          padding: 15px 0;
        }
        .menu a {
          text-decoration: none;
          color: #222222;
          display: inline-block;
          padding: 10px 0;
          position: relative;
        }
        .menu a:hover:before {
          opacity: 1;
          transform: translateX(0px);
        }
        .menu a:before {
          content: "";
          display: block;
          position: absolute;
          left: 0;
          bottom: 0;
          width: 18px;
          height: 4px;
          opacity: 0;
          background-color: #222222;
          transform: translateX(100px);
          transition: all 0.3s cubic-bezier(0.55, 0, 0.1, 1);
        }

        .menu-bg {
          position: absolute;
          display: block;
          width: 200%;
          left: -53%;
          top: -25%;
          height: 40%;
          background-color: white;
        }
        .menu-bg.middle {
          top: 29%;
          left: -53%;
          transform: rotate(-45deg) scaleY(0);
        }
        .menu-bg.top {
          left: -34%;
          top: 0;
          transform: rotate(-45deg) translateY(-152%);
        }
        .menu-bg.bottom {
          top: 105%;
          transform: rotate(-45deg) translateY(25%);
          left: -20%;
        }

        #links {
          position: absolute;
          bottom: 0px;
          left: 0px;
          width: 100%;
          height: 50px;
          font-size: 13px;
          font-family: tahoma;
          color: #fff;
        }

        #links a {
          text-decoration: none;
          font-size: 2.3em;
          color: #fff;
        }

        #twitter {
          position: absolute;
          bottom: 15px;
          right: 20px;
        }

        #pens {
          position: absolute;
          bottom: 15px;
          left: 20px;
        }

        .page {
            z-index:40;
        }
        #UserName{
            /*border-top-right-radius:20px;*/
                        border: #d9d9d9 0.5px solid!important;

        }
        #Password{
            /*border-bottom-right-radius:20px;*/
                        border: #d9d9d9 0.5px solid!important;

        }
/*
        #UserNameRequired{
            position:absolute;
            top:10px;
            left:10px;
            display:none;
        }
        #PasswordRequired{
            position:absolute;
            top:20px;
            left:20px;
            display:none;
            border-top:none;
        }*/
    </style>

 
</head>

<body>
  
    <div id="particles-js"><canvas class="particles-js-canvas-el" width="1908" height="969" style="width: 100%; height: 100%;"></canvas></div>


  <form id="form" runat="server" class="form"  novalidate="novalidate" style="margin-top:100px;box-shadow:10px 15px 40px -10px rgba(0, 0, 0, 0.95);">
  <asp:ScriptManager runat="server" ID="scr1"></asp:ScriptManager>

<div class="container">
  <span class="menu-trigger">
    <i class="menu-trigger-bar top"></i>
    <i class="menu-trigger-bar middle"></i>
    <i class="menu-trigger-bar bottom"></i>
    <span style="font-size: 10px;text-transform: uppercase;margin-left: -6px;padding-top: 5px;">Registrati</span>
  </span>
    
       <div id="Page1" class="page" runat="server" style="margin-left:20px;margin-right:15px;position:absolute;    height: 100%;" >
          <img src="img/logo_noy.png" id="logo-svg" style="margin-top: 115px;margin-bottom: 50px;height: 85px;" />
          <asp:Login ID = "Login1"  runat = "server"  ClientIDMode="static" TitleText="" 
              UserNameLabelText="Nome utente:" PasswordLabelText="Password:" 
              LoginButtonText="Accesso"  
              UserNameRequiredErrorMessage="E 'richiesta il nome utente" 
              PasswordRequiredErrorMessage="E 'richiesta la password" 
             RememberMeText="Ricordati di me la prossima volta." 

              RememberMeSet="true" ValidateRequestMode="Enabled" OnAuthenticate= "ValidateUser">
              <LabelStyle CssClass="labeltext" />
              <TitleTextStyle CssClass="titletext" />
              <TextBoxStyle CssClass="input" />
              <CheckBoxStyle CssClass="cbox" />
              <LoginButtonStyle CssClass="btn"/>
          </asp:Login> 

           <%-- <div class="input-container">
            <i class="fa fa-user icon"></i>
            <input class="input-field" type="text" placeholder="Username" name="usrnm"/>
          </div>--%>
   </div>



  <span class="close-trigger">
    <i class="close-trigger-bar left"></i>
    <i class="close-trigger-bar right"></i>
  </span> 
 
  <div class="inner-container">
      <i class="menu-bg top"></i>
      <i class="menu-bg middle"></i>
      <i class="menu-bg bottom"></i>
    <div class="menu-container">
     <div id="Page2" class="menu" runat="server" >

    <asp:TextBox type="text" runat="server" id="txtName" required="true" placeholder="Nome e Cognome" CssClass="input"></asp:TextBox> <!-- IME I PREZIME -->
      <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                  ControlToValidate="txtName"
                                  ErrorMessage="Full Name is a required field."
                                  ForeColor="Red">
      </asp:RequiredFieldValidator>

      <asp:TextBox type="text" runat="server" id="txtUsername" required="true" placeholder="Utente" CssClass="input"></asp:TextBox> <!-- IME I PREZIME -->
      <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                  ControlToValidate="txtUsername"
                                  ErrorMessage="Username is a required field."
                                  ForeColor="Red">
      </asp:RequiredFieldValidator>

    <asp:TextBox  runat="server" id="txtEmail"  placeholder="E-Mail" required="true" type="email" onfocus="this.type='email'" CssClass="input" ></asp:TextBox> <!-- EMAIL -->
      <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                  ControlToValidate="txtEmail"
                                  ErrorMessage="E-Mail is a required field."
                                  ForeColor="Red">
      </asp:RequiredFieldValidator>

      <asp:TextBox type="password" runat="server" id="txtPassword" required="true"  placeholder="Crea Password" CssClass="input"></asp:TextBox>  <!-- Password -->
      <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                                  ControlToValidate="txtPassword"
                                  ErrorMessage="Password is a required field."
                                  ForeColor="Red">
      </asp:RequiredFieldValidator>
      <asp:TextBox type="password" runat="server" id="txtPasswordre" required="true"  placeholder="Conferma Password" CssClass="input"></asp:TextBox>  <!-- Password -->
      <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                                  ControlToValidate="txtPasswordre"
                                  ErrorMessage="Password is a required field."
                                  ForeColor="Red">
      </asp:RequiredFieldValidator>
      
      <asp:TextBox type="text" runat="server" id="txtJob" required="true"  placeholder="Ruolo Aziendale" CssClass="input" style="margin: 0 0 15px;"></asp:TextBox>  <!-- JOB  -->
      <asp:textbox  type="number" runat="server" id="txtPhone"  placeholder="Telefono" CssClass="input" style="margin: 0 0 15px;"></asp:textbox>  <!-- PHONE  -->

      <span class="message"><asp:CheckBox runat="server" ID="checkbox1" CssClass="" Text="Confermo di aver letto le " />  </span>
     <span class="message"> <asp:CheckBox runat="server" ID="checkbox2" CssClass=""  Text="Accetto integralmente" /> </span>
    <asp:Button id="btnCheck1" runat="server" class="btn" onclick="CreateAccount1" Text="Registrati"></asp:Button>
  </div>
    </div>
  </div>
</div>  

  <div id="Page3" class="Page" runat="server" style="display:none;">
          <h3>Recupero della password</h3><br />  
          <asp:TextBox type="text" runat="server" id="RecoveryBox" placeholder="Inserisci il tuo indirizzo email" CssClass="input"></asp:TextBox>
          <asp:Button runat="server" Text="Inviare" CssClass="btn" />
  </div>

     
   </form>

   <div id="footer" class="footer">
        <asp:table runat="server">
            <asp:TableFooterRow><asp:TableCell><p style="color:white;font-size: 10pt;">	&copy; 2018 - Olimpias Knitting Serbia </p></asp:TableCell> 
                <asp:TableCell style="padding-left: 150px;"><a href="Terms.aspx" class="ahref_footer">TERMINI E CONDIZIONI</a></asp:TableCell>
                <asp:TableCell style="padding-left: 15px;"><a href="Terms.aspx" class="ahref_footer">CONDIZIONI SULLA PRIVACY</a></asp:TableCell>
                <asp:TableCell style="padding-left: 15px;"><a href="Terms.aspx" class="ahref_footer">COOKIE</a></asp:TableCell>
                <asp:TableCell style="padding-left: 15px;"><a href="#" class="ahref_footer">CONTATTA L'ASSISTENZA</a></asp:TableCell>
            </asp:TableFooterRow>
        </asp:table></div>
 


       <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
        <script>

         
            function recaptcha_callback() {
                $("#LoginButton").click();
            }

          particlesJS("particles-js", {
        "particles": {
            "number": {
                "value":  100,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#ffffff"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#000000"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "Images/img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 3,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 40,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#ffffff",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 1,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "grab"
                },
                "onclick": {
                    "enable": true,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 140,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 400,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 200,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
              "retina_detect": true
    });
    </script>


    <script>
        function show() {
            var p = document.getElementById('txtPassword');
            p.setAttribute('type', 'text');
        }

        function hide() {
            var p = document.getElementById('txtPassword');
            p.setAttribute('type', 'password');
        }

        var pwShown = 0;
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
            for(var i = 0; i < pages.length; i++) {
                pages[i].style.display = 'none';
            }
            // then show the requested page
            ele.style.display = 'block';
        }
    </script>

    <script>
        $(document).ready(function () {
            $('.btn').closest('td').attr('align', 'center');            //OPEN TRIGGER
            var openTrigger = $('.menu-trigger');
            var openTriggerTop = openTrigger.find('.menu-trigger-bar.top');
            var openTriggerMiddle = openTrigger.find('.menu-trigger-bar.middle');
            var openTriggerBottom = openTrigger.find('.menu-trigger-bar.bottom');

            //CLOSE TRIGGER
            var closeTrigger = $('.close-trigger');
            var closeTriggerLeft = closeTrigger.find('.close-trigger-bar.left');
            var closeTriggerRight = closeTrigger.find('.close-trigger-bar.right');

            //LOGO
            var logo = $('.logo');

            //MENU
            var menuContainer = $('.menu-container');
            var menu = $('.menu');
            var menuTop = $('.menu-bg.top');
            var menuMiddle = $('.menu-bg.middle');
            var menuBottom = $('.menu-bg.bottom');

            //TL
            var tlOpen = new TimelineMax({ paused: true });
            var tlClose = new TimelineMax({ paused: true });

            //OPEN TIMELINE
            tlOpen.add("preOpen")
                .to(logo, 0.4, {
                    scale: 0.8,
                    opacity: 0,
                    ease: Power2.easeOut
                }, "preOpen")
                .to(openTriggerTop, 0.4, {
                    x: "+80px", y: "-80px", delay: 0.1, ease: Power4.easeIn, onComplete: function () {
                        closeTrigger.css('z-index', '25');
                    }
                }, "preOpen")
                .to(openTriggerMiddle, 0.4, {
                    x: "+=80px", y: "-=80px", ease: Power4.easeIn,
                    onComplete: function () {
                        openTrigger.css('visibility', 'hidden');
                    }
                }, "preOpen")
                .to(openTriggerBottom, 0.4, {
                    x: "+=80px", y: "-=80px", delay: 0.2, ease: Power4.easeIn
                }, "preOpen")
                .add("open", "-=0.4")
                .to(menuTop, 0.8, {
                    y: "13%",
                    ease: Power4.easeInOut
                }, "open")
                .to(menuMiddle, 0.8, {
                    scaleY: 1,
                    ease: Power4.easeInOut
                }, "open")
                .to(menuBottom, 0.8, {
                    y: "-114%",
                    ease: Power4.easeInOut
                }, "open")
                .fromTo(menu, 0.6, {
                    y: 30, opacity: 0, visibility: 'hidden'
                }, {
                    y: 0, opacity: 1, visibility: 'visible', ease: Power4.easeOut
                }, "-=0.2")
                .add("preClose", "-=0.8")
                .to(closeTriggerLeft, 0.8, {
                    x: "-=100px", y: "+=100px", ease: Power4.easeOut
                }, "preClose")
                .to(closeTriggerRight, 0.8, {
                    x: "+=100px", y: "+=100px", delay: 0.2, ease: Power4.easeOut
                }, "preClose");

            //CLOSE TIMELINE
            tlClose.add("close")
                .to(menuTop, 0.2, {
                    backgroundColor: "#6295ca", ease: Power4.easeInOut, onComplete: function () {
                        logo.css('z-index', '26');
                        closeTrigger.css('z-index', '5');
                        openTrigger.css('visibility', 'visible');
                    }
                }, "close")
                .to(menuMiddle, 0.2, {
                    backgroundColor: "#6295ca", ease: Power4.easeInOut
                }, "close")
                .to(menuBottom, 0.2, {
                    backgroundColor: "#6295ca", ease: Power4.easeInOut
                }, "close")
                .to(menu, 0.6, {
                    y: 20, opacity: 0, ease: Power4.easeOut, onComplete: function () {
                        menu.css('visibility', 'hidden');
                    }
                }, "close")
                .to(logo, 0.8, {
                    scale: 1, opacity: 1, ease: Power4.easeInOut
                }, "close", "+=0.2")
                .to(menuTop, 0.8, {
                    y: "-113%",
                    ease: Power4.easeInOut
                }, "close", "+=0.2")
                .to(menuMiddle, 0.8, {
                    scaleY: 0,
                    ease: Power4.easeInOut
                }, "close", "+=0.2")
                .to(menuBottom, 0.8, {
                    y: "23%",
                    ease: Power4.easeInOut,
                    onComplete: function () {
                        menuTop.css('background-color', '#ffffff');
                        menuMiddle.css('background-color', '#ffffff');
                        menuBottom.css('background-color', '#ffffff');
                    }
                }, "close", "+=0.2")
                .to(closeTriggerLeft, 0.2, {
                    x: "+=100px", y: "-=100px", ease: Power4.easeIn
                }, "close")
                .to(closeTriggerRight, 0.2, {
                    x: "-=100px", y: "-=100px", delay: 0.1, ease: Power4.easeIn
                }, "close")
                .to(openTriggerTop, 1, {
                    x: "-=80px", y: "+=80px", delay: 0.2, ease: Power4.easeOut
                }, "close")
                .to(openTriggerMiddle, 1, {
                    x: "-=80px", y: "+=80px", ease: Power4.easeOut
                }, "close")
                .to(openTriggerBottom, 1, {
                    x: "-=80px", y: "+=80px", delay: 0.1, ease: Power4.easeOut
                }, "close");

            //EVENTS
            openTrigger.on('click', function () {
                $('.page').css('position', 'unset');

                if (tlOpen.progress() < 1) {
                    tlOpen.play();
                } else {
                    tlOpen.restart();
                }
            });

            closeTrigger.on('click', function () {
               

                setTimeout(function () { $('.page').css('position', 'absolute');}, 500);


                if (tlClose.progress() < 1) {
                    tlClose.play();
                } else {
                    tlClose.restart();
                }
            });
        });
    </script>
</body>
</html>