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
    public class RaportAbsenteAnObiect
    {
        public List<RaportAbsentaAnObiect> Tabela;
        public string An;
        public string Eroare;
        public RaportAbsenteAnObiect()
        {
            An = "";
            Tabela = new List<RaportAbsentaAnObiect>();
            Eroare = "";
        }
    }
    public class RaportAbsentaAnObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string A;
        public string B;
        public string C;
        public string D;
        public string E;
        public string F;
        public string G;
        public string H;
        public string I;
        public string J;
        public string K;
        public string Eroare;
        public RaportAbsentaAnObiect()
        {
            Id = "";
            NumeClasa = "rNeselectat";
            A = "";
            B = "";
            C = "";
            D = "";
            E = "";
            F = "";
            G = "";
            H = "";
            I = "";
            J = "";
            K = "";
            Eroare = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportAbsenteAnWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportAbsenteAnObiect RaportAbsenteAnLista(string FiltruAn)
        {
            RaportAbsenteAnObiect oRaportAbsenteAn = new RaportAbsenteAnObiect();
            oRaportAbsenteAn.An = "ANNO " + FiltruAn;
            if (GlobalClass.VerificareAcces("Raport numar angajati", "1"))
            {
                oRaportAbsenteAn.Tabela.AddRange(PreparaAbsenteProcent(FiltruAn));

            }
            else
                oRaportAbsenteAn.Eroare = "Acces interzis!";
            return oRaportAbsenteAn;
        }

        private List<RaportAbsentaAnObiect> PreparaAbsenteProcent(string FiltruAn)
        {
            List<RaportAbsentaAnObiect> Tabela = new List<RaportAbsentaAnObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tAbsenteAn in dcWbmOlimpias.AbsenteAnViews
                        orderby tAbsenteAn.Luna
                        where tAbsenteAn.An.Equals(FiltruAn)
                        select tAbsenteAn;
            RaportAbsentaAnObiect oRaportAbsentaAn = new RaportAbsentaAnObiect();
            foreach (var rezultat in query)
            {
                oRaportAbsentaAn = new RaportAbsentaAnObiect();
                if (rezultat.Luna == 13)
                {
                    oRaportAbsentaAn.A = "Totale anno";
                    oRaportAbsentaAn.NumeClasa = "rSelectat";
                }
                else
                oRaportAbsentaAn.A = GlobalClass.ConversieNumarInLuna(rezultat.Luna.Value);
                oRaportAbsentaAn.B = rezultat.B.ToString();
                oRaportAbsentaAn.C = rezultat.B.ToString();
                oRaportAbsentaAn.D = rezultat.B.ToString();
                oRaportAbsentaAn.E = rezultat.B.ToString();
                oRaportAbsentaAn.F = rezultat.B.ToString();
                oRaportAbsentaAn.G = rezultat.B.ToString();
                oRaportAbsentaAn.H = rezultat.B.ToString();
                oRaportAbsentaAn.I = rezultat.B.ToString();
                oRaportAbsentaAn.J = rezultat.B.ToString();
                oRaportAbsentaAn.K = rezultat.B.ToString();
                Tabela.Add(oRaportAbsentaAn);

            }
            return Tabela;
        }

        [WebMethod(EnableSession = false)]
        public RaportAbsenteAnObiect RaportAbsenteAnExcel(string FiltruAn)
        {
            return RaportAbsenteAnLista(FiltruAn);
        }

    }
}