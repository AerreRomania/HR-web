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
    public class EficienteAngajatObiect
    {
        public List<EficientaAngajatObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public EficienteAngajatObiect()
        {
            Tabela = new List<EficientaAngajatObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class EficientaAngajatObiect
    {
        public string Id;
        public string IdAngajat;
        public string Eficienta;
        public string DataEficienta;
        public string Eroare;
        public EficientaAngajatObiect()
        {
            Id = "";
            IdAngajat = "";
            Eficienta = "";
            DataEficienta = "";
            Eroare = "";
        }
    }
    public class FiltruEficienteAngajatObiect
    {
        public string Find;
        public string FiltruData;
        public FiltruEficienteAngajatObiect()
        {
            Find = "";
            FiltruData = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class EficienteAngajatWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public EficienteAngajatObiect EficienteAngajatLista(FiltruEficienteAngajatObiect oFiltruEficienteAngajat, int PaginaCurenta, string IdAngajat)
        {
            EficienteAngajatObiect oEficienteAngajat = new EficienteAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tEficienteAngajat in dcWbmOlimpias.EficienteAngajats
                            where tEficienteAngajat.IdAngajat.Equals(IdAngajat) && tEficienteAngajat.IdUtilizatorStergere.Equals(null)
                            orderby tEficienteAngajat.Id
                            select new { tEficienteAngajat.Id, tEficienteAngajat.Eficienta, tEficienteAngajat.DataEficienta };

                oEficienteAngajat.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruEficienteAngajat.Find == "")
                {
                    oEficienteAngajat.PaginaCurenta = PaginaCurenta;
                    oEficienteAngajat.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruEficienteAngajat.Find)));

                    oEficienteAngajat.PaginaCurenta = Pozitie / 5 + 1;
                    oEficienteAngajat.IndexRand = Pozitie - (oEficienteAngajat.PaginaCurenta - 1) * 5;
                }
                if (oEficienteAngajat.NumarPagini < oEficienteAngajat.PaginaCurenta)
                    oEficienteAngajat.PaginaCurenta = oEficienteAngajat.NumarPagini;
                if (oEficienteAngajat.PaginaCurenta < 1)
                    oEficienteAngajat.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oEficienteAngajat.PaginaCurenta - 1)).Take(5))
                {
                    EficientaAngajatObiect oEficientaAngajat = new EficientaAngajatObiect();
                    oEficientaAngajat.Id = rezultat.Id.ToString();
                    oEficientaAngajat.Eficienta = rezultat.Eficienta.ToString("N1");
                    oEficientaAngajat.DataEficienta = rezultat.DataEficienta.ToString("MM.yyyy");
                    oEficienteAngajat.Tabela.Add(oEficientaAngajat);
                }
            }
            else
                oEficienteAngajat.Eroare = "Acces interzis!";
            return oEficienteAngajat;
        }
        [WebMethod(EnableSession = false)]
        public EficientaAngajatObiect EficientaAngajatProprietati(string Id)
        {
            EficientaAngajatObiect oEficientaAngajat = new EficientaAngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tEficienteAngajat in dcWbmOlimpias.EficienteAngajats
                            where tEficienteAngajat.Id.Equals(Id)
                            select new { tEficienteAngajat.Id, tEficienteAngajat.Eficienta, tEficienteAngajat.DataEficienta };
                oEficientaAngajat.Eficienta = query.First().Eficienta.ToString("N1");
                oEficientaAngajat.DataEficienta = query.First().DataEficienta.ToString("MM.yyyy");
            }
            else
                oEficientaAngajat.Eroare = "Acces interzis!";
            return oEficientaAngajat;
        }
        [WebMethod(EnableSession = false)]
        public EficientaAngajatObiect EficientaAngajatAdaugare(EficientaAngajatObiect oEficientaAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oEficientaAngajat.Eroare = VerificareDate(oEficientaAngajat);

                if (oEficientaAngajat.Eroare == "")
                {
                    DateTime DataEficienta = DateTime.ParseExact(oEficientaAngajat.DataEficienta, "MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.EficientaAngajatAdaugare(Convert.ToInt32(oEficientaAngajat.IdAngajat), Convert.ToDecimal(oEficientaAngajat.Eficienta), DataEficienta, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oEficientaAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                    oEficientaAngajat.Id = Id.ToString();
                }
                if (oEficientaAngajat.Eroare != "")
                {
                    oEficientaAngajat.Id = "";
                }
            }
            else
                oEficientaAngajat.Eroare = "Nu aveti drept de adaugare!";
            return oEficientaAngajat;
        }
        [WebMethod(EnableSession = false)]
        public EficientaAngajatObiect EficientaAngajatModificare(EficientaAngajatObiect oEficientaAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oEficientaAngajat.Eroare = VerificareDate(oEficientaAngajat);
                if (oEficientaAngajat.Eroare == "")
                {
                    DateTime DataEficienta = DateTime.ParseExact(oEficientaAngajat.DataEficienta, "MM.yyyy", null, System.Globalization.DateTimeStyles.None);
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.EficientaAngajatModificare(Convert.ToInt32(oEficientaAngajat.IdAngajat), Convert.ToDecimal(oEficientaAngajat.Eficienta), DataEficienta, Convert.ToInt32("1"), Convert.ToInt32(oEficientaAngajat.Id), ref IdEroare);
                    oEficientaAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oEficientaAngajat.Eroare != "")
                {
                    oEficientaAngajat.Id = "";
                }
            }
            else
                oEficientaAngajat.Eroare = "Nu aveti drept de modificare!";
            return oEficientaAngajat;
        }
        [WebMethod(EnableSession = false)]
        public string EficientaAngajatStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.EficientaAngajatStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(EficientaAngajatObiect oEficientaAngajat)
        {
            string Eroare = "";
            Decimal eficienta;
            DateTime dateTime;
            if (!Decimal.TryParse(oEficientaAngajat.Eficienta, out eficienta))
                Eroare = InterpretareEroare("2");
            if (!DateTime.TryParseExact(oEficientaAngajat.DataEficienta, "MM.yyyy", null, System.Globalization.DateTimeStyles.None, out dateTime))
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
                    Eroare = "EficientaAngajat existenta!";
                    break;
                case "2":
                    Eroare = "Completati corect campul Eficienta!";
                    break;
                case "3":
                    Eroare = "Completati corect campul Data Eficienta!";
                    break;
                case "4":
                    Eroare = "EficientaAngajat nu se poate sterge, sunt date salvate cu aceasta EficientaAngajat!";
                    break;
            }
            return Eroare;
        }

    }
}