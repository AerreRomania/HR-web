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
    public class FluturaseAngajatObiect
    {
        public List<FluturasAngajatObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public FluturaseAngajatObiect()
        {
            Tabela = new List<FluturasAngajatObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class FluturasAngajatObiect
    {
        public string Id;
        public string IdAngajat;
        public string DataFluturas;
        public string IdFisier;
        public string Fisier;
        public string Eroare;
        public FluturasAngajatObiect()
        {
            Id = "";
            IdAngajat = "";
            DataFluturas = "";
            IdFisier = "";
            Fisier = "";
            Eroare = "";
        }
    }
    public class FiltruFluturaseAngajatObiect
    {
        public string Find;
        public string FiltruData;
        public FiltruFluturaseAngajatObiect()
        {
            Find = "";
            FiltruData = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class FluturaseAngajatWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public FluturaseAngajatObiect FluturaseAngajatLista(FiltruFluturaseAngajatObiect oFiltruFluturaseAngajat, int PaginaCurenta, string IdAngajat)
        {
            FluturaseAngajatObiect oFluturaseAngajat = new FluturaseAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tFluturaseAngajat in dcWbmOlimpias.FluturaseAngajats
                            where tFluturaseAngajat.IdAngajat.Equals(IdAngajat) && tFluturaseAngajat.IdUtilizatorStergere.Equals(null)
                            orderby tFluturaseAngajat.Id
                            select new { tFluturaseAngajat.Id, tFluturaseAngajat.DataFluturas, tFluturaseAngajat.IdFisier };

                oFluturaseAngajat.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruFluturaseAngajat.Find == "")
                {
                    oFluturaseAngajat.PaginaCurenta = PaginaCurenta;
                    oFluturaseAngajat.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruFluturaseAngajat.Find)));

                    oFluturaseAngajat.PaginaCurenta = Pozitie / 5 + 1;
                    oFluturaseAngajat.IndexRand = Pozitie - (oFluturaseAngajat.PaginaCurenta - 1) * 5;
                }
                if (oFluturaseAngajat.NumarPagini < oFluturaseAngajat.PaginaCurenta)
                    oFluturaseAngajat.PaginaCurenta = oFluturaseAngajat.NumarPagini;
                if (oFluturaseAngajat.PaginaCurenta < 1)
                    oFluturaseAngajat.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oFluturaseAngajat.PaginaCurenta - 1)).Take(5))
                {
                    FluturasAngajatObiect oFluturasAngajat = new FluturasAngajatObiect();
                    oFluturasAngajat.Id = rezultat.Id.ToString();
                    oFluturasAngajat.DataFluturas = rezultat.DataFluturas.ToString("MM.yyyy");
                    oFluturasAngajat.IdFisier = rezultat.IdFisier.ToString();
                    oFluturaseAngajat.Tabela.Add(oFluturasAngajat);
                }
            }
            else
                oFluturaseAngajat.Eroare = "Acces interzis!";
            return oFluturaseAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FluturasAngajatObiect FluturasAngajatProprietati(string Id)
        {
            FluturasAngajatObiect oFluturasAngajat = new FluturasAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tFluturaseAngajat in dcWbmOlimpias.FluturaseAngajats
                            join tFisiere in dcWbmOlimpias.Fisieres on tFluturaseAngajat.IdFisier equals tFisiere.Id
                            where tFluturaseAngajat.Id.Equals(Id)
                            select new { tFluturaseAngajat.Id, tFluturaseAngajat.DataFluturas, tFluturaseAngajat.IdFisier, tFisiere.NumeFisier };
                oFluturasAngajat.DataFluturas = query.First().DataFluturas.ToString("MM.yyyy");
                oFluturasAngajat.IdFisier = query.First().IdFisier.ToString();
                oFluturasAngajat.Fisier = query.First().NumeFisier;
            }
            else
                oFluturasAngajat.Eroare = "Acces interzis!";
            return oFluturasAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FluturasAngajatObiect FluturasAngajatAdaugare(FluturasAngajatObiect oFluturasAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oFluturasAngajat.Eroare = VerificareDate(oFluturasAngajat);

                if (oFluturasAngajat.Eroare == "")
                {
                    DateTime DataFluturas = DateTime.ParseExact(oFluturasAngajat.DataFluturas, "MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.FluturasAngajatAdaugare(Convert.ToInt32(oFluturasAngajat.IdAngajat), DataFluturas, Convert.ToInt32(oFluturasAngajat.IdFisier), Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oFluturasAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                    oFluturasAngajat.Id = Id.ToString();
                }
                if (oFluturasAngajat.Eroare != "")
                {
                    oFluturasAngajat.Id = "";
                }
            }
            else
                oFluturasAngajat.Eroare = "Nu aveti drept de adaugare!";
            return oFluturasAngajat;
        }
        [WebMethod(EnableSession = false)]
        public FluturasAngajatObiect FluturasAngajatModificare(FluturasAngajatObiect oFluturasAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oFluturasAngajat.Eroare = VerificareDate(oFluturasAngajat);
                if (oFluturasAngajat.Eroare == "")
                {
                    DateTime DataFluturas = DateTime.ParseExact(oFluturasAngajat.DataFluturas, "MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.FluturasAngajatModificare(Convert.ToInt32(oFluturasAngajat.IdAngajat), DataFluturas, Convert.ToInt32(oFluturasAngajat.IdFisier), Convert.ToInt32("1"), Convert.ToInt32(oFluturasAngajat.Id), ref IdEroare);
                    oFluturasAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oFluturasAngajat.Eroare != "")
                {
                    oFluturasAngajat.Id = "";
                }
            }
            else
                oFluturasAngajat.Eroare = "Nu aveti drept de modificare!";
            return oFluturasAngajat;
        }
        [WebMethod(EnableSession = false)]
        public string FluturasAngajatStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.FluturasAngajatStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(FluturasAngajatObiect oFluturasAngajat)
        {
            string Eroare = "";
            DateTime dateTime;
            if (!DateTime.TryParseExact(oFluturasAngajat.DataFluturas, "MM.yyyy", null, System.Globalization.DateTimeStyles.None, out dateTime))
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
                    Eroare = "FluturasAngajat existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Descriere!";
                    break;
                case "3":
                    Eroare = "Completati corect campul Data Fluturas!";
                    break;
                case "4":
                    Eroare = "FluturasAngajat nu se poate sterge, sunt date salvate cu aceasta FluturasAngajat!";
                    break;
            }
            return Eroare;
        }

    }
}