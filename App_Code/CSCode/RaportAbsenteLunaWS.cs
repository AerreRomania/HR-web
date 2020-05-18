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
    public class RaportAbsenteLunaObiect
    {
        public List<RaportAbsentaLunaObiect> Tabela;
        public string An;
        public string Eroare;
        public RaportAbsenteLunaObiect()
        {
            An = "";
            Tabela = new List<RaportAbsentaLunaObiect>();
            Eroare = "";
        }
    }
    public class RaportAbsentaLunaObiect
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
        public RaportAbsentaLunaObiect()
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
    public class RaportAbsenteLunaWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportAbsenteLunaObiect RaportAbsenteLunaLista(string FiltruAn, string FiltruLuna)
        {
            RaportAbsenteLunaObiect oRaportAbsenteLuna = new RaportAbsenteLunaObiect();
            oRaportAbsenteLuna.An = "ANNO " + FiltruAn;
            if (GlobalClass.VerificareAcces("Raport numar angajati", "1"))
            {
                oRaportAbsenteLuna.Tabela.AddRange(PreparaAbsenteProcent(FiltruAn, FiltruLuna));

            }
            else
                oRaportAbsenteLuna.Eroare = "Acces interzis!";
            return oRaportAbsenteLuna;
        }

        private List<RaportAbsentaLunaObiect> PreparaAbsenteProcent(string FiltruAn, string FiltruLuna)
        {
            int iFiltruAn = Convert.ToInt32(FiltruAn);
            int iFiltruLuna = Convert.ToInt32(FiltruLuna);
            List<RaportAbsentaLunaObiect> Tabela = new List<RaportAbsentaLunaObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tAbsenteLuna in dcWbmOlimpias.AbsenteLunaViews
                        orderby tAbsenteLuna.Luna
                        where tAbsenteLuna.An.Equals(FiltruAn) && tAbsenteLuna.Luna.Equals(FiltruLuna)
                        select tAbsenteLuna;
            RaportAbsentaLunaObiect oRaportAbsentaLuna = new RaportAbsentaLunaObiect();

            for (int i = 1; i <= DateTime.DaysInMonth(iFiltruAn, iFiltruLuna); i++)
            {
                oRaportAbsentaLuna = new RaportAbsentaLunaObiect();
                oRaportAbsentaLuna.A = i.ToString();
                var queryZi = query.Where(x => x.Zi.Equals(i));
                if (queryZi.Count() > 0)
                {
                    var rezultat = queryZi.First();
                    oRaportAbsentaLuna.B = rezultat.B.ToString();
                    oRaportAbsentaLuna.C = rezultat.C.ToString();
                    oRaportAbsentaLuna.D = rezultat.D.ToString();
                    oRaportAbsentaLuna.E = rezultat.E.ToString();
                    oRaportAbsentaLuna.F = rezultat.F.ToString();
                    oRaportAbsentaLuna.G = rezultat.G.ToString();
                    oRaportAbsentaLuna.H = rezultat.H.ToString();
                    oRaportAbsentaLuna.I = rezultat.I.ToString();
                    oRaportAbsentaLuna.J = rezultat.J.ToString();
                    oRaportAbsentaLuna.K = rezultat.K.ToString();
                }
                Tabela.Add(oRaportAbsentaLuna);

            }
            return Tabela;
        }

        [WebMethod(EnableSession = false)]
        public RaportAbsenteLunaObiect RaportAbsenteLunaExcel(string FiltruAn, string FiltruLuna)
        {
            return RaportAbsenteLunaLista(FiltruAn, FiltruLuna);
        }

    }
}