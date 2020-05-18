<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LogIn.aspx.vb" Inherits="LogIn" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Olimpias Knitting</title>
	<meta charset="UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link runat="server" rel="shortcut icon" href="./images/favicon.ico" type="Images/Image/x-icon" />
    <link runat="server" rel="icon" href="./images/favicon.ico" type="Images/Image/ico" />

    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/Scripts/bootstrap.min.js"></script>
    <script src="./js/index.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"/>
    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/fonts/font-awesome/4.3.0/css/font-awesome.min.css'/>
    <link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" />
    <link rel="stylesheet" href="css/style-login.css"/>
    <link rel="stylesheet" href="./css/mobile/login.css"/>


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
    </style>

 
</head>

<body>
  
    <div id="particles-js"><canvas class="particles-js-canvas-el" width="1908" height="969" style="width: 100%; height: 100%;"></canvas></div>


  <form id="form" runat="server" class="form"  novalidate="novalidate" style="margin-top:100px;box-shadow:10px 15px 40px -10px rgba(0, 0, 0, 0.95);">
  <asp:ScriptManager runat="server" ID="scr1"></asp:ScriptManager>



<%-- LOGIN --%>
  <div id="Page1" class="page" runat="server" >
          <img src="images/logo.svg" id="logo-svg" style="height:100px;margin-top:-20px;margin-bottom:20px" />
          <asp:Login ID = "Login1"  runat = "server"  ClientIDMode="static" TitleText="" UserNameLabelText="Nome utente:" PasswordLabelText="Password:" LoginButtonText="Accesso"  RememberMeText="Ricordati di me la prossima volta."  UserNameRequiredErrorMessage="E 'richiesta il nome utente" PasswordRequiredErrorMessage="E 'richiesta la password" RememberMeSet="true" ValidateRequestMode="Enabled" OnAuthenticate= "ValidateUser">
              <LabelStyle CssClass="labeltext" />
              <TitleTextStyle CssClass="titletext" />
              <TextBoxStyle CssClass="input" />
              <CheckBoxStyle CssClass="cbox" />
              <LoginButtonStyle CssClass="hidden"/>
          </asp:Login>
                  <button class="g-recaptcha btn" data-sitekey="6LdtXHQUAAAAAOEhyVVPEH0kcUZzlwpmYyU65R77" data-callback="recaptcha_callback" style="line-height: 0px;">ACCESSO</button>

           <p class="message">Non registrato? <a class="bysectorA" href="#A" onclick="show('Page2');">Crea un account</a></p>
  </div>

 <%-- REGISTRATION --%>
  <div id="Page2" class="page" runat="server"  style="display:none;">
    <h2  style="padding-bottom: 20px;">REGISTRATI</h2><br />

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

      <p class="message"><asp:CheckBox runat="server" ID="checkbox1" CssClass="" Text="Confermo di aver letto le " />  <a href="Terms.aspx"  class="message">Condizioni sulla Privacy</a></p><br />
     <p class="message" style="text-align: left;    padding-left: 5px;"> <asp:CheckBox runat="server" ID="checkbox2" CssClass=""  Text="Accetto integralmente" /> <a href="Terms.aspx"  class="message">Termi e Condizioni</a></p> <br /><br />
    <asp:Button id="btnCheck1" runat="server" class="btn" onclick="CreateAccount1" Text="Registrati"></asp:Button>
    <p class="message">Già registrato? &nbsp;<a class="bysectorA" href="#B" onclick="show('Page1');">Vai per accedere</a></p>
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
</body>
</html>