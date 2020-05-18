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
    public class AngajatiObiect
    {
        public List<AngajatObiect> Tabela;
        public int PaginaCurenta;
        public int NumarPagini;
        public int IndexRand;
        public string Eroare;
        public AngajatiObiect()
        {
            Tabela = new List<AngajatObiect>();
            IndexRand = 0;
            PaginaCurenta = 0;
            NumarPagini = 0;
            Eroare = "";
        }
    }
    public class AngajatObiect
    {
        public string Id;
        public string CodAngajat;
        public string CodSistem;
        public string Marca;
        public string Nume;
        public string Prenume;
        public string Strada;
        public LocalitateObiect oLocalitate;
        public string DataNasterii;
        public string Somaj;
        public string DataAngajarii;
        public string DataNedeterminat;
        public TipPostDeLucruObiect oTipPostDeLucru;
        public string DataExpirareContract;
        public string DataExpirareProba;
        public IntervalDeLucruObiect oIntervalDeLucru;
        public PostDeLucruObiect oPostDeLucru; 
        public string Sex;
        public LocalitateObiect oLoculNasterii;
        public string NumarIdentificarePersonala;
        public IncadrareObiect oIncadrare;
        public NivelStudiuObiect oNivelStudiu;
        public BancaObiect oBanca;
        public string StareCivila;
        public string NumarTelefon;
        public string CC;
        public DepartamentObiect oDepartament;
        public EchipaObiect oEchipa;
        public string AdresaEmail;
        public LinieObiect oLinie;
        public string DataLichidarii;
        public string DataMaternitate;
        public string Eroare;
        public AngajatObiect()
        {
            Id = "";
            CodAngajat = "";
            CodSistem = "";
            Marca = "";
            Nume = "";
            Prenume = "";
            Strada = "";
            oLocalitate = new LocalitateObiect();
            DataNasterii = "";
            Somaj = "";
            DataAngajarii = "";
            DataNedeterminat = "";
            oTipPostDeLucru = new TipPostDeLucruObiect();
            DataExpirareContract = "";
            DataExpirareProba = "";
            oIntervalDeLucru = new IntervalDeLucruObiect();
            oPostDeLucru = new PostDeLucruObiect(); 
            Sex = "";
            oLoculNasterii = new LocalitateObiect();
            NumarIdentificarePersonala = "";
            oIncadrare = new IncadrareObiect();
            oNivelStudiu = new NivelStudiuObiect();
            oBanca = new BancaObiect();
            StareCivila = "";
            NumarTelefon = "";
            CC = "";
            oDepartament = new DepartamentObiect();
            oEchipa = new EchipaObiect();
            AdresaEmail = "";
            oLinie = new LinieObiect();
            DataLichidarii = "";
            DataMaternitate = "";
            Eroare = "";
        }
    }
    public class FiltruAngajatiObiect
    {
        public string Find;
        public string FiltruCodAngajat;
        public string FiltruCodSistem;
        public string FiltruMarca;
        public string FiltruNume;
        public string FiltruDepartament;
        public string FiltruEchipa;
        public string FiltruLinie;
        public FiltruAngajatiObiect()
        {
            Find = "";
            FiltruCodAngajat = "";
            FiltruCodSistem = "";
            FiltruMarca = "";
            FiltruNume = "";
            FiltruDepartament = "";
            FiltruEchipa = "";
            FiltruLinie = "";
        }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [GenerateScriptType(typeof(LocalitateObiect))]
    [GenerateScriptType(typeof(TipPostDeLucruObiect))]
    [GenerateScriptType(typeof(IntervalDeLucruObiect))]
    [GenerateScriptType(typeof(PostDeLucruObiect))]
    [GenerateScriptType(typeof(NivelStudiuObiect))]
    [GenerateScriptType(typeof(DepartamentObiect))]
    [GenerateScriptType(typeof(EchipaObiect))]
    [GenerateScriptType(typeof(LinieObiect))]
    [ScriptService]
    public class AngajatiWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = false)]
        public AngajatiObiect AngajatiLista(FiltruAngajatiObiect oFiltruAngajat, int PaginaCurenta)
        {
            AngajatiObiect oAngajati = new AngajatiObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tAngajati in dcWbmOlimpias.AngajatiViews
                            orderby tAngajati.Nume, tAngajati.Id
                            select new { tAngajati.Id, tAngajati.CodAngajat, tAngajati.CodSistem, tAngajati.Marca, tAngajati.Nume, tAngajati.Prenume, tAngajati.Departament, tAngajati.Echipa, tAngajati.Linie };
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruCodAngajat))
                    query = query.Where(x => x.CodAngajat.Contains(oFiltruAngajat.FiltruCodAngajat));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruCodSistem))
                    query = query.Where(x => x.CodSistem.ToString().Contains(oFiltruAngajat.FiltruCodSistem));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruMarca))
                    query = query.Where(x => x.Marca.Contains(oFiltruAngajat.FiltruMarca));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruNume))
                    query = query.Where(x => x.Nume.Contains(oFiltruAngajat.FiltruNume));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruDepartament))
                    query = query.Where(x => x.Departament.Contains(oFiltruAngajat.FiltruDepartament));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruEchipa))
                    query = query.Where(x => x.Echipa.Contains(oFiltruAngajat.FiltruEchipa));
                if (!String.IsNullOrEmpty(oFiltruAngajat.FiltruLinie))
                    query = query.Where(x => x.Linie.Contains(oFiltruAngajat.FiltruLinie));
                
                oAngajati.NumarPagini = (query.Count() - 1) / 5 + 1;
                if (oFiltruAngajat.Find == "")
                {
                    oAngajati.PaginaCurenta = PaginaCurenta;
                    oAngajati.IndexRand = 0;
                }
                else
                {
                    int Pozitie = 0;
                    Pozitie = query.ToList().FindIndex(A => A.Id.Equals(Convert.ToInt32(oFiltruAngajat.Find)));

                    oAngajati.PaginaCurenta = Pozitie / 5 + 1;
                    oAngajati.IndexRand = Pozitie - (oAngajati.PaginaCurenta - 1) * 5;
                }
                if (oAngajati.NumarPagini < oAngajati.PaginaCurenta)
                    oAngajati.PaginaCurenta = oAngajati.NumarPagini;
                if (oAngajati.PaginaCurenta < 1)
                    oAngajati.PaginaCurenta = 1;
                foreach (var rezultat in query.Skip(5 * (oAngajati.PaginaCurenta - 1)).Take(10))
                {
                    AngajatObiect oAngajat = new AngajatObiect();
                    oAngajat.Id = rezultat.Id.ToString();
                    oAngajat.CodAngajat = rezultat.CodAngajat;
                    oAngajat.CodSistem = rezultat.CodSistem.ToString();
                    oAngajat.Marca = rezultat.Marca;
                    oAngajat.Nume = rezultat.Nume;
                    oAngajat.Prenume = rezultat.Prenume;
                    oAngajat.oDepartament.Departament = rezultat.Departament;
                    oAngajati.Tabela.Add(oAngajat);
                }
            }
            else
                oAngajati.Eroare = "Acces interzis!";
            return oAngajati;
        }
        [WebMethod(EnableSession = false)]
        public AngajatObiect AngajatProprietati(string Id)
        {
            AngajatObiect oAngajat = new AngajatObiect();
            if (GlobalClass.VerificareAcces("Angajati", "1"))
            {
                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = dcWbmOlimpias.AngajatiViews.Where(x => x.Id.Equals(Id));
                var rezultat = query.First();
                oAngajat.CodAngajat = rezultat.CodAngajat;
                oAngajat.CodSistem = rezultat.CodSistem.ToString();
                oAngajat.Marca = rezultat.Marca;
                oAngajat.Nume = rezultat.Nume;
                oAngajat.Prenume = rezultat.Prenume;
                oAngajat.Strada = rezultat.Strada;
                oAngajat.oLocalitate.Id = rezultat.IdLocalitate.ToString();
                oAngajat.oLocalitate.Localitate = rezultat.Localitate;
                oAngajat.DataNasterii = rezultat.DataNasterii.ToString("dd.MM.yyyy");
                oAngajat.Somaj = rezultat.Somaj;
                oAngajat.DataAngajarii = rezultat.DataAngajarii.ToString("dd.MM.yyyy");
                if (rezultat.DataNedeterminat.HasValue)
                    oAngajat.DataNedeterminat = rezultat.DataNedeterminat.Value.ToString("dd.MM.yyyy");
                oAngajat.oTipPostDeLucru.Id = rezultat.IdTipPostDeLucru.ToString();
                oAngajat.oTipPostDeLucru.TipPostDeLucru = rezultat.TipPostDeLucru;
                if (rezultat.DataExpirareContract.HasValue)
                    oAngajat.DataExpirareContract = rezultat.DataExpirareContract.Value.ToString("dd.MM.yyyy");
                if (rezultat.DataExpirareProba.HasValue)
                    oAngajat.DataExpirareProba = rezultat.DataExpirareProba.Value.ToString("dd.MM.yyyy");
                oAngajat.oIntervalDeLucru.Id = rezultat.IdIntervalDeLucru.ToString();
                oAngajat.oIntervalDeLucru.IntervalDeLucru = rezultat.IntervalDeLucru;
                oAngajat.oPostDeLucru.Id = rezultat.IdPostDeLucru.ToString();
                oAngajat.oPostDeLucru.PostDeLucru = rezultat.PostDeLucru;
                oAngajat.Sex = rezultat.Sex;
                oAngajat.oLoculNasterii.Id = rezultat.IdLoculNasterii.ToString();
                oAngajat.oLoculNasterii.Localitate = rezultat.LoculNasterii;
                oAngajat.NumarIdentificarePersonala = rezultat.NumarIdentificarePersonala;
                oAngajat.oIncadrare.Id = rezultat.IdIncadrare.ToString();
                oAngajat.oIncadrare.Incadrare = rezultat.Incadrare;
                oAngajat.oNivelStudiu.Id = rezultat.IdNivelStudiu.ToString();
                oAngajat.oNivelStudiu.NivelStudiu = rezultat.NivelStudiu;
                if (rezultat.IdBanca.HasValue)
                {
                    oAngajat.oBanca.Id = rezultat.IdBanca.ToString();
                    oAngajat.oBanca.Banca = rezultat.Banca;
                }
                oAngajat.StareCivila = rezultat.StareCivila;
                oAngajat.NumarTelefon = rezultat.NumarTelefon;
                oAngajat.CC = rezultat.CC;
                oAngajat.oDepartament.Id = rezultat.IdDepartament.ToString();
                oAngajat.oDepartament.Departament = rezultat.Departament;
                if (rezultat.IdEchipa.HasValue)
                {
                    oAngajat.oEchipa.Id = rezultat.IdEchipa.ToString();
                    oAngajat.oEchipa.Echipa = rezultat.Echipa;
                }
                oAngajat.AdresaEmail = rezultat.AdresaEmail;
                if (rezultat.IdLinie.HasValue)
                {
                    oAngajat.oLinie.Id = rezultat.IdLinie.ToString();
                    oAngajat.oLinie.Linie = rezultat.Linie;
                }
                if (rezultat.DataLichidarii.HasValue)
                    oAngajat.DataLichidarii = rezultat.DataLichidarii.Value.ToString("dd.MM.yyyy");
                if (rezultat.DataMaternitate.HasValue)
                    oAngajat.DataMaternitate = rezultat.DataMaternitate.Value.ToString("dd.MM.yyyy");
            }
            else
                oAngajat.Eroare = "Acces interzis!";
            return oAngajat;
        }
        [WebMethod(EnableSession = false)]
        public AngajatObiect AngajatAdaugare(AngajatObiect oAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Adaugare"))
            {
                Nullable<int> Id = null, IdEroare = null, IdBanca = null, IdEchipa = null, IdLinie = null;
                Nullable<DateTime> DataExpirareContract = null, DataNedeterminat = null, DataExpirareProba = null, DataLichidarii = null, DataMaternitate = null;
                DateTime Data, DataAngajarii, DataNasterii;
                oAngajat.Eroare = VerificareDate(oAngajat);

                if (!DateTime.TryParseExact(oAngajat.DataNasterii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out DataNasterii))
                    oAngajat.Eroare = "Data nasterii nu e corect!";
                if (!DateTime.TryParseExact(oAngajat.DataAngajarii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out DataAngajarii))
                    oAngajat.Eroare = "Data angajarii nu e corect!";
                if (!String.IsNullOrEmpty(oAngajat.DataNedeterminat))
                    if (DateTime.TryParseExact(oAngajat.DataNedeterminat.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataNedeterminat = Data;
                    else
                        oAngajat.Eroare = "Data nedeterminat nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataExpirareContract))
                    if (DateTime.TryParseExact(oAngajat.DataExpirareContract.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataExpirareContract = Data;
                    else
                        oAngajat.Eroare = "Data expirare contract nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataExpirareProba))
                    if (DateTime.TryParseExact(oAngajat.DataExpirareProba.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataExpirareProba = Data;
                    else
                        oAngajat.Eroare = "Data expirare proba nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataLichidarii))
                    if (DateTime.TryParseExact(oAngajat.DataLichidarii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataLichidarii = Data;
                    else
                        oAngajat.Eroare = "Data lichidarii nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataMaternitate))
                    if (DateTime.TryParseExact(oAngajat.DataMaternitate.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataMaternitate = Data;
                    else
                        oAngajat.Eroare = "Data maternitate nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.oBanca.Id))
                    IdBanca = Convert.ToInt32(oAngajat.oBanca.Id);
                if (!String.IsNullOrEmpty(oAngajat.oEchipa.Id))
                    IdEchipa = Convert.ToInt32(oAngajat.oEchipa.Id);
                if (!String.IsNullOrEmpty(oAngajat.oLinie.Id))
                    IdLinie = Convert.ToInt32(oAngajat.oLinie.Id);

                if (oAngajat.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.AngajatAdaugare((oAngajat.CodAngajat), Convert.ToInt32(oAngajat.CodSistem), oAngajat.Marca, oAngajat.Nume, oAngajat.Prenume, oAngajat.Strada, Convert.ToInt32(oAngajat.oLocalitate.Id), DataNasterii, oAngajat.Somaj, DataAngajarii, DataNedeterminat, Convert.ToInt32(oAngajat.oTipPostDeLucru.Id), DataExpirareContract, DataExpirareProba, Convert.ToInt32(oAngajat.oIntervalDeLucru.Id), Convert.ToInt32(oAngajat.oPostDeLucru.Id), oAngajat.Sex, Convert.ToInt32(oAngajat.oLoculNasterii.Id), oAngajat.NumarIdentificarePersonala, Convert.ToInt32(oAngajat.oIncadrare.Id), Convert.ToInt32(oAngajat.oNivelStudiu.Id), IdBanca, oAngajat.StareCivila, oAngajat.NumarTelefon, oAngajat.CC, Convert.ToInt32(oAngajat.oDepartament.Id), IdEchipa, oAngajat.AdresaEmail, IdLinie, DataLichidarii, DataMaternitate, Convert.ToInt32("1"), ref Id, ref IdEroare);
                    oAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                    oAngajat.Id = Id.ToString();
                }
            }
            else
                oAngajat.Eroare = "Nu aveti drept de adaugare!";
            return oAngajat;
        }
        [WebMethod(EnableSession = false)]
        public AngajatObiect AngajatModificare(AngajatObiect oAngajat)
        {
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Modificare"))
            {
                Nullable<int> IdEroare = null, IdBanca = null, IdEchipa = null, IdLinie = null;
                Nullable<DateTime> DataExpirareContract = null, DataNedeterminat = null, DataExpirareProba = null, DataLichidarii = null, DataMaternitate = null;
                DateTime Data, DataAngajarii, DataNasterii;
                oAngajat.Eroare = VerificareDate(oAngajat);

                if (!DateTime.TryParseExact(oAngajat.DataNasterii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out DataNasterii))
                    oAngajat.Eroare = "Data nasterii nu e corect!";
                if (!DateTime.TryParseExact(oAngajat.DataAngajarii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out DataAngajarii))
                    oAngajat.Eroare = "Data angajarii nu e corect!";
                if (!String.IsNullOrEmpty(oAngajat.DataNedeterminat))
                    if (DateTime.TryParseExact(oAngajat.DataNedeterminat.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataNedeterminat = Data;
                    else
                        oAngajat.Eroare = "Data nedeterminat nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataExpirareContract))
                    if (DateTime.TryParseExact(oAngajat.DataExpirareContract.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataExpirareContract = Data;
                    else
                        oAngajat.Eroare = "Data expirare contract nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataExpirareProba))
                    if (DateTime.TryParseExact(oAngajat.DataExpirareProba.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataExpirareProba = Data;
                    else
                        oAngajat.Eroare = "Data expirare proba nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataLichidarii))
                    if (DateTime.TryParseExact(oAngajat.DataLichidarii.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataLichidarii = Data;
                    else
                        oAngajat.Eroare = "Data lichidarii nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.DataMaternitate))
                    if (DateTime.TryParseExact(oAngajat.DataMaternitate.Replace(".", ""), "ddMMyyyy", null, System.Globalization.DateTimeStyles.None, out Data))
                        DataMaternitate = Data;
                    else
                        oAngajat.Eroare = "Data maternitate nu e corect!";

                if (!String.IsNullOrEmpty(oAngajat.oBanca.Id))
                    IdBanca = Convert.ToInt32(oAngajat.oBanca.Id);
                if (!String.IsNullOrEmpty(oAngajat.oEchipa.Id))
                    IdEchipa = Convert.ToInt32(oAngajat.oEchipa.Id);
                if (!String.IsNullOrEmpty(oAngajat.oLinie.Id))
                    IdLinie = Convert.ToInt32(oAngajat.oLinie.Id);

                if (oAngajat.Eroare == "")
                {
                    DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                    dcWbmOlimpias.AngajatModificare((oAngajat.CodAngajat), Convert.ToInt32(oAngajat.CodSistem), oAngajat.Marca, oAngajat.Nume, oAngajat.Prenume, oAngajat.Strada, Convert.ToInt32(oAngajat.oLocalitate.Id), DataNasterii, oAngajat.Somaj, DataAngajarii, DataNedeterminat, Convert.ToInt32(oAngajat.oTipPostDeLucru.Id), DataExpirareContract, DataExpirareProba, Convert.ToInt32(oAngajat.oIntervalDeLucru.Id), Convert.ToInt32(oAngajat.oPostDeLucru.Id), oAngajat.Sex, Convert.ToInt32(oAngajat.oLoculNasterii.Id), oAngajat.NumarIdentificarePersonala, Convert.ToInt32(oAngajat.oIncadrare.Id), Convert.ToInt32(oAngajat.oNivelStudiu.Id), IdBanca, oAngajat.StareCivila, oAngajat.NumarTelefon, oAngajat.CC, Convert.ToInt32(oAngajat.oDepartament.Id), IdEchipa, oAngajat.AdresaEmail, IdLinie, DataLichidarii, DataMaternitate, Convert.ToInt32("1"), Convert.ToInt32(oAngajat.Id), ref IdEroare);
                    oAngajat.Eroare = InterpretareEroare(IdEroare.ToString());
                }
            }
            else
                oAngajat.Eroare = "Nu aveti drept de modificare!";
            return oAngajat;
        }
        [WebMethod(EnableSession = false)]
        public string AngajatStergere(string Id="1")
        {
            string Eroare = "";
            if (GlobalClass.VerificareAccesOperatie("Angajati", "1", "Stergere"))
            {
                Nullable<int> IdEroare = null;
                

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                dcWbmOlimpias.AngajatStergere(Convert.ToInt32("1"), Convert.ToInt32(Id), ref IdEroare);
                Eroare = InterpretareEroare(IdEroare.ToString());
            }
            else
                Eroare = "Nu aveti drept de stergere!";
            return Eroare;
        }
        [WebMethod(EnableSession = false)]
        public LocalitateObiect LocalitateCautare(string Localitate)
        {
            LocalitateObiect oLocalitate = new LocalitateObiect();
            if (GlobalClass.VerificareAcces("Localitati", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLocalitati in dcWbmOlimpias.Localitatis
                            where tLocalitati.Localitate.Contains(Localitate)
                            select new { tLocalitati.Id, tLocalitati.Localitate };
                if (query.Count() == 1)
                {
                    oLocalitate.Id = query.First().Id.ToString();
                    oLocalitate.Localitate = query.First().Localitate;
                }
            }
            else
                oLocalitate.Eroare = "Acces interzis!";
            return oLocalitate;
        }
        [WebMethod(EnableSession = false)]
        public TipPostDeLucruObiect TipPostDeLucruCautare(string TipPostDeLucru)
        {
            TipPostDeLucruObiect oTipPostDeLucru = new TipPostDeLucruObiect();
            if (GlobalClass.VerificareAcces("Tipuri post de lucru", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tTipuriPostDeLucru in dcWbmOlimpias.TipuriPostDeLucrus
                            where tTipuriPostDeLucru.TipPostDeLucru.Contains(TipPostDeLucru)
                            select new { tTipuriPostDeLucru.Id, tTipuriPostDeLucru.TipPostDeLucru };
                if (query.Count() == 1)
                {
                    oTipPostDeLucru.Id = query.First().Id.ToString();
                    oTipPostDeLucru.TipPostDeLucru = query.First().TipPostDeLucru;
                }
            }
            else
                oTipPostDeLucru.Eroare = "Acces interzis!";
            return oTipPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public IntervalDeLucruObiect IntervalDeLucruCautare(string IntervalDeLucru)
        {
            IntervalDeLucruObiect oIntervalDeLucru = new IntervalDeLucruObiect();
            if (GlobalClass.VerificareAcces("Intervale de lucru", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIntervaleDeLucru in dcWbmOlimpias.IntervaleDeLucrus
                            where tIntervaleDeLucru.IntervalDeLucru.Contains(IntervalDeLucru)
                            select new { tIntervaleDeLucru.Id, tIntervaleDeLucru.IntervalDeLucru };
                if (query.Count() == 1)
                {
                    oIntervalDeLucru.Id = query.First().Id.ToString();
                    oIntervalDeLucru.IntervalDeLucru = query.First().IntervalDeLucru;
                }
            }
            else
                oIntervalDeLucru.Eroare = "Acces interzis!";
            return oIntervalDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public PostDeLucruObiect PostDeLucruCautare(string PostDeLucru)
        {
            PostDeLucruObiect oPostDeLucru = new PostDeLucruObiect();
            if (GlobalClass.VerificareAcces("Posturi de lucru", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tPosturiDeLucru in dcWbmOlimpias.PosturiDeLucrus
                            where tPosturiDeLucru.PostDeLucru.Contains(PostDeLucru)
                            select new { tPosturiDeLucru.Id, tPosturiDeLucru.PostDeLucru };
                if (query.Count() == 1)
                {
                    oPostDeLucru.Id = query.First().Id.ToString();
                    oPostDeLucru.PostDeLucru = query.First().PostDeLucru;
                }
            }
            else
                oPostDeLucru.Eroare = "Acces interzis!";
            return oPostDeLucru;
        }
        [WebMethod(EnableSession = false)]
        public LocalitateObiect LoculNasteriiCautare(string Localitate)
        {
            LocalitateObiect oLocalitate = new LocalitateObiect();
            if (GlobalClass.VerificareAcces("Localitati", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLocalitati in dcWbmOlimpias.Localitatis
                            where tLocalitati.Localitate.Contains(Localitate)
                            select new { tLocalitati.Id, tLocalitati.Localitate };
                if (query.Count() == 1)
                {
                    oLocalitate.Id = query.First().Id.ToString();
                    oLocalitate.Localitate = query.First().Localitate;
                }
            }
            else
                oLocalitate.Eroare = "Acces interzis!";
            return oLocalitate;
        }
        [WebMethod(EnableSession = false)]
        public IncadrareObiect IncadrareCautare(string Incadrare)
        {
            IncadrareObiect oIncadrare = new IncadrareObiect();
            if (GlobalClass.VerificareAcces("Incadrari", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tIncadrari in dcWbmOlimpias.Incadraris
                            where tIncadrari.Incadrare.Contains(Incadrare)
                            select new { tIncadrari.Id, tIncadrari.Incadrare };
                if (query.Count() == 1)
                {
                    oIncadrare.Id = query.First().Id.ToString();
                    oIncadrare.Incadrare = query.First().Incadrare;
                }
            }
            else
                oIncadrare.Eroare = "Acces interzis!";
            return oIncadrare;
        }
        [WebMethod(EnableSession = false)]
        public NivelStudiuObiect NivelStudiuCautare(string NivelStudiu)
        {
            NivelStudiuObiect oNivelStudiu = new NivelStudiuObiect();
            if (GlobalClass.VerificareAcces("Nivele studii", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tNiveleStudii in dcWbmOlimpias.NiveleStudiis
                            where tNiveleStudii.NivelStudiu.Contains(NivelStudiu)
                            select new { tNiveleStudii.Id, tNiveleStudii.NivelStudiu };
                if (query.Count() == 1)
                {
                    oNivelStudiu.Id = query.First().Id.ToString();
                    oNivelStudiu.NivelStudiu = query.First().NivelStudiu;
                }
            }
            else
                oNivelStudiu.Eroare = "Acces interzis!";
            return oNivelStudiu;
        }
        [WebMethod(EnableSession = false)]
        public BancaObiect BancaCautare(string Banca)
        {
            BancaObiect oBanca = new BancaObiect();
            if (GlobalClass.VerificareAcces("Banci", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tBanci in dcWbmOlimpias.Bancis
                            where tBanci.Banca.Contains(Banca)
                            select new { tBanci.Id, tBanci.Banca };
                if (query.Count() == 1)
                {
                    oBanca.Id = query.First().Id.ToString();
                    oBanca.Banca = query.First().Banca;
                }
            }
            else
                oBanca.Eroare = "Acces interzis!";
            return oBanca;
        }
        [WebMethod(EnableSession = false)]
        public DepartamentObiect DepartamentCautare(string Departament)
        {
            DepartamentObiect oDepartament = new DepartamentObiect();
            if (GlobalClass.VerificareAcces("Departamente", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tDepartamente in dcWbmOlimpias.Departamentes
                            where tDepartamente.Departament.Contains(Departament)
                            select new { tDepartamente.Id, tDepartamente.Departament };
                if (query.Count() == 1)
                {
                    oDepartament.Id = query.First().Id.ToString();
                    oDepartament.Departament = query.First().Departament;
                }
            }
            else
                oDepartament.Eroare = "Acces interzis!";
            return oDepartament;
        }
        [WebMethod(EnableSession = false)]
        public EchipaObiect EchipaCautare(string Echipa)
        {
            EchipaObiect oEchipa = new EchipaObiect();
            if (GlobalClass.VerificareAcces("Echipe", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tEchipe in dcWbmOlimpias.Echipes
                            where tEchipe.Echipa.Contains(Echipa)
                            select new { tEchipe.Id, tEchipe.Echipa };
                if (query.Count() == 1)
                {
                    oEchipa.Id = query.First().Id.ToString();
                    oEchipa.Echipa = query.First().Echipa;
                }
            }
            else
                oEchipa.Eroare = "Acces interzis!";
            return oEchipa;
        }
        [WebMethod(EnableSession = false)]
        public LinieObiect LinieCautare(string Linie)
        {
            LinieObiect oLinie = new LinieObiect();
            if (GlobalClass.VerificareAcces("Linii", "1"))
            {

                DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
                var query = from tLinii in dcWbmOlimpias.Liniis
                            where tLinii.Linie.Contains(Linie)
                            select new { tLinii.Id, tLinii.Linie };
                if (query.Count() == 1)
                {
                    oLinie.Id = query.First().Id.ToString();
                    oLinie.Linie = query.First().Linie;
                }
            }
            else
                oLinie.Eroare = "Acces interzis!";
            return oLinie;
        }
        private string VerificareDate(AngajatObiect oAngajat)
        {
            string Eroare = "";
            int value;
            if (oAngajat.Nume == "")
                Eroare = InterpretareEroare("1");
            if (oAngajat.Prenume == "")
                Eroare = InterpretareEroare("2");
            if (oAngajat.oLocalitate.Id == "")
                Eroare = InterpretareEroare("3");
            if (oAngajat.oTipPostDeLucru.Id == "")
                Eroare = InterpretareEroare("4");
            if (oAngajat.oIntervalDeLucru.Id == "")
                Eroare = InterpretareEroare("5");
            if (oAngajat.oPostDeLucru.Id == "")
                Eroare = InterpretareEroare("6");
            if (oAngajat.oLoculNasterii.Id == "")
                Eroare = InterpretareEroare("7");
            if (oAngajat.oIncadrare.Id == "")
                Eroare = InterpretareEroare("8");
            if (oAngajat.oNivelStudiu.Id == "")
                Eroare = InterpretareEroare("9");
            if (oAngajat.oDepartament.Id == "")
                Eroare = InterpretareEroare("10");
            if (!Int32.TryParse(oAngajat.CodAngajat, out value))
                Eroare = InterpretareEroare("11");
            if (!Int32.TryParse(oAngajat.CodSistem, out value))
                Eroare = InterpretareEroare("12");
            if (String.IsNullOrEmpty(oAngajat.Marca))
                Eroare = InterpretareEroare("13");
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
                    Eroare = "Completati corect campul Cod angajat!";
                    break;
                case "12":
                    Eroare = "Completati corect campul Cod sistem!";
                    break;
                case "13":
                    Eroare = "Completati campul Marca!";
                    break;
                case "101":
                    Eroare = "Cod angajat existent!";
                    break;
                case "102":
                    Eroare = "Cod sistem angajat existent!";
                    break;
                case "103":
                    Eroare = "Marca angajat existent!";
                    break;
                case "104":
                    Eroare = "Nume,prenume angajat existent!";
                    break;
                case "105":
                    Eroare = "Numar identificare personala existent!";
                    break;
                case "201":
                    Eroare = "Angajatul nu se poate sterge, sunt date salvate cu acest Angajat!";
                    break;
            }
            return Eroare;
        }

    }
}