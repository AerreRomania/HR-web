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
    public class IncadrariObiect
    {
        public List<IncadrareObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public IncadrariObiect()
        {
            Tabela = new List<IncadrareObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class IncadrareObiect
    {
        public string Id;
        public string CodIncadrare;
        public string Incadrare;
        public string Eroare;
        public IncadrareObiect()
        {
            Id = "";
            CodIncadrare = "";
            Incadrare = "";
            Eroare = "";
        }
    }
    public class FiltruIncadrariObiect
    {
        public string Find;
        public string FiltruIncadrare;
        public FiltruIncadrariObiect()
        {
            Find = "";
            FiltruIncadrare = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class IncadrariWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public IncadrariObiect IncadrariLista(FiltruIncadrariObiect oFiltruIncadrare, int PaginaCurenta)
        {
            IncadrariObiect oIncadrari = new IncadrariObiect();
            if (GlobalClass.VerificareAcces("Incadrari", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIncadrari in dcWbmOlimpias.Incadraris
                            where tIncadrari.Incadrare.Contains(oFiltruIncadrare.FiltruIncadrare) && !tIncadrari.DataAdaugare.Equals(null)
                            orderby tIncadrari.Incadrare, tIncadrari.Id
                            select new { tIncadrari.Id, tIncadrari.CodIncadrare, tIncadrari.Incadrare };

                
                oIncadrari.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruIncadrare.Find == "")
                {
                    oIncadrari.PaginaCurenta = PaginaCurenta;
                    oIncadrari.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruIncadrare.Find)));

                    oIncadrari.PaginaCurenta = Pozitie / 5 + 1;
                    oIncadrari.IndexRand = Pozitie - (oIncadrari.PaginaCurenta - 1) * 5;
                }
                if (oIncadrari.NumarPagini < oIncadrari.PaginaCurenta)
                    oIncadrari.PaginaCurenta = oIncadrari.NumarPagini;
                if (oIncadrari.PaginaCurenta < 1)
                    oIncadrari.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oIncadrari.PaginaCurenta - 1)).Take(5))
                {
                    IncadrareObiect oIncadrare = new IncadrareObiect();
                    oIncadrare.Id = rezultat.Id.ToString();
                    oIncadrare.CodIncadrare = rezultat.CodIncadrare;
                    oIncadrare.Incadrare = rezultat.Incadrare;
                    oIncadrari.Tabela.Add(oIncadrare);
                }
            }
            else
                oIncadrari.Eroare = "Acces interzis!";
            return oIncadrari;
        }
        [WebMethod(EnableSession = false)]
        public IncadrareObiect IncadrareProprietati(string Id)
        {
            IncadrareObiect oIncadrare = new IncadrareObiect();
            if (GlobalClass.VerificareAcces("Incadrari", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIncadrari in dcWbmOlimpias.Incadraris
                            where tIncadrari.Id.Equals(Id)
                            select new { tIncadrari.Id, tIncadrari.Incadrare, tIncadrari.CodIncadrare };
                oIncadrare.Incadrare = query.First().Incadrare;
                oIncadrare.CodIncadrare = query.First().CodIncadrare;
            }
            else
                oIncadrare.Eroare = "Acces interzis!";
            return oIncadrare;
        }
        [WebMethod(EnableSession = false)]
        public IncadrareObiect IncadrareAdaugare(IncadrareObiect oIncadrare)
        {
            if (GlobalClass.VerificareAccesOperatie("Incadrari", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oIncadrare.Eroare = VerificareDate(oIncadrare);
                if (oIncadrare.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.IncadrareAdaugare(oIncadrare.CodIncadrare, oIncadrare.Incadrare, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oIncadrare.Eroare = InterpretareEroare(IdEroare.ToString());
                    oIncadrare.Id = Id.ToString();
                }
                if (oIncadrare.Eroare != "")
                {
                    oIncadrare.Id = "";
                }
            }
            else
                oIncadrare.Eroare = "Nu aveti drept de adaugare!";
            return oIncadrare;
        }
        [WebMethod(EnableSession = false)]
        public IncadrareObiect IncadrareModificare(IncadrareObiect oIncadrare)
        {
            if (GlobalClass.VerificareAccesOperatie("Incadrari", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oIncadrare.Eroare = VerificareDate(oIncadrare);
                if (oIncadrare.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.IncadrareModificare(oIncadrare.CodIncadrare, oIncadrare.Incadrare, Convert.ToInt32("1"), Convert.ToInt32(oIncadrare.Id), ref IdEroare);
                    oIncadrare.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oIncadrare.Eroare != "")
                {
                    oIncadrare.Id = "";
                }
            }
            else
                oIncadrare.Eroare = "Nu aveti drept de modificare!";
            return oIncadrare;
        }
        [WebMethod(EnableSession = false)]
        public string IncadrareStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Incadrari", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.IncadrareStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(IncadrareObiect oIncadrare)
        {
            string Eroare = "";
            if (oIncadrare.Incadrare == "")
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
                    Eroare = "Incadrare existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Incadrare!";
                    break;
                case "4":
                    Eroare = "Incadrare nu se poate sterge, sunt date salvate cu aceasta Incadrare!";
                    break;
            }
            return Eroare;
        }

    }
}