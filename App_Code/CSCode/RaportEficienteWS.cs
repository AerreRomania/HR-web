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
    public class RaportEficienteObiect
    {
        public List<RaportEficientaObiect> Tabela;
        public List<RaportEficientaLunaObiect> TabelaLuna;
        public List<string> AnLuna;
        public string Perioada;
        public string Eroare;
        public RaportEficienteObiect()
        {
            Perioada = "";
            Tabela = new List<RaportEficientaObiect>();
            TabelaLuna = new List<RaportEficientaLunaObiect>();
            AnLuna = new List<string>();
            Eroare = "";
        }
    }
    public class RaportEficientaObiect
    {
        public string NumeClasa; // pentru css style
        public string NrCrt;
        public string Nume;
        public string Prenume;
        public string PostDeLucru;
        public string LinieEchipa;
        public string DataAngajarii;
        public string OreLucratoare;
        public string OreLucrate;
        public string OreAbsente;
        public string OreAbsenteNemotivate;
        public string ProcentAbsenteLucratoare;
        public string Eficienta;
        public string Eroare;
        public RaportEficientaObiect()
        {
            
            NumeClasa = "rNeselectat";
            NrCrt = "";
            Nume = "";
            Prenume = "";
            PostDeLucru = "";
            LinieEchipa = "";
            DataAngajarii = "";
            OreLucratoare = "";
            OreLucrate = "";
            OreAbsente = "";
            OreAbsenteNemotivate = "";
            ProcentAbsenteLucratoare = "";
            Eficienta = "";
            Eroare = "";
        }
    }


    public class RaportEficientaLunaObiect
    {
        public string NumeClasa; // pentru css style
        public string NrCrt;
        public string Nume;
        public string Prenume;
        public string PostDeLucru;
        public string LinieEchipa;
        public string DataAngajarii;
        public List<string> Eficiente;
        public string Eroare;
        public RaportEficientaLunaObiect()
        {

            NumeClasa = "rNeselectat";
            NrCrt = "";
            Nume = "";
            Prenume = "";
            PostDeLucru = "";
            LinieEchipa = "";
            DataAngajarii = "";
            Eficiente = new List<string>();
            Eroare = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class RaportEficienteWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportEficienteObiect RaportEficienteLista(string FiltruDeLa, string FiltruPanaLa, string FiltruDepartament, string Ordonat, string TipFiltru)
        {
            DateTime dateDeLa, datePanaLa;
            RaportEficienteObiect oRaportEficiente = new RaportEficienteObiect();
            
            if (TipFiltru == "Perioada")
            {
                oRaportEficiente.Perioada = FiltruDeLa + " - " + FiltruPanaLa;
                if (!DateTime.TryParseExact(FiltruDeLa.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out dateDeLa))
                    oRaportEficiente.Eroare = "Date its not corect!";

                if (!DateTime.TryParseExact(FiltruPanaLa.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out datePanaLa))
                    oRaportEficiente.Eroare = "Date its not corect!";
            }
            else
            {
                oRaportEficiente.Perioada = FiltruDeLa + FiltruPanaLa;
                dateDeLa = new DateTime(Convert.ToInt32(FiltruDeLa), Convert.ToInt32(FiltruPanaLa), 1);
                datePanaLa = dateDeLa.AddMonths(1).AddDays(-1);
            }
            if (oRaportEficiente.Eroare == "")
            {
                if (GlobalClass.VerificareAcces("Raport numar angajati", "1"))
                {
                    if (Ordonat != "1")
                        oRaportEficiente.Tabela.AddRange(PreparaRaportEficiente(dateDeLa, datePanaLa, FiltruDepartament, Ordonat));
                    else
                        oRaportEficiente = PreparaRaportEficienteLuna(dateDeLa, datePanaLa, FiltruDepartament);
                }
                else
                    oRaportEficiente.Eroare = "Acces interzis!";
            }
            return oRaportEficiente;
        }

        private List<RaportEficientaObiect> PreparaRaportEficiente(DateTime FiltruDeLa, DateTime FiltruPanaLa, string FiltruDepartament, string Ordonat)
        {
            List<RaportEficientaObiect> Tabela = new List<RaportEficientaObiect>();
            dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tRaportEficiente in dcWbmOlimpias.RaportEficienteViews
                        where tRaportEficiente.Data>=FiltruDeLa && tRaportEficiente.Data<=FiltruPanaLa && tRaportEficiente.Departament.Equals(FiltruDepartament)
                        group tRaportEficiente by new {tRaportEficiente.Nume, tRaportEficiente.Prenume, tRaportEficiente.DataAngajarii, tRaportEficiente.PostDeLucru, tRaportEficiente.Echipa, tRaportEficiente.Linie} into t
                        select new { t.Key.Nume, t.Key.Prenume, t.Key.DataAngajarii, t.Key.PostDeLucru, t.Key.Echipa, t.Key.Linie, OreLucratoare = t.Sum(x => x.OreLucratoare), OreLucrate = t.Sum(x => x.OreLucrate), OreAbsente = t.Sum(x => x.OreAbsente),  OreAbsenteNemotivate=t.Sum(x=>x.OreAbsenteNemotivate), Eficienta = t.Sum(x => x.Eficienta) / t.Count() };
             
            RaportEficientaObiect oRaportEficienta = new RaportEficientaObiect();

            switch (Ordonat)
            {
                case "0":
                    query = query.OrderByDescending(x => x.OreAbsente);
                    break;
                case "2":
                    query = query.OrderBy(x => x.DataAngajarii);
                    break;
                case "3":
                    query = query.OrderBy(x => x.Nume).ThenBy(x => x.Prenume);
                    break;
                case "4":
                    query = query.OrderBy(x => x.Linie).ThenBy(x => x.Echipa);
                    break;
            }
            int i = 0;
            string LinieEchipa = "";
            foreach (var rezultat in query)
            {
                i++;
                oRaportEficienta = new RaportEficientaObiect();
                oRaportEficienta.NrCrt = i.ToString();
                oRaportEficienta.Nume = rezultat.Nume;
                oRaportEficienta.Prenume = rezultat.Prenume;
                oRaportEficienta.PostDeLucru = rezultat.PostDeLucru;

                if (!String.IsNullOrEmpty(rezultat.Linie))
                    LinieEchipa = rezultat.Linie;
                else if (!String.IsNullOrEmpty(rezultat.Echipa))
                    LinieEchipa = rezultat.Echipa;
                else
                    LinieEchipa = "";
                oRaportEficienta.LinieEchipa = LinieEchipa;
                oRaportEficienta.DataAngajarii = rezultat.DataAngajarii.ToString("dd.MM.yyyy");
                if (rezultat.OreLucratoare.HasValue)
                    oRaportEficienta.OreLucratoare = rezultat.OreLucratoare.Value.ToString();
                if (rezultat.OreLucrate.HasValue)
                    oRaportEficienta.OreLucrate = rezultat.OreLucrate.Value.ToString();
                if (rezultat.OreAbsente.HasValue)
                    oRaportEficienta.OreAbsente = rezultat.OreAbsente.Value.ToString();
                if (rezultat.OreAbsenteNemotivate.HasValue)
                    oRaportEficienta.OreAbsenteNemotivate = rezultat.OreAbsenteNemotivate.Value.ToString();
                if (rezultat.OreLucratoare.HasValue && rezultat.OreAbsente.HasValue)
                    if (rezultat.OreAbsente > 0)
                        oRaportEficienta.ProcentAbsenteLucratoare = (100 * rezultat.OreAbsente.Value / rezultat.OreLucratoare.Value).ToString("N1");
                if (rezultat.Eficienta.HasValue)
                    oRaportEficienta.Eficienta = rezultat.Eficienta.Value.ToString("N1");

                Tabela.Add(oRaportEficienta);


            }
            return Tabela;
        }

        private RaportEficienteObiect PreparaRaportEficienteLuna(DateTime FiltruDeLa, DateTime FiltruPanaLa, string FiltruDepartament)
        {
            RaportEficienteObiect oRaportEficiente = new RaportEficienteObiect();
            var Tabela = oRaportEficiente.TabelaLuna;
            dcWbmOlimpias = new DataClassWbmOlimpias();
            int deLa = FiltruDeLa.Year * 100 + FiltruDeLa.Month;
            int panaLa = FiltruPanaLa.Year * 100 + FiltruPanaLa.Month;
            var query = from tRaportEficiente in dcWbmOlimpias.RaportEficienteLunarViews
                        where tRaportEficiente.AnLuna >= deLa && tRaportEficiente.AnLuna <= panaLa && tRaportEficiente.Departament.Equals(FiltruDepartament)
                        orderby tRaportEficiente.AnLuna,tRaportEficiente.Eficienta descending
                        select tRaportEficiente;
            RaportEficientaLunaObiect oRaportEficienta = new RaportEficientaLunaObiect();
            int i = 0;
            string LinieEchipa = "";

            var queryLunaAn = query.GroupBy(x => x.AnLuna).OrderBy(x => x.Key);
            foreach(var rezLunaAn in queryLunaAn)
            {
                var sLuna = rezLunaAn.Key.Value.ToString();
                oRaportEficiente.AnLuna.Add(sLuna.Substring(0,4) + " " + GlobalClass.ConversieNumarInLuna(Convert.ToInt32(sLuna.Substring(4))));
            }

            foreach (var rezultat in query)
            {
                i++;
                if (!String.IsNullOrEmpty(rezultat.Linie))
                    LinieEchipa = rezultat.Linie;
                else if (!String.IsNullOrEmpty(rezultat.Echipa))
                    LinieEchipa = rezultat.Echipa;
                else
                    LinieEchipa = "";
                var querySecund = Tabela.Where(x => x.Nume.Equals(rezultat.Nume) && x.Prenume.Equals(rezultat.Prenume) && x.PostDeLucru.Equals(rezultat.PostDeLucru) && x.LinieEchipa.Equals(LinieEchipa));
                if(querySecund.Count()==0)
                {
                    oRaportEficienta = new RaportEficientaLunaObiect();
                    oRaportEficienta.NrCrt = i.ToString();
                    oRaportEficienta.Nume = rezultat.Nume;
                    oRaportEficienta.Prenume = rezultat.Prenume;
                    oRaportEficienta.PostDeLucru = rezultat.PostDeLucru;
                    oRaportEficienta.LinieEchipa = LinieEchipa;
                    oRaportEficienta.DataAngajarii = rezultat.DataAngajarii.ToString("dd.MM.yyyy");
                    if (rezultat.Eficienta.HasValue)
                        oRaportEficienta.Eficiente.Add(rezultat.Eficienta.Value.ToString("N1"));
                    else
                        oRaportEficienta.Eficiente.Add("");
                    Tabela.Add(oRaportEficienta);
                }
                else
                {
                    oRaportEficienta = querySecund.First();
                    if (rezultat.Eficienta.HasValue)
                        oRaportEficienta.Eficiente.Add(rezultat.Eficienta.Value.ToString("N1"));
                    else
                        oRaportEficienta.Eficiente.Add("");
                }
            }
            return oRaportEficiente;
        }
        [WebMethod(EnableSession = false)]
        public RaportEficienteObiect RaportEficienteExcel(string FiltruDeLa, string FiltruPanaLa, string FiltruDepartament, string Ordonat, string TipFiltru)
        {
            return RaportEficienteLista(FiltruDeLa, FiltruPanaLa, FiltruDepartament, Ordonat, TipFiltru);
        }

    }
}