<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControleDigestioneMain.aspx.cs" Inherits="Views_ControloDiGestione_ControleDigestioneMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="startJavaS()">
    <table border="1"id="task">
        <tr>
            <th id="olymp">OLIMPIAS KNITTING</th>
        </tr>
    </table>

    <table border="1"id="task2">
        <tr>
            <th id="olymp2"> ONLYOU
            </th>
        </tr>
    </table>

    <section>
            <table border="1" id="tables">
            <th id="knitt">31 dicembre 2020</th>
        </tr>
    </table>
</section>

     <section>
            <table border="1" id="tables2">
            <th> BILANCIO ALL:  </th>
        </tr>
    </table>
</section>
     
    <form id="form1" runat="server">
       
            <button class="main" onclick="enlarge()">
                Servizio
                </br>
                Contabilità
                </br>
                </br>
               <hr size="1" width="150" align="center" noshade color="black"/>
                </br>
                <font color="blue"> 
                <span id="arrow"> <a href="https://ro.wikipedia.org/wiki/Arad'"> &#8595;  </span>
                </font>
                </a>
                </br>
                Seleziona
            </button>
            <p id="main"></p>
           </br>
            </br>
            </br>

<form>
<input type="button" id="alfa" value="COPERTINA###############" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
            </br>
            </br>
            </br>

                 <button class="main2" onclick="enlarge()">
                Conto 
                </br>
                Economico
                     </br>
                     </br>
                     <hr size="1" width="150" align="center" noshade color="black"/>
                     </br>
                     <span id="arraw">&#8595;</span>
                     </br>
                     Seleziona
            </button>
            <p id="main2"></p>
            </br>
             </br>

            <form>
<input type="button" id="beta" value="CONTO ECONOMICO PROGR." onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
            </br>
            </br>
            </br>

            <input type="button" id="gama" class="gamas" value="CONTO ECONOMICO MENSILE" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

       <input type="button" id="delta" value="BUDGET###################" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

              <button class="main3" onclick="enlarge()">
                Produzione
                  </br>
                  </br>
                  <hr size="1" width="150" align="center" noshade color="black"/>    <%--add"Seleziona"--%>
                  </br>
                         <span id="arrow">&#8595;</span>
                  </br>
                  Seleziona
              </button>
    <p id="main3"></p>
            </br>
              </br>
    </br>

    <input type="button" id="epsilon" value="SATURAZIONE TESSITURA" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

    <input type="button"id="zeta" value="PRODUZIONE CAPI#######" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

    <input type="button" id="cota" value="EFFICIENZE REPARTI#####" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
   </br>
   </br>
   </br>

      <input type="button" id="teta" value="DATI PRODUTTIVI########" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

                    <button class="main4" onclick="enlarge()">
                     Costi
                     </br>
                     </br>
                     </br>
                     <hr size="1" width="150" align="center" noshade color="black"/>
                        </br>
                        <span id="arraw">&#8595;</span>
                        </br>
                        Seleziona
            </button>
    <p id="main4"></p>

             </br>
            </br>
            </br>

     <input type="button" id="iota" value="COSTI CONS/BUDGET####" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

     <input type="button" id="kappa" value="COSTI REPARTO#########" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>

    <input type="button" id="lambda" value="COSTI ENERGIE#########" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>
       
     <input type="button" id="miu" value="COSTI ORARIO FASE#####" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>
    </br>
    </br>
    </br>
            
     <button class="main5" onclick="enlarge()">
                Vendite
                  </br>
                  </br>
                  </br>
                  <hr size="1" width="150" align="center" noshade color="black"/>
         </br>
                              <span id="arraw">&#8595;</span>
         </br>
         Seleziona
              </button>
    <p id="main5"></p>
    </br>
    </br>
    </br>
     <input type="button" id="niu"value="RICAVI###################" onclick="window.location.href='http://192.168.96.17/VIews/Finance/RicaviContoLavoro.aspx'" />
</form>
    </br>
    </br>
    </br>

      <button class="main6" onclick="enlarge()">
                Analitica/Finanza
                  </br>
                  </br>
                  </br>
                  <hr size="1" width="150" align="center" noshade color="black"/>
          </br>
                                        <span id="arraw">&#8595;</span>
