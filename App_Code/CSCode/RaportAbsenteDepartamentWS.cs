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
    public class RaportAbsenteDepartamentObiect
    {
        public List<RaportAbsentaDepartamentObiect> TabelaAbsenteDepartamentOre;
        public int NumarZile;
        public string Luna;
        public string Departament;
        public string Eroare;
        public string Linie;
        public RaportAbsenteDepartamentObiect()
        {
            NumarZile = 0;
            Luna = "";
            Linie = "";
            Departament = "";
            TabelaAbsenteDepartamentOre = new List<RaportAbsentaDepartamentObiect>();
            Eroare = "";
        }
    }
    public class RaportAbsentaDepartamentObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string Angajat;
        public string PostDeLucru;
        public string Linie;
        public string EchipaLinie;
        public List<ValoareZilnicaObiect> ValoriZilnice;
        public string Total;
        public string Eroare;
        public RaportAbsentaDepartamentObiect(int NumarZile)
        {
            Id = "";
            NumeClasa = "rNeselectat";
            Angajat = "";
            PostDeLucru = "";
            Linie = "";
            EchipaLinie = "";
            ValoriZilnice = new List<ValoareZilnicaObiect>();
            for (int i = 0; i < NumarZile; i++)
            {
                var oValoareZilnica = new ValoareZilnicaObiect();
                ValoriZilnice.Add(oValoareZilnica);
            }
            Total = "";
            Eroare = "";
        }
    }

    public class ValoareZilnicaObiect
    {
        public string Ore;
        public bool InMaternitate;
        public ValoareZilnicaObiect()
        {
            Ore = "";
            InMaternitate = false;
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportAbsenteDepartamentWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportAbsenteDepartamentObiect RaportAbsenteDepartamentLista(string FiltruAn ,string FiltruLuna, string FiltruDepartament,string FiltruLinea, string FiltruMansione)
        {
            Console.Write(FiltruLinea);
            RaportAbsenteDepartamentObiect oRaportAbsenteDepartament = new RaportAbsenteDepartamentObiect();
            oRaportAbsenteDepartament.Luna = "Mese: " + FiltruLuna;
            oRaportAbsenteDepartament.NumarZile = DateTime.DaysInMonth(Convert.ToInt32(FiltruAn), Convert.ToInt32(FiltruLuna));
            oRaportAbsenteDepartament.TabelaAbsenteDepartamentOre.AddRange(PreparaAbsenteDepartamentOre(FiltruAn, FiltruLuna, FiltruDepartament, oRaportAbsenteDepartament.NumarZile,FiltruLinea,FiltruMansione));

            return oRaportAbsenteDepartament;
        }

        private List<RaportAbsentaDepartamentObiect> PreparaAbsenteDepartamentOre(string FiltruAn, string FiltruLuna, string FiltruDepartament, int NumarZile, string FiltruLinea, string FiltruMansione)
        {
            List<RaportAbsentaDepartamentObiect> TabelaAbsenteDepartamentProcent = new List<RaportAbsentaDepartamentObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                        orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                        where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Departament.Equals(FiltruDepartament)  && tAbsenteDepartamentOre.Ore > 0 
                        select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };

            //Filter by Line
            if (FiltruLinea.Equals("ALL"))
            {
                if (FiltruMansione.Equals("ALL"))
                {
                    query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                            orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                            where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Departament.Equals(FiltruDepartament) && tAbsenteDepartamentOre.Ore > 0
                            select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };
                }
                else
                {
                    query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                            orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                            where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Departament.Equals(FiltruDepartament) && tAbsenteDepartamentOre.Ore > 0 && tAbsenteDepartamentOre.PostDeLucru.Equals(FiltruMansione)
                            select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };
                }
              
            }
            else
            {
                
                if (FiltruMansione.Equals("ALL"))
                {
                    query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                            orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                            where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Departament.Equals(FiltruDepartament) && tAbsenteDepartamentOre.Ore > 0 && tAbsenteDepartamentOre.Linie.Equals(FiltruLinea)
                            select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };
                } else
                {
                    query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                            orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                            where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Departament.Equals(FiltruDepartament) && tAbsenteDepartamentOre.Ore > 0 && tAbsenteDepartamentOre.Linie.Equals(FiltruLinea) && tAbsenteDepartamentOre.PostDeLucru.Equals(FiltruMansione)
                            select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };
                }
            }

      


            //IF Departament is Struttura
            if (FiltruDepartament == "STRUTTURA")
            {
                query = from tAbsenteDepartamentOre in dcWbmOlimpias.AbsenteDepartamentAllViews
                        orderby tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie, tAbsenteDepartamentOre.Zi
                        where tAbsenteDepartamentOre.An.Equals(FiltruAn) && tAbsenteDepartamentOre.Luna.Equals(FiltruLuna) && tAbsenteDepartamentOre.Ore > 0
                        && (tAbsenteDepartamentOre.Departament.Equals("AMMINISTRAZIONE") || tAbsenteDepartamentOre.Departament.Equals("AREA TECNICA") || tAbsenteDepartamentOre.Departament.Equals("CENTRALE TERMICA") || tAbsenteDepartamentOre.Departament.Equals("PERSONALE") || tAbsenteDepartamentOre.Departament.Equals("SERVIZI GENERALI"))  
                        select new { tAbsenteDepartamentOre.Zi, tAbsenteDepartamentOre.Angajat, tAbsenteDepartamentOre.Ore, tAbsenteDepartamentOre.PostDeLucru, tAbsenteDepartamentOre.Echipa, tAbsenteDepartamentOre.Linie };
            }

            string Angajat = "&&&Angajat&&&";
            RaportAbsentaDepartamentObiect oRaportAbsentaDepartament = new RaportAbsentaDepartamentObiect(NumarZile);
            foreach (var rezultat in query)
            {
                if (Angajat != rezultat.Angajat)
                {
                    if (Angajat != "&&&Angajat&&&")
                    {
                        TabelaAbsenteDepartamentProcent.Add(oRaportAbsentaDepartament);
                    }
                    oRaportAbsentaDepartament = new RaportAbsentaDepartamentObiect(NumarZile);
                    if (Angajat != rezultat.Angajat)
                    {
                        oRaportAbsentaDepartament.Angajat = rezultat.Angajat;
                        oRaportAbsentaDepartament.PostDeLucru = rezultat.PostDeLucru;
                        if (!String.IsNullOrEmpty(rezultat.Linie))
                            oRaportAbsentaDepartament.EchipaLinie = rezultat.Linie;
                        else if (!String.IsNullOrEmpty(rezultat.Echipa))
                            oRaportAbsentaDepartament.EchipaLinie = rezultat.Echipa;
                    }
                    Angajat = rezultat.Angajat;
                }
                if (rezultat.Zi.Value == 32)
                    oRaportAbsentaDepartament.Total = rezultat.Ore.Value.ToString("N1");
                else if (rezultat.Zi.Value <= NumarZile)
                    oRaportAbsentaDepartament.ValoriZilnice[rezultat.Zi.Value - 1].Ore = rezultat.Ore.Value.ToString("N1");
            }
            if (Angajat != "&&&Angajat&&&")
            {
                try
                {
                    TabelaAbsenteDepartamentProcent.Add(oRaportAbsentaDepartament);
                    var temp = TabelaAbsenteDepartamentProcent.Where(x => x.Angajat.Equals("")).First();
                    TabelaAbsenteDepartamentProcent.Remove(temp);
                    temp.NumeClasa = "rSelectat tot";
                    temp.Angajat = "TOTALE";
                    temp.PostDeLucru = "&nbsp;";
                    //temp.Linie = "&nbsp;2";
                    temp.EchipaLinie = "&nbsp;";


                    TabelaAbsenteDepartamentProcent.Add(temp);
                }
                catch (Exception)
                {

                } 
            }
            return TabelaAbsenteDepartamentProcent;
        }

        [WebMethod(EnableSession = false)]
        public RaportAbsenteDepartamentObiect RaportAbsenteDepartamentExcel(string FiltruAn, string FiltruLuna, string FiltruDepartament, string FiltruLinea, string FiltruMansione )
        {
            return RaportAbsenteDepartamentLista(FiltruAn, FiltruLuna, FiltruDepartament, FiltruLinea, FiltruMansione);
        }
    }
}