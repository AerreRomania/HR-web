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
    public class FisiereAngajatObiect
    {
        public List<FisierAngajatObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public FisiereAngajatObiect()
        {
            Tabela = new List<FisierAngajatObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class FisierAngajatObiect
    {
        public string Id;
        public string IdAngajat;
        public string Descriere;
        public string DataFisier;
        public string IdFisier;
        public string Fisier;
        public string Eroare;
        public FisierAngajatObiect()
        {
            Id = "";
            IdAngajat = "";
            Descriere = "";
            DataFisier = "";
            IdFisier = "";
            Fisier = "";
            Eroare = "";
        }
    }
    public class FiltruFisiereAngajatObiect
    {
        public string Find;
        public string FiltruDescriere;
        public FiltruFisiereAngajatObiect()
        {
            Find = "";
            FiltruDescriere = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class FisiereAngajatWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public FisiereAngajatObiect FisiereAngajatLista(FiltruFisiereAngajatObiect oFiltruFisiereAngajat, int PaginaCurenta, string IdAngajat)
        {
            FisiereAngajatObiect oFisiereAngajat = new FisiereAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tFisiereAngajat in dcWbmOlimpias.FisiereAngajats
                            where tFisiereAngajat.IdAngajat.Equals(IdAngajat) && tFisiereAngajat.IdUtilizatorStergere.Equals(null)
                            orderby tFisiereAngajat.Id
                            select new { tFisiereAngajat.Id, tFisiereAngajat.Descriere, tFisiereAngajat.DataFisier, tFisiereAngajat.IdFisier };

                if (!String.IsNullOrEmpty(oFiltruFisiereAngajat.FiltruDescriere))
                    query = query.Where(x => x.Descriere.Contains(oFiltruFisiereAngajat.FiltruDescriere));

                oFisiereAngajat.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruFisiereAngajat.Find == "")
                {
                    oFisiereAngajat.PaginaCurenta = PaginaCurenta;
                    oFisiereAngajat.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruFisiereAngajat.Find)));

                    oFisiereAngajat.PaginaCurenta = Pozitie / 5 + 1;
                    oFisiereAngajat.IndexRand = Pozitie - (oFisiereAngajat.PaginaCurenta - 1) * 5;
                }
                if (oFisiereAngajat.NumarPagini < oFisiereAngajat.PaginaCurenta)
                    oFisiereAngajat.PaginaCurenta = oFisiereAngajat.NumarPagini;
                if (oFisiereAngajat.PaginaCurenta < 1)
                    oFisiereAngajat.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oFisiereAngajat.PaginaCurenta - 1)).Take(5))
                {
                    FisierAngajatObiect oFisierAngajat = new FisierAngajatObiect();
                    oFisierAngajat.Id = rezultat.Id.ToString();
                    oFisierAngajat.Descriere = rezultat.Descriere;
                    oFisierAngajat.DataFisier = rezultat.DataFisier.ToString("dd.MM.yyyy");
                    oFisierAngajat.IdFisier = rezultat.IdFisier.ToString();
                    oFisiereAngajat.Tabela.Add(oFisierAngajat);
                }
            }
            else
                oFisiereAngajat.Eroare = "Acces interzis!";
            return oFisiereAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FisierAngajatObiect FisierAngajatProprietati(string Id)
        {
            FisierAngajatObiect oFisierAngajat = new FisierAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tFisiereAngajat in dcWbmOlimpias.FisiereAngajats
                            join tFisiere in dcWbmOlimpias.Fisieres on tFisiereAngajat.IdFisier equals tFisiere.Id
                            where tFisiereAngajat.Id.Equals(Id)
                            select new { tFisiereAngajat.Id, tFisiereAngajat.Descriere, tFisiereAngajat.DataFisier, tFisiereAngajat.IdFisier, tFisiere.NumeFisier };
                oFisierAngajat.Descriere = query.First().Descriere;
                oFisierAngajat.DataFisier = query.First().DataFisier.ToString("dd.MM.yyyy");
                oFisierAngajat.IdFisier = query.First().IdFisier.ToString();
                oFisierAngajat.Fisier = query.First().NumeFisier;
            }
            else
                oFisierAngajat.Eroare = "Acces interzis!";
            return oFisierAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FisierAngajatObiect FisierAngajatAdaugare(FisierAngajatObiect oFisierAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oFisierAngajat.Eroare = VerificareDate(oFisierAngajat);

                if (oFisierAngajat.Eroare == "")
                {
                    DateTime DataFisier = DateTime.ParseExact(oFisierAngajat.DataFisier, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.FisierAngajatAdaugare(Convert.ToInt32(oFisierAngajat.IdAngajat), oFisierAngajat.Descriere, DataFisier, Convert.ToInt32(oFisierAngajat.IdFisier), Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oFisierAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                    oFisierAngajat.Id = Id.ToString();
                }
                if (oFisierAngajat.Eroare != "")
                {
                    oFisierAngajat.Id = "";
                }
            }
            else
                oFisierAngajat.Eroare = "Nu aveti drept de adaugare!";
            return oFisierAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FisierAngajatObiect FisierAngajatModificare(FisierAngajatObiect oFisierAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oFisierAngajat.Eroare = VerificareDate(oFisierAngajat);
                if (oFisierAngajat.Eroare == "")
                {
                    DateTime DataFisier = DateTime.ParseExact(oFisierAngajat.DataFisier, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.FisierAngajatModificare(Convert.ToInt32(oFisierAngajat.IdAngajat), oFisierAngajat.Descriere, DataFisier, Convert.ToInt32(oFisierAngajat.IdFisier), Convert.ToInt32("1"), Convert.ToInt32(oFisierAngajat.Id), ref IdEroare);
                    oFisierAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oFisierAngajat.Eroare != "")
                {
                    oFisierAngajat.Id = "";
                }
            }
            else
                oFisierAngajat.Eroare = "Nu aveti drept de modificare!";
            return oFisierAngajat;
        }
        [WebMethod(EnableSession = false)]
        public string FisierAngajatStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.FisierAngajatStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(FisierAngajatObiect oFisierAngajat)
        {
            string Eroare = "";
            DateTime dateTime;
            if (oFisierAngajat.Descriere == "")
                Eroare = InterpretareEroare("2");
            if (!DateTime.TryParseExact(oFisierAngajat.DataFisier, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None, out dateTime))
                Eroare = InterpretareEroare("");
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
                    Eroare = "FisierAngajat existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Descriere!";
                    break;
                case "3":
                    Eroare = "Completati corect campul Data fisier!";
                    break;
                case "4":
                    Eroare = "FisierAngajat nu se poate sterge, sunt date salvate cu aceasta FisierAngajat!";
                    break;
            }
            return Eroare;
        }

    }
}