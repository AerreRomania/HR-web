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
    public class TipuriOreObiect
    {
        public List<TipOraObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public TipuriOreObiect()
        {
            Tabela = new List<TipOraObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class TipOraObiect
    {
        public string Id;
        public string CodTipOra;
        public string TipOra;
        public string Eroare;
        public TipOraObiect()
        {
            Id = "";
            CodTipOra = "";
            TipOra = "";
            Eroare = "";
        }
    }
    public class FiltruTipuriOreObiect
    {
        public string Find;
        public string FiltruTipOra;
        public FiltruTipuriOreObiect()
        {
            Find = "";
            FiltruTipOra = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class TipuriOreWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public TipuriOreObiect TipuriOreLista(FiltruTipuriOreObiect oFiltruTipOra, int PaginaCurenta)
        {
            TipuriOreObiect oTipuriOre = new TipuriOreObiect();
            if (GlobalClass.VerificareAcces("Tipuri ore", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tTipuriOre in dcWbmOlimpias.TipuriOres
                            where tTipuriOre.TipOra.Contains(oFiltruTipOra.FiltruTipOra) && !tTipuriOre.DataAdaugare.Equals(null)
                            orderby tTipuriOre.TipOra, tTipuriOre.Id
                            select new { tTipuriOre.Id, tTipuriOre.CodTipOra, tTipuriOre.TipOra };

                
                oTipuriOre.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruTipOra.Find == "")
                {
                    oTipuriOre.PaginaCurenta = PaginaCurenta;
                    oTipuriOre.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruTipOra.Find)));

                    oTipuriOre.PaginaCurenta = Pozitie / 5 + 1;
                    oTipuriOre.IndexRand = Pozitie - (oTipuriOre.PaginaCurenta - 1) * 5;
                }
                if (oTipuriOre.NumarPagini < oTipuriOre.PaginaCurenta)
                    oTipuriOre.PaginaCurenta = oTipuriOre.NumarPagini;
                if (oTipuriOre.PaginaCurenta < 1)
                    oTipuriOre.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oTipuriOre.PaginaCurenta - 1)).Take(5))
                {
                    TipOraObiect oTipOra = new TipOraObiect();
                    oTipOra.Id = rezultat.Id.ToString();
                    oTipOra.CodTipOra = rezultat.CodTipOra;
                    oTipOra.TipOra = rezultat.TipOra;
                    oTipuriOre.Tabela.Add(oTipOra);
                }
            }
            else
                oTipuriOre.Eroare = "Acces interzis!";
            return oTipuriOre;
        }
        [WebMethod(EnableSession = false)]
        public TipOraObiect TipOraProprietati(string Id)
        {
            TipOraObiect oTipOra = new TipOraObiect();
            if (GlobalClass.VerificareAcces("Tipuri ore", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tTipuriOre in dcWbmOlimpias.TipuriOres
                            where tTipuriOre.Id.Equals(Id)
                            select new { tTipuriOre.Id, tTipuriOre.TipOra, tTipuriOre.CodTipOra };
                oTipOra.TipOra = query.First().TipOra;
                oTipOra.CodTipOra = query.First().CodTipOra;
            }
            else
                oTipOra.Eroare = "Acces interzis!";
            return oTipOra;
        }
        [WebMethod(EnableSession = false)]
        public TipOraObiect TipOraAdaugare(TipOraObiect oTipOra)
        {
            if (GlobalClass.VerificareAccesOperatie("Tipuri ore", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oTipOra.Eroare = VerificareDate(oTipOra);
                if (oTipOra.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.TipOraAdaugare(oTipOra.CodTipOra, oTipOra.TipOra, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oTipOra.Eroare = InterpretareEroare(IdEroare.ToString());
                    oTipOra.Id = Id.ToString();
                }
                if (oTipOra.Eroare != "")
                {
                    oTipOra.Id = "";
                }
            }
            else
                oTipOra.Eroare = "Nu aveti drept de adaugare!";
            return oTipOra;
        }
        [WebMethod(EnableSession = false)]
        public TipOraObiect TipOraModificare(TipOraObiect oTipOra)
        {
            if (GlobalClass.VerificareAccesOperatie("Tipuri ore", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oTipOra.Eroare = VerificareDate(oTipOra);
                if (oTipOra.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.TipOraModificare(oTipOra.CodTipOra, oTipOra.TipOra, Convert.ToInt32("1"), Convert.ToInt32(oTipOra.Id), ref IdEroare);
                    oTipOra.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oTipOra.Eroare != "")
                {
                    oTipOra.Id = "";
                }
            }
            else
                oTipOra.Eroare = "Nu aveti drept de modificare!";
            return oTipOra;
        }
        [WebMethod(EnableSession = false)]
        public string TipOraStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Tipuri ore", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.TipOraStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(TipOraObiect oTipOra)
        {
            string Eroare = "";
            if (oTipOra.TipOra == "")
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
                case "2":
                    Eroare = "Completati campul Tip ora!";
                    break;
                case "101":
                    Eroare = "Tip ora existent!";
                    break;
                case "102":
                    Eroare = "Tip ora existent!";
                    break;
                case "201":
                    Eroare = "Postul de lucru nu se poate sterge, sunt date salvate cu acest Tip ora!";
                    break;
            }
            return Eroare;
        }

    }
}