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
    public class RaportPrezenteDepartamentObiect
    {
        public List<RaportPrezentaDepartamentObiect> TabelaPrezentaDepartament;
        public List<RaportPrezentaSumarObiect> TabelaPrezentaSumar;
        public string Ziua;
        public string Departament;
        public string Eroare;
        public RaportPrezenteDepartamentObiect()
        {
            Ziua = "";
            Departament = "";
            TabelaPrezentaDepartament = new List<RaportPrezentaDepartamentObiect>();
            TabelaPrezentaSumar = new List<RaportPrezentaSumarObiect>();
            Eroare = "";
        }
    }
    public class RaportPrezentaDepartamentObiect
    {
        public string Grup;
        public List<RaportPrezentaGrupObiect> TabelaPrezentaGrup;
        public RaportPrezentaDepartamentObiect()
        {
            Grup = "";
            TabelaPrezentaGrup = new List<RaportPrezentaGrupObiect>();
        }
    }

    // echipa sau linie
    public class RaportPrezentaGrupObiect
    {
        public string NumeClasa; // pentru css style
        public string ZiLucratoare;
        public string Angajat;
        public string PostDeLucru;
        public string Absent;
        //public string Maternitate;
        public string Ferie;
        public RaportPrezentaGrupObiect()
        {
            NumeClasa = "rNeselectat";
            ZiLucratoare = "";
            Angajat = "";
            PostDeLucru = "";
            Absent = "";
            //Maternitate = "";
            Ferie = "";
        }
    }

    // echipa sau linie
    public class RaportPrezentaSumarObiect
    {
        public string LinieEchipa;
        public string NumarAngajati;
        public string Prezenti;
        public string Absenti;
        public string Procent;
        public string Ferie;
        public RaportPrezentaSumarObiect()
        {
            LinieEchipa = "";
            NumarAngajati = "";
            Prezenti = "";
            Absenti = "";
            Procent = "";
            Ferie = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportPrezenteDepartamentWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportPrezenteDepartamentObiect RaportPrezenteDepartamentLista(string FiltruData, string FiltruDepartament)
        {
            RaportPrezenteDepartamentObiect oRaportPrezenteDepartament = new RaportPrezenteDepartamentObiect();
            oRaportPrezenteDepartament.Ziua = "Mese: " + FiltruData;
            DateTime Data;
            if (!DateTime.TryParseExact(FiltruData.Replace("/", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                oRaportPrezenteDepartament.Eroare = "Choise a date!";
            else
            {
                oRaportPrezenteDepartament.TabelaPrezentaDepartament.AddRange(PreparaPrezenteDepartament(Data, FiltruDepartament));
                oRaportPrezenteDepartament.TabelaPrezentaSumar.AddRange(PreparareRaportSumar(Data, FiltruDepartament));

                // completare date
                int MaxLinii = 0;
                foreach (var oTabelaPrezentaDepartament in oRaportPrezenteDepartament.TabelaPrezentaDepartament)
                {
                    if (MaxLinii < oTabelaPrezentaDepartament.TabelaPrezentaGrup.Count())
                        MaxLinii = oTabelaPrezentaDepartament.TabelaPrezentaGrup.Count();
                }
                /*if (MaxLinii < oRaportPrezenteDepartament.TabelaPrezentaSumar.Count())
                    MaxLinii = oRaportPrezenteDepartament.TabelaPrezentaSumar.Count();*/
                foreach (var oTabelaPrezentaDepartament in oRaportPrezenteDepartament.TabelaPrezentaDepartament)
                {
                    var vCount = oTabelaPrezentaDepartament.TabelaPrezentaGrup.Count();
                    while (oTabelaPrezentaDepartament.TabelaPrezentaGrup.Count() < MaxLinii)
                    {
                        oTabelaPrezentaDepartament.TabelaPrezentaGrup.Add(new RaportPrezentaGrupObiect() { ZiLucratoare = "&nbsp;" });
                    }
                }
                /*while (oRaportPrezenteDepartament.TabelaPrezentaSumar.Count() < MaxLinii)
                {
                    oRaportPrezenteDepartament.TabelaPrezentaSumar.Add(new RaportPrezentaSumarObiect() { LinieEchipa = "&nbsp"});
                }*/
            }

            return oRaportPrezenteDepartament;
        }

        private List<RaportPrezentaDepartamentObiect> PreparaPrezenteDepartament(DateTime FiltruData, string FiltruDepartament)
        {
            List<RaportPrezentaDepartamentObiect> TabelaPrezenteDepartament = new List<RaportPrezentaDepartamentObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tRaportPrezente in dcWbmOlimpias.RaportPrezenteViews
                        orderby tRaportPrezente.Nume, tRaportPrezente.Linie, tRaportPrezente.Echipa
                        where tRaportPrezente.Data.Equals(FiltruData) && tRaportPrezente.Departament.Equals(FiltruDepartament)
                        select new { tRaportPrezente.Nume, tRaportPrezente.ZiLucratoare,tRaportPrezente.ZiLucrata,  tRaportPrezente.ZiFerie, tRaportPrezente.PostDeLucru, tRaportPrezente.Echipa, tRaportPrezente.Linie };

            var queryLinii = query.Where(x => !x.Linie.Equals(null)).GroupBy(x => x.Linie);
            foreach (var rezLinie in queryLinii)
            {
                RaportPrezentaDepartamentObiect oRaportPrezentaDepartament = new RaportPrezentaDepartamentObiect();
                oRaportPrezentaDepartament.Grup = rezLinie.Key;
                var queryGrup = query.Where(x => x.Linie.Equals(rezLinie.Key)).OrderBy(x => x.PostDeLucru);
                foreach (var rezGrup in queryGrup)
                {
                    RaportPrezentaGrupObiect oRaportPrezentaGrup = new RaportPrezentaGrupObiect();
                    oRaportPrezentaGrup.Angajat = rezGrup.Nume;
                    oRaportPrezentaGrup.PostDeLucru = rezGrup.PostDeLucru;
                    oRaportPrezentaGrup.ZiLucratoare = rezGrup.ZiLucratoare.ToString();
                    //oRaportPrezentaGrup.Ferie = rezGrup.ZiFerie.ToString();
                    if (rezGrup.ZiLucrata == 0)
                        oRaportPrezentaGrup.Absent = "1";
                    //if (rezGrup.ZiMaternitate == 1)
                    //    oRaportPrezentaGrup.Maternitate = "1";
                    if (rezGrup.ZiFerie == 1)
                        oRaportPrezentaGrup.Ferie = "1";
                    else
                        oRaportPrezentaGrup.Ferie = "0";
                    oRaportPrezentaDepartament.TabelaPrezentaGrup.Add(oRaportPrezentaGrup);
                }
                TabelaPrezenteDepartament.Add(oRaportPrezentaDepartament);
            }

            return TabelaPrezenteDepartament;
        }

        private List<RaportPrezentaSumarObiect> PreparareRaportSumar(DateTime FiltruData, string FiltruDepartament)
        {
            List<RaportPrezentaSumarObiect> TabelaPrezenteSumar = new List<RaportPrezentaSumarObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tRaportPrezente in dcWbmOlimpias.RaportPrezenteViews
                        where tRaportPrezente.Data.Equals(FiltruData) && tRaportPrezente.Departament.Equals(FiltruDepartament) 
                        group tRaportPrezente by new {tRaportPrezente.Linie,tRaportPrezente.Echipa} into t

                        select new { t.Key.Echipa, t.Key.Linie, NumarAngajati = t.Sum(x => x.ZiLucratoare), Prezenti = t.Sum(x => x.ZiLucrata), Ferie = t.Sum(x=> x.ZiFerie) };
            int NumarAngajati = 0, Prezenti= 0, Absenti = 0, Ferie = 0;
            foreach (var rez in query)
            {
                RaportPrezentaSumarObiect oRaportPrezentaSumar = new RaportPrezentaSumarObiect();
                oRaportPrezentaSumar.LinieEchipa = rez.Linie;
                NumarAngajati = NumarAngajati + rez.NumarAngajati;
                oRaportPrezentaSumar.NumarAngajati = rez.NumarAngajati.ToString();
                Prezenti = Prezenti + rez.Prezenti;
                oRaportPrezentaSumar.Prezenti = rez.Prezenti.ToString();
                Absenti = Absenti + rez.NumarAngajati - rez.Prezenti;
                oRaportPrezentaSumar.Ferie = rez.Ferie.ToString();
                Ferie = Ferie + rez.Ferie;

                //oRaportPrezentaSumar.Maternita = rez.Maternita.ToString();
                //Maternita = Maternita + rez.Maternita;

                oRaportPrezentaSumar.Absenti = (rez.NumarAngajati - rez.Prezenti).ToString();
                if(rez.NumarAngajati>0)
                {
                    oRaportPrezentaSumar.Procent = (100 * (rez.NumarAngajati - rez.Prezenti) / rez.NumarAngajati).ToString("N1");
                }
                TabelaPrezenteSumar.Add(oRaportPrezentaSumar);
            }
            if(query.Count()>0)
            {
                //var queryMaternita = dcWbmOlimpias.RaportPrezenteViews.Where(x=>x.Data.Equals(FiltruData) && x.Departament.Equals(FiltruDepartament) && x.ZiMaternitate.Equals(1));

                RaportPrezentaSumarObiect oRaportPrezentaSumar = new RaportPrezentaSumarObiect();
                //oRaportPrezentaSumar.LinieEchipa = "MATERNITA";
                //oRaportPrezentaSumar.NumarAngajati = queryMaternita.Count().ToString();
                //oRaportPrezentaSumar.Absenti = oRaportPrezentaSumar.NumarAngajati;
                //TabelaPrezenteSumar.Add(oRaportPrezentaSumar);

                oRaportPrezentaSumar = new RaportPrezentaSumarObiect();
                oRaportPrezentaSumar.LinieEchipa = "TOTALE";
                oRaportPrezentaSumar.NumarAngajati = NumarAngajati.ToString();
                oRaportPrezentaSumar.Prezenti = Prezenti.ToString();
                oRaportPrezentaSumar.Absenti = Absenti.ToString();
                oRaportPrezentaSumar.Ferie = Ferie.ToString();
                //oRaportPrezentaSumar.Maternita = Maternita.ToString();
                //oRaportPrezentaSumar.Maternita = queryMaternita.Count().ToString();
                if(NumarAngajati>0)
                    oRaportPrezentaSumar.Procent = (100 * (NumarAngajati - Prezenti) / NumarAngajati).ToString("N1");
                TabelaPrezenteSumar.Add(oRaportPrezentaSumar);
            }
            
            return TabelaPrezenteSumar;
        }

        [WebMethod(EnableSession = false)]
        public RaportPrezenteDepartamentObiect RaportPrezenteDepartamentExcel(string FiltruData, string FiltruDepartament)
        {
            return RaportPrezenteDepartamentLista(FiltruData, FiltruDepartament);
        }

    }
}