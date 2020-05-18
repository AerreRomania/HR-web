using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace WbmOlimpias
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class AutentificareWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public string Autentificare(string Utilizator, string Parola)
        {
            string Eroare = VerificareDate(Utilizator,Parola);
            if (Eroare == "")
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var t = dcWbmOlimpias.Utilizatoris.Where(a => a.Utilizator == Utilizator).FirstOrDefault(a => a.Parola == Parola);
                if (t == null)
                    Eroare = "Utilizator sau parola gresita!";
                else
                    Session["IdUtilizator"] = t.Id;
                
            }
            return Eroare;
        }
        private string VerificareDate(string Utilizator, string Parola)
        {
            string Eroare = "";
            if (Utilizator == "")
                Eroare = InterpretareEroare("2");
            if (Parola == "")
                Eroare = InterpretareEroare("3");
            return Eroare;
        }
        private string InterpretareEroare(string IdEroare)
        {
            string Eroare = "";
            switch (IdEroare)
            {
                case "0":
                    Eroare = "";
                    break;
                case "1":
                    Eroare = "Utilizator sau Parola gresita!";
                    break;
                case "2":
                    Eroare = "Completati campul Utilizator!";
                    break;
                case "3":
                    Eroare = "Completati campul Parola!";
                    break;
            }
            return Eroare;
        }

    }
}