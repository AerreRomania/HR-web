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
    public class RaportNumarAngajatiObiect
    {
        public List<RaportNumarAngajatObiect> Tabela;
        public string An;
        public string Eroare;
        public RaportNumarAngajatiObiect()
        {
            An = "";
            Tabela = new List<RaportNumarAngajatObiect>();
            Eroare = "";
        }
    }
    

    public class DepartmentModel
    {
        public string Department { get; set; }
        public int? Luna { get; set; }
        public int? NumarAngajati { get; set; }
        public int? ContractNedeterminat { get; set; }
    }
    public class RaportNumarAngajatObiect
    {
        public string Id;
        public string Departament;
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
        public RaportNumarAngajatObiect()
        {
            Id = "";
            Departament = "";
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


    public class RaportNumarAngajatObiectMaternita
    {
        public string Id;
        public string Departament;
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
        public RaportNumarAngajatObiectMaternita()
        {
            Id = "";
            Departament = "";
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
    public class RaportNumarAngajatiWS : System.Web.Services.WebService
    {
        private static int MapDepartments(string department)
        {
            switch (department.ToUpperInvariant())
            {
                case "TESSITURA":
                    return 1;
                case "CONFEZIONE":
                    return 2;
                case "STIRO":
                    return 3;
                default:
                    return 4;
            }
        }

        [WebMethod(EnableSession = false)]
        public RaportNumarAngajatiObiect RaportNumarAngajatiLista(string FiltruAn)
        {
            RaportNumarAngajatiObiect oRaportNumarAngajati = new RaportNumarAngajatiObiect();
            oRaportNumarAngajati.An = "ANNO " + FiltruAn;
           
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();

                var query1 = (from tNumarAngajati in dcWbmOlimpias.NumarAngajatiViews
                              orderby tNumarAngajati.Departament, tNumarAngajati.Luna
                              where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament != "AREA TECNICA" && tNumarAngajati.Departament != "CENTRALE TERMICA" && tNumarAngajati.Departament != "PERSONALE"
                              select new DepartmentModel
                              {
                                  Department = tNumarAngajati.Departament,
                                  Luna = tNumarAngajati.Luna,
                                  NumarAngajati = tNumarAngajati.NumarAngajati,
                                  ContractNedeterminat = tNumarAngajati.ContractNedeterminat
                              }).ToList();

                var query = query1/*.OrderBy(dep=>MapDepartments(dep.Department))*/;

                string Departament = "";

                RaportNumarAngajatObiect oRaportNumarAngajat = new RaportNumarAngajatObiect();
                //PRVI RED ISPOD MESECI
                //oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);



                int TotalIanuarie = 0, TotalFebruarie = 0, TotalMartie = 0, TotalAprilie = 0, TotalMai = 0, TotalIunie = 0;
                int TotalIulie = 0, TotalAugust = 0, TotalSeptembrie = 0, TotalOctombrie = 0, TotalNoiembrie = 0, TotalDecembrie = 0;
                int NedeterminatIanuarie = 0, NedeterminatFebruarie = 0, NedeterminatMartie = 0, NedeterminatAprilie = 0, NedeterminatMai = 0, NedeterminatIunie = 0;
                int NedeterminatIulie = 0, NedeterminatAugust = 0, NedeterminatSeptembrie = 0, NedeterminatOctombrie = 0, NedeterminatNoiembrie = 0, NedeterminatDecembrie = 0;
                int DeterminatIanuarie = 0, DeterminatFebruarie = 0, DeterminatMartie = 0, DeterminatAprilie = 0, DeterminatMai = 0, DeterminatIunie = 0;
                int DeterminatIulie = 0, DeterminatAugust = 0, DeterminatSeptembrie = 0, DeterminatOctombrie = 0, DeterminatNoiembrie = 0, DeterminatDecembrie = 0;
                List<int> ListaLuni = new List<int>();
                foreach (var rezultat in query)
                {
                    if (!ListaLuni.Any(x => x.Equals(rezultat.Luna.Value)))
                        ListaLuni.Add(rezultat.Luna.Value);
                    if (Departament != rezultat.Department)
                    {
                        if (Departament != "")
                        oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);
                        oRaportNumarAngajat = new RaportNumarAngajatObiect();
                        oRaportNumarAngajat.Departament = rezultat.Department;                        
                         Departament = rezultat.Department;
                       
                    }
                    switch (rezultat.Luna)
                    {
                        case 1:
                            oRaportNumarAngajat.Ianuarie = rezultat.NumarAngajati.ToString();
                            TotalIanuarie = TotalIanuarie + rezultat.NumarAngajati.Value;
                            NedeterminatIanuarie = NedeterminatIanuarie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 2:
                            oRaportNumarAngajat.Februarie = rezultat.NumarAngajati.ToString();
                            TotalFebruarie = TotalFebruarie + rezultat.NumarAngajati.Value;
                            NedeterminatFebruarie = NedeterminatFebruarie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 3:
                            oRaportNumarAngajat.Martie = rezultat.NumarAngajati.ToString();
                            TotalMartie = TotalMartie + rezultat.NumarAngajati.Value;
                            NedeterminatMartie = NedeterminatMartie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 4:
                            oRaportNumarAngajat.Aprilie = rezultat.NumarAngajati.ToString();
                            TotalAprilie = TotalAprilie + rezultat.NumarAngajati.Value;
                            NedeterminatAprilie = NedeterminatAprilie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 5:
                            oRaportNumarAngajat.Mai = rezultat.NumarAngajati.ToString();
                            TotalMai = TotalMai + rezultat.NumarAngajati.Value;
                            NedeterminatMai = NedeterminatMai + rezultat.ContractNedeterminat.Value;
                            break;
                        case 6:
                            oRaportNumarAngajat.Iunie = rezultat.NumarAngajati.ToString();
                            TotalIunie = TotalIunie + rezultat.NumarAngajati.Value;
                            NedeterminatIunie = NedeterminatIunie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 7:
                            oRaportNumarAngajat.Iulie = rezultat.NumarAngajati.ToString();
                            TotalIulie = TotalIulie + rezultat.NumarAngajati.Value;
                            NedeterminatIulie = NedeterminatIulie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 8:
                            oRaportNumarAngajat.August = rezultat.NumarAngajati.ToString();
                            TotalAugust = TotalAugust + rezultat.NumarAngajati.Value;
                            NedeterminatAugust = NedeterminatAugust + rezultat.ContractNedeterminat.Value;
                            break;
                        case 9:
                            oRaportNumarAngajat.Septembrie = rezultat.NumarAngajati.ToString();
                            TotalSeptembrie = TotalSeptembrie + rezultat.NumarAngajati.Value;
                            NedeterminatSeptembrie = NedeterminatSeptembrie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 10:
                            oRaportNumarAngajat.Octombrie = rezultat.NumarAngajati.ToString();
                            TotalOctombrie = TotalOctombrie + rezultat.NumarAngajati.Value;
                            NedeterminatOctombrie = NedeterminatOctombrie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 11:
                            oRaportNumarAngajat.Noiembrie = rezultat.NumarAngajati.ToString();
                            TotalNoiembrie = TotalNoiembrie + rezultat.NumarAngajati.Value;
                            NedeterminatNoiembrie = NedeterminatNoiembrie + rezultat.ContractNedeterminat.Value;
                            break;
                        case 12:
                            oRaportNumarAngajat.Decembrie = rezultat.NumarAngajati.ToString();
                            TotalDecembrie = TotalDecembrie + rezultat.NumarAngajati.Value;
                            NedeterminatDecembrie = NedeterminatDecembrie + rezultat.ContractNedeterminat.Value;
                            break;
                    }

                }
                oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);
                int Medie;
                foreach (RaportNumarAngajatObiect oRaportNumarAngajatCalc in oRaportNumarAngajati.Tabela)
                {
                    Medie = 0;
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Ianuarie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Ianuarie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Februarie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Februarie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Martie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Martie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Aprilie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Aprilie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Mai))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Mai);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Iunie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Iunie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Iulie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Iulie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.August))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.August);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Septembrie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Septembrie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Octombrie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Octombrie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Noiembrie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Noiembrie);
                    if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Decembrie))
                        Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Decembrie);
                    if (ListaLuni.Count() > 0)
                    {
                        Medie = Medie / ListaLuni.Count();
                        oRaportNumarAngajatCalc.Medie = Medie.ToString();
                    }
                }
                oRaportNumarAngajat = new RaportNumarAngajatObiect();

                oRaportNumarAngajat.Departament = "TOTALE";
                
                Medie = TotalIanuarie;
                oRaportNumarAngajat.Ianuarie = TotalIanuarie.ToString();
                Medie = Medie + TotalFebruarie;
                oRaportNumarAngajat.Februarie = TotalFebruarie.ToString();
                Medie = Medie + TotalMartie;
                oRaportNumarAngajat.Martie = TotalMartie.ToString();
                Medie = Medie + TotalAprilie;
                oRaportNumarAngajat.Aprilie = TotalAprilie.ToString();
                Medie = Medie + TotalMai;
                oRaportNumarAngajat.Mai = TotalMai.ToString();
                Medie = Medie + TotalIunie;
                oRaportNumarAngajat.Iunie = TotalIunie.ToString();
                Medie = Medie + TotalIulie;
                oRaportNumarAngajat.Iulie = TotalIulie.ToString();
                Medie = Medie + TotalAugust;
                oRaportNumarAngajat.August = TotalAugust.ToString();
                Medie = Medie + TotalSeptembrie;
                oRaportNumarAngajat.Septembrie = TotalSeptembrie.ToString();
                Medie = Medie + TotalOctombrie;
                oRaportNumarAngajat.Octombrie = TotalOctombrie.ToString();
                Medie = Medie + TotalNoiembrie;
                oRaportNumarAngajat.Noiembrie = TotalNoiembrie.ToString();
                Medie = Medie + TotalDecembrie;
                oRaportNumarAngajat.Decembrie = TotalDecembrie.ToString();
                if (ListaLuni.Count() > 0)
                {
                    Medie = Medie / ListaLuni.Count();
                    oRaportNumarAngajat.Medie = Medie.ToString();
                }
                oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

                oRaportNumarAngajat = new RaportNumarAngajatObiect();
                oRaportNumarAngajat.Departament = "di cui:";
                oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

                // a tempo determinato
                oRaportNumarAngajat = new RaportNumarAngajatObiect();
                oRaportNumarAngajat.Departament = "a tempo determinato";
                DeterminatIanuarie = TotalIanuarie - NedeterminatIanuarie;
                Medie = DeterminatIanuarie;
                oRaportNumarAngajat.Ianuarie = DeterminatIanuarie.ToString();
                DeterminatFebruarie = TotalFebruarie - NedeterminatFebruarie;
                Medie = Medie + DeterminatFebruarie;
                oRaportNumarAngajat.Februarie = DeterminatFebruarie.ToString();
                DeterminatMartie = TotalMartie - NedeterminatMartie;
                Medie = Medie + DeterminatMartie;
                oRaportNumarAngajat.Martie = DeterminatMartie.ToString();
                DeterminatAprilie = TotalAprilie - NedeterminatAprilie;
                Medie = Medie + DeterminatAprilie;
                oRaportNumarAngajat.Aprilie = DeterminatAprilie.ToString();
                DeterminatMai = TotalMai - NedeterminatMai;
                Medie = Medie + DeterminatMai;
                oRaportNumarAngajat.Mai = DeterminatMai.ToString();
                DeterminatIunie = TotalIunie - NedeterminatIunie;
                Medie = Medie + DeterminatIunie;
                oRaportNumarAngajat.Iunie = DeterminatIunie.ToString();
                DeterminatIulie = TotalIulie - NedeterminatIulie;
                Medie = Medie + DeterminatIulie;
                oRaportNumarAngajat.Iulie = DeterminatIulie.ToString();
                DeterminatAugust = TotalAugust - NedeterminatAugust;
                Medie = Medie + DeterminatAugust;
                oRaportNumarAngajat.August = DeterminatAugust.ToString();
                DeterminatSeptembrie = TotalSeptembrie - NedeterminatSeptembrie;
                Medie = Medie + DeterminatSeptembrie;
                oRaportNumarAngajat.Septembrie = DeterminatSeptembrie.ToString();
                DeterminatOctombrie = TotalOctombrie - NedeterminatOctombrie;
                Medie = Medie + DeterminatOctombrie;
                oRaportNumarAngajat.Octombrie = DeterminatOctombrie.ToString();
                DeterminatNoiembrie = TotalNoiembrie - NedeterminatNoiembrie;
                Medie = Medie + DeterminatNoiembrie;
                oRaportNumarAngajat.Noiembrie = DeterminatNoiembrie.ToString();
                DeterminatDecembrie = TotalDecembrie - NedeterminatDecembrie;
                Medie = Medie + DeterminatDecembrie;
                oRaportNumarAngajat.Decembrie = DeterminatDecembrie.ToString();
                if (ListaLuni.Count() > 0)
                {
                    Medie = Medie / ListaLuni.Count();
                    oRaportNumarAngajat.Medie = Medie.ToString();
                }
                oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

                //a tempo indeterminato
                oRaportNumarAngajat = new RaportNumarAngajatObiect();
                oRaportNumarAngajat.Departament = "a tempo indeterminato";
                Medie = NedeterminatIanuarie;
                oRaportNumarAngajat.Ianuarie = NedeterminatIanuarie.ToString();
                Medie = Medie + NedeterminatFebruarie;
                oRaportNumarAngajat.Februarie = NedeterminatFebruarie.ToString();
                Medie = Medie + NedeterminatMartie;
                oRaportNumarAngajat.Martie = NedeterminatMartie.ToString();
                Medie = Medie + NedeterminatAprilie;
                oRaportNumarAngajat.Aprilie = NedeterminatAprilie.ToString();
                Medie = Medie + NedeterminatMai;
                oRaportNumarAngajat.Mai = NedeterminatMai.ToString();
                Medie = Medie + NedeterminatIunie;
                oRaportNumarAngajat.Iunie = NedeterminatIunie.ToString();
                Medie = Medie + NedeterminatIulie;
                oRaportNumarAngajat.Iulie = NedeterminatIulie.ToString();
                Medie = Medie + NedeterminatAugust;
                oRaportNumarAngajat.August = NedeterminatAugust.ToString();
                Medie = Medie + NedeterminatSeptembrie;
                oRaportNumarAngajat.Septembrie = NedeterminatSeptembrie.ToString();
                Medie = Medie + NedeterminatOctombrie;
                oRaportNumarAngajat.Octombrie = NedeterminatOctombrie.ToString();
                Medie = Medie + NedeterminatNoiembrie;
                oRaportNumarAngajat.Noiembrie = NedeterminatNoiembrie.ToString();
                Medie = Medie + NedeterminatDecembrie;
                oRaportNumarAngajat.Decembrie = NedeterminatDecembrie.ToString();
                if (ListaLuni.Count() > 0)
                {
                    Medie = Medie / ListaLuni.Count();
                    oRaportNumarAngajat.Medie = Medie.ToString();
                }
                oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

                foreach (var t in oRaportNumarAngajati.Tabela)
                {
                    if (t.Ianuarie == "0")
                        t.Ianuarie = "";
                    if (t.Februarie == "0")
                        t.Februarie = "";
                    if (t.Martie == "0")
                        t.Martie = "";
                    if (t.Aprilie == "0")
                        t.Aprilie = "";
                    if (t.Mai == "0")
                        t.Mai = "";
                    if (t.Iunie == "0")
                        t.Iunie = "";
                    if (t.Iulie == "0")
                        t.Iulie = "";
                    if (t.August == "0")
                        t.August = "";
                    if (t.Septembrie == "0")
                        t.Septembrie = "";
                    if (t.Octombrie == "0")
                        t.Octombrie = "";
                    if (t.Noiembrie == "0")
                        t.Noiembrie = "";
                    if (t.Decembrie == "0")
                        t.Decembrie = "";
                    if (t.Medie == "0")
                        t.Medie = "";
                }            
            return oRaportNumarAngajati;
        }

        [WebMethod(EnableSession = false)]
        public RaportNumarAngajatiObiect RaportNumarAngajatiListaMaternita(string FiltruAn)
        {
            RaportNumarAngajatiObiect oRaportNumarAngajati = new RaportNumarAngajatiObiect();
            oRaportNumarAngajati.An = "ANNO " + FiltruAn;

            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();

            var query1 = (from tNumarAngajati in dcWbmOlimpias.RaportNumarMaternitas
                          orderby tNumarAngajati.Departament, tNumarAngajati.Luna
                          where tNumarAngajati.An.Equals(FiltruAn) && tNumarAngajati.Departament != "AREA TECNICA" && tNumarAngajati.Departament != "CENTRALE TERMICA" && tNumarAngajati.Departament != "PERSONALE"
                          select new DepartmentModel
                          {
                              Department = tNumarAngajati.Departament,
                              Luna = tNumarAngajati.Luna,
                              NumarAngajati = tNumarAngajati.NumarAngajati,
                              ContractNedeterminat = tNumarAngajati.ContractNedeterminat
                          }).ToList();

            var query = query1/*.OrderBy(dep=>MapDepartments(dep.Department))*/;

            string Departament = "";

            RaportNumarAngajatObiect oRaportNumarAngajat = new RaportNumarAngajatObiect();
            //PRVI RED ISPOD MESECI
            //oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);



            int TotalIanuarie = 0, TotalFebruarie = 0, TotalMartie = 0, TotalAprilie = 0, TotalMai = 0, TotalIunie = 0;
            int TotalIulie = 0, TotalAugust = 0, TotalSeptembrie = 0, TotalOctombrie = 0, TotalNoiembrie = 0, TotalDecembrie = 0;
            int NedeterminatIanuarie = 0, NedeterminatFebruarie = 0, NedeterminatMartie = 0, NedeterminatAprilie = 0, NedeterminatMai = 0, NedeterminatIunie = 0;
            int NedeterminatIulie = 0, NedeterminatAugust = 0, NedeterminatSeptembrie = 0, NedeterminatOctombrie = 0, NedeterminatNoiembrie = 0, NedeterminatDecembrie = 0;
            int DeterminatIanuarie = 0, DeterminatFebruarie = 0, DeterminatMartie = 0, DeterminatAprilie = 0, DeterminatMai = 0, DeterminatIunie = 0;
            int DeterminatIulie = 0, DeterminatAugust = 0, DeterminatSeptembrie = 0, DeterminatOctombrie = 0, DeterminatNoiembrie = 0, DeterminatDecembrie = 0;
            List<int> ListaLuni = new List<int>();
            foreach (var rezultat in query)
            {
                if (!ListaLuni.Any(x => x.Equals(rezultat.Luna.Value)))
                    ListaLuni.Add(rezultat.Luna.Value);
                if (Departament != rezultat.Department)
                {
                    if (Departament != "")
                        oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);
                    oRaportNumarAngajat = new RaportNumarAngajatObiect();
                    oRaportNumarAngajat.Departament = rezultat.Department;
                    Departament = rezultat.Department;

                }
                switch (rezultat.Luna)
                {
                    case 1:
                        oRaportNumarAngajat.Ianuarie = rezultat.NumarAngajati.ToString();
                        TotalIanuarie = TotalIanuarie + rezultat.NumarAngajati.Value;
                        NedeterminatIanuarie = NedeterminatIanuarie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 2:
                        oRaportNumarAngajat.Februarie = rezultat.NumarAngajati.ToString();
                        TotalFebruarie = TotalFebruarie + rezultat.NumarAngajati.Value;
                        NedeterminatFebruarie = NedeterminatFebruarie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 3:
                        oRaportNumarAngajat.Martie = rezultat.NumarAngajati.ToString();
                        TotalMartie = TotalMartie + rezultat.NumarAngajati.Value;
                        NedeterminatMartie = NedeterminatMartie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 4:
                        oRaportNumarAngajat.Aprilie = rezultat.NumarAngajati.ToString();
                        TotalAprilie = TotalAprilie + rezultat.NumarAngajati.Value;
                        NedeterminatAprilie = NedeterminatAprilie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 5:
                        oRaportNumarAngajat.Mai = rezultat.NumarAngajati.ToString();
                        TotalMai = TotalMai + rezultat.NumarAngajati.Value;
                        NedeterminatMai = NedeterminatMai + rezultat.ContractNedeterminat.Value;
                        break;
                    case 6:
                        oRaportNumarAngajat.Iunie = rezultat.NumarAngajati.ToString();
                        TotalIunie = TotalIunie + rezultat.NumarAngajati.Value;
                        NedeterminatIunie = NedeterminatIunie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 7:
                        oRaportNumarAngajat.Iulie = rezultat.NumarAngajati.ToString();
                        TotalIulie = TotalIulie + rezultat.NumarAngajati.Value;
                        NedeterminatIulie = NedeterminatIulie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 8:
                        oRaportNumarAngajat.August = rezultat.NumarAngajati.ToString();
                        TotalAugust = TotalAugust + rezultat.NumarAngajati.Value;
                        NedeterminatAugust = NedeterminatAugust + rezultat.ContractNedeterminat.Value;
                        break;
                    case 9:
                        oRaportNumarAngajat.Septembrie = rezultat.NumarAngajati.ToString();
                        TotalSeptembrie = TotalSeptembrie + rezultat.NumarAngajati.Value;
                        NedeterminatSeptembrie = NedeterminatSeptembrie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 10:
                        oRaportNumarAngajat.Octombrie = rezultat.NumarAngajati.ToString();
                        TotalOctombrie = TotalOctombrie + rezultat.NumarAngajati.Value;
                        NedeterminatOctombrie = NedeterminatOctombrie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 11:
                        oRaportNumarAngajat.Noiembrie = rezultat.NumarAngajati.ToString();
                        TotalNoiembrie = TotalNoiembrie + rezultat.NumarAngajati.Value;
                        NedeterminatNoiembrie = NedeterminatNoiembrie + rezultat.ContractNedeterminat.Value;
                        break;
                    case 12:
                        oRaportNumarAngajat.Decembrie = rezultat.NumarAngajati.ToString();
                        TotalDecembrie = TotalDecembrie + rezultat.NumarAngajati.Value;
                        NedeterminatDecembrie = NedeterminatDecembrie + rezultat.ContractNedeterminat.Value;
                        break;
                }

            }
            oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);
            int Medie;
            foreach (RaportNumarAngajatObiect oRaportNumarAngajatCalc in oRaportNumarAngajati.Tabela)
            {
                Medie = 0;
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Ianuarie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Ianuarie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Februarie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Februarie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Martie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Martie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Aprilie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Aprilie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Mai))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Mai);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Iunie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Iunie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Iulie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Iulie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.August))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.August);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Septembrie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Septembrie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Octombrie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Octombrie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Noiembrie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Noiembrie);
                if (!String.IsNullOrEmpty(oRaportNumarAngajatCalc.Decembrie))
                    Medie = Medie + Convert.ToInt32(oRaportNumarAngajatCalc.Decembrie);
                if (ListaLuni.Count() > 0)
                {
                    Medie = Medie / ListaLuni.Count();
                    oRaportNumarAngajatCalc.Medie = Medie.ToString();
                }
            }
            oRaportNumarAngajat = new RaportNumarAngajatObiect();

            oRaportNumarAngajat.Departament = "TOTALE";

            Medie = TotalIanuarie;
            oRaportNumarAngajat.Ianuarie = TotalIanuarie.ToString();
            Medie = Medie + TotalFebruarie;
            oRaportNumarAngajat.Februarie = TotalFebruarie.ToString();
            Medie = Medie + TotalMartie;
            oRaportNumarAngajat.Martie = TotalMartie.ToString();
            Medie = Medie + TotalAprilie;
            oRaportNumarAngajat.Aprilie = TotalAprilie.ToString();
            Medie = Medie + TotalMai;
            oRaportNumarAngajat.Mai = TotalMai.ToString();
            Medie = Medie + TotalIunie;
            oRaportNumarAngajat.Iunie = TotalIunie.ToString();
            Medie = Medie + TotalIulie;
            oRaportNumarAngajat.Iulie = TotalIulie.ToString();
            Medie = Medie + TotalAugust;
            oRaportNumarAngajat.August = TotalAugust.ToString();
            Medie = Medie + TotalSeptembrie;
            oRaportNumarAngajat.Septembrie = TotalSeptembrie.ToString();
            Medie = Medie + TotalOctombrie;
            oRaportNumarAngajat.Octombrie = TotalOctombrie.ToString();
            Medie = Medie + TotalNoiembrie;
            oRaportNumarAngajat.Noiembrie = TotalNoiembrie.ToString();
            Medie = Medie + TotalDecembrie;
            oRaportNumarAngajat.Decembrie = TotalDecembrie.ToString();
            if (ListaLuni.Count() > 0)
            {
                Medie = Medie / ListaLuni.Count();
                oRaportNumarAngajat.Medie = Medie.ToString();
            }
            oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

            oRaportNumarAngajat = new RaportNumarAngajatObiect();
            oRaportNumarAngajat.Departament = "di cui:";
            oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

            // a tempo determinato
            oRaportNumarAngajat = new RaportNumarAngajatObiect();
            oRaportNumarAngajat.Departament = "a tempo determinato";
            DeterminatIanuarie = TotalIanuarie - NedeterminatIanuarie;
            Medie = DeterminatIanuarie;
            oRaportNumarAngajat.Ianuarie = DeterminatIanuarie.ToString();
            DeterminatFebruarie = TotalFebruarie - NedeterminatFebruarie;
            Medie = Medie + DeterminatFebruarie;
            oRaportNumarAngajat.Februarie = DeterminatFebruarie.ToString();
            DeterminatMartie = TotalMartie - NedeterminatMartie;
            Medie = Medie + DeterminatMartie;
            oRaportNumarAngajat.Martie = DeterminatMartie.ToString();
            DeterminatAprilie = TotalAprilie - NedeterminatAprilie;
            Medie = Medie + DeterminatAprilie;
            oRaportNumarAngajat.Aprilie = DeterminatAprilie.ToString();
            DeterminatMai = TotalMai - NedeterminatMai;
            Medie = Medie + DeterminatMai;
            oRaportNumarAngajat.Mai = DeterminatMai.ToString();
            DeterminatIunie = TotalIunie - NedeterminatIunie;
            Medie = Medie + DeterminatIunie;
            oRaportNumarAngajat.Iunie = DeterminatIunie.ToString();
            DeterminatIulie = TotalIulie - NedeterminatIulie;
            Medie = Medie + DeterminatIulie;
            oRaportNumarAngajat.Iulie = DeterminatIulie.ToString();
            DeterminatAugust = TotalAugust - NedeterminatAugust;
            Medie = Medie + DeterminatAugust;
            oRaportNumarAngajat.August = DeterminatAugust.ToString();
            DeterminatSeptembrie = TotalSeptembrie - NedeterminatSeptembrie;
            Medie = Medie + DeterminatSeptembrie;
            oRaportNumarAngajat.Septembrie = DeterminatSeptembrie.ToString();
            DeterminatOctombrie = TotalOctombrie - NedeterminatOctombrie;
            Medie = Medie + DeterminatOctombrie;
            oRaportNumarAngajat.Octombrie = DeterminatOctombrie.ToString();
            DeterminatNoiembrie = TotalNoiembrie - NedeterminatNoiembrie;
            Medie = Medie + DeterminatNoiembrie;
            oRaportNumarAngajat.Noiembrie = DeterminatNoiembrie.ToString();
            DeterminatDecembrie = TotalDecembrie - NedeterminatDecembrie;
            Medie = Medie + DeterminatDecembrie;
            oRaportNumarAngajat.Decembrie = DeterminatDecembrie.ToString();
            if (ListaLuni.Count() > 0)
            {
                Medie = Medie / ListaLuni.Count();
                oRaportNumarAngajat.Medie = Medie.ToString();
            }
            oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

            //a tempo indeterminato
            oRaportNumarAngajat = new RaportNumarAngajatObiect();
            oRaportNumarAngajat.Departament = "a tempo indeterminato";
            Medie = NedeterminatIanuarie;
            oRaportNumarAngajat.Ianuarie = NedeterminatIanuarie.ToString();
            Medie = Medie + NedeterminatFebruarie;
            oRaportNumarAngajat.Februarie = NedeterminatFebruarie.ToString();
            Medie = Medie + NedeterminatMartie;
            oRaportNumarAngajat.Martie = NedeterminatMartie.ToString();
            Medie = Medie + NedeterminatAprilie;
            oRaportNumarAngajat.Aprilie = NedeterminatAprilie.ToString();
            Medie = Medie + NedeterminatMai;
            oRaportNumarAngajat.Mai = NedeterminatMai.ToString();
            Medie = Medie + NedeterminatIunie;
            oRaportNumarAngajat.Iunie = NedeterminatIunie.ToString();
            Medie = Medie + NedeterminatIulie;
            oRaportNumarAngajat.Iulie = NedeterminatIulie.ToString();
            Medie = Medie + NedeterminatAugust;
            oRaportNumarAngajat.August = NedeterminatAugust.ToString();
            Medie = Medie + NedeterminatSeptembrie;
            oRaportNumarAngajat.Septembrie = NedeterminatSeptembrie.ToString();
            Medie = Medie + NedeterminatOctombrie;
            oRaportNumarAngajat.Octombrie = NedeterminatOctombrie.ToString();
            Medie = Medie + NedeterminatNoiembrie;
            oRaportNumarAngajat.Noiembrie = NedeterminatNoiembrie.ToString();
            Medie = Medie + NedeterminatDecembrie;
            oRaportNumarAngajat.Decembrie = NedeterminatDecembrie.ToString();
            if (ListaLuni.Count() > 0)
            {
                Medie = Medie / ListaLuni.Count();
                oRaportNumarAngajat.Medie = Medie.ToString();
            }
            oRaportNumarAngajati.Tabela.Add(oRaportNumarAngajat);

            foreach (var t in oRaportNumarAngajati.Tabela)
            {
                if (t.Ianuarie == "0")
                    t.Ianuarie = "";
                if (t.Februarie == "0")
                    t.Februarie = "";
                if (t.Martie == "0")
                    t.Martie = "";
                if (t.Aprilie == "0")
                    t.Aprilie = "";
                if (t.Mai == "0")
                    t.Mai = "";
                if (t.Iunie == "0")
                    t.Iunie = "";
                if (t.Iulie == "0")
                    t.Iulie = "";
                if (t.August == "0")
                    t.August = "";
                if (t.Septembrie == "0")
                    t.Septembrie = "";
                if (t.Octombrie == "0")
                    t.Octombrie = "";
                if (t.Noiembrie == "0")
                    t.Noiembrie = "";
                if (t.Decembrie == "0")
                    t.Decembrie = "";
                if (t.Medie == "0")
                    t.Medie = "";
            }
            return oRaportNumarAngajati;
        }



        //[WebMethod(EnableSession = false)]
        public RaportNumarAngajatiObiect RaportNumarAngajatiExcel(string FiltruAn)
        {
            return RaportNumarAngajatiLista(FiltruAn);
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
                    Eroare = "Completati campul Nume!";
                    break;
                case "2":
                    Eroare = "Completati campul Prenume!";
                    break;
                case "3":
                    Eroare = "Alegeti o Localitate!";
                    break;
                case "4":
                    Eroare = "Alegeti un Tip post de lucru!";
                    break;
                case "5":
                    Eroare = "Alegeti un Interval de lucru!";
                    break;
                case "6":
                    Eroare = "Alegeti un Post de lucru!";
                    break;
                case "7":
                    Eroare = "Alegeti Locul nasterii!";
                    break;
                case "8":
                    Eroare = "Alegeti o Incadrare!";
                    break;
                case "9":
                    Eroare = "Alegeti Nivel studiu!";
                    break;
                case "10":
                    Eroare = "Alegeti un Departament!";
                    break;
                case "11":
                    Eroare = "Completati corect campul Cod RaportNumarAngajat!";
                    break;
                case "12":
                    Eroare = "Completati corect campul Cod sistem!";
                    break;
                case "13":
                    Eroare = "Completati campul Marca!";
                    break;
                case "101":
                    Eroare = "Cod RaportNumarAngajat existent!";
                    break;
                case "102":
                    Eroare = "Cod sistem RaportNumarAngajat existent!";
                    break;
                case "103":
                    Eroare = "Marca RaportNumarAngajat existent!";
                    break;
                case "104":
                    Eroare = "Nume,prenume RaportNumarAngajat existent!";
                    break;
                case "105":
                    Eroare = "Numar identificare personala existent!";
                    break;
                case "201":
                    Eroare = "RaportNumarAngajatul nu se poate sterge, sunt date salvate cu acest RaportNumarAngajat!";
                    break;
            }
            return Eroare;
        }

    }
}