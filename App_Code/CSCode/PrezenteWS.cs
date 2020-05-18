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
    public class PrezenteObiect
    {
        public List<PrezentaObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public PrezenteObiect()
        {
            Tabela = new List<PrezentaObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class PrezentaObiect
    {
        public string Id;
        public AngajatObiect oAngajat;
        public string Data;
        public TipOraObiect oTipOra;
        public string R1DAL;
        public string R1ALL;
        public string R1TOT;
        public string Eroare;
        public PrezentaObiect()
        {
            Id = "";
            oAngajat = new AngajatObiect();
            Data = "";
            oTipOra = new TipOraObiect();
            R1DAL = "";
            R1ALL = "";
            R1TOT = "";
            Eroare = "";
        }
    }
    public class FiltruPrezenteObiect
    {
        public string Find;
        public string FiltruCodAngajat;
        public string FiltruCodSistem;
        public string FiltruMarca;
        public string FiltruNume;
        public string FiltruDepartament;
        public FiltruPrezenteObiect()
        {
            Find = "";
            FiltruCodAngajat = "";
            FiltruCodSistem = "";
            FiltruMarca = "";
            FiltruNume = "";
            FiltruDepartament = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [GenerateScriptType(typeof(AngajatObiect))]
    [GenerateScriptType(typeof(TipPostDeLucruObiect))]
    [GenerateScriptType(typeof(PostDeLucruObiect))]
    [GenerateScriptType(typeof(DepartamentObiect))]
    [GenerateScriptType(typeof(EchipaObiect))]
    [GenerateScriptType(typeof(LinieObiect))]
    [GenerateScriptType(typeof(LocalitateObiect))]
    [GenerateScriptType(typeof(IncadrareObiect))]
    [ScriptService]
    public class PrezenteWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public PrezenteObiect PrezenteLista(FiltruPrezenteObiect oFiltruPrezenta, int PaginaCurenta)
        {
            PrezenteObiect oPrezente = new PrezenteObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tPrezente in dcWbmOlimpias.PrezenteViews
                        orderby tPrezente.Nume, tPrezente.Id
                        select new { tPrezente.Id, tPrezente.CodAngajat, tPrezente.CodSistem, tPrezente.Marca, tPrezente.Nume, tPrezente.Prenume, tPrezente.Departament, tPrezente.TipOra, tPrezente.R1ALL,tPrezente.R1DAL,tPrezente.R1TOT, tPrezente.Data };
            if (!String.IsNullOrEmpty(oFiltruPrezenta.FiltruCodAngajat))
                query = query.Where(x => x.CodAngajat.ToString().Contains(oFiltruPrezenta.FiltruCodAngajat));
            if (!String.IsNullOrEmpty(oFiltruPrezenta.FiltruCodSistem))
                query = query.Where(x => x.CodSistem.ToString().Contains(oFiltruPrezenta.FiltruCodSistem));
            if (!String.IsNullOrEmpty(oFiltruPrezenta.FiltruMarca))
                query = query.Where(x => x.Marca.Contains(oFiltruPrezenta.FiltruMarca));
            if (!String.IsNullOrEmpty(oFiltruPrezenta.FiltruNume))
                query = query.Where(x => x.Nume.Contains(oFiltruPrezenta.FiltruNume));
            if (!String.IsNullOrEmpty(oFiltruPrezenta.FiltruDepartament))
                query = query.Where(x => x.Nume.Contains(oFiltruPrezenta.FiltruDepartament));

            oPrezente.NumarPagini = (query.Count() - 1) / 5 + 1;
            if (oFiltruPrezenta.Find == "")
            {
                oPrezente.PaginaCurenta = PaginaCurenta;
                oPrezente.IndexRand = 0;
            }
            else
            {
                int Pozitie = 0;
                Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruPrezenta.Find)));

                oPrezente.PaginaCurenta = Pozitie / 5 + 1;
                oPrezente.IndexRand = Pozitie - (oPrezente.PaginaCurenta - 1) * 5;
            }
            if (oPrezente.NumarPagini < oPrezente.PaginaCurenta)
                oPrezente.PaginaCurenta = oPrezente.NumarPagini;
            if (oPrezente.PaginaCurenta < 1)
                oPrezente.PaginaCurenta = 1;
            foreach (var rezultat in query.Skip(5 * (oPrezente.PaginaCurenta - 1)).Take(5))
            {
                PrezentaObiect oPrezenta = new PrezentaObiect();
                oPrezenta.Id = rezultat.Id.ToString();
                oPrezenta.oAngajat.CodAngajat = rezultat.CodAngajat.ToString();
                oPrezenta.oAngajat.CodSistem = rezultat.CodSistem.ToString();
                oPrezenta.oAngajat.Marca = rezultat.Marca;
                oPrezenta.oAngajat.Nume = rezultat.Nume;
                oPrezenta.oAngajat.Prenume = rezultat.Prenume;
                oPrezenta.oAngajat.oDepartament.Departament = rezultat.Departament;
                oPrezenta.Data = rezultat.Data.ToString();
                oPrezenta.oTipOra.TipOra = rezultat.TipOra;
                oPrezenta.R1DAL = rezultat.R1DAL.ToString();
                oPrezenta.R1ALL = rezultat.R1ALL.ToString();
                oPrezenta.R1TOT = rezultat.R1TOT.ToString();
                oPrezente.Tabela.Add(oPrezenta);
            }
                return oPrezente;
        }
        [WebMethod(EnableSession = false)]
        public PrezentaObiect PrezentaProprietati(string Id)
        {
            PrezentaObiect oPrezenta = new PrezentaObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = dcWbmOlimpias.PrezenteViews.Where(x => x.Id.Equals(Id));
            var rezultat = query.First();
            oPrezenta.oAngajat.CodAngajat = rezultat.CodAngajat.ToString();
            oPrezenta.oAngajat.CodSistem = rezultat.CodSistem.ToString();
            oPrezenta.oAngajat.Marca = rezultat.Marca;
            oPrezenta.oAngajat.Nume = rezultat.Nume;
            oPrezenta.oAngajat.Prenume = rezultat.Prenume;
            oPrezenta.oAngajat.oTipPostDeLucru.Id = rezultat.IdTipPostDeLucru.ToString();
            oPrezenta.oAngajat.oTipPostDeLucru.TipPostDeLucru = rezultat.TipPostDeLucru;
            oPrezenta.oAngajat.oPostDeLucru.Id = rezultat.IdPostDeLucru.ToString();
            oPrezenta.oAngajat.oPostDeLucru.PostDeLucru = rezultat.PostDeLucru;
            oPrezenta.oAngajat.oDepartament.Id = rezultat.IdDepartament.ToString();
            oPrezenta.oAngajat.oDepartament.Departament = rezultat.Departament;
            if (rezultat.IdEchipa.HasValue)
            {
                oPrezenta.oAngajat.oEchipa.Id = rezultat.IdEchipa.ToString();
                oPrezenta.oAngajat.oEchipa.Echipa = rezultat.Echipa;
            }
            if (rezultat.IdLinie.HasValue)
            {
                oPrezenta.oAngajat.oLinie.Id = rezultat.IdLinie.ToString();
                oPrezenta.oAngajat.oLinie.Linie = rezultat.Linie;
            }
            oPrezenta.Data = rezultat.Data.ToString("dd.MM.yyyy");
            oPrezenta.oTipOra.Id = rezultat.IdTipOra.ToString();
            oPrezenta.oTipOra.TipOra = rezultat.TipOra;
            oPrezenta.R1DAL = rezultat.R1DAL.ToString();
            oPrezenta.R1ALL = rezultat.R1ALL.ToString();
            oPrezenta.R1TOT = rezultat.R1TOT.ToString();
            return oPrezenta;
        }
        [WebMethod(EnableSession = false)]
        public PrezentaObiect PrezentaAdaugare(PrezentaObiect oPrezenta)
        {
            Nullable<int> Id = null, IdEroare = null, IdEchipa = null, IdLinie = null;
            DateTime Data;
            oPrezenta.Eroare = VerificareDate(oPrezenta);

            if (!DateTime.TryParseExact(oPrezenta.Data.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                oPrezenta.Eroare = "Data nu este corect!";

            if (!String.IsNullOrEmpty(oPrezenta.oAngajat.oEchipa.Id))
                IdEchipa = Convert.ToInt32(oPrezenta.oAngajat.oEchipa.Id);
            if (!String.IsNullOrEmpty(oPrezenta.oAngajat.oLinie.Id))
                IdLinie = Convert.ToInt32(oPrezenta.oAngajat.oLinie.Id);

            if (oPrezenta.Eroare == "")
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.PrezentaAdaugare(Convert.ToInt32(oPrezenta.oAngajat.Id), Convert.ToInt32(oPrezenta.oAngajat.oTipPostDeLucru.Id), Convert.ToInt32(oPrezenta.oAngajat.oPostDeLucru.Id), Convert.ToInt32(oPrezenta.oAngajat.oDepartament.Id), IdEchipa, IdLinie, Data, Convert.ToInt32(oPrezenta.oTipOra.Id), Convert.ToDecimal(oPrezenta.R1DAL), Convert.ToDecimal(oPrezenta.R1ALL), Convert.ToDecimal(oPrezenta.R1TOT), 1, ref Id, ref IdEroare);
                oPrezenta.Eroare = InterpretareEroare(IdEroare.ToString());
                oPrezenta.Id = Id.ToString();
            }
            return oPrezenta;
        }
        [WebMethod(EnableSession = false)]
        public PrezentaObiect PrezentaModificare(PrezentaObiect oPrezenta)
        {
            Nullable<int> Id = null, IdEroare = null, IdEchipa = null, IdLinie = null;
            DateTime Data;
            oPrezenta.Eroare = VerificareDate(oPrezenta);

            if (!DateTime.TryParseExact(oPrezenta.Data.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                oPrezenta.Eroare = "Data nu este corect!";

            if (!String.IsNullOrEmpty(oPrezenta.oAngajat.oEchipa.Id))
                IdEchipa = Convert.ToInt32(oPrezenta.oAngajat.oEchipa.Id);
            if (!String.IsNullOrEmpty(oPrezenta.oAngajat.oLinie.Id))
                IdLinie = Convert.ToInt32(oPrezenta.oAngajat.oLinie.Id);

            if (oPrezenta.Eroare == "")
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                //dcWbmOlimpias.PrezentaModificare(Convert.ToInt32(oPrezenta.CodAngajat), Convert.ToInt32(oPrezenta.CodSistem), oPrezenta.Marca, oPrezenta.Nume, oPrezenta.Prenume, oPrezenta.Strada, oPrezenta.Numar, Convert.ToInt32(oPrezenta.oLocalitate.Id), DataNasterii, oPrezenta.Somaj, DataAngajarii, DataNedeterminat, Convert.ToInt32(oPrezenta.oTipPostDeLucru.Id), DataExpirareContract, DataExpirareProba, Convert.ToInt32(oPrezenta.oIntervalDeLucru.Id), Convert.ToInt32(oPrezenta.oPostDeLucru.Id), oPrezenta.Sex, Convert.ToInt32(oPrezenta.oLoculNasterii.Id), DataInregistrareContract, oPrezenta.NumarIdentificarePersonala, Convert.ToInt32(oPrezenta.oIncadrare.Id), Convert.ToInt32(oPrezenta.oNivelStudiu.Id), IdBanca, oPrezenta.StareCivila, oPrezenta.NumarTelefon, oPrezenta.CC, Convert.ToInt32(oPrezenta.oDepartament.Id), IdEchipa, oPrezenta.AdresaEmail, oPrezenta.Prime, IdLinie, Convert.ToInt32(Session["IdUtilizator"]), Convert.ToInt32(oPrezenta.Id), ref IdEroare);
                oPrezenta.Eroare = InterpretareEroare(IdEroare.ToString());
                oPrezenta.Id = Id.ToString();
            }
            return oPrezenta;
        }
        [WebMethod(EnableSession = false)]
        public string PrezentaStergere(string Id)
        {
            string Eroare = "";
            Nullable<int> IdEroare = null;


            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            dcWbmOlimpias.PrezentaStergere(1, Convert.ToInt32(Id), ref IdEroare);
            Eroare = InterpretareEroare(IdEroare.ToString());
            return Eroare;
        }
        [WebMethod(EnableSession = false)]
        public string PrezentaImport(PrezentaObiect oPrezenta, string Urmatorul)
        {
            Nullable<int> IdEroare = null, Id = null;
            DateTime Data = DateTime.Now;

            if (Urmatorul == "Continua")
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                try
                {
                    Data = DateTime.ParseExact(oPrezenta.Data, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None);

                }
                catch (Exception)
                {
                    Data = DateTime.Now;
                    //throw;
                }
                try
                {
                    dcWbmOlimpias.PrezentaImport(Convert.ToString(oPrezenta.oAngajat.CodAngajat), Data, oPrezenta.oTipOra.CodTipOra, Convert.ToDecimal(oPrezenta.R1DAL), Convert.ToDecimal(oPrezenta.R1ALL), Convert.ToDecimal(oPrezenta.R1TOT), 1, ref Id, ref IdEroare);
                }
                catch (Exception)
                {

                    dcWbmOlimpias.PrezentaImport("", Data, oPrezenta.oTipOra.CodTipOra, Convert.ToDecimal(oPrezenta.R1DAL), Convert.ToDecimal(oPrezenta.R1ALL), Convert.ToDecimal(oPrezenta.R1TOT), 1, ref Id, ref IdEroare);
                }

                
            }
            return Urmatorul;
        }
        [WebMethod(EnableSession = false)]
        public string AngajatiImport(AngajatiObiect oAngajati)
        {
            string Eroare = "";
            //Nullable<int> IdEroare = null, Id = null;
            DateTime DataAngajarii = DateTime.Now;
            Nullable<DateTime> DataNedeterminata = null;
            DateTime DataNasterii = DateTime.Now;


            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            foreach (AngajatObiect oAngajat in oAngajati.Tabela)
            {
                DataAngajarii = DateTime.ParseExact(oAngajat.DataAngajarii, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None);

                if (oAngajat.DataNedeterminat != "00000")
                    DataNedeterminata = DateTime.ParseExact(oAngajat.DataNedeterminat, "yyyyMMdd", null, System.Globalization.DateTimeStyles.None);
                if (!DateTime.TryParseExact(oAngajat.NumarIdentificarePersonala.Substring(0, 4) + "1" + oAngajat.NumarIdentificarePersonala.Substring(4, 3), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out DataNasterii))
                    DataNasterii = DateTime.Now;
                dcWbmOlimpias.AngajatImport(Convert.ToString(oAngajat.CodAngajat), oAngajat.Nume, oAngajat.Prenume, Convert.ToInt32(oAngajat.CodSistem), oAngajat.Marca, oAngajat.NumarIdentificarePersonala, oAngajat.Sex, DataAngajarii, oAngajat.oLocalitate.Localitate, oAngajat.Strada, oAngajat.oPostDeLucru.CodPostDeLucru, oAngajat.oPostDeLucru.PostDeLucru, oAngajat.oDepartament.CodDepartament, oAngajat.oDepartament.Departament, oAngajat.oIncadrare.CodIncadrare, oAngajat.oIncadrare.Incadrare, DataNedeterminata, oAngajat.CC, "nu are cod tip post de lucru", oAngajat.oTipPostDeLucru.TipPostDeLucru, DataNasterii, oAngajat.oLoculNasterii.Localitate, 1);
            }
            return Eroare;
        }
        [WebMethod(EnableSession = false)]
        public TipPostDeLucruObiect TipPostDeLucruCautare(string TipPostDeLucru)
        {
            TipPostDeLucruObiect oTipPostDeLucru = new TipPostDeLucruObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tTipuriPostDeLucru in dcWbmOlimpias.TipuriPostDeLucrus
                        where tTipuriPostDeLucru.TipPostDeLucru.Contains(TipPostDeLucru)
                        select new { tTipuriPostDeLucru.Id, tTipuriPostDeLucru.TipPostDeLucru };
            if (query.Count() == 1)
            {
                oTipPostDeLucru.Id = query.First().Id.ToString();
                oTipPostDeLucru.TipPostDeLucru = query.First().TipPostDeLucru;
            }
            return oTipPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public PostDeLucruObiect PostDeLucruCautare(string PostDeLucru)
        {
            PostDeLucruObiect oPostDeLucru = new PostDeLucruObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tPosturiDeLucru in dcWbmOlimpias.PosturiDeLucrus
                        where tPosturiDeLucru.PostDeLucru.Contains(PostDeLucru)
                        select new { tPosturiDeLucru.Id, tPosturiDeLucru.PostDeLucru };
            if (query.Count() == 1)
            {
                oPostDeLucru.Id = query.First().Id.ToString();
                oPostDeLucru.PostDeLucru = query.First().PostDeLucru;
            }
            return oPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public DepartamentObiect DepartamentCautare(string Departament)
        {
            DepartamentObiect oDepartament = new DepartamentObiect();

            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tDepartamente in dcWbmOlimpias.Departamentes
                        where tDepartamente.Departament.Contains(Departament)
                        select new { tDepartamente.Id, tDepartamente.Departament };
            if (query.Count() == 1)
            {
                oDepartament.Id = query.First().Id.ToString();
                oDepartament.Departament = query.First().Departament;
            }
            return oDepartament;
        }
        [WebMethod(EnableSession = false)]
        public EchipaObiect EchipaCautare(string Echipa)
        {
            EchipaObiect oEchipa = new EchipaObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tEchipe in dcWbmOlimpias.Echipes
                        where tEchipe.Echipa.Contains(Echipa)
                        select new { tEchipe.Id, tEchipe.Echipa };
            if (query.Count() == 1)
            {
                oEchipa.Id = query.First().Id.ToString();
                oEchipa.Echipa = query.First().Echipa;
            }
            return oEchipa;
        }
        [WebMethod(EnableSession = false)]
        public LinieObiect LinieCautare(string Linie)
        {
            LinieObiect oLinie = new LinieObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tLinii in dcWbmOlimpias.Liniis
                        where tLinii.Linie.Contains(Linie)
                        select new { tLinii.Id, tLinii.Linie };
            if (query.Count() == 1)
            {
                oLinie.Id = query.First().Id.ToString();
                oLinie.Linie = query.First().Linie;
            }
            return oLinie;
        }
        [WebMethod(EnableSession = false)]
        public TipOraObiect TipOraCautare(string TipOra)
        {
            TipOraObiect oTipOra = new TipOraObiect();
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var query = from tTipuriOre in dcWbmOlimpias.TipuriOres
                        where tTipuriOre.TipOra.Contains(TipOra)
                        select new { tTipuriOre.Id, tTipuriOre.TipOra };
            if (query.Count() == 1)
            {
                oTipOra.Id = query.First().Id.ToString();
                oTipOra.TipOra = query.First().TipOra;
            }
            return oTipOra;
        }

        private string VerificareDate(PrezentaObiect oPrezenta)
        {
            string Eroare = "";
            if (oPrezenta.oAngajat.Id == "")
                Eroare = InterpretareEroare("1");
            if (oPrezenta.oAngajat.oTipPostDeLucru.Id == "")
                Eroare = InterpretareEroare("2");
            if (oPrezenta.oAngajat.oPostDeLucru.Id == "")
                Eroare = InterpretareEroare("3");
            if (oPrezenta.oAngajat.oDepartament.Id == "")
                Eroare = InterpretareEroare("4");
            if (oPrezenta.oTipOra.Id == "")
                Eroare = InterpretareEroare("5");
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
                    Eroare = "Completati corect campul Cod Prezenta!";
                    break;
                case "12":
                    Eroare = "Completati corect campul Cod sistem!";
                    break;
                case "13":
                    Eroare = "Completati campul Marca!";
                    break;
                case "101":
                    Eroare = "Cod Prezenta existent!";
                    break;
                case "102":
                    Eroare = "Cod sistem Prezenta existent!";
                    break;
                case "103":
                    Eroare = "Marca Prezenta existent!";
                    break;
                case "104":
                    Eroare = "Nume,prenume Prezenta existent!";
                    break;
                case "105":
                    Eroare = "Numar identificare personala existent!";
                    break;
                case "201":
                    Eroare = "Prezentaul nu se poate sterge, sunt date salvate cu acest Prezenta!";
                    break;
            }
            return Eroare;
        }

    }
}