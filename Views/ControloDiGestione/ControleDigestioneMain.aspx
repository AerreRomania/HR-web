<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControleDigestioneMain.aspx.cs" Inherits="Views_ControloDiGestione_ControleDigestioneMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button class="main" onclick="enlarge()">
                Servizio
                </br>
                Contabilità
                </br>
                </br>
                </br>
               <hr size="1" width="150" align="center" noshade color="black"/>
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
                     </br>
                     <hr size="1" width="150" align="center" noshade color="black"/>
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

            <input type="button" id="gama"value="CONTO ECONOMICO MENSILE" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
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
                  </br>
                  <hr size="1" width="150" align="center" noshade color="black"/>    <%--add"Seleziona"--%>
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
              </button>
    <p id="main5"></p>
    </br>
    </br>
    </br>
     <input type="button" id="niu"value="RICAVI###################" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
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
              </button>
    <p id="main5"></p>
    </br>
    </br>
    </br>

    <input type="button" id="sigma" value="SITUAZ.FINANZIARIA#######" onclick="window.location.href='https://ro.wikipedia.org/wiki/Arad'" />
</form>

        </div>
    </form>




    <script>

        var enlarge = function () {
            var main = document.getElementById("main");     /*Check this script later if this is necessary or if it only occupies lines of code;*/
            main.style.width = "400px";
        }
        


    </script>

    <style>

        #alfa:hover {
            color:red;
        }

        #beta:hover{
            color:red;
        }

        #gama:hover{
            color:red;
        }

        #delta:hover{
            color:red;
        }

        #epsilon:hover{
            color:red;
        }

        #zeta:hover{
            color:red;
        }

        #cota:hover{
            color:red;
        }

        #teta:hover{
            color:red;
        }
        
         #iota:hover {
            color:red;
        }

         #kappa:hover{
             color:red;
         }

         #lambda:hover{
             color:red;
         }

         #miu:hover{
             color:red;
         }

         #niu:hover{
             color:red;
         }

         #sigma:hover{
             color:red;
         }
        
        .main {
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: gold;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 58px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

        .main:hover{
            background-color:goldenrod;
        }

                .main2 {
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: indianred;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 58px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

                 .main3{
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: #996666	;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 68px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

                           .main4{
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: #2E8B57	;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 68px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

                                                  .main5{
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: #6495ED;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 68px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

                                                                                            .main6{
  display: block;
  width: 17%;
  border-radius:7%;
  border: none;
  background-color: #FF7F50;
  box-shadow:1px 1px yellow;
  color: black;
  padding: 68px 28px ;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}
    </style>

</body>
</html>
