using System;
using System.Data;
using System.Linq;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;

namespace WbmOlimpias
{
    public class RaportAbsenteGiornalieroObiect
    {
        public List<RaportAbsentaGiornalieroObiect> TabelaAbsenteDepartamentOre;
        public int NumarZile;
        public string Luna;
        public string Departament;
        public string Eroare;
        public string Linie;
        public string Categorie;
        public RaportAbsenteGiornalieroObiect()
        {
            NumarZile = 0;
            Luna = "";
            Linie = "";
            Departament = "";
            Categorie = "";
            TabelaAbsenteDepartamentOre = new List<RaportAbsentaGiornalieroObiect>();
            Eroare = "";
        }
    }
    public class RaportAbsentaGiornalieroObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string Angajat;
        public string PostDeLucru;
        public string Linie;
        public string EchipaLinie;
        public List<ValoareZilnicaObiectGiornaliero> ValoriZilnice;
        public string Total;
        public string TotalFerie;
        public string Eroare;
        public string Departament;
        public string Categorie;
        public RaportAbsentaGiornalieroObiect(int NumarZile)
        {
            Id = "";
            NumeClasa = "rNeselectat";
            Angajat = "";
            PostDeLucru = "";
            Linie = "";
            EchipaLinie = "";
            Categorie = "";
            Departament = "";

            ValoriZilnice = new List<ValoareZilnicaObiectGiornaliero>();
            for (int i = 0; i < NumarZile; i++)
            {
                var oValoareZilnica = new ValoareZilnicaObiectGiornaliero();
                ValoriZilnice.Add(oValoareZilnica);
            }
            Total = "";
            Eroare = "";
        }
    }

    public class ValoareZilnicaObiectGiornaliero
    {
        public string Ore;
        public bool InMaternitate;
        public ValoareZilnicaObiectGiornaliero()
        {
            Ore = "";
            InMaternitate = false;
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportAbsenteGiornalieroWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportAbsenteGiornalieroObiect RaportAbsenteDepartamentLista(string FiltruAn, string FiltruLuna)
        {
            RaportAbsenteGiornalieroObiect oRaportAbsenteDepartament = new RaportAbsenteGiornalieroObiect();
            oRaportAbsenteDepartament.Luna = "Mese: " + FiltruLuna;
            oRaportAbsenteDepartament.NumarZile = DateTime.DaysInMonth(Convert.ToInt32(FiltruAn), Convert.ToInt32(FiltruLuna));
            oRaportAbsenteDepartament.TabelaAbsenteDepartamentOre.AddRange(PreparaAbsenteDepartamentOre(FiltruAn, FiltruLuna, oRaportAbsenteDepartament.NumarZile));

            return oRaportAbsenteDepartament;
        }

        private List<RaportAbsentaGiornalieroObiect> PreparaAbsenteDepartamentOre(string FiltruAn, string FiltruLuna, int NumarZile)
        {
            List<RaportAbsentaGiornalieroObiect> TabelaAbsenteDepartamentProcent = new List<RaportAbsentaGiornalieroObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();

            var query = from tAbsenteOre in dcWbmOlimpias.AbsenteOreGiornalieroAllViews
                        orderby tAbsenteOre.SortHelper,  tAbsenteOre.Departament,tAbsenteOre.Categorie,  tAbsenteOre.Zi
                        where tAbsenteOre.An.Equals(FiltruAn) && tAbsenteOre.Luna.Equals(FiltruLuna) 
                        select new { tAbsenteOre.SortHelper, tAbsenteOre.Zi, tAbsenteOre.Categorie, tAbsenteOre.Ore, tAbsenteOre.Departament };
            string Departament = "&&&Departament&&&";
            string Categorie = "&&&Categorie&&&";
            string Totalee = "&&&Totalee&&&";
             
            RaportAbsentaGiornalieroObiect oRaportAbsentaDepartament = new RaportAbsentaGiornalieroObiect(NumarZile);
            int i = 0;
            foreach (var item in TabelaAbsenteDepartamentProcent)
            {
                if (item.ValoriZilnice == oRaportAbsentaDepartament.ValoriZilnice)
                {
                    item.Id = (i++).ToString();
                }
            }
            TabelaAbsenteDepartamentProcent.Add(oRaportAbsentaDepartament);


            foreach (var rezultat in query)
            {

               if (Departament != rezultat.Departament || Categorie != rezultat.Categorie)
                {

                    if (Departament != "&&&Departament&&&")
                    {
                        TabelaAbsenteDepartamentProcent.Add(oRaportAbsentaDepartament);
                    }


                    oRaportAbsentaDepartament = new RaportAbsentaGiornalieroObiect(NumarZile);
                    if (Departament != rezultat.Departament )
                        oRaportAbsentaDepartament.Departament = rezultat.Departament;
                        oRaportAbsentaDepartament.Categorie = rezultat.Categorie;
                        Departament = rezultat.Departament;
                        Categorie = rezultat.Categorie;
                        Totalee = rezultat.Ore.Value.ToString("N1");
                }

                if (rezultat.Zi.Value == 32 )
                    oRaportAbsentaDepartament.Total = rezultat.Ore.Value.ToString("N1");
                else if (rezultat.Zi.Value <= NumarZile)
                    oRaportAbsentaDepartament.ValoriZilnice[rezultat.Zi.Value - 1].Ore = rezultat.Ore.Value.ToString("N1");
               
            }

         


            if (Departament != "&&&Departament&&&")
            {
                try
                {
                    TabelaAbsenteDepartamentProcent.Add(oRaportAbsentaDepartament);
                    var temp = TabelaAbsenteDepartamentProcent.Where(x => x.Departament.Equals("")).First();
                    //temp.NumeClasa = "rSelectat peki321";
                    temp.Angajat = "TOTALE";
                    temp.PostDeLucru = "&nbsp;";
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
        public RaportAbsenteGiornalieroObiect RaportAbsenteDepartamentExcel(string FiltruAn, string FiltruLuna)
        {
            return RaportAbsenteDepartamentLista(FiltruAn, FiltruLuna);
        }
    }
}