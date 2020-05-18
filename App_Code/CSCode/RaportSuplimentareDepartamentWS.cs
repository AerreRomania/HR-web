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
    public class RaportSuplimentareDepartamentObiect
    {
        public List<RaportSuplimentarDepartamentObiect> TabelaSuplimentareDepartamentOre;
        public int NumarZile;
        public string Luna;
        public string Departament;
        public string Eroare;
        public string Linie;

        public RaportSuplimentareDepartamentObiect()
        {
            NumarZile = 0;
            Luna = "";
            Linie = "";

            Departament = "";
            TabelaSuplimentareDepartamentOre = new List<RaportSuplimentarDepartamentObiect>();
            Eroare = "";
        }
    }
    public class RaportSuplimentarDepartamentObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string Angajat;
        public string PostDeLucru;
        public string Linie;

        public string EchipaLinie;
        public List<string> ValoriZilnice;
        public string Total;
        public string Eroare;
        public RaportSuplimentarDepartamentObiect(int NumarZile)
        {
            Id = "";
            NumeClasa = "rNeselectat";
            Angajat = "";
            PostDeLucru = "";
            Linie = "";

            EchipaLinie = "";
            ValoriZilnice = new List<string>();
            for (int i = 0; i < NumarZile; i++)
                ValoriZilnice.Add("");
            Total = "";
            Eroare = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportSuplimentareDepartamentWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportSuplimentareDepartamentObiect RaportSuplimentareDepartamentLista(string FiltruAn ,string FiltruLuna, string FiltruDepartament, string FiltruLinea, string FiltruMansione)
        {
            RaportSuplimentareDepartamentObiect oRaportSuplimentareDepartament = new RaportSuplimentareDepartamentObiect();
            oRaportSuplimentareDepartament.Luna = "Mese: " + FiltruLuna;
            oRaportSuplimentareDepartament.NumarZile = DateTime.DaysInMonth(Convert.ToInt32(FiltruAn), Convert.ToInt32(FiltruLuna));
            oRaportSuplimentareDepartament.TabelaSuplimentareDepartamentOre.AddRange(PreparaSuplimentareDepartamentOre(FiltruAn, FiltruLuna, FiltruDepartament, oRaportSuplimentareDepartament.NumarZile, FiltruLinea, FiltruMansione));

            return oRaportSuplimentareDepartament;
        }

        private List<RaportSuplimentarDepartamentObiect> PreparaSuplimentareDepartamentOre(string FiltruAn, string FiltruLuna, string FiltruDepartament, int NumarZile, string FiltruLinea, string FiltruMansione)
        {
            List<RaportSuplimentarDepartamentObiect> TabelaSuplimentareDepartamentProcent = new List<RaportSuplimentarDepartamentObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                        orderby tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie, tSuplimentareDepartamentOre.Zi
                        where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Departament.Equals(FiltruDepartament) && tSuplimentareDepartamentOre.Ore > 0
                        select new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.Ore, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie };



            //Filter by Line
            if (FiltruLinea.Equals("ALL"))
            {
                if (FiltruMansione.Equals("ALL"))
                {
                     query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                                orderby tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie, tSuplimentareDepartamentOre.Zi
                                where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Departament.Equals(FiltruDepartament) && tSuplimentareDepartamentOre.Ore > 0
                                select new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.Ore, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie };
                }
                else
                {

                     query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                                orderby tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie, tSuplimentareDepartamentOre.Zi
                                where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Departament.Equals(FiltruDepartament) && tSuplimentareDepartamentOre.Ore > 0 && tSuplimentareDepartamentOre.PostDeLucru.Equals(FiltruMansione)
                                select new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.Ore, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie };
                }

            }
            else
            {

                if (FiltruMansione.Equals("ALL"))
                {
                    query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                            orderby tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie, tSuplimentareDepartamentOre.Zi
                            where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Departament.Equals(FiltruDepartament) && tSuplimentareDepartamentOre.Ore > 0 && tSuplimentareDepartamentOre.Linie.Equals(FiltruLinea)
                            select new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.Ore, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie };

                }
                else
                {
                    query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                            orderby tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie, tSuplimentareDepartamentOre.Zi
                            where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Departament.Equals(FiltruDepartament) && tSuplimentareDepartamentOre.Ore > 0 && tSuplimentareDepartamentOre.Linie.Equals(FiltruLinea) && tSuplimentareDepartamentOre.PostDeLucru.Equals(FiltruMansione)
                            select new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.Ore, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie };
                    
                }
            }




            if (FiltruDepartament == "STRUTTURA")
            {
                query = from tSuplimentareDepartamentOre in dcWbmOlimpias.SuplimentareDepartamentAllViews
                        where tSuplimentareDepartamentOre.An.Equals(FiltruAn) && tSuplimentareDepartamentOre.Luna.Equals(FiltruLuna) && tSuplimentareDepartamentOre.Ore > 0
                        && (tSuplimentareDepartamentOre.Departament.Equals("AMMINISTRAZIONE") || tSuplimentareDepartamentOre.Departament.Equals("AREA TECNICA") || tSuplimentareDepartamentOre.Departament.Equals("CENTRALE TERMICA") || tSuplimentareDepartamentOre.Departament.Equals("PERSONALE") || tSuplimentareDepartamentOre.Departament.Equals("SERVIZI GENERALI"))
                        group tSuplimentareDepartamentOre by new { tSuplimentareDepartamentOre.Zi, tSuplimentareDepartamentOre.Angajat, tSuplimentareDepartamentOre.PostDeLucru, tSuplimentareDepartamentOre.Echipa, tSuplimentareDepartamentOre.Linie } into t
                        orderby t.Key.Angajat, t.Key.PostDeLucru, t.Key.Echipa, t.Key.Linie, t.Key.Zi
                        select new { t.Key.Zi, t.Key.Angajat, Ore = t.Sum(x=>x.Ore), t.Key.PostDeLucru, t.Key.Echipa, t.Key.Linie };

            }
            string Angajat = "&&&Angajat&&&";
            RaportSuplimentarDepartamentObiect oRaportSuplimentarDepartament = new RaportSuplimentarDepartamentObiect(NumarZile);
            foreach (var rezultat in query)
            {
                if (Angajat != rezultat.Angajat)
                {
                    if (Angajat != "&&&Angajat&&&")
                    {
                        TabelaSuplimentareDepartamentProcent.Add(oRaportSuplimentarDepartament);
                    }
                    oRaportSuplimentarDepartament = new RaportSuplimentarDepartamentObiect(NumarZile);
                    if (Angajat != rezultat.Angajat)
                    {
                        oRaportSuplimentarDepartament.Angajat = rezultat.Angajat;
                        oRaportSuplimentarDepartament.PostDeLucru = rezultat.PostDeLucru;
                        if (!String.IsNullOrEmpty(rezultat.Echipa))
                            oRaportSuplimentarDepartament.EchipaLinie = rezultat.Linie;
                        else if (!String.IsNullOrEmpty(rezultat.Linie))
                            oRaportSuplimentarDepartament.EchipaLinie = rezultat.Echipa;
                    }
                    Angajat = rezultat.Angajat;
                }
                if (rezultat.Zi.Value == 32)
                    oRaportSuplimentarDepartament.Total = rezultat.Ore.Value.ToString("N1");
                else if (rezultat.Zi.Value <= NumarZile)
                    oRaportSuplimentarDepartament.ValoriZilnice[rezultat.Zi.Value - 1] = rezultat.Ore.Value.ToString("N1");
            }
            if (Angajat != "&&&Angajat&&&")
            {
                try
                {
                    TabelaSuplimentareDepartamentProcent.Add(oRaportSuplimentarDepartament);

                    var temp = TabelaSuplimentareDepartamentProcent.Where(x => x.Angajat.Equals("")).First();
                    TabelaSuplimentareDepartamentProcent.Remove(temp);
                    temp.NumeClasa = "rSelectat tot";
                    temp.Angajat = "TOTALE";
                    temp.PostDeLucru = "&nbsp;";
                    //temp.Linie = "&nbsp;2";
                    temp.EchipaLinie = "&nbsp;";
                    TabelaSuplimentareDepartamentProcent.Add(temp);
                }
                catch (Exception)
                {

                }

            }

            
            return TabelaSuplimentareDepartamentProcent;
        }

        [WebMethod(EnableSession = false)]
        public RaportSuplimentareDepartamentObiect RaportSuplimentareDepartamentExcel(string FiltruAn, string FiltruLuna, string FiltruDepartament, string FiltruLinea, string FiltruMansione)
        {
            return RaportSuplimentareDepartamentLista(FiltruAn, FiltruLuna, FiltruDepartament, FiltruLinea, FiltruMansione);
        }

    }
}