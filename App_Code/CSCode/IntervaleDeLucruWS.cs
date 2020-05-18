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
    public class IntervaleDeLucruObiect
    {
        public List<IntervalDeLucruObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public IntervaleDeLucruObiect()
        {
            Tabela = new List<IntervalDeLucruObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class IntervalDeLucruObiect
    {
        public string Id;
        public string IntervalDeLucru;
        public string Eroare;
        public IntervalDeLucruObiect()
        {
            Id = "";
            IntervalDeLucru = "";
            Eroare = "";
        }
    }
    public class FiltruIntervaleDeLucruObiect
    {
        public string Find;
        public string FiltruIntervalDeLucru;
        public FiltruIntervaleDeLucruObiect()
        {
            Find = "";
            FiltruIntervalDeLucru = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class IntervaleDeLucruWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public IntervaleDeLucruObiect IntervaleDeLucruLista(FiltruIntervaleDeLucruObiect oFiltruIntervalDeLucru, int PaginaCurenta)
        {
            IntervaleDeLucruObiect oIntervaleDeLucru = new IntervaleDeLucruObiect();
            if (GlobalClass.VerificareAcces("Intervale de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIntervaleDeLucru in dcWbmOlimpias.IntervaleDeLucrus
                            where tIntervaleDeLucru.IntervalDeLucru.Contains(oFiltruIntervalDeLucru.FiltruIntervalDeLucru) && tIntervaleDeLucru.DataStergere.Equals(null)
                            orderby tIntervaleDeLucru.IntervalDeLucru, tIntervaleDeLucru.Id
                            select new { tIntervaleDeLucru.Id, tIntervaleDeLucru.IntervalDeLucru };

                
                oIntervaleDeLucru.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruIntervalDeLucru.Find == "")
                {
                    oIntervaleDeLucru.PaginaCurenta = PaginaCurenta;
                    oIntervaleDeLucru.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruIntervalDeLucru.Find)));

                    oIntervaleDeLucru.PaginaCurenta = Pozitie / 5 + 1;
                    oIntervaleDeLucru.IndexRand = Pozitie - (oIntervaleDeLucru.PaginaCurenta - 1) * 5;
                }
                if (oIntervaleDeLucru.NumarPagini < oIntervaleDeLucru.PaginaCurenta)
                    oIntervaleDeLucru.PaginaCurenta = oIntervaleDeLucru.NumarPagini;
                if (oIntervaleDeLucru.PaginaCurenta < 1)
                    oIntervaleDeLucru.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oIntervaleDeLucru.PaginaCurenta - 1)).Take(5))
                {
                    IntervalDeLucruObiect oIntervalDeLucru = new IntervalDeLucruObiect();
                    oIntervalDeLucru.Id = rezultat.Id.ToString();
                    oIntervalDeLucru.IntervalDeLucru = rezultat.IntervalDeLucru;
                    oIntervaleDeLucru.Tabela.Add(oIntervalDeLucru);
                }
            }
            else
                oIntervaleDeLucru.Eroare = "Acces interzis!";
            return oIntervaleDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public IntervalDeLucruObiect IntervalDeLucruProprietati(string Id)
        {
            IntervalDeLucruObiect oIntervalDeLucru = new IntervalDeLucruObiect();
            if (GlobalClass.VerificareAcces("Intervale de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIntervaleDeLucru in dcWbmOlimpias.IntervaleDeLucrus
                            where tIntervaleDeLucru.Id.Equals(Id)
                            select new { tIntervaleDeLucru.Id, tIntervaleDeLucru.IntervalDeLucru };
                oIntervalDeLucru.IntervalDeLucru = query.First().IntervalDeLucru;
            }
            else
                oIntervalDeLucru.Eroare = "Acces interzis!";
            return oIntervalDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public IntervalDeLucruObiect IntervalDeLucruAdaugare(IntervalDeLucruObiect oIntervalDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Intervale de lucru", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oIntervalDeLucru.Eroare = VerificareDate(oIntervalDeLucru);
                if (oIntervalDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.IntervalDeLucruAdaugare(oIntervalDeLucru.IntervalDeLucru, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oIntervalDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                    oIntervalDeLucru.Id = Id.ToString();
                }
                if (oIntervalDeLucru.Eroare != "")
                {
                    oIntervalDeLucru.Id = "";
                }
            }
            else
                oIntervalDeLucru.Eroare = "Nu aveti drept de adaugare!";
            return oIntervalDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public IntervalDeLucruObiect IntervalDeLucruModificare(IntervalDeLucruObiect oIntervalDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Intervale de lucru", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oIntervalDeLucru.Eroare = VerificareDate(oIntervalDeLucru);
                if (oIntervalDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.IntervalDeLucruModificare(oIntervalDeLucru.IntervalDeLucru, Convert.ToInt32("1"), Convert.ToInt32(oIntervalDeLucru.Id), ref IdEroare);
                    oIntervalDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oIntervalDeLucru.Eroare != "")
                {
                    oIntervalDeLucru.Id = "";
                }
            }
            else
                oIntervalDeLucru.Eroare = "Nu aveti drept de modificare!";
            return oIntervalDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public string IntervalDeLucruStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Intervale de lucru", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.IntervalDeLucruStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(IntervalDeLucruObiect oIntervalDeLucru)
        {
            string Eroare = "";
            if (oIntervalDeLucru.IntervalDeLucru == "")
                Eroare = InterpretareEroare("2");
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
                    Eroare = "IntervalDeLucru existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul IntervalDeLucru!";
                    break;
                case "4":
                    Eroare = "IntervalDeLucru nu se poate sterge, sunt date salvate cu aceasta IntervalDeLucru!";
                    break;
            }
            return Eroare;
        }

    }
}