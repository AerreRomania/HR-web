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
    public class PaginiRolObiect
    {
        public List<PaginaRolObiect> Tabela;
        public string Eroare;
        public PaginiRolObiect()
        {
            Tabela = new List<PaginaRolObiect>();
            Eroare = "";
        }
    }
    public class PaginaRolObiect
    {
        public string Id;
        public string IdRol;
        public PaginaObiect oPagina;
        public bool DreptAdaugare;
        public bool DreptModificare;
        public bool DreptStergere;
        public bool DreptAprobare;
        public string Eroare;
        public PaginaRolObiect()
        {
            Id = "";
            IdRol = "";
            oPagina = new PaginaObiect();
            DreptAdaugare = false;
            DreptModificare = false;
            DreptStergere = false;
            DreptAprobare = false;
            Eroare = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [GenerateScriptType(typeof(PaginaObiect))]
    [ScriptService]
    public class PaginiRolWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public PaginiRolObiect Lista(string IdRol)
        {
            PaginiRolObiect oPaginiRol = new PaginiRolObiect();
            if (GlobalClass.VerificareAcces("Roluri", "1"))
            {
                if (IdRol != "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    var query = from tPaginiRol in dcWbmOlimpias.PaginiRols
                                join tPagini in dcWbmOlimpias.Paginis on tPaginiRol.IdPagina equals tPagini.Id
                                where tPaginiRol.IdRol.Equals(IdRol)
                                orderby tPagini.Pagina
                                select new { tPaginiRol.Id, tPagini.Pagina, tPaginiRol.Adaugare, tPaginiRol.Modificare, tPaginiRol.Stergere, tPaginiRol };

                    foreach (var rezultat in query)
                    {
                        PaginaRolObiect oPaginaRol = new PaginaRolObiect();
                        oPaginaRol.Id = rezultat.Id.ToString();
                        oPaginaRol.oPagina.Pagina = rezultat.Pagina;
                        oPaginaRol.DreptAdaugare = rezultat.Adaugare;
                        oPaginaRol.DreptModificare = rezultat.Modificare;
                        oPaginaRol.DreptStergere = rezultat.Stergere;
                        oPaginiRol.Tabela.Add(oPaginaRol);
                    }
                }
            }
            else
                oPaginiRol.Eroare = "Acces interzis!";
            return oPaginiRol;
        }
        [WebMethod(EnableSession=true)]
        public PaginaRolObiect Proprietati(string Id)
        {
            PaginaRolObiect oPaginaRol = new PaginaRolObiect();
            if (GlobalClass.VerificareAcces("Roluri", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPaginiRol in dcWbmOlimpias.PaginiRols
                            join tPagini in dcWbmOlimpias.Paginis on tPaginiRol.IdPagina equals tPagini.Id
                            where tPaginiRol.Id.Equals(Id)
                            orderby tPagini.Pagina
                            select new { tPaginiRol.IdPagina, tPagini.Pagina, tPaginiRol.Adaugare, tPaginiRol.Modificare, tPaginiRol.Stergere, tPaginiRol.Aprobare };
                oPaginaRol.oPagina.Id = query.First().IdPagina.ToString();
                oPaginaRol.oPagina.Pagina = query.First().Pagina;
                oPaginaRol.DreptAdaugare = query.First().Adaugare;
                oPaginaRol.DreptModificare = query.First().Modificare;
                oPaginaRol.DreptStergere = query.First().Stergere;
                oPaginaRol.DreptAprobare = query.First().Aprobare;
            }
            else
                oPaginaRol.Eroare = "Acces interzis!";
            return oPaginaRol;
        }
        [WebMethod(EnableSession=true)]
        public PaginaRolObiect Adaugare(PaginaRolObiect oPaginaRol)
        {
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oPaginaRol.Eroare = VerificareDate(oPaginaRol);
                if (oPaginaRol.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PaginaRolAdaugare(Convert.ToInt32(oPaginaRol.IdRol), Convert.ToInt32(oPaginaRol.oPagina.Id), oPaginaRol.DreptAdaugare, oPaginaRol.DreptModificare, oPaginaRol.DreptStergere, oPaginaRol.DreptAprobare, Convert.ToInt32(Session["IdFirma"]), Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oPaginaRol.Eroare = InterpretareEroare(IdEroare.ToString());
                    oPaginaRol.Id = Id.ToString();
                }
                if (oPaginaRol.Eroare != "")
                {
                    oPaginaRol.Id = "";
                }
            }
            else
                oPaginaRol.Eroare = "Nu aveti drept de adaugare!";
            return oPaginaRol;
        }
        [WebMethod(EnableSession=true)]
        public PaginaRolObiect Modificare(PaginaRolObiect oPaginaRol)
        {
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oPaginaRol.Eroare = VerificareDate(oPaginaRol);
                if (oPaginaRol.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PaginaRolModificare(Convert.ToInt32(oPaginaRol.IdRol), Convert.ToInt32(oPaginaRol.oPagina.Id), oPaginaRol.DreptAdaugare, oPaginaRol.DreptModificare, oPaginaRol.DreptStergere, oPaginaRol.DreptAprobare, Convert.ToInt32(oPaginaRol.Id), ref IdEroare);
                    oPaginaRol.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oPaginaRol.Eroare != "")
                {
                    oPaginaRol.Id = "";
                }
            }
            else
                oPaginaRol.Eroare = "Nu aveti drept de modificare!";
            return oPaginaRol;
        }
        [WebMethod(EnableSession=true)]
        public string Stergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;


                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.PaginaRolStergere(Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        [WebMethod(EnableSession=true)]
        public PaginaObiect PaginaCautare(string Pagina)
        {
            PaginaObiect oPagina = new PaginaObiect();
            if (GlobalClass.VerificareAcces("Pagini", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPagini in dcWbmOlimpias.Paginis
                            where tPagini.Pagina.Contains(Pagina)
                            select new { tPagini.Id, tPagini.Pagina };
                if (query.Count() == 1)
                {
                    oPagina.Id = query.First().Id.ToString();
                    oPagina.Pagina = query.First().Pagina;
                }
            }
            else
                oPagina.Eroare = "Acces interzis!";
            return oPagina;
        }
        private string VerificareDate(PaginaRolObiect abdco)
        {
            string Eroare = "";
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
                    Eroare = "Alegeti o Pagina!";
                    break;
            }
            return Eroare;
        }

    }
}