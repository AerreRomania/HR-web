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
    public class RaportAbsenteObiect
    {
        public List<RaportAbsentaObiect> TabelaAbsenteProcent;
        public List<RaportAbsentaObiect> TabelaAbsenteOre;
        public List<RaportAbsentaObiect> TabelaAbsenteSuplimentare;
        public string An;
        public string Eroare;
        public RaportAbsenteObiect()
        {
            An = "";
            TabelaAbsenteProcent = new List<RaportAbsentaObiect>();
            TabelaAbsenteOre = new List<RaportAbsentaObiect>();
            TabelaAbsenteSuplimentare = new List<RaportAbsentaObiect>();
            Eroare = "";
        }
    }
    public class RaportAbsentaObiect
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
        public RaportAbsentaObiect()
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
    public class RaportAbsenteWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportAbsenteObiect RaportAbsenteLista(string FiltruAn)
        {
            RaportAbsenteObiect oRaportAbsente = new RaportAbsenteObiect();
            oRaportAbsente.An = "ANNO " + FiltruAn;
            oRaportAbsente.TabelaAbsenteProcent.AddRange(PreparaAbsenteProcent(FiltruAn));
            oRaportAbsente.TabelaAbsenteOre.AddRange(PreparaAbsenteOre(FiltruAn));
            return oRaportAbsente;
        }

        private List<RaportAbsentaObiect> PreparaAbsenteProcent(string FiltruAn)
        {
            List<RaportAbsentaObiect> TabelaAbsenteProcent = new List<RaportAbsentaObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tAbsenteOre in dcWbmOlimpias.AbsenteLucratoareProcentViews
                        orderby tAbsenteOre.SortHelper, tAbsenteOre.Departament, tAbsenteOre.Categorie, tAbsenteOre.Luna
                        where tAbsenteOre.An.Equals(FiltruAn) && tAbsenteOre.Departament != "AREA TECNICA" && tAbsenteOre.Departament != "CENTRALE TERMICA" && tAbsenteOre.Departament != "PERSONALE" && tAbsenteOre.Departament != "00050"
                        select new { tAbsenteOre.Luna, tAbsenteOre.Categorie, tAbsenteOre.Procent, tAbsenteOre.Departament };
            string Departament = "&&&DepartamentNou&&&";
            string Categorie = "";
            RaportAbsentaObiect oRaportAbsenta = new RaportAbsentaObiect();
            foreach (var rezultat in query)
            {
                if (Departament != rezultat.Departament || Categorie != rezultat.Categorie)
                {
                    if (Departament != "&&&DepartamentNou&&&")
                    {
                        TabelaAbsenteProcent.Add(oRaportAbsenta);
                    }
                    oRaportAbsenta = new RaportAbsentaObiect();
                    if (Departament != rezultat.Departament)
                        oRaportAbsenta.Departament = rezultat.Departament;
                    oRaportAbsenta.Categorie = rezultat.Categorie;
                    Departament = rezultat.Departament;
                    Categorie = rezultat.Categorie;
                }
                CompleteazaLuna(rezultat.Luna.Value, rezultat.Procent.Value, oRaportAbsenta);

            }
            TabelaAbsenteProcent.Add(oRaportAbsenta);

            var temp = TabelaAbsenteProcent.First(x => x.Categorie.Equals("") && x.Departament.Equals(""));
            TabelaAbsenteProcent.Remove(temp);
            temp.NumeClasa = "rSelectat";
            temp.Categorie = "TOTALE";
            TabelaAbsenteProcent.Add(temp);


            return TabelaAbsenteProcent;
        }



        private List<RaportAbsentaObiect> PreparaAbsenteOre(string FiltruAn)
        {
            List<RaportAbsentaObiect> TabelaAbsenteProcent = new List<RaportAbsentaObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tAbsenteOre in dcWbmOlimpias.AbsenteOreAllViews
                        orderby tAbsenteOre.SortHelper, tAbsenteOre.Departament, tAbsenteOre.Categorie, tAbsenteOre.Luna
                        where tAbsenteOre.An.Equals(FiltruAn) && tAbsenteOre.Departament != "AREA TECNICA" && tAbsenteOre.Departament != "CENTRALE TERMICA" && tAbsenteOre.Departament != "PERSONALE" && tAbsenteOre.Departament != "00050"
                        select new { tAbsenteOre.Luna, tAbsenteOre.Categorie, tAbsenteOre.Ore, tAbsenteOre.Departament };
            string Departament = "&&&DepartamentNou&&&";
            string Categorie = "";
            RaportAbsentaObiect oRaportAbsenta = new RaportAbsentaObiect();
            foreach (var rezultat in query)
            {
                if (Departament != rezultat.Departament || Categorie != rezultat.Categorie)
                {
                    if (Departament != "&&&DepartamentNou&&&")
                    {
                        TabelaAbsenteProcent.Add(oRaportAbsenta);
                    }
                    oRaportAbsenta = new RaportAbsentaObiect();
                    if (Departament != rezultat.Departament)
                        oRaportAbsenta.Departament = rezultat.Departament;
                    oRaportAbsenta.Categorie = rezultat.Categorie;
                    Departament = rezultat.Departament;
                    Categorie = rezultat.Categorie;
                }
                CompleteazaLuna(rezultat.Luna.Value, rezultat.Ore.Value, oRaportAbsenta);

            }
            TabelaAbsenteProcent.Add(oRaportAbsenta);

            var temp = TabelaAbsenteProcent.Where(x => x.Categorie.Equals("") && x.Departament.Equals("")).First();
            TabelaAbsenteProcent.Remove(temp);
            temp.NumeClasa = "rSelectat";
            temp.Categorie = "TOTALE";
            TabelaAbsenteProcent.Add(temp);


            return TabelaAbsenteProcent;
        }

        [WebMethod(EnableSession = false)]
        public RaportAbsenteObiect RaportAbsenteExcel(string FiltruAn)
        {
            return RaportAbsenteLista(FiltruAn);
        }

        private void CompleteazaLuna(int Luna, Decimal Valoare, RaportAbsentaObiect oRaportAbsenta)
        {
            string sValoare = "";
            if (Valoare != 0)
            {
                sValoare = Valoare.ToString("N1");
            }

            //sValoare = Valoare.ToString("N1");

            switch (Luna)
            {
                case 1:
                    oRaportAbsenta.Ianuarie = sValoare;
                    break;
                case 2:
                    oRaportAbsenta.Februarie = sValoare;
                    break;
                case 3:
                    oRaportAbsenta.Martie = sValoare;
                    break;
                case 4:
                    oRaportAbsenta.Aprilie = sValoare;
                    break;
                case 5:
                    oRaportAbsenta.Mai = sValoare;
                    break;
                case 6:
                    oRaportAbsenta.Iunie = sValoare;
                    break;
                case 7:
                    oRaportAbsenta.Iulie = sValoare;
                    break;
                case 8:
                    oRaportAbsenta.August = sValoare;
                    break;
                case 9:
                    oRaportAbsenta.Septembrie = sValoare;
                    break;
                case 10:
                    oRaportAbsenta.Octombrie = sValoare;
                    break;
                case 11:
                    oRaportAbsenta.Noiembrie = sValoare;
                    break;
                case 12:
                    oRaportAbsenta.Decembrie = sValoare;
                    break;
                case 13:
                    oRaportAbsenta.Medie = sValoare;
                    break;
            }
        }

    }
}