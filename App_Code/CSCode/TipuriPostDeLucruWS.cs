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
    public class TipuriPostDeLucruObiect
    {
        public List<TipPostDeLucruObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public TipuriPostDeLucruObiect()
        {
            Tabela = new List<TipPostDeLucruObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class TipPostDeLucruObiect
    {
        public string Id;
        public string TipPostDeLucru;
        public string Eroare;
        public TipPostDeLucruObiect()
        {
            Id = "";
            TipPostDeLucru = "";
            Eroare = "";
        }
    }
    public class FiltruTipuriPostDeLucruObiect
    {
        public string Find;
        public string FiltruTipPostDeLucru;
        public FiltruTipuriPostDeLucruObiect()
        {
            Find = "";
            FiltruTipPostDeLucru = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class TipuriPostDeLucruWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public TipuriPostDeLucruObiect TipuriPostDeLucruLista(FiltruTipuriPostDeLucruObiect oFiltruTipPostDeLucru, int PaginaCurenta)
        {
            TipuriPostDeLucruObiect oTipuriPostDeLucru = new TipuriPostDeLucruObiect();
            if (GlobalClass.VerificareAcces("Tipuri post de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tTipuriPostDeLucru in dcWbmOlimpias.TipuriPostDeLucrus
                            where tTipuriPostDeLucru.TipPostDeLucru.Contains(oFiltruTipPostDeLucru.FiltruTipPostDeLucru) && tTipuriPostDeLucru.DataStergere.Equals(null)
                            orderby tTipuriPostDeLucru.TipPostDeLucru, tTipuriPostDeLucru.Id
                            select new { tTipuriPostDeLucru.Id, tTipuriPostDeLucru.TipPostDeLucru };

                
                oTipuriPostDeLucru.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruTipPostDeLucru.Find == "")
                {
                    oTipuriPostDeLucru.PaginaCurenta = PaginaCurenta;
                    oTipuriPostDeLucru.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruTipPostDeLucru.Find)));

                    oTipuriPostDeLucru.PaginaCurenta = Pozitie / 5 + 1;
                    oTipuriPostDeLucru.IndexRand = Pozitie - (oTipuriPostDeLucru.PaginaCurenta - 1) * 5;
                }
                if (oTipuriPostDeLucru.NumarPagini < oTipuriPostDeLucru.PaginaCurenta)
                    oTipuriPostDeLucru.PaginaCurenta = oTipuriPostDeLucru.NumarPagini;
                if (oTipuriPostDeLucru.PaginaCurenta < 1)
                    oTipuriPostDeLucru.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oTipuriPostDeLucru.PaginaCurenta - 1)).Take(5))
                {
                    TipPostDeLucruObiect oTipPostDeLucru = new TipPostDeLucruObiect();
                    oTipPostDeLucru.Id = rezultat.Id.ToString();
                    oTipPostDeLucru.TipPostDeLucru = rezultat.TipPostDeLucru;
                    oTipuriPostDeLucru.Tabela.Add(oTipPostDeLucru);
                }
            }
            else
                oTipuriPostDeLucru.Eroare = "Acces interzis!";
            return oTipuriPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public TipPostDeLucruObiect TipPostDeLucruProprietati(string Id)
        {
            TipPostDeLucruObiect oTipPostDeLucru = new TipPostDeLucruObiect();
            if (GlobalClass.VerificareAcces("Tipuri post de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tTipuriPostDeLucru in dcWbmOlimpias.TipuriPostDeLucrus
                            where tTipuriPostDeLucru.Id.Equals(Id)
                            select new { tTipuriPostDeLucru.Id, tTipuriPostDeLucru.TipPostDeLucru };
                oTipPostDeLucru.TipPostDeLucru = query.First().TipPostDeLucru;
            }
            else
                oTipPostDeLucru.Eroare = "Acces interzis!";
            return oTipPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public TipPostDeLucruObiect TipPostDeLucruAdaugare(TipPostDeLucruObiect oTipPostDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Tipuri post de lucru", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oTipPostDeLucru.Eroare = VerificareDate(oTipPostDeLucru);
                if (oTipPostDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.TipPostDeLucruAdaugare(oTipPostDeLucru.TipPostDeLucru, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oTipPostDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                    oTipPostDeLucru.Id = Id.ToString();
                }
                if (oTipPostDeLucru.Eroare != "")
                {
                    oTipPostDeLucru.Id = "";
                }
            }
            else
                oTipPostDeLucru.Eroare = "Nu aveti drept de adaugare!";
            return oTipPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public TipPostDeLucruObiect TipPostDeLucruModificare(TipPostDeLucruObiect oTipPostDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Tipuri post de lucru", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oTipPostDeLucru.Eroare = VerificareDate(oTipPostDeLucru);
                if (oTipPostDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.TipPostDeLucruModificare(oTipPostDeLucru.TipPostDeLucru, Convert.ToInt32("1"), Convert.ToInt32(oTipPostDeLucru.Id), ref IdEroare);
                    oTipPostDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oTipPostDeLucru.Eroare != "")
                {
                    oTipPostDeLucru.Id = "";
                }
            }
            else
                oTipPostDeLucru.Eroare = "Nu aveti drept de modificare!";
            return oTipPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public string TipPostDeLucruStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Tipuri post de lucru", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.TipPostDeLucruStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(TipPostDeLucruObiect oTipPostDeLucru)
        {
            string Eroare = "";
            if (oTipPostDeLucru.TipPostDeLucru == "")
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
                    Eroare = "TipPostDeLucru existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul TipPostDeLucru!";
                    break;
                case "4":
                    Eroare = "TipPostDeLucru nu se poate sterge, sunt date salvate cu aceasta TipPostDeLucru!";
                    break;
            }
            return Eroare;
        }

    }
}