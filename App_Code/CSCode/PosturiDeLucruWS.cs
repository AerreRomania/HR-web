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
    public class PosturiDeLucruObiect
    {
        public List<PostDeLucruObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public PosturiDeLucruObiect()
        {
            Tabela = new List<PostDeLucruObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class PostDeLucruObiect
    {
        public string Id;
        public string CodPostDeLucru;
        public string PostDeLucru;
        public string NumarOrdonare;
        public string Eroare;
        public PostDeLucruObiect()
        {
            Id = "";
            CodPostDeLucru = "";
            PostDeLucru = "";
            NumarOrdonare = "";
            Eroare = "";
        }
    }
    public class FiltruPosturiDeLucruObiect
    {
        public string Find;
        public string FiltruPostDeLucru;
        public FiltruPosturiDeLucruObiect()
        {
            Find = "";
            FiltruPostDeLucru = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class PosturiDeLucruWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public PosturiDeLucruObiect PosturiDeLucruLista(FiltruPosturiDeLucruObiect oFiltruPostDeLucru, int PaginaCurenta)
        {
            PosturiDeLucruObiect oPosturiDeLucru = new PosturiDeLucruObiect();
            if (GlobalClass.VerificareAcces("Posturi de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPosturiDeLucru in dcWbmOlimpias.PosturiDeLucrus
                            where tPosturiDeLucru.PostDeLucru.Contains(oFiltruPostDeLucru.FiltruPostDeLucru) && !tPosturiDeLucru.DataAdaugare.Equals(null)
                            orderby tPosturiDeLucru.PostDeLucru, tPosturiDeLucru.Id
                            select new { tPosturiDeLucru.Id, tPosturiDeLucru.CodPostDeLucru, tPosturiDeLucru.PostDeLucru };

                
                oPosturiDeLucru.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruPostDeLucru.Find == "")
                {
                    oPosturiDeLucru.PaginaCurenta = PaginaCurenta;
                    oPosturiDeLucru.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruPostDeLucru.Find)));

                    oPosturiDeLucru.PaginaCurenta = Pozitie / 5 + 1;
                    oPosturiDeLucru.IndexRand = Pozitie - (oPosturiDeLucru.PaginaCurenta - 1) * 5;
                }
                if (oPosturiDeLucru.NumarPagini < oPosturiDeLucru.PaginaCurenta)
                    oPosturiDeLucru.PaginaCurenta = oPosturiDeLucru.NumarPagini;
                if (oPosturiDeLucru.PaginaCurenta < 1)
                    oPosturiDeLucru.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oPosturiDeLucru.PaginaCurenta - 1)).Take(5))
                {
                    PostDeLucruObiect oPostDeLucru = new PostDeLucruObiect();
                    oPostDeLucru.Id = rezultat.Id.ToString();
                    oPostDeLucru.CodPostDeLucru = rezultat.CodPostDeLucru;
                    oPostDeLucru.PostDeLucru = rezultat.PostDeLucru;
                    oPosturiDeLucru.Tabela.Add(oPostDeLucru);
                }
            }
            else
                oPosturiDeLucru.Eroare = "Acces interzis!";
            return oPosturiDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public PostDeLucruObiect PostDeLucruProprietati(string Id)
        {
            PostDeLucruObiect oPostDeLucru = new PostDeLucruObiect();
            if (GlobalClass.VerificareAcces("Posturi de lucru", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPosturiDeLucru in dcWbmOlimpias.PosturiDeLucrus
                            where tPosturiDeLucru.Id.Equals(Id)
                            select new { tPosturiDeLucru.Id, tPosturiDeLucru.PostDeLucru, tPosturiDeLucru.CodPostDeLucru, tPosturiDeLucru.NumarOrdonare };
                oPostDeLucru.PostDeLucru = query.First().PostDeLucru;
                oPostDeLucru.CodPostDeLucru = query.First().CodPostDeLucru;
                oPostDeLucru.NumarOrdonare = query.First().NumarOrdonare.ToString();
            }
            else
                oPostDeLucru.Eroare = "Acces interzis!";
            return oPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public PostDeLucruObiect PostDeLucruAdaugare(PostDeLucruObiect oPostDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Posturi de lucru", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oPostDeLucru.Eroare = VerificareDate(oPostDeLucru);
                if (oPostDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PostDeLucruAdaugare(oPostDeLucru.CodPostDeLucru, oPostDeLucru.PostDeLucru, Convert.ToInt32(oPostDeLucru.NumarOrdonare), Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oPostDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                    oPostDeLucru.Id = Id.ToString();
                }
                if (oPostDeLucru.Eroare != "")
                {
                    oPostDeLucru.Id = "";
                }
            }
            else
                oPostDeLucru.Eroare = "Nu aveti drept de adaugare!";
            return oPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public PostDeLucruObiect PostDeLucruModificare(PostDeLucruObiect oPostDeLucru)
        {
            if (GlobalClass.VerificareAccesOperatie("Posturi de lucru", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oPostDeLucru.Eroare = VerificareDate(oPostDeLucru);
                if (oPostDeLucru.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.PostDeLucruModificare(oPostDeLucru.CodPostDeLucru, oPostDeLucru.PostDeLucru, Convert.ToInt32(oPostDeLucru.NumarOrdonare), Convert.ToInt32("1"), Convert.ToInt32(oPostDeLucru.Id), ref IdEroare);
                    oPostDeLucru.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oPostDeLucru.Eroare != "")
                {
                    oPostDeLucru.Id = "";
                }
            }
            else
                oPostDeLucru.Eroare = "Nu aveti drept de modificare!";
            return oPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public string PostDeLucruStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Posturi de lucru", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.PostDeLucruStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(PostDeLucruObiect oPostDeLucru)
        {
            string Eroare = "";
            if (oPostDeLucru.PostDeLucru == "")
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
                case "2":
                    Eroare = "Completati campul Post de lucru!";
                    break;
                case "101":
                    Eroare = "Post de lucru existent!";
                    break;
                case "102":
                    Eroare = "Post de lucru existent!";
                    break;
                case "201":
                    Eroare = "Postul de lucru nu se poate sterge, sunt date salvate cu acest Post de lucru!";
                    break;
            }
            return Eroare;
        }

    }
}