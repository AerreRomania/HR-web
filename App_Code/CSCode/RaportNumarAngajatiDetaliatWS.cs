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
    public class RaportNumarAngajatiDetaliatObiect
    {
        public List<RaportNumarAngajatDetaliatObiect> Tabela;
        public string An;
        public string Dep;
        public string PostDeLucru;
        public string Eroare;
        public RaportNumarAngajatiDetaliatObiect()
        {
            Dep = "";
            An = "";
            PostDeLucru = "";
            Tabela = new List<RaportNumarAngajatDetaliatObiect>();
            Eroare = "";
        }
    }
    public class RaportNumarAngajatDetaliatObiect
    {
        public string Id;
        public string NumeClasa; // pentru css style
        public string Departament;
        public string TipPostDeLucru;
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
        public RaportNumarAngajatDetaliatObiect()
        {
            Id = "";
            NumeClasa = "rNeselectat";
            Departament = "";
            TipPostDeLucru = "";
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
    public class RaportNumarAngajatiDetaliatWS : System.Web.Services.WebService
    {
        DataClassWbmOlimpias dcWbmOlimpias;
        [WebMethod(EnableSession = false)]
        public RaportNumarAngajatiDetaliatObiect RaportNumarAngajatiDetaliatLista(string FiltruAn, string FiltruDep, string FiltruMansione)
        {
            RaportNumarAngajatiDetaliatObiect oRaportNumarAngajatiDetaliat = new RaportNumarAngajatiDetaliatObiect();
            oRaportNumarAngajatiDetaliat.An = "ANNO " + FiltruAn;
            oRaportNumarAngajatiDetaliat.Dep = "DEPARTAMENT " + FiltruDep;
            oRaportNumarAngajatiDetaliat.PostDeLucru = "MANSIONE " + FiltruMansione;
            if (FiltruDep != "ALL")
            {
                if (FiltruMansione != "ALL")
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();                    
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViews.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament.Equals(FiltruDep) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDepMat(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);
                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalByDepNonMaternita(FiltruAn, FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
                else
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViews.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament.Equals(FiltruDep)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDepMat(FiltruAn, Departament, FiltruMansione));
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);
                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }              
            }
            else
            {
                if (FiltruMansione != "ALL")
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViews.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    //int brojangajata = 0;
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";

                    //TOTALE NA TOP'u
                    oRaportNumarAngajatiDetaliat.Tabela.Add(Total(FiltruAn));
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalByDepNonMaternita(FiltruAn, FiltruMansione));

                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }

                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDepMat(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }


                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
                else
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViews.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    //int brojangajata = 0;
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";

                    //TOTALE NA TOP'u
                    oRaportNumarAngajatiDetaliat.Tabela.Add(Total(FiltruAn));
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }

                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDepMat(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }


                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrare(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucru(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
            }
            
            return oRaportNumarAngajatiDetaliat;
        }

        private void CompleteazaLuna(int Luna, int NumarAngajati,RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat)
        {
            string sNumarAngajati = "";
            if (NumarAngajati != 0)
                sNumarAngajati = NumarAngajati.ToString();
            switch (Luna)
            {
                case 1:
                    oRaportNumarAngajatDetaliat.Ianuarie = sNumarAngajati;
                    break;
                case 2:
                    oRaportNumarAngajatDetaliat.Februarie = sNumarAngajati;
                    break;
                case 3:
                    oRaportNumarAngajatDetaliat.Martie = sNumarAngajati;
                    break;
                case 4:
                    oRaportNumarAngajatDetaliat.Aprilie = sNumarAngajati;
                    break;
                case 5:
                    oRaportNumarAngajatDetaliat.Mai = sNumarAngajati;
                    break;
                case 6:
                    oRaportNumarAngajatDetaliat.Iunie = sNumarAngajati;
                    break;
                case 7:
                    oRaportNumarAngajatDetaliat.Iulie = sNumarAngajati;
                    break;
                case 8:
                    oRaportNumarAngajatDetaliat.August = sNumarAngajati;
                    break;
                case 9:
                    oRaportNumarAngajatDetaliat.Septembrie = sNumarAngajati;
                    break;
                case 10:
                    oRaportNumarAngajatDetaliat.Octombrie = sNumarAngajati;
                    break;
                case 11:
                    oRaportNumarAngajatDetaliat.Noiembrie = sNumarAngajati;
                    break;
                case 12:
                    oRaportNumarAngajatDetaliat.Decembrie = sNumarAngajati;
                    break;
            }
        }

        private List<RaportNumarAngajatDetaliatObiect> GrupatPeIncadrare(string An, string FiltruDepartament, string FiltruMansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            if (FiltruDepartament != "ALL")
            {
                if (FiltruMansione != "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }

            }
            else
            {
                if (FiltruMansione != "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An)  && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {

                    
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                            orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                            where tNumarAngajati.An.Equals(An) 
                            select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);

                }
            }
            return oRaportNumarAngajatiDetaliat;
        }
        
        private List<RaportNumarAngajatDetaliatObiect> GrupatPeTipPostDeLucru(string An, string FiltruDepartament, string FiltruMansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();

            if (FiltruDepartament != "ALL")
            {
                if (FiltruMansione != "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
            }
            else
            {
                if (FiltruMansione != "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                   
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
            }
           
            return oRaportNumarAngajatiDetaliat;
        }

        private RaportNumarAngajatDetaliatObiect Total(string An)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                        where tNumarAngajati.An.Equals(An)
                        group tNumarAngajati by new { tNumarAngajati.Luna } into t
                        select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
            foreach (var rezultat in query)
            {
                
                CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

            }
            oRaportNumarAngajatDetaliat.Departament = "TOTALE GENERALE";
            oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";

            return oRaportNumarAngajatDetaliat;
        }

        private RaportNumarAngajatDetaliatObiect TotalByDepNonMaternita(string An,string Mansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                        where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                        group tNumarAngajati by new { tNumarAngajati.Luna } into t
                        select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
            foreach (var rezultat in query)
            {

                CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

            }
            oRaportNumarAngajatDetaliat.Departament = "TOTALE";
            oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";

            return oRaportNumarAngajatDetaliat;
        }

        private RaportNumarAngajatDetaliatObiect TotalByDepMaternita(string An, string Mansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                        where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                        group tNumarAngajati by new { tNumarAngajati.Luna } into t
                        select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
            foreach (var rezultat in query)
            {

                CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

            }
            oRaportNumarAngajatDetaliat.Departament = "TOTALE";
            oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";

            return oRaportNumarAngajatDetaliat;
        }

        private RaportNumarAngajatDetaliatObiect TotalDep(string An, string Departament, string Mansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

            if (Departament == "ALL")
            {
                if (Mansione == "ALL")
                {

                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";

                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
            }
            else
            {
                if (Mansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(Departament)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(Departament) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
            }

            return oRaportNumarAngajatDetaliat;
        }

        private RaportNumarAngajatDetaliatObiect TotalDepMat(string An, string Departament, string Mansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();

            if (Departament == "ALL")
            {
                if (Mansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
            }
            else
            {
                if (Mansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(Departament)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViews
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(Departament) && tNumarAngajati.PostDeLucru.Equals(Mansione)
                                group tNumarAngajati by new { tNumarAngajati.Luna } into t
                                select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };


                    foreach (var rezultat in query)
                    {

                        CompleteazaLuna(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.Departament = Departament;
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                }
            }



            return oRaportNumarAngajatDetaliat;
        }
        [WebMethod(EnableSession = false)]
        public RaportNumarAngajatiDetaliatObiect RaportNumarAngajatiDetaliatListaMaternita(string FiltruAn, string FiltruDep, string FiltruMansione)
        {
            RaportNumarAngajatiDetaliatObiect oRaportNumarAngajatiDetaliat = new RaportNumarAngajatiDetaliatObiect();
            oRaportNumarAngajatiDetaliat.An = "ANNO " + FiltruAn;
            oRaportNumarAngajatiDetaliat.Dep = "DEPARTAMENT " + FiltruDep;
            oRaportNumarAngajatiDetaliat.PostDeLucru = "MANSIONE " + FiltruMansione;

            if (FiltruDep != "ALL")
            {
                if (FiltruMansione != "ALL")
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament.Equals(FiltruDep) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalByDepMaternita(FiltruAn, FiltruMansione));

                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }


                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDep(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);
                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament,FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    //oRaportNumarAngajatiDetaliat.Tabela.Add(TotalByDep(FiltruAn, FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
                else
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament.Equals(FiltruDep)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }
                            
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDep(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));


                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
            }
            else
            {
                if (FiltruMansione != "ALL")
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //TOTALE NA TOP'u
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalMaternita(FiltruAn));
                    //OVDE
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalByDepMaternita(FiltruAn, FiltruMansione));

                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }


                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDep(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";


                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));

                    oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, "", FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
                else
                {
                    dcWbmOlimpias = new DataClassWbmOlimpias();
                    int NumarLuni = dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas.Where(x => x.An.Equals(FiltruAn)).GroupBy(x => x.Luna).Count();
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(FiltruAn)
                                group tNumarAngajati by new { tNumarAngajati.Departament, tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna, tNumarAngajati.SortHelper } into t
                                orderby t.Key.SortHelper, t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.Departament, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };
                    string Departament = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //TOTALE NA TOP'u
                    oRaportNumarAngajatiDetaliat.Tabela.Add(TotalMaternita(FiltruAn));

                    foreach (var rezultat in query)
                    {
                        if (Departament != rezultat.Departament)
                        {
                            if (Departament != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";
                                //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                                oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                            }


                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.Departament;
                            Departament = rezultat.Departament;
                            oRaportNumarAngajatiDetaliat.Tabela.Add(TotalDep(FiltruAn, Departament, FiltruMansione));

                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";


                    //oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeIncadrareMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, oRaportNumarAngajatDetaliat.Departament, FiltruMansione));

                    oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    oRaportNumarAngajatiDetaliat.Tabela.Add(oRaportNumarAngajatDetaliat);
                    oRaportNumarAngajatiDetaliat.Tabela.AddRange(GrupatPeTipPostDeLucruMaternita(FiltruAn, "", FiltruMansione));

                    int Medie;
                    foreach (RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatCalc in oRaportNumarAngajatiDetaliat.Tabela)
                    {
                        Medie = 0;
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Ianuarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Ianuarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Februarie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Februarie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Martie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Martie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Aprilie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Aprilie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Mai))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Mai);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iunie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iunie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Iulie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Iulie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.August))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.August);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Septembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Septembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Octombrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Octombrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Noiembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Noiembrie);
                        if (!String.IsNullOrEmpty(oRaportNumarAngajatDetaliatCalc.Decembrie))
                            Medie = Medie + Convert.ToInt32(oRaportNumarAngajatDetaliatCalc.Decembrie);
                        if (NumarLuni > 0)
                        {
                            Medie = Medie / NumarLuni;
                            if (Medie != 0)
                                oRaportNumarAngajatDetaliatCalc.Medie = Medie.ToString();
                        }
                    }
                }
            }

            return oRaportNumarAngajatiDetaliat;
        }
        
        private void CompleteazaLunaMaternita(int Luna, int NumarAngajati, RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliatMaternita)
        {
            string sNumarAngajati = "";
            if (NumarAngajati != 0)
                sNumarAngajati = NumarAngajati.ToString();
            switch (Luna)
            {
                case 1:
                    oRaportNumarAngajatDetaliatMaternita.Ianuarie = sNumarAngajati;
                    break;
                case 2:
                    oRaportNumarAngajatDetaliatMaternita.Februarie = sNumarAngajati;
                    break;
                case 3:
                    oRaportNumarAngajatDetaliatMaternita.Martie = sNumarAngajati;
                    break;
                case 4:
                    oRaportNumarAngajatDetaliatMaternita.Aprilie = sNumarAngajati;
                    break;
                case 5:
                    oRaportNumarAngajatDetaliatMaternita.Mai = sNumarAngajati;
                    break;
                case 6:
                    oRaportNumarAngajatDetaliatMaternita.Iunie = sNumarAngajati;
                    break;
                case 7:
                    oRaportNumarAngajatDetaliatMaternita.Iulie = sNumarAngajati;
                    break;
                case 8:
                    oRaportNumarAngajatDetaliatMaternita.August = sNumarAngajati;
                    break;
                case 9:
                    oRaportNumarAngajatDetaliatMaternita.Septembrie = sNumarAngajati;
                    break;
                case 10:
                    oRaportNumarAngajatDetaliatMaternita.Octombrie = sNumarAngajati;
                    break;
                case 11:
                    oRaportNumarAngajatDetaliatMaternita.Noiembrie = sNumarAngajati;
                    break;
                case 12:
                    oRaportNumarAngajatDetaliatMaternita.Decembrie = sNumarAngajati;
                    break;
            }
        }

        private List<RaportNumarAngajatDetaliatObiect> GrupatPeIncadrareMaternita(string An, string FiltruDepartament, string FiltruMansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();


            if (FiltruDepartament == "ALL")
            {
                if(FiltruMansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);


                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);


                }
            }
            else
            {
                if (FiltruMansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);

                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                orderby tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                select new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.PostDeLucru, tNumarAngajati.Luna, tNumarAngajati.NumarAngajati };

                    string PostDeLucru = "";
                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    foreach (var rezultat in query)
                    {
                        if (PostDeLucru != rezultat.PostDeLucru || TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (PostDeLucru != "")
                            {
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.Departament = rezultat.PostDeLucru;
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            PostDeLucru = rezultat.PostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);


                }
            }

           
            return oRaportNumarAngajatiDetaliat;
        }

        private List<RaportNumarAngajatDetaliatObiect> GrupatPeTipPostDeLucruMaternita(string An, string FiltruDepartament, string FiltruMansione)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();

            if (FiltruDepartament == "ALL")
            {
                if(FiltruMansione == "ALL")
                {

                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };


                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //if (String.IsNullOrEmpty(FiltruDepartament))

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };


                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //if (String.IsNullOrEmpty(FiltruDepartament))

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
            }
            else
            {
                if (FiltruMansione == "ALL")
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };


                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //if (String.IsNullOrEmpty(FiltruDepartament))

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
                else
                {
                    var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                                where tNumarAngajati.An.Equals(An) && tNumarAngajati.Departament.Equals(FiltruDepartament) && tNumarAngajati.PostDeLucru.Equals(FiltruMansione)
                                group tNumarAngajati by new { tNumarAngajati.TipPostDeLucru, tNumarAngajati.Luna } into t
                                orderby t.Key.TipPostDeLucru, t.Key.Luna
                                select new { t.Key.TipPostDeLucru, t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };


                    string TipPostDeLucru = "";
                    RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                    //if (String.IsNullOrEmpty(FiltruDepartament))

                    foreach (var rezultat in query)
                    {
                        if (TipPostDeLucru != rezultat.TipPostDeLucru)
                        {
                            if (TipPostDeLucru != "")
                            {
                                oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                                oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                            }
                            oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
                            oRaportNumarAngajatDetaliat.TipPostDeLucru = rezultat.TipPostDeLucru;
                            TipPostDeLucru = rezultat.TipPostDeLucru;
                        }
                        CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

                    }
                    oRaportNumarAngajatDetaliat.NumeClasa = "rSubSelectat";
                    oRaportNumarAngajatiDetaliat.Add(oRaportNumarAngajatDetaliat);
                }
            }


            return oRaportNumarAngajatiDetaliat;
        }
        
        private RaportNumarAngajatDetaliatObiect TotalMaternita(string An)
        {
            List<RaportNumarAngajatDetaliatObiect> oRaportNumarAngajatiDetaliat = new List<RaportNumarAngajatDetaliatObiect>();
            var query = from tNumarAngajati in dcWbmOlimpias.NumarAngajatiDetaliatViewsMaternitas
                        where tNumarAngajati.An.Equals(An)
                        group tNumarAngajati by new { tNumarAngajati.Luna } into t
                        select new { t.Key.Luna, NumarAngajati = t.Sum(x => x.NumarAngajati) };

            RaportNumarAngajatDetaliatObiect oRaportNumarAngajatDetaliat = new RaportNumarAngajatDetaliatObiect();
            foreach (var rezultat in query)
            {

                CompleteazaLunaMaternita(rezultat.Luna.Value, rezultat.NumarAngajati.Value, oRaportNumarAngajatDetaliat);

            }
            oRaportNumarAngajatDetaliat.Departament = "TOTALE GENERALE";
            oRaportNumarAngajatDetaliat.NumeClasa = "rSelectat";

            return oRaportNumarAngajatDetaliat;
        }
    }
}