</br>
          Seleziona
              </button>
    <p id="main5"></p>
    </br>
    </br>
    </br>

    <input type="button" id="sigma" value="SITUAZ.FINANZIARIA#######" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>

    </form>
    </br>
    
    <p id="clock"></p>
    </br>
    </br>

    <p id="clock"></p>
     
    <script>

      

     
        function startJavaS() {
            document.getElementById("tables").style.backgroundColor = "#8FBC8F";
            document.getElementById("tables").style.borderColor = "transparent";
            document.getElementById("tables").style.width = "1250px";
            document.getElementById("tables").style.height = "40px";
            document.getElementById("tables").style.borderStyle = "groove";
            document.getElementById("olymp").style.color = "white";
            document.getElementById("olymp").style.marginLeft = "100px";
            document.getElementById("olymp").style.marginTop = "15px";
            document.getElementById("knitt").style.marginTop = "15px";
            document.getElementById("knitt").style.marginLeft = "280px";
            document.getElementById("knitt").style.color = "#483D8B";

        }
        



        var c = document.getElementById("main4");
        var ctx = c.getContext("2d");
        // Create gradient
        var grd = ctx.createLinearGradient(0, 0, 200, 0);
        grd.addColorStop(0, "red");
        grd.addColorStop(1, "white");
        // Fill with gradient
        ctx.fillStyle = grd;
        ctx.fillRect(10, 10, 150, 80);





        var enlarge = function () {
            var main = document.getElementById("main");     /*Check this script later if this is necessary or if that only occupies lines of code;*/
            main.style.width = "400px";
        }



    </script>

    <style>
        
      

    body{
        background-color:azure;
    }

        #knitt {
            border-collapse:collapse;
         margin-left:-30px;
                width:100%;
        }
      
         #tables{
            margin-left:90px;
           margin-top:-7px;
           font-family:vendeta;
           font-size:1.7em;
        }

          #tables2{
            width:150px;
            height:41px;
            background-color:#5F9EA0;
            border-color:transparent;
            color:white;
            margin-top:-41px;
            margin-left:-7px;
            text-decoration:none;
        }

          #tables2:hover{
              height:100px;
              position:absolute;
              box-shadow:3px 3px 3px #5F9EA0;
          }

       span {
 font-size:70px;
   width:30px;
}
   

        #task{
        width:100%;
            height:70px;
            background:linear-gradient(to right,#7FFFD4,#00FFFF,#00BFFF,#00CED1,#00FFFF);
            border-style:groove;
            border-color:transparent;
           margin-left:90px;
           margin-top:-10px;
           font-family:vendeta;
           font-size:1.7em;
           
        }

        #task:hover{
            background:linear-gradient(to left,#7FFFD4,#00FFFF,#00BFFF,#00CED1,#00FFFF);
        }

        #task2{
            width:97px;
            height:63px;
            background-color:#E6E6FA;
            border-color:transparent;
            color:white;
            margin-top:-73px;
            margin-left:-7px;
        }

       #olymp2:hover{
           color:red;
        }
       

        #alfa:hover {
        color:red;
        }

        #alfa{
            position:absolute;
            margin-top:-35px;
        }

        #beta{
            position:absolute;
            margin-top:-15px;
            margin-left:330px;
        }


        #beta:hover{
         color:red;
        }
        
        #gama:hover{
            color:red;
        }

        #gama{
            margin-left:330px;
            margin-top:-30px;
            position:absolute;
        }

        #delta:hover{
         color:red;
        }

        #delta{
            margin-left:330px;
            margin-top:-48px;
            position:absolute;
        }

        #epsilon:hover{
            color:red;
        }

        #epsilon{
            margin-left:670px;
            margin-top:-25px;
            position:absolute;
        }

        #zeta:hover{
        color:red;
        }

        #zeta{
            margin-left:670px;
            position:absolute;
            margin-top:-40px;
        }
        #cota:hover{
            color:red;
        }

        #cota{
            position:absolute;
            margin-left:670px;
            margin-top:-55px;
        }

        #teta:hover{
        color:red;
        }

        #teta{
            position:absolute;
            margin-left:670px;
            margin-top:-73px;
        }
        
         #iota:hover {
         color:red;
        }

         #iota{
             position:absolute;
             margin-left:970px;
             margin-top:-29px;
         }

         #kappa:hover{
         color:red;
         }

         #kappa{
             position:absolute;
             margin-left:970px;
             margin-top:-47px;
         }

         #lambda:hover{
         color:red;
         }

         #lambda{
             position:absolute;
             margin-left:970px;
             margin-top:-59px;
         }

         #miu:hover{
         color:red;
         }

         #miu{
             position:absolute;
             margin-left:970px;
             margin-top:-75px;
         }

         #niu:hover{
         color:red;
         }

         #niu{
             position:absolute;
             margin-left:1270px;
             margin-top:-30px;
         }

         #sigma:hover{
         color:red;
         }

         #sigma{
             position:absolute;
             margin-left:1570px;
             margin-top:-30px;
         }
        
  .main {
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,gold,darkorange,yellow,orange);
  box-shadow:1px 1px yellow;
  color: black;
  padding: 3px 0px ; 
  font-size: 16px;
  cursor: pointer;
  text-align: center;
margin-top:70px;
position:relative;
}

   .main:hover{
      background-color:#DAA520;
      filter:drop-shadow(7px 7px 7px #DAA520);
      }

  .main2 {
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,#B22222,#CD5C5C,#F08080,#FF6347);
  box-shadow:1px 1px yellow;
  color: black;
  padding: 3px  0px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  margin-left:320px;
  margin-top:-320px;
  position:relative;
}

    .main2:hover{
    background-color:#8B0000;
    filter:drop-shadow(7px 7px 7px #8B0000);
    }

   .main3{
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,#BA55D3,#996666,#663399,#DDA0DD)	;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 11px  0px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
   margin-left:650px;
   margin-top:-410px;
}

    .main3:hover{
    box-shadow:3px 3px 3px #BA55D3;
    }

    .main4{
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,#90EE90, #2E8B57,#228B22)	;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 3px 0px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  margin-left:950px;
  margin-top:-475px;
}
   .main4:hover{
    background-color:#006400;
   }

  .main5{
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,#00CED1,#00BFFF,#6495ED,#20B2AA,#00FFFF);
  box-shadow:1px 1px yellow;
  color: black;
  padding: 3px 0px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  margin-left:1250px;
  margin-top:-485px;
}

   .main5:hover{
   background-color:#7B68EE;
   }

    .main6{
  display: block;
  width: 17%;
  border-radius:15%;
  border: none;
  background:linear-gradient(to right,#FF4500,#FF7F50,#FF8C00,#FF7F50);
  box-shadow:1px 1px yellow;
  color: black;
  padding: 2px 0px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
  margin-left:1550px;
  margin-top:-320px;
}
 .main6:hover{
  background-color:#FF4500;
  }
    </style>

</body>
</html>
