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
    public class BanciObiect
    {
        public List<BancaObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public BanciObiect()
        {
            Tabela = new List<BancaObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class BancaObiect
    {
        public string Id;
        public string Banca;
        public string Eroare;
        public BancaObiect()
        {
            Id = "";
            Banca = "";
            Eroare = "";
        }
    }
    public class FiltruBanciObiect
    {
        public string Find;
        public string FiltruBanca;
        public FiltruBanciObiect()
        {
            Find = "";
            FiltruBanca = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class BanciWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public BanciObiect BanciLista(FiltruBanciObiect oFiltruBanca, int PaginaCurenta)
        {
            BanciObiect oBanci = new BanciObiect();
            if (GlobalClass.VerificareAcces("Banci", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tBanci in dcWbmOlimpias.Bancis
                            where tBanci.Banca.Contains(oFiltruBanca.FiltruBanca) && tBanci.DataStergere.Equals(null)
                            orderby tBanci.Banca, tBanci.Id
                            select new { tBanci.Id, tBanci.Banca };

                
                oBanci.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruBanca.Find == "")
                {
                    oBanci.PaginaCurenta = PaginaCurenta;
                    oBanci.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruBanca.Find)));

                    oBanci.PaginaCurenta = Pozitie / 5 + 1;
                    oBanci.IndexRand = Pozitie - (oBanci.PaginaCurenta - 1) * 5;
                }
                if (oBanci.NumarPagini < oBanci.PaginaCurenta)
                    oBanci.PaginaCurenta = oBanci.NumarPagini;
                if (oBanci.PaginaCurenta < 1)
                    oBanci.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oBanci.PaginaCurenta - 1)).Take(5))
                {
                    BancaObiect oBanca = new BancaObiect();
                    oBanca.Id = rezultat.Id.ToString();
                    oBanca.Banca = rezultat.Banca;
                    oBanci.Tabela.Add(oBanca);
                }
            }
            else
                oBanci.Eroare = "Acces interzis!";
            return oBanci;
        }
        [WebMethod(EnableSession = false)]
        public BancaObiect BancaProprietati(string Id)
        {
            BancaObiect oBanca = new BancaObiect();
            if (GlobalClass.VerificareAcces("Banci", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tBanci in dcWbmOlimpias.Bancis
                            where tBanci.Id.Equals(Id)
                            select new { tBanci.Id, tBanci.Banca };
                oBanca.Banca = query.First().Banca;
            }
            else
                oBanca.Eroare = "Acces interzis!";
            return oBanca;
        }
        [WebMethod(EnableSession = false)]
        public BancaObiect BancaAdaugare(BancaObiect oBanca)
        {
            if (GlobalClass.VerificareAccesOperatie("Banci", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oBanca.Eroare = VerificareDate(oBanca);
                if (oBanca.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.BancaAdaugare(oBanca.Banca, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oBanca.Eroare = InterpretareEroare(IdEroare.ToString());
                    oBanca.Id = Id.ToString();
                }
                if (oBanca.Eroare != "")
                {
                    oBanca.Id = "";
                }
            }
            else
                oBanca.Eroare = "Nu aveti drept de adaugare!";
            return oBanca;
        }
        [WebMethod(EnableSession = false)]
        public BancaObiect BancaModificare(BancaObiect oBanca)
        {
            if (GlobalClass.VerificareAccesOperatie("Banci", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oBanca.Eroare = VerificareDate(oBanca);
                if (oBanca.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.BancaModificare(oBanca.Banca, Convert.ToInt32("1"), Convert.ToInt32(oBanca.Id), ref IdEroare);
                    oBanca.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oBanca.Eroare != "")
                {
                    oBanca.Id = "";
                }
            }
            else
                oBanca.Eroare = "Nu aveti drept de modificare!";
            return oBanca;
        }
        [WebMethod(EnableSession = false)]
        public string BancaStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Banci", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.BancaStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(BancaObiect oBanca)
        {
            string Eroare = "";
            if (oBanca.Banca == "")
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
                    Eroare = "Banca existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Banca!";
                    break;
                case "4":
                    Eroare = "Banca nu se poate sterge, sunt date salvate cu aceasta Banca!";
                    break;
            }
            return Eroare;
        }

    }
}