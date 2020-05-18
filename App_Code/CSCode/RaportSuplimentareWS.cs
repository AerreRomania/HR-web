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
    public class RaportSuplimentareObiect
    {
        public List<RaportSuplimentarObiect> TabelaSuplimentareProcent;
        public List<RaportSuplimentarObiect> TabelaSuplimentareOre;
        public List<RaportSuplimentarObiect> TabelaSuplimentareSuplimentare;
        public string An;
        public string Eroare;
        public RaportSuplimentareObiect()
        {
            An = "";
            TabelaSuplimentareProcent = new List<RaportSuplimentarObiect>();
            TabelaSuplimentareOre = new List<RaportSuplimentarObiect>();
            TabelaSuplimentareSuplimentare = new List<RaportSuplimentarObiect>();
            Eroare = "";
        }
    }
    public class RaportSuplimentarObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string Departament;
        public string Categorie;
        public string Ianuarie;
        public string Februarie;
        public string Martie;
        public string Aprilie;
        public string Mai;
        public string Iunie;
        public string Iulie;
        public string August;
        public string Septembrie;
        public string Octombrie;
        public string Noiembrie;
        public string Decembrie;
        public string Medie;
        public string Eroare;
        public RaportSuplimentarObiect()
        {
            Id = "";
            NumeClasa = "rNeselectat";
            Departament = "";
            Categorie = "";
            Ianuarie = "";
            Februarie = "";
            Martie = "";
            Aprilie = "";
            Mai = "";
            Iunie = "";
            Iulie = "";
            August = "";
            Septembrie = "";
            Octombrie = "";
            Noiembrie = "";
            Decembrie = "";
            Medie = "";
            Eroare = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportSuplimentareWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportSuplimentareObiect RaportSuplimentareLista(string FiltruAn)
        {
            RaportSuplimentareObiect oRaportSuplimentare = new RaportSuplimentareObiect();
            oRaportSuplimentare.An = "ANNO " + FiltruAn;

            oRaportSuplimentare.TabelaSuplimentareOre.AddRange(PreparaSuplimentareOre(FiltruAn));
            
            return oRaportSuplimentare;
        }

        private List<RaportSuplimentarObiect> PreparaSuplimentareOre(string FiltruAn)
        {
            List<RaportSuplimentarObiect> TabelaSuplimentareProcent = new List<RaportSuplimentarObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tSuplimentareOre in dcWbmOlimpias.SuplimentareOreAllViews
                        orderby tSuplimentareOre.SortHelper,tSuplimentareOre.Departament, tSuplimentareOre.Categorie, tSuplimentareOre.Luna
                        where tSuplimentareOre.An.Equals(FiltruAn)
                        select new { tSuplimentareOre.Luna, tSuplimentareOre.Categorie, tSuplimentareOre.Ore, tSuplimentareOre.Departament };
            string Departament = "&&&DepartamentNou&&&";
            string Categorie = "";
            RaportSuplimentarObiect oRaportSuplimentar = new RaportSuplimentarObiect();
            foreach (var rezultat in query)
            {
                if (Departament != rezultat.Departament || Categorie != rezultat.Categorie)
                {
                    if (Departament != "&&&DepartamentNou&&&")
                    {
                        TabelaSuplimentareProcent.Add(oRaportSuplimentar);
                    }
                    oRaportSuplimentar = new RaportSuplimentarObiect();
                    if (Departament != rezultat.Departament)
                        oRaportSuplimentar.Departament = rezultat.Departament;
                    oRaportSuplimentar.Categorie = rezultat.Categorie;
                    Departament = rezultat.Departament;
                    Categorie = rezultat.Categorie;
                }
                CompleteazaLuna(rezultat.Luna.Value, rezultat.Ore.Value, oRaportSuplimentar);
            }
            TabelaSuplimentareProcent.Add(oRaportSuplimentar);

            var temp = TabelaSuplimentareProcent.Where(x => x.Categorie.Equals("") && x.Departament.Equals("")).First();
            TabelaSuplimentareProcent.Remove(temp);
            temp.NumeClasa = "rSelectat";
            temp.Categorie = "TOTALE";
            TabelaSuplimentareProcent.Add(temp);

            return TabelaSuplimentareProcent;
        }

        [WebMethod(EnableSession = false)]
        public RaportSuplimentareObiect RaportSuplimentareExcel(string FiltruAn)
        {
            return RaportSuplimentareLista(FiltruAn);
        }

        private void CompleteazaLuna(int Luna, Decimal Valoare,RaportSuplimentarObiect oRaportSuplimentar)
        {
            string sValoare = "";
            if (Valoare != 0)
                sValoare = Valoare.ToString();
            switch (Luna)
            {
                case 1:
                    oRaportSuplimentar.Ianuarie = sValoare;
                    break;
                case 2:
                    oRaportSuplimentar.Februarie = sValoare;
                    break;
                case 3:
                    oRaportSuplimentar.Martie = sValoare;
                    break;
                case 4:
                    oRaportSuplimentar.Aprilie = sValoare;
                    break;
                case 5:
                    oRaportSuplimentar.Mai = sValoare;
                    break;
                case 6:
                    oRaportSuplimentar.Iunie = sValoare;
                    break;
                case 7:
                    oRaportSuplimentar.Iulie = sValoare;
                    break;
                case 8:
                    oRaportSuplimentar.August = sValoare;
                    break;
                case 9:
                    oRaportSuplimentar.Septembrie = sValoare;
                    break;
                case 10:
                    oRaportSuplimentar.Octombrie = sValoare;
                    break;
                case 11:
                    oRaportSuplimentar.Noiembrie = sValoare;
                    break;
                case 12:
                    oRaportSuplimentar.Decembrie = sValoare;
                    break;
                case 13:
                    oRaportSuplimentar.Medie = sValoare;
                    break;
            }
        }
    }
}