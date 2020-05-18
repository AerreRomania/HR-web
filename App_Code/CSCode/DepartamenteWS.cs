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
    public class DepartamenteObiect
    {
        public List<DepartamentObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public DepartamenteObiect()
        {
            Tabela = new List<DepartamentObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class DepartamentObiect
    {
        public string Id;
        public string CodDepartament;
        public string Departament;
        public string Eroare;
        public DepartamentObiect()
        {
            Id = "";
            CodDepartament = "";
            Departament = "";
            Eroare = "";
        }
    }
    public class FiltruDepartamenteObiect
    {
        public string Find;
        public string FiltruDepartament;
        public FiltruDepartamenteObiect()
        {
            Find = "";
            FiltruDepartament = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class DepartamenteWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public DepartamenteObiect DepartamenteLista(FiltruDepartamenteObiect oFiltruDepartament, int PaginaCurenta)
        {
            DepartamenteObiect oDepartamente = new DepartamenteObiect();
            if (GlobalClass.VerificareAcces("Departamente", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tDepartamente in dcWbmOlimpias.Departamentes
                            where tDepartamente.Departament.Contains(oFiltruDepartament.FiltruDepartament) && !tDepartamente.DataAdaugare.Equals(null)
                            orderby tDepartamente.Departament, tDepartamente.Id
                            select new { tDepartamente.Id,tDepartamente.CodDepartament ,tDepartamente.Departament };

                
                oDepartamente.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruDepartament.Find == "")
                {
                    oDepartamente.PaginaCurenta = PaginaCurenta;
                    oDepartamente.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruDepartament.Find)));

                    oDepartamente.PaginaCurenta = Pozitie / 5 + 1;
                    oDepartamente.IndexRand = Pozitie - (oDepartamente.PaginaCurenta - 1) * 5;
                }
                if (oDepartamente.NumarPagini < oDepartamente.PaginaCurenta)
                    oDepartamente.PaginaCurenta = oDepartamente.NumarPagini;
                if (oDepartamente.PaginaCurenta < 1)
                    oDepartamente.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oDepartamente.PaginaCurenta - 1)).Take(5))
                {
                    DepartamentObiect oDepartament = new DepartamentObiect();
                    oDepartament.Id = rezultat.Id.ToString();
                    oDepartament.CodDepartament = rezultat.CodDepartament;
                    oDepartament.Departament = rezultat.Departament;
                    oDepartamente.Tabela.Add(oDepartament);
                }
            }
            else
                oDepartamente.Eroare = "Acces interzis!";
            return oDepartamente;
        }
        [WebMethod(EnableSession = false)]
        public DepartamentObiect DepartamentProprietati(string Id)
        {
            DepartamentObiect oDepartament = new DepartamentObiect();
            if (GlobalClass.VerificareAcces("Departamente", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tDepartamente in dcWbmOlimpias.Departamentes
                            where tDepartamente.Id.Equals(Id)
                            select new { tDepartamente.Id, tDepartamente.Departament, tDepartamente.CodDepartament };
                oDepartament.Departament = query.First().Departament;
                oDepartament.CodDepartament = query.First().CodDepartament;
            }
            else
                oDepartament.Eroare = "Acces interzis!";
            return oDepartament;
        }
        [WebMethod(EnableSession = false)]
        public DepartamentObiect DepartamentAdaugare(DepartamentObiect oDepartament)
        {
            if (GlobalClass.VerificareAccesOperatie("Departamente", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oDepartament.Eroare = VerificareDate(oDepartament);
                if (oDepartament.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.DepartamentAdaugare(oDepartament.CodDepartament, oDepartament.Departament, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oDepartament.Eroare = InterpretareEroare(IdEroare.ToString());
                    oDepartament.Id = Id.ToString();
                }
                if (oDepartament.Eroare != "")
                {
                    oDepartament.Id = "";
                }
            }
            else
                oDepartament.Eroare = "Nu aveti drept de adaugare!";
            return oDepartament;
        }
        [WebMethod(EnableSession = false)]
        public DepartamentObiect DepartamentModificare(DepartamentObiect oDepartament)
        {
            if (GlobalClass.VerificareAccesOperatie("Departamente", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oDepartament.Eroare = VerificareDate(oDepartament);
                if (oDepartament.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.DepartamentModificare(oDepartament.CodDepartament, oDepartament.Departament, Convert.ToInt32("1"), Convert.ToInt32(oDepartament.Id), ref IdEroare);
                    oDepartament.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oDepartament.Eroare != "")
                {
                    oDepartament.Id = "";
                }
            }
            else
                oDepartament.Eroare = "Nu aveti drept de modificare!";
            return oDepartament;
        }
        [WebMethod(EnableSession = false)]
        public string DepartamentStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Departamente", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.DepartamentStergere(Convert.ToInt32("1"),Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(DepartamentObiect oDepartament)
        {
            string Eroare = "";
            if (oDepartament.Departament == "")
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
                    Eroare = "Departament existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul Departament!";
                    break;
                case "4":
                    Eroare = "Departament nu se poate sterge, sunt date salvate cu aceasta Departament!";
                    break;
            }
            return Eroare;
        }

    }
}