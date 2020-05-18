using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using OfficeOpenXml;

namespace Views.HR
{
    public partial class form_anagrafiche : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (Upload.HasFile)
            {
                // ReSharper disable once PossibleNullReferenceException
                if (Path.GetExtension(Upload.FileName).Equals(".xlsx"))
                {
                    informer.Text = "Uploading... Please wait! Do not shut down this window!";
                    Button1.Enabled = false;
                    Button1.Attributes.Add("onclick", "this.style.display='none';");
                    Upload.Enabled = false;

                    var excel = new ExcelPackage(Upload.FileContent);
                    var dt = excel.ToDataTable();

                    using (var conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        foreach (DataRow row in dt.Rows)
                        {
                            try
                            {
                                int codAngajat = Convert.ToInt32(row["R3KEY"]);
                                string nume = Convert.ToString(row["R3NOM"]);
                                string prenume = Convert.ToString(row["R3COG"]);
                                int codSistem = Convert.ToInt32(row["R3IDP"]);
                                string marca = Convert.ToString(row["R3MAT"]);
                                string numaridenticare = Convert.ToString(row["R3FSC"]);
                                string sex = Convert.ToString(row["R3SEX"]);
                                string localitate = Convert.ToString(row["R3CMR"]);
                                string strada = Convert.ToString(row["R3VIR"]);
                                string codpostdelucru = Convert.ToString(row["R3MAN"]);
                                string postdelucru = Convert.ToString(row["R3DEM"]);
                                string coddepartment = Convert.ToString(row["R3ARE"]);
                                string idlinie = Convert.ToString(row["R3CLV"]);
                                string departament = Convert.ToString(row["R3DEA"]);
                                string codincadrare = Convert.ToString(row["R3CCD"]);
                                string incadrare = Convert.ToString(row["R3DCD"]);
                                string cc = Convert.ToString(row["R3IBA"]);
                                //string codtippostdelucru = Convert.ToString(row[""]);
                                string tippostdelucru = Convert.ToString(row["R3D07"]);
                                string loculnasteri = Convert.ToString(row["R3CMN"]);
                                int nivalstudio = Convert.ToInt32(row["R3QUA"]);
                                int usrId = 0;

                                string determinato = Convert.ToString(row["R3U02"]);
                                int deteindete = 0;

                                DateTime datumzaposljenja;
                                DateTime datumraskida;
                                DateTime datumistekaugovora;
                                DateTime prelazaknaneodredjeno;

                                if (determinato.Equals("T.DETE"))
                                {
                                    deteindete = 0;
                                }
                                else
                                {
                                    deteindete = 1;
                                }

                                if (coddepartment.Equals("00015"))
                                {
                                    coddepartment = "00030";
                                }

                                if (coddepartment.Equals("00035"))
                                {
                                    coddepartment = "00030";
                                }

                                if (coddepartment.Equals("00040"))
                                {
                                    coddepartment = "00030";
                                }

                                if (coddepartment.Equals("00045"))
                                {
                                    coddepartment = "00025";
                                }

                                int dan = Convert.ToInt32(row["R3GAS"]);
                                int mesec = Convert.ToInt32(row["R3MAS"]);
                                int godina = Convert.ToInt32(row["R3AAS"]);

                                //int dmesec = Convert.ToInt32(txt_mesec.tex)

                                if (godina == 0)
                                {
                                    datumzaposljenja = Convert.ToDateTime(new DateTime(0001, 1, 1).ToShortDateString());

                                }
                                else
                                {
                                    datumzaposljenja = Convert.ToDateTime(new DateTime(godina, mesec, dan).ToShortDateString());
                                }


                                int dan1 = Convert.ToInt32(row["R3GCE"]);
                                int mesec1 = Convert.ToInt32(row["R3MCE"]);
                                int godina1 = Convert.ToInt32(row["R3ACE"]);

                                if (godina1 == 0)
                                {
                                    datumraskida = Convert.ToDateTime(new DateTime(0001, 1, 1).ToShortDateString());
                                }
                                else
                                {
                                    datumraskida = Convert.ToDateTime(new DateTime(godina1, mesec1, dan1).ToShortDateString());
                                }

                                int dan2 = Convert.ToInt32(row["R3GS3"]);
                                int mesec2 = Convert.ToInt32(row["R3MS3"]);
                                int godina2 = Convert.ToInt32(row["R3AS3"]);

                                if (godina2 == 0)
                                {
                                    datumistekaugovora = Convert.ToDateTime(new DateTime(0001, 1, 1).ToShortDateString());
                                }
                                else
                                {
                                    datumistekaugovora = Convert.ToDateTime(new DateTime(godina2, mesec2, dan2).ToShortDateString());
                                }

                                int dan3 = Convert.ToInt32(row["R3GS1"]);
                                int mesec3 = Convert.ToInt32(row["R3MS1"]);
                                int godina3 = Convert.ToInt32(row["R3AS1"]);

                                if (godina3 == 0)
                                {
                                    prelazaknaneodredjeno = Convert.ToDateTime(new DateTime(0001, 1, 1).ToShortDateString());
                                }
                                else
                                {
                                    prelazaknaneodredjeno = Convert.ToDateTime(new DateTime(godina3, mesec3, dan3).ToShortDateString());
                                }



                                string telefon = Convert.ToString(row["R3PTE"]) + Convert.ToString(row["R3NTE"]);

                                using (SqlCommand cmd = new SqlCommand("AngajatImportSaMesecomIGodinom", conn))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.Add("@CodAngajat", SqlDbType.Int).Value = codAngajat;
                                    cmd.Parameters.Add("@Nume", SqlDbType.VarChar).Value = nume;
                                    cmd.Parameters.Add("@Prenume", SqlDbType.VarChar).Value = prenume;
                                    cmd.Parameters.Add("@CodSistem", SqlDbType.Int).Value = codSistem;
                                    cmd.Parameters.Add("@Marca", SqlDbType.VarChar).Value = marca;
                                    cmd.Parameters.Add("@NumarIdentificarePersonala", SqlDbType.VarChar).Value = numaridenticare;
                                    cmd.Parameters.Add("@Sex", SqlDbType.VarChar).Value = sex;
                                    cmd.Parameters.Add("@Localitate", SqlDbType.VarChar).Value = localitate;
                                    cmd.Parameters.Add("@Strada", SqlDbType.VarChar).Value = strada;
                                    cmd.Parameters.Add("@CodPostDeLucru", SqlDbType.VarChar).Value = codpostdelucru;
                                    cmd.Parameters.Add("@PostDeLucru", SqlDbType.VarChar).Value = postdelucru;
                                    cmd.Parameters.Add("@CodDepartament", SqlDbType.VarChar).Value = coddepartment;
                                    cmd.Parameters.Add("@Departament", SqlDbType.VarChar).Value = departament;
                                    cmd.Parameters.Add("@CodIncadrare", SqlDbType.VarChar).Value = codincadrare;
                                    cmd.Parameters.Add("@Incadrare", SqlDbType.VarChar).Value = incadrare;
                                    cmd.Parameters.Add("@CC", SqlDbType.VarChar).Value = cc;
                                    cmd.Parameters.Add("@TipPostDeLucru", SqlDbType.VarChar).Value = tippostdelucru;
                                    cmd.Parameters.Add("@LoculNasterii", SqlDbType.VarChar).Value = loculnasteri;
                                    cmd.Parameters.Add("@IdLiniee", SqlDbType.VarChar).Value = idlinie;
                                    cmd.Parameters.Add("@IdUtilizatorAdaugare", SqlDbType.Int).Value = usrId;
                                    cmd.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = telefon;
                                    cmd.Parameters.Add("@IdNivelStudi", SqlDbType.Int).Value = nivalstudio;

                                    cmd.Parameters.Add("@DataAngajarii", SqlDbType.Date).Value = datumzaposljenja;
                                    cmd.Parameters.Add("@DataLichidare", SqlDbType.Date).Value = datumraskida;
                                    cmd.Parameters.Add("@DataExpirareContract", SqlDbType.Date).Value = datumistekaugovora;
                                    cmd.Parameters.Add("@DataNedeterminat", SqlDbType.Date).Value = prelazaknaneodredjeno;

                                    cmd.Parameters.Add("@DataNasterii", SqlDbType.Date).Value = datumzaposljenja;
                                    cmd.Parameters.Add("@DeteIndete", SqlDbType.Int).Value = deteindete;

                                    cmd.Parameters.Add("@DYear", SqlDbType.Int).Value = Convert.ToInt32(txt_godina.Text);
                                    cmd.Parameters.Add("@DMonth", SqlDbType.Int).Value = Convert.ToInt32(txt_mesec.Text);

                                    cmd.ExecuteNonQuery();
                                }
                            }
                            catch (Exception ex)
                            {
                                String query = "INSERT INTO dbo.Exception (Application,Exception,Time) VALUES (@application, @exception,@time)";
                                SqlCommand cmd = new SqlCommand(query, conn);
                                cmd.Parameters.Add("@application", SqlDbType.NVarChar).Value = "Anagrafiche Upload";
                                cmd.Parameters.Add("@exception", SqlDbType.NVarChar).Value = ex.ToString();
                                cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Now;
                                cmd.ExecuteNonQuery();
                                continue;
                            }
                        }
                        conn.Close();
                    }
                    informer.Text = "Done!" + "<br />" + dt.Rows.Count + " rows uploaded.";
                    Button1.Enabled = true;
                    Button1.Attributes.Add("onclick", "this.style.display='block';");
                    Upload.Enabled = true;
                }
            }
        }
    }
}