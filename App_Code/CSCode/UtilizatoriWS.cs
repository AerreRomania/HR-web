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
    public class UtilizatoriObiect
    {
        public List<UtilizatorObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public UtilizatoriObiect()
        {
            Tabela = new List<UtilizatorObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class UtilizatorObiect
    {
        public string Id;
        public string Utilizator;
        public string Parola;
        public RolObiect oRol;
        public string Eroare;
        public UtilizatorObiect()
        {
            Id = "";
            Utilizator = "";
            Parola = "";
            oRol = new RolObiect();
            Eroare = "";
        }
    }
    public class FiltruUtilizatoriObiect
    {
        public string Find;
        public string FiltruUtilizator;
        public FiltruUtilizatoriObiect()
        {
            Find = "";
            FiltruUtilizator = "";
        }
    }
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class UtilizatoriWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public UtilizatoriObiect UtilizatoriLista(FiltruUtilizatoriObiect oFiltruUtilizator, int PaginaCurenta)
        {
            UtilizatoriObiect oUtilizatori = new UtilizatoriObiect();
            if (GlobalClass.VerificareAcces("Utilizatori", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tUtilizatori in dcWbmOlimpias.Utilizatoris
                            join tRoluri in dcWbmOlimpias.Roluris on tUtilizatori.IdRol equals tRoluri.Id
                            where tUtilizatori.Utilizator.Contains(oFiltruUtilizator.FiltruUtilizator)
                            orderby tUtilizatori.Utilizator, tUtilizatori.Id
                            select new { tUtilizatori.Id, tUtilizatori.Utilizator, tRoluri.Rol };

                
                oUtilizatori.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruUtilizator.Find == "")
                {
                    oUtilizatori.PaginaCurenta = PaginaCurenta;
                    oUtilizatori.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruUtilizator.Find)));

                    oUtilizatori.PaginaCurenta = Pozitie / 5 + 1;
                    oUtilizatori.IndexRand = Pozitie - (oUtilizatori.PaginaCurenta - 1) * 5;
                }
                if (oUtilizatori.NumarPagini < oUtilizatori.PaginaCurenta)
                    oUtilizatori.PaginaCurenta = oUtilizatori.NumarPagini;
                if (oUtilizatori.PaginaCurenta < 1)
                    oUtilizatori.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oUtilizatori.PaginaCurenta - 1)).Take(5))
                {
                    UtilizatorObiect oUtilizator = new UtilizatorObiect();
                    oUtilizator.Id = rezultat.Id.ToString();
                    oUtilizator.Utilizator = rezultat.Utilizator;
                    oUtilizator.oRol.Rol = rezultat.Rol;
                    oUtilizatori.Tabela.Add(oUtilizator);
                }
            }
            else
                oUtilizatori.Eroare = "Acces interzis!";
            return oUtilizatori;
        }
        [WebMethod(EnableSession = false)]
        public UtilizatorObiect UtilizatorProprietati(string Id)
        {
            UtilizatorObiect oUtilizator = new UtilizatorObiect();
            if (GlobalClass.VerificareAcces("Utilizatori", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tUtilizatori in dcWbmOlimpias.Utilizatoris
                            join tRoluri in dcWbmOlimpias.Roluris on tUtilizatori.IdRol equals tRoluri.Id
                            where tUtilizatori.Id.Equals(Id)
                            select new { tUtilizatori.Id, tUtilizatori.Utilizator, tUtilizatori.Parola, tUtilizatori.IdRol, tRoluri.Rol };
                oUtilizator.Utilizator = query.First().Utilizator;
                oUtilizator.Parola = query.First().Parola;
                oUtilizator.oRol.Id = query.First().IdRol.ToString();
                oUtilizator.oRol.Rol = query.First().Rol;
            }
            else
                oUtilizator.Eroare = "Acces interzis!";
            return oUtilizator;
        }
        [WebMethod(EnableSession = false)]
        public UtilizatorObiect UtilizatorAdaugare(UtilizatorObiect oUtilizator)
        {
            if (GlobalClass.VerificareAccesOperatie("Utilizatori", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oUtilizator.Eroare = VerificareDate(oUtilizator);
                if (oUtilizator.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    //dcWbmOlimpias.UtilizatorAdaugare(oUtilizator.Utilizator, oUtilizator.Parola, Convert.ToInt32(oUtilizator.oRol.Id), Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oUtilizator.Eroare = InterpretareEroare(IdEroare.ToString());
                    oUtilizator.Id = Id.ToString();
                }
                if (oUtilizator.Eroare != "")
                {
                    oUtilizator.Id = "";
                }
            }
            else
                oUtilizator.Eroare = "Nu aveti drept de adaugare!";
            return oUtilizator;
        }
        [WebMethod(EnableSession = false)]
        public UtilizatorObiect UtilizatorModificare(UtilizatorObiect oUtilizator)
        {
            if (GlobalClass.VerificareAccesOperatie("Utilizatori", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oUtilizator.Eroare = VerificareDate(oUtilizator);
                if (oUtilizator.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    //dcWbmOlimpias.UtilizatorModificare(oUtilizator.Utilizator, oUtilizator.Parola, Convert.ToInt32(oUtilizator.oRol.Id), Convert.ToInt32(oUtilizator.Id), ref IdEroare);
                    oUtilizator.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oUtilizator.Eroare != "")
                {
                    oUtilizator.Id = "";
                }
            }
            else
                oUtilizator.Eroare = "Nu aveti drept de modificare!";
            return oUtilizator;
        }
        [WebMethod(EnableSession = false)]
        public string UtilizatorStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Utilizatori", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.UtilizatorStergere(Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        [WebMethod(EnableSession = false)]
        public RolObiect RolCautare(string Rol)
        {
            RolObiect oRol = new RolObiect();
            if (GlobalClass.VerificareAcces("Roluri", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tRoluri in dcWbmOlimpias.Roluris
                            where tRoluri.Rol.Contains(Rol)
                            select new { tRoluri.Id, tRoluri.Rol };
                if (query.Count() == 1)
                {
                    oRol.Id = query.First().Id.ToString();
                    oRol.Rol = query.First().Rol;
                }
            }
            else
                oRol.Eroare = "Acces interzis!";
            return oRol;
        }
        private string VerificareDate(UtilizatorObiect oUtilizator)
        {
            string Eroare = "";
            if (oUtilizator.Utilizator == "")
                Eroare = InterpretareEroare("2");
            if (oUtilizator.oRol.Id == "")
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
                    Eroare = "Utilizator existent!";
                    break;
                case "2":
                    Eroare = "Completati campul Utilizator!";
                    break;
                case "3":
                    Eroare = "Alegeti un Rol!";
                    break;
                case "4":
                    Eroare = "Utilizatorul 'admin' nu se poate sterge!";
                    break;
            }
            return Eroare;
        }

    }
}