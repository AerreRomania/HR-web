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
    public class RoluriObiect
    {
        public List<RolObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public RoluriObiect()
        {
            Tabela = new List<RolObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class RolObiect
    {
        public string Id;
        public string Rol;
        public string Eroare;
        public RolObiect()
        {
            Id = "";
            Rol = "";
            Eroare = "";
        }
    }
    public class FiltruRoluriObiect
    {
        public string Find;
        public string FiltruRol;
        public FiltruRoluriObiect()
        {
            Find = "";
            FiltruRol = "";
        }
    }
    
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RoluriWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public RoluriObiect RoluriLista(FiltruRoluriObiect oFiltruRoluri, int PaginaCurenta)
        {
            RoluriObiect oRoluri = new RoluriObiect();
            if (GlobalClass.VerificareAcces("Roluri", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tRoluri in dcWbmOlimpias.Roluris
                            where tRoluri.Rol.Contains(oFiltruRoluri.FiltruRol)
                            orderby tRoluri.Rol, tRoluri.Id
                            select new { tRoluri.Id, tRoluri.Rol };
                
                oRoluri.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruRoluri.Find == "")
                {
                    oRoluri.PaginaCurenta = PaginaCurenta;
                    oRoluri.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruRoluri.Find)));

                    oRoluri.PaginaCurenta = Pozitie / 5 + 1;
                    oRoluri.IndexRand = Pozitie - (oRoluri.PaginaCurenta - 1) * 5;
                }
                if (oRoluri.NumarPagini < oRoluri.PaginaCurenta)
                    oRoluri.PaginaCurenta = oRoluri.NumarPagini;
                if (oRoluri.PaginaCurenta < 1)
                    oRoluri.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oRoluri.PaginaCurenta - 1)).Take(5))
                {
                    RolObiect oRol = new RolObiect();
                    oRol.Id = rezultat.Id.ToString();
                    oRol.Rol = rezultat.Rol;
                    oRoluri.Tabela.Add(oRol);
                }
            }
            else
                oRoluri.Eroare = "Acces interzis!";
            return oRoluri;
        }
        [WebMethod(EnableSession=true)]
        public RolObiect RolProprietati(string Id)
        {
            RolObiect oRol = new RolObiect();
            if (GlobalClass.VerificareAcces("Roluri", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tRoluri in dcWbmOlimpias.Roluris
                            where tRoluri.Id.Equals(Id)
                            select new { tRoluri.Id, tRoluri.Rol };

                
                oRol.Rol = query.First().Rol;
            }
            else
                oRol.Eroare = "Acces interzis!";
            return oRol;
        }
        [WebMethod(EnableSession=true)]
        public RolObiect RolAdaugare(RolObiect oRol)
        {
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null;
                oRol.Eroare = VerificareDate(oRol);
                if (oRol.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.RolAdaugare(oRol.Rol, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oRol.Eroare = InterpretareEroare(IdEroare.ToString());
                    oRol.Id = Id.ToString();
                }
                if (oRol.Eroare != "")
                {
                    oRol.Id = "";
                }
            }
            else
                oRol.Eroare = "Nu aveti drept de adaugare!";
            return oRol;
        }
        [WebMethod(EnableSession=true)]
        public RolObiect RolModificare(RolObiect oRol)
        {
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null;
                oRol.Eroare = VerificareDate(oRol);
                if (oRol.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.RolModificare(oRol.Rol, Convert.ToInt32(oRol.Id), ref IdEroare);
                    oRol.Eroare = InterpretareEroare(IdEroare.ToString());
                }
                if (oRol.Eroare != "")
                {
                    oRol.Id = "";
                }
            }
            else
                oRol.Eroare = "Nu aveti drept de modificare!";
            return oRol;
        }
        [WebMethod(EnableSession=true)]
        public string RolStergere(string Id)
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Roluri", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.RolStergere(Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        private string VerificareDate(RolObiect bdco)
        {
            string Eroare = "";
            if (bdco.Rol == "")
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
                    Eroare = "Rol existent!";
                    break;
                case "2":
                    Eroare = "Completati campul Rol!";
                    break;
                case "4":
                    Eroare = "Rolul nu se poate sterge, sunt date salvate cu acest Rol!";
                    break;
            }
            return Eroare;
        }

    }
}