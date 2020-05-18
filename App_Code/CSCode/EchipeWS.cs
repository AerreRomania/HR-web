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
    public class EchipeObiect
    {
        public List<EchipaObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public EchipeObiect()
        {
            Tabela = new List<EchipaObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class EchipaObiect
    {
        public string Id;
        public string CodEchipa;
        public string Echipa;
        public string Eroare;
        public EchipaObiect()
        {
            Id = "";
            CodEchipa = "";
            Echipa = "";
            Eroare = "";
        }
    }
    public class FiltruEchipeObiect
    {
        public string Find;
        public string FiltruEchipa;
        public FiltruEchipeObiect()
        {
            Find = "";
            FiltruEchipa = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class EchipeWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public EchipeObiect EchipeLista(FiltruEchipeObiect oFiltruEchipa, int PaginaCurenta)
        {
            EchipeObiect oEchipe = new EchipeObiect();
            if (GlobalClass.VerificareAcces("Echipe", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tEchipe in dcWbmOlimpias.Echipes
                            where tEchipe.Echipa.Contains(oFiltruEchipa.FiltruEchipa) && !tEchipe.DataAdaugare.Equals(null)
                            orderby tEchipe.Echipa, tEchipe.Id
                            select new { tEchipe.Id,tEchipe.CodEchipa ,tEchipe.Echipa };

                
                oEchipe.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruEchipa.Find == "")
                {
                    oEchipe.PaginaCurenta = PaginaCurenta;
                    oEchipe.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruEchipa.Find)));

                    oEchipe.PaginaCurenta = Pozitie / 5 + 1;
                    oEchipe.IndexRand = Pozitie - (oEchipe.PaginaCurenta - 1) * 5;
                }
                if (oEchipe.NumarPagini < oEchipe.PaginaCurenta)
                    oEchipe.PaginaCurenta = oEchipe.NumarPagini;
                if (oEchipe.PaginaCurenta < 1)
                    oEchipe.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oEchipe.PaginaCurenta - 1)).Take(5))
                {
                    EchipaObiect oEchipa = new EchipaObiect();
                    oEchipa.Id = rezultat.Id.ToString();
                    oEchipa.CodEchipa = rezultat.CodEchipa;
                    oEchipa.Echipa = rezultat.Echipa;
                    oEchipe.Tabela.Add(oEchipa);
                }
            }
            else
                oEchipe.Eroare = "Acces interzis!";
            return oEchipe;
        }
        [WebMethod(EnableSession = false)]
        public EchipaObiect EchipaProprietati(string Id)
        {
            EchipaObiect oEchipa = new EchipaObiect();
            if (GlobalClass.VerificareAcces("Echipe", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tEchipe in dcWbmOlimpias.Echipes
                            where tEchipe.Id.Equals(Id)
                            select new { tEchipe.Id, tEchipe.Echipa, tEchipe.CodEchipa };
                oEchipa.Echipa = query.First().Echipa;
                oEchipa.CodEchipa = query.First().CodEchipa;
            }
            else
                oEchipa.Eroare = "Acces interzis!";
            return oEchipa;
        }
        [WebMethod(EnableSession = false)]
        public EchipaObiect EchipaAdaugare(EchipaObiect oEchipa)
        {
            if (GlobalClass.VerificareAccesOperatie("Echipe", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oEchipa.Eroare = VerificareDate(oEchipa);
                if (oEchipa.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.EchipaAdaugare(oEchipa.CodEchipa, oEchipa.Echipa, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oEchipa.Eroare = InterpretareEroare(IdEroare.ToString());
                    oEchipa.Id = Id.ToString();
                }
                if (oEchipa.Eroare != "")
                {
                    oEchipa.Id = "";
                }
            }
            else
                oEchipa.Eroare = "Nu aveti drept de adaugare!";
            return oEchipa;
        }
        [WebMethod(EnableSession = false)]
        public EchipaObiect EchipaModificare(EchipaObiect oEchipa)
        {
            if (GlobalClass.VerificareAccesOperatie("Echipe", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oEchipa.Eroare = VerificareDate(oEchipa);
                if (oEchipa.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.EchipaModificare(oEchipa.CodEchipa, oEchipa.Echipa, Convert.ToInt32("1"), Convert.ToInt32(oEchipa.Id), ref IdEroare);
                    oEchipa.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oEchipa.Eroare != "")
                {
                    oEchipa.Id = "";
                }
            }
            else
                oEchipa.Eroare = "Nu aveti drept de modificare!";
            return oEchipa;
        }
        [WebMethod(EnableSession = false)]
        public string EchipaStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Echipe", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.EchipaStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(EchipaObiect oEchipa)
        {
            string Eroare = "";
            if (oEchipa.Echipa == "")
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
                    Eroare = "Echipa existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Echipa!";
                    break;
                case "4":
                    Eroare = "Echipa nu se poate sterge, sunt date salvate cu aceasta Echipa!";
                    break;
            }
            return Eroare;
        }

    }
}