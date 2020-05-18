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
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    public class ImportWS : System.Web.Services.WebService
    {
        [WebMethod(EnableSession=true)]
        public void ImportPrezentaAdaugare(int CodAngajat, int CodSistem, string Marca, string Nume,string Prenume, int DataAngajariiZi, 
            int DataAngajariiLuna, int DataAngajariiAn, string DataLichidariiZi, string DataLichidariiLuna, string DataLichidariiAn,
            string CodPostDeLucru, string PostDeLucru, string CodDeparatment, string Departament, int DataZi, int DataLuna, int DataAn,
            string CodTipOra, string TipOra, string R1DAL, string R1ALL, string R1TOT, string CodEchipaLinie)
        {
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var importPrezente = new ImportPrezente();
            importPrezente.CodAngajat = CodAngajat;
            importPrezente.CodSistem = CodSistem;
            importPrezente.Marca = Marca;
            importPrezente.Nume = Nume;
            importPrezente.Prenume = Prenume;
            DateTime DataAngajarii = new DateTime(DataAngajariiAn, DataAngajariiLuna, DataAngajariiZi);
            importPrezente.DataAngajarii = DataAngajarii;
            if (DataLichidariiAn != "0")
            {
                DateTime DataLichidarii = new DateTime(Convert.ToInt32(DataLichidariiAn), Convert.ToInt32(DataLichidariiLuna), Convert.ToInt32(DataLichidariiZi));
                importPrezente.DataLichidarii = DataLichidarii;
            }
            importPrezente.CodPostDeLucru = CodPostDeLucru;
            importPrezente.PostDeLucru = PostDeLucru;
            importPrezente.CodDeparatment = CodDeparatment;
            importPrezente.Departament = Departament;
            DateTime Data = new DateTime(DataAn, DataLuna, DataZi);
            importPrezente.Data = Data;
            importPrezente.CodTipOra = CodTipOra;
            importPrezente.TipOra = TipOra;
            importPrezente.R1DAL = Convert.ToDecimal(R1DAL);
            importPrezente.R1ALL = Convert.ToDecimal(R1ALL);
            importPrezente.R1TOT = Convert.ToDecimal(R1TOT);
            if (CodEchipaLinie.Contains("NIS C ") || CodEchipaLinie.Contains("NIS L "))
                importPrezente.CodLinie = CodEchipaLinie.Substring(CodEchipaLinie.Length - 2, 2).Replace(" ", "");
            else if (CodEchipaLinie.Contains("NIS S ") || CodEchipaLinie.Contains("NIS T "))
                importPrezente.CodEchipa = CodEchipaLinie.Substring(CodEchipaLinie.Length - 2, 2).Replace(" ", "");
            dcWbmOlimpias.ImportPrezentes.InsertOnSubmit(importPrezente);
            dcWbmOlimpias.SubmitChanges();
        }
        [WebMethod(EnableSession = false)]
        public void ImportPrezenteSalvare()
        {
            Nullable<int> IdEroare = null;
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            dcWbmOlimpias.ImportPrezenteSalvare(0, ref IdEroare);
        }

        [WebMethod(EnableSession = false)]
        public void ImportAngajatAdaugare(string CodAngajat, int CodSistem, string Marca, string Nume, string Prenume, string Strada, string Numar,
            string Localitate, int DataAngajariiZi, int DataAngajariiLuna, int DataAngajariiAn, string DataNedeterminatZi, 
            string DataNedeterminatLuna, string DataNedeterminatAn, string TipPostDeLucru, string Sex, string LoculNasterii,
            string NumarIdentificarePersonala, string CodIncadrare, string CC, string CodDepartament, string CodPostDeLucru, string CodEchipaLinie,
            string NivelStudiu, string PostDeLucru, string Incadrare, int DataLichidariiZi, int DataLichidariiLuna, int DataLichidariiAn,
            int DataMaternitateZi, int DataMaternitateLuna, int DataMaternitateAn, string Somaj)
        {
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var importAngajati = new ImportAngajati();
            importAngajati.CodAngajat = CodAngajat;
            importAngajati.CodSistem = CodSistem;
            importAngajati.Marca = Marca;
            importAngajati.Nume = Nume;
            importAngajati.Prenume = Prenume;
            importAngajati.Strada = Strada;
            importAngajati.Numar = Numar;
            importAngajati.Localitate = Localitate;
            try
            {
                if (NumarIdentificarePersonala.Substring(4, 1) == "9")
                    importAngajati.DataNasterii = new DateTime(Convert.ToInt32("1" + NumarIdentificarePersonala.Substring(4, 3)), Convert.ToInt32(NumarIdentificarePersonala.Substring(2, 2)), Convert.ToInt32(NumarIdentificarePersonala.Substring(0, 2)));
                else
                    importAngajati.DataNasterii = new DateTime(Convert.ToInt32("2" + NumarIdentificarePersonala.Substring(4, 3)), Convert.ToInt32(NumarIdentificarePersonala.Substring(2, 2)), Convert.ToInt32(NumarIdentificarePersonala.Substring(0, 2)));
            }
            catch(Exception)
            {
                importAngajati.DataNasterii = DateTime.Now;
            }
            DateTime DataAngajarii = new DateTime(DataAngajariiAn, DataAngajariiLuna, DataAngajariiZi);
            importAngajati.DataAngajarii = DataAngajarii;

            if (DataNedeterminatAn != "0")
            {
                DateTime DataNedeterminat = new DateTime(Convert.ToInt32(DataNedeterminatAn), Convert.ToInt32(DataNedeterminatLuna), Convert.ToInt32(DataNedeterminatZi));
                importAngajati.DataNedeterminat = DataNedeterminat;
            }
            importAngajati.TipPostDeLucru = TipPostDeLucru;
            importAngajati.Sex = Sex;
            importAngajati.LoculNasterii = LoculNasterii;
            importAngajati.NumarIdentificarePersonala = NumarIdentificarePersonala;
            importAngajati.CodIncadrare = CodIncadrare;
            importAngajati.CC = CC;
            importAngajati.CodDepartament = CodDepartament;
            importAngajati.CodPostDeLucru = CodPostDeLucru;
            if (CodEchipaLinie.Contains("NIS C ") || CodEchipaLinie.Contains("NIS L "))
                importAngajati.CodLinie = CodEchipaLinie.Substring(CodEchipaLinie.Length - 2, 2).Replace(" ", "");
            else if (CodEchipaLinie.Contains("NIS S ") || CodEchipaLinie.Contains("NIS T "))
                importAngajati.CodEchipa = CodEchipaLinie.Substring(CodEchipaLinie.Length - 2, 2).Replace(" ","");
            importAngajati.NivelStudiu = NivelStudiu;
            importAngajati.PostDeLucru = PostDeLucru;
            importAngajati.Incadrare = Incadrare;
            if (DataLichidariiAn != 0)
            {
                DateTime DataLichidarii = new DateTime(DataLichidariiAn, DataLichidariiLuna, DataLichidariiZi);
                importAngajati.DataLichidarii = DataLichidarii;
            }
            if (DataMaternitateAn != 0)
            {
                DateTime DataMaternitate = new DateTime(DataMaternitateAn, DataMaternitateLuna, DataMaternitateZi);
                importAngajati.DataMaternitate = DataMaternitate;
            }
            importAngajati.Somaj = Somaj;
            dcWbmOlimpias.ImportAngajatis.InsertOnSubmit(importAngajati);
            dcWbmOlimpias.SubmitChanges();
        }
        [WebMethod(EnableSession = false)]
        public void ImportAngajatiSalvare()
        {
            Nullable<int> IdEroare = null;
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            dcWbmOlimpias.ImportAngajatiSalvare(0, ref IdEroare);
        }

        [WebMethod(EnableSession = false)]
        public void ImportEficientaAngajatAdaugare(string Marca, int DataLuna, int DataAn, int Eficienta)
        {
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            var importEficienteAngajat = new ImportEficienteAngajat();
            importEficienteAngajat.Marca = Marca;
            DateTime Data = new DateTime(DataAn, DataLuna, 1);
            importEficienteAngajat.Data = Data;
            importEficienteAngajat.Eficienta = Eficienta;
            dcWbmOlimpias.ImportEficienteAngajats.InsertOnSubmit(importEficienteAngajat);
            dcWbmOlimpias.SubmitChanges();
        }

        [WebMethod(EnableSession = false)]
        public void ImportEficienteAngajatSalvare()
        {
            Nullable<int> IdEroare = null;
            DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
            dcWbmOlimpias.ImportEficienteAngajatSalvare(0, ref IdEroare);
        }

    }
}