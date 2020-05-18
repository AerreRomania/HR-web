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
    public class NiveleStudiiObiect
    {
        public List<NivelStudiuObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public NiveleStudiiObiect()
        {
            Tabela = new List<NivelStudiuObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class NivelStudiuObiect
    {
        public string Id;
        public string NivelStudiu;
        public string Eroare;
        public NivelStudiuObiect()
        {
            Id = "";
            NivelStudiu = "";
            Eroare = "";
        }
    }
    public class FiltruNiveleStudiiObiect
    {
        public string Find;
        public string FiltruNivelStudiu;
        public FiltruNiveleStudiiObiect()
        {
            Find = "";
            FiltruNivelStudiu = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class NiveleStudiiWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public NiveleStudiiObiect NiveleStudiiLista(FiltruNiveleStudiiObiect oFiltruNivelStudiu, int PaginaCurenta)
        {
            NiveleStudiiObiect oNiveleStudii = new NiveleStudiiObiect();
            if (GlobalClass.VerificareAcces("Nivele studii", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tNiveleStudii in dcWbmOlimpias.NiveleStudiis
                            where tNiveleStudii.NivelStudiu.Contains(oFiltruNivelStudiu.FiltruNivelStudiu) && tNiveleStudii.DataStergere.Equals(null)
                            orderby tNiveleStudii.NivelStudiu, tNiveleStudii.Id
                            select new { tNiveleStudii.Id, tNiveleStudii.NivelStudiu };

                
                oNiveleStudii.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruNivelStudiu.Find == "")
                {
                    oNiveleStudii.PaginaCurenta = PaginaCurenta;
                    oNiveleStudii.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruNivelStudiu.Find)));

                    oNiveleStudii.PaginaCurenta = Pozitie / 5 + 1;
                    oNiveleStudii.IndexRand = Pozitie - (oNiveleStudii.PaginaCurenta - 1) * 5;
                }
                if (oNiveleStudii.NumarPagini < oNiveleStudii.PaginaCurenta)
                    oNiveleStudii.PaginaCurenta = oNiveleStudii.NumarPagini;
                if (oNiveleStudii.PaginaCurenta < 1)
                    oNiveleStudii.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oNiveleStudii.PaginaCurenta - 1)).Take(5))
                {
                    NivelStudiuObiect oNivelStudiu = new NivelStudiuObiect();
                    oNivelStudiu.Id = rezultat.Id.ToString();
                    oNivelStudiu.NivelStudiu = rezultat.NivelStudiu;
                    oNiveleStudii.Tabela.Add(oNivelStudiu);
                }
            }
            else
                oNiveleStudii.Eroare = "Acces interzis!";
            return oNiveleStudii;
        }
        [WebMethod(EnableSession = false)]
        public NivelStudiuObiect NivelStudiuProprietati(string Id)
        {
            NivelStudiuObiect oNivelStudiu = new NivelStudiuObiect();
            if (GlobalClass.VerificareAcces("Nivele studii", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tNiveleStudii in dcWbmOlimpias.NiveleStudiis
                            where tNiveleStudii.Id.Equals(Id)
                            select new { tNiveleStudii.Id, tNiveleStudii.NivelStudiu };
                oNivelStudiu.NivelStudiu = query.First().NivelStudiu;
            }
            else
                oNivelStudiu.Eroare = "Acces interzis!";
            return oNivelStudiu;
        }
        [WebMethod(EnableSession = false)]
        public NivelStudiuObiect NivelStudiuAdaugare(NivelStudiuObiect oNivelStudiu)
        {
            if (GlobalClass.VerificareAccesOperatie("Nivele studii", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oNivelStudiu.Eroare = VerificareDate(oNivelStudiu);
                if (oNivelStudiu.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.NivelStudiuAdaugare(oNivelStudiu.NivelStudiu, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oNivelStudiu.Eroare = InterpretareEroare(IdEroare.ToString());
                    oNivelStudiu.Id = Id.ToString();
                }
                if (oNivelStudiu.Eroare != "")
                {
                    oNivelStudiu.Id = "";
                }
            }
            else
                oNivelStudiu.Eroare = "Nu aveti drept de adaugare!";
            return oNivelStudiu;
        }
        [WebMethod(EnableSession = false)]
        public NivelStudiuObiect NivelStudiuModificare(NivelStudiuObiect oNivelStudiu)
        {
            if (GlobalClass.VerificareAccesOperatie("Nivele studii", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oNivelStudiu.Eroare = VerificareDate(oNivelStudiu);
                if (oNivelStudiu.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.NivelStudiuModificare(oNivelStudiu.NivelStudiu, Convert.ToInt32("1"), Convert.ToInt32(oNivelStudiu.Id), ref IdEroare);
                    oNivelStudiu.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oNivelStudiu.Eroare != "")
                {
                    oNivelStudiu.Id = "";
                }
            }
            else
                oNivelStudiu.Eroare = "Nu aveti drept de modificare!";
            return oNivelStudiu;
        }
        [WebMethod(EnableSession = false)]
        public string NivelStudiuStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Nivele studii", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.NivelStudiuStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(NivelStudiuObiect oNivelStudiu)
        {
            string Eroare = "";
            if (oNivelStudiu.NivelStudiu == "")
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
                    Eroare = "NivelStudiu existenta!";
                    break;
                case "2":
                    Eroare = "Completati campul NivelStudiu!";
                    break;
                case "4":
                    Eroare = "NivelStudiu nu se poate sterge, sunt date salvate cu aceasta NivelStudiu!";
                    break;
            }
            return Eroare;
        }

    }
}