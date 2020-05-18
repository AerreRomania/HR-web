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
    public class PaginiObiect
    {
        public List<PaginaObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public PaginiObiect()
        {
            Tabela = new List<PaginaObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class PaginaObiect
    {
        public string Id;
        public string Pagina;
        public string Eroare;
        public PaginaObiect()
        {
            Id = "";
            Pagina = "";
            Eroare = "";
        }
    }
    public class FiltruPaginiObiect
    {
        public string Find;
        public string FiltruPagina;
        public FiltruPaginiObiect()
        {
            Find = "";
            FiltruPagina = "";
        }
    }
    
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class PaginiWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public PaginiObiect PaginiLista(FiltruPaginiObiect oFiltruPagini, int PaginaCurenta)
        {
            PaginiObiect oPagini = new PaginiObiect();
            if (GlobalClass.VerificareAcces("Pagini", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPagini in dcWbmOlimpias.Paginis
                            where tPagini.Pagina.Contains(oFiltruPagini.FiltruPagina)
                            orderby tPagini.Pagina, tPagini.Id
                            select new { tPagini.Id, tPagini.Pagina };
                
                oPagini.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruPagini.Find == "")
                {
                    oPagini.PaginaCurenta = PaginaCurenta;
                    oPagini.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruPagini.Find)));

                    oPagini.PaginaCurenta = Pozitie / 5 + 1;
                    oPagini.IndexRand = Pozitie - (oPagini.PaginaCurenta - 1) * 5;
                }
                if (oPagini.NumarPagini < oPagini.PaginaCurenta)
                    oPagini.PaginaCurenta = oPagini.NumarPagini;
                if (oPagini.PaginaCurenta < 1)
                    oPagini.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oPagini.PaginaCurenta - 1)).Take(5))
                {
                    PaginaObiect oPagina = new PaginaObiect();
                    oPagina.Id = rezultat.Id.ToString();
                    oPagina.Pagina = rezultat.Pagina;
                    oPagini.Tabela.Add(oPagina);
                }
            }
            else
                oPagini.Eroare = "Acces interzis!";
            return oPagini;
        }
        [WebMethod(EnableSession=true)]
        public PaginaObiect PaginaProprietati(string Id)
        {
            PaginaObiect oPagina = new PaginaObiect();
            if (GlobalClass.VerificareAcces("Pagini", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPagini in dcWbmOlimpias.Paginis
                            where tPagini.Id.Equals(Id)
                            select new { tPagini.Id, tPagini.Pagina };

                
                oPagina.Pagina = query.First().Pagina;
            }
            else
                oPagina.Eroare = "Acces interzis!";
            return oPagina;
        }
        [WebMethod(EnableSession=true)]
        public PaginaObiect PaginaAdaugare(PaginaObiect oPagina)
        {
            if (GlobalClass.VerificareAccesOperatie("Pagini", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oPagina.Eroare = VerificareDate(oPagina);
                if (oPagina.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PaginaAdaugare(oPagina.Pagina, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oPagina.Eroare = InterpretareEroare(IdEroare.ToString());
                    oPagina.Id = Id.ToString();
                }
                if (oPagina.Eroare != "")
                {
                    oPagina.Id = "";
                }
            }
            else
                oPagina.Eroare = "Nu aveti drept de adaugare!";
            return oPagina;
        }
        [WebMethod(EnableSession=true)]
        public PaginaObiect PaginaModificare(PaginaObiect oPagina)
        {
            if (GlobalClass.VerificareAccesOperatie("Pagini", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oPagina.Eroare = VerificareDate(oPagina);
                if (oPagina.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PaginaModificare(oPagina.Pagina, Convert.ToInt32(oPagina.Id), ref IdEroare);
                    oPagina.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oPagina.Eroare != "")
                {
                    oPagina.Id = "";
                }
            }
            else
                oPagina.Eroare = "Nu aveti drept de modificare!";
            return oPagina;
        }
        [WebMethod(EnableSession=true)]
        public string PaginaStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Pagini", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.PaginaStergere(Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(PaginaObiect bdco)
        {
            string Eroare = "";
            if (bdco.Pagina == "")
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
                    Eroare = "Pagina existent!";
                    break;
                case "2":
                    Eroare = "Completati campul Pagina!";
                    break;
                case "4":
                    Eroare = "Pagina nu se poate sterge, sunt date salvate cu aceasta Pagina!";
                    break;
            }
            return Eroare;
        }

    }
}