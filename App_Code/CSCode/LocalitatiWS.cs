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
    public class LocalitatiObiect
    {
        public List<LocalitateObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public LocalitatiObiect()
        {
            Tabela = new List<LocalitateObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class LocalitateObiect
    {
        public string Id;
        public string Localitate;
        public string Eroare;
        public LocalitateObiect()
        {
            Id = "";
            Localitate = "";
            Eroare = "";
        }
    }
    public class FiltruLocalitatiObiect
    {
        public string Find;
        public string FiltruLocalitate;
        public FiltruLocalitatiObiect()
        {
            Find = "";
            FiltruLocalitate = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class LocalitatiWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public LocalitatiObiect LocalitatiLista(FiltruLocalitatiObiect oFiltruLocalitate, int PaginaCurenta)
        {
            LocalitatiObiect oLocalitati = new LocalitatiObiect();
            if (GlobalClass.VerificareAcces("Localitati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLocalitati in dcWbmOlimpias.Localitatis
                            where tLocalitati.Localitate.Contains(oFiltruLocalitate.FiltruLocalitate)
                            orderby tLocalitati.Localitate, tLocalitati.Id
                            select new { tLocalitati.Id, tLocalitati.Localitate };

                
                oLocalitati.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruLocalitate.Find == "")
                {
                    oLocalitati.PaginaCurenta = PaginaCurenta;
                    oLocalitati.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruLocalitate.Find)));

                    oLocalitati.PaginaCurenta = Pozitie / 5 + 1;
                    oLocalitati.IndexRand = Pozitie - (oLocalitati.PaginaCurenta - 1) * 5;
                }
                if (oLocalitati.NumarPagini < oLocalitati.PaginaCurenta)
                    oLocalitati.PaginaCurenta = oLocalitati.NumarPagini;
                if (oLocalitati.PaginaCurenta < 1)
                    oLocalitati.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oLocalitati.PaginaCurenta - 1)).Take(5))
                {
                    LocalitateObiect oLocalitate = new LocalitateObiect();
                    oLocalitate.Id = rezultat.Id.ToString();
                    oLocalitate.Localitate = rezultat.Localitate;
                    oLocalitati.Tabela.Add(oLocalitate);
                }
            }
            else
                oLocalitati.Eroare = "Acces interzis!";
            return oLocalitati;
        }
        [WebMethod(EnableSession = false)]
        public LocalitateObiect LocalitateProprietati(string Id)
        {
            LocalitateObiect oLocalitate = new LocalitateObiect();
            if (GlobalClass.VerificareAcces("Localitati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLocalitati in dcWbmOlimpias.Localitatis
                            where tLocalitati.Id.Equals(Id)
                            select new { tLocalitati.Id, tLocalitati.Localitate };
                oLocalitate.Localitate = query.First().Localitate;
            }
            else
                oLocalitate.Eroare = "Acces interzis!";
            return oLocalitate;
        }
        [WebMethod(EnableSession = false)]
        public LocalitateObiect LocalitateAdaugare(LocalitateObiect oLocalitate)
        {
            if (GlobalClass.VerificareAccesOperatie("Localitati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oLocalitate.Eroare = VerificareDate(oLocalitate);
                if (oLocalitate.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.LocalitateAdaugare(oLocalitate.Localitate, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oLocalitate.Eroare = InterpretareEroare(IdEroare.ToString());
                    oLocalitate.Id = Id.ToString();
                }
                if (oLocalitate.Eroare != "")
                {
                    oLocalitate.Id = "";
                }
            }
            else
                oLocalitate.Eroare = "Nu aveti drept de adaugare!";
            return oLocalitate;
        }
        [WebMethod(EnableSession = false)]
        public LocalitateObiect LocalitateModificare(LocalitateObiect oLocalitate)
        {
            if (GlobalClass.VerificareAccesOperatie("Localitati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oLocalitate.Eroare = VerificareDate(oLocalitate);
                if (oLocalitate.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.LocalitateModificare(oLocalitate.Localitate, Convert.ToInt32("1"), Convert.ToInt32(oLocalitate.Id), ref IdEroare);
                    oLocalitate.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oLocalitate.Eroare != "")
                {
                    oLocalitate.Id = "";
                }
            }
            else
                oLocalitate.Eroare = "Nu aveti drept de modificare!";
            return oLocalitate;
        }
        [WebMethod(EnableSession = false)]
        public string LocalitateStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Localitati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.LocalitateStergere( Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
       
        private string VerificareDate(LocalitateObiect oLocalitate)
        {
            string Eroare = "";
            if (oLocalitate.Localitate == "")
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
                    Eroare = "Localitate existent!";
                    break;
                case "2":
                    Eroare = "Completati campul Localitate!";
                    break;
                case "4":
                    Eroare = "Localitatea nu se poate sterge, sunt date salvate cu aceasta Localitate!";
                    break;
            }
            return Eroare;
        }

    }
}