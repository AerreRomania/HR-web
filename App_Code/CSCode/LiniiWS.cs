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
    public class LiniiObiect
    {
        public List<LinieObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public LiniiObiect()
        {
            Tabela = new List<LinieObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class LinieObiect
    {
        public string Id;
        public string CodLinie;
        public string Linie;
        public string Eroare;
        public LinieObiect()
        {
            Id = "";
            CodLinie = "";
            Linie = "";
            Eroare = "";
        }
    }
    public class FiltruLiniiObiect
    {
        public string Find;
        public string FiltruLinie;
        public FiltruLiniiObiect()
        {
            Find = "";
            FiltruLinie = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class LiniiWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public LiniiObiect LiniiLista(FiltruLiniiObiect oFiltruLinie, int PaginaCurenta)
        {
            LiniiObiect oLinii = new LiniiObiect();
            if (GlobalClass.VerificareAcces("Linii", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLinii in dcWbmOlimpias.Liniis
                            where tLinii.Linie.Contains(oFiltruLinie.FiltruLinie) && !tLinii.DataAdaugare.Equals(null)
                            orderby tLinii.Linie, tLinii.Id
                            select new { tLinii.Id, tLinii.CodLinie, tLinii.Linie };

                
                oLinii.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruLinie.Find == "")
                {
                    oLinii.PaginaCurenta = PaginaCurenta;
                    oLinii.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruLinie.Find)));

                    oLinii.PaginaCurenta = Pozitie / 5 + 1;
                    oLinii.IndexRand = Pozitie - (oLinii.PaginaCurenta - 1) * 5;
                }
                if (oLinii.NumarPagini < oLinii.PaginaCurenta)
                    oLinii.PaginaCurenta = oLinii.NumarPagini;
                if (oLinii.PaginaCurenta < 1)
                    oLinii.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oLinii.PaginaCurenta - 1)).Take(5))
                {
                    LinieObiect oLinie = new LinieObiect();
                    oLinie.Id = rezultat.Id.ToString();
                    oLinie.CodLinie = rezultat.CodLinie;
                    oLinie.Linie = rezultat.Linie;
                    oLinii.Tabela.Add(oLinie);
                }
            }
            else
                oLinii.Eroare = "Acces interzis!";
            return oLinii;
        }
        [WebMethod(EnableSession = false)]
        public LinieObiect LinieProprietati(string Id)
        {
            LinieObiect oLinie = new LinieObiect();
            if (GlobalClass.VerificareAcces("Linii", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLinii in dcWbmOlimpias.Liniis
                            where tLinii.Id.Equals(Id)
                            select new { tLinii.Id, tLinii.Linie, tLinii.CodLinie };
                oLinie.Linie = query.First().Linie;
                oLinie.CodLinie = query.First().CodLinie;
            }
            else
                oLinie.Eroare = "Acces interzis!";
            return oLinie;
        }
        [WebMethod(EnableSession = false)]
        public LinieObiect LinieAdaugare(LinieObiect oLinie)
        {
            if (GlobalClass.VerificareAccesOperatie("Linii", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oLinie.Eroare = VerificareDate(oLinie);
                if (oLinie.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.LinieAdaugare(oLinie.CodLinie, oLinie.Linie, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oLinie.Eroare = InterpretareEroare(IdEroare.ToString());
                    oLinie.Id = Id.ToString();
                }
                if (oLinie.Eroare != "")
                {
                    oLinie.Id = "";
                }
            }
            else
                oLinie.Eroare = "Nu aveti drept de adaugare!";
            return oLinie;
        }
        [WebMethod(EnableSession = false)]
        public LinieObiect LinieModificare(LinieObiect oLinie)
        {
            if (GlobalClass.VerificareAccesOperatie("Linii", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oLinie.Eroare = VerificareDate(oLinie);
                if (oLinie.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.LinieModificare(oLinie.CodLinie, oLinie.Linie, Convert.ToInt32("1"), Convert.ToInt32(oLinie.Id), ref IdEroare);
                    oLinie.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oLinie.Eroare != "")
                {
                    oLinie.Id = "";
                }
            }
            else
                oLinie.Eroare = "Nu aveti drept de modificare!";
            return oLinie;
        }
        [WebMethod(EnableSession = false)]
        public string LinieStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Linii", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.LinieStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(LinieObiect oLinie)
        {
            string Eroare = "";
            if (oLinie.Linie == "")
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
                    Eroare = "Linie existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Linie!";
                    break;
                case "4":
                    Eroare = "Linie nu se poate sterge, sunt date salvate cu aceasta Linie!";
                    break;
            }
            return Eroare;
        }

    }
}