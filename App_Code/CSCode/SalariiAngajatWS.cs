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
    public class SalariiAngajatObiect
    {
        public List<SalariuAngajatObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public SalariiAngajatObiect()
        {
            Tabela = new List<SalariuAngajatObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class SalariuAngajatObiect
    {
        public string Id;
        public string IdAngajat;
        public string DataSalariu;
        public string MarireSalar;
        public string SalarActual;
        public string Eroare;
        public SalariuAngajatObiect()
        {
            Id = "";
            IdAngajat = "";
            DataSalariu = "";
            MarireSalar = "";
            SalarActual = "";
            Eroare = "";
        }
    }
    public class FiltruSalariiAngajatObiect
    {
        public string Find;
        public string FiltruData;
        public FiltruSalariiAngajatObiect()
        {
            Find = "";
            FiltruData = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class SalariiAngajatWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public SalariiAngajatObiect SalariiAngajatLista(FiltruSalariiAngajatObiect oFiltruSalariiAngajat, int PaginaCurenta, string IdAngajat)
        {
            SalariiAngajatObiect oSalariiAngajat = new SalariiAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tSalariiAngajat in dcWbmOlimpias.SalariiAngajats
                            where tSalariiAngajat.IdAngajat.Equals(IdAngajat) && tSalariiAngajat.IdUtilizatorStergere.Equals(null)
                            orderby tSalariiAngajat.Id
                            select new { tSalariiAngajat.Id, tSalariiAngajat.DataSalariu, tSalariiAngajat.MarireSalar, tSalariiAngajat.SalarActual };

                oSalariiAngajat.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruSalariiAngajat.Find == "")
                {
                    oSalariiAngajat.PaginaCurenta = PaginaCurenta;
                    oSalariiAngajat.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruSalariiAngajat.Find)));

                    oSalariiAngajat.PaginaCurenta = Pozitie / 5 + 1;
                    oSalariiAngajat.IndexRand = Pozitie - (oSalariiAngajat.PaginaCurenta - 1) * 5;
                }
                if (oSalariiAngajat.NumarPagini < oSalariiAngajat.PaginaCurenta)
                    oSalariiAngajat.PaginaCurenta = oSalariiAngajat.NumarPagini;
                if (oSalariiAngajat.PaginaCurenta < 1)
                    oSalariiAngajat.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oSalariiAngajat.PaginaCurenta - 1)).Take(5))
                {
                    SalariuAngajatObiect oSalariuAngajat = new SalariuAngajatObiect();
                    oSalariuAngajat.Id = rezultat.Id.ToString();
                    oSalariuAngajat.DataSalariu = rezultat.DataSalariu.ToString("dd.MM.yyyy");
                    oSalariuAngajat.MarireSalar = rezultat.MarireSalar;
                    oSalariuAngajat.SalarActual = rezultat.SalarActual;
                    oSalariiAngajat.Tabela.Add(oSalariuAngajat);
                }
            }
            else
                oSalariiAngajat.Eroare = "Acces interzis!";
            return oSalariiAngajat;
        }
        [WebMethod(EnableSession = false)]
        public SalariuAngajatObiect SalariuAngajatProprietati(string Id)
        {
            SalariuAngajatObiect oSalariuAngajat = new SalariuAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tSalariiAngajat in dcWbmOlimpias.SalariiAngajats
                            where tSalariiAngajat.Id.Equals(Id)
                            select new { tSalariiAngajat.Id, tSalariiAngajat.DataSalariu, tSalariiAngajat.MarireSalar, tSalariiAngajat.SalarActual                            };
                oSalariuAngajat.DataSalariu = query.First().DataSalariu.ToString("dd.MM.yyyy");
                oSalariuAngajat.MarireSalar = query.First().MarireSalar;
                oSalariuAngajat.SalarActual = query.First().SalarActual;
            }
            else
                oSalariuAngajat.Eroare = "Acces interzis!";
            return oSalariuAngajat;
        }
        [WebMethod(EnableSession = false)]
        public SalariuAngajatObiect SalariuAngajatAdaugare(SalariuAngajatObiect oSalariuAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oSalariuAngajat.Eroare = VerificareDate(oSalariuAngajat);

                if (oSalariuAngajat.Eroare == "")
                {
                    DateTime DataSalariu = DateTime.ParseExact(oSalariuAngajat.DataSalariu, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.SalariuAngajatAdaugare(Convert.ToInt32(oSalariuAngajat.IdAngajat), DataSalariu, oSalariuAngajat.MarireSalar, oSalariuAngajat.SalarActual, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oSalariuAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                    oSalariuAngajat.Id = Id.ToString();
                }
                if (oSalariuAngajat.Eroare != "")
                {
                    oSalariuAngajat.Id = "";
                }
            }
            else
                oSalariuAngajat.Eroare = "Nu aveti drept de adaugare!";
            return oSalariuAngajat;
        }
        [WebMethod(EnableSession = false)]
        public SalariuAngajatObiect SalariuAngajatModificare(SalariuAngajatObiect oSalariuAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oSalariuAngajat.Eroare = VerificareDate(oSalariuAngajat);
                if (oSalariuAngajat.Eroare == "")
                {
                    DateTime DataSalariu = DateTime.ParseExact(oSalariuAngajat.DataSalariu, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.SalariuAngajatModificare(Convert.ToInt32(oSalariuAngajat.IdAngajat), DataSalariu, oSalariuAngajat.MarireSalar, oSalariuAngajat.SalarActual, Convert.ToInt32("1"), Convert.ToInt32(oSalariuAngajat.Id), ref IdEroare);
                    oSalariuAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oSalariuAngajat.Eroare != "")
                {
                    oSalariuAngajat.Id = "";
                }
            }
            else
                oSalariuAngajat.Eroare = "Nu aveti drept de modificare!";
            return oSalariuAngajat;
        }
        [WebMethod(EnableSession = false)]
        public string SalariuAngajatStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.SalariuAngajatStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(SalariuAngajatObiect oSalariuAngajat)
        {
            string Eroare = "";
            DateTime dateTime;
            if (!DateTime.TryParseExact(oSalariuAngajat.DataSalariu, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None, out dateTime))
                Eroare = InterpretareEroare("3");
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
                    Eroare = "SalariuAngajat existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Descriere!";
                    break;
                case "3":
                    Eroare = "Completati corect campul Data Salariu!";
                    break;
                case "4":
                    Eroare = "SalariuAngajat nu se poate sterge, sunt date salvate cu aceasta SalariuAngajat!";
                    break;
            }
            return Eroare;
        }

    }
}