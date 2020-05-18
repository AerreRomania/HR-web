using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for WebServiceHR
/// </summary>
[WebService(Namespace = "WSCHR")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]

public class WebServiceHR : System.Web.Services.WebService
{

    public WebServiceHR()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    string _connectionString = "Data Source = KNSQL2014;Initial Catalog = WbmOlimpiasHR; user=sa;password=onlyouolimpias";

    [WebMethod]
    public void EditUser(string nrid, string nrcode, string nses, string ncognome, string nnome, string ncitta, string nteldom, 
        string nreparto, string nlinea, string nfase, string nemail, string nmansione, string nlivelo, string ndiretti, string nnascita, string ntipodi, string ninizio,
        string nscadenza, int IdTipPostDeLucru, int IdPostDeLucru, int IdEchipa, int IdLinie, int IdDepartament, int IdIncadrare, int IdLoculNasterii, int IdNivelStudiu, int IdLocalitate, string cc)
    {

        int Dmonth = 0;
        string qry = "SELECT  MAX([DMonth]) FROM AngajatiMY WHERE [DYear] = YEAR(GETDATE())";
        try
        {

             SqlConnection conn = new SqlConnection(_connectionString);

            SqlCommand someCmd = new SqlCommand(qry,conn);
            conn.Open();
            Dmonth = (int)someCmd.ExecuteScalar();
            conn.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

        using (SqlConnection connection = new SqlConnection(_connectionString))
        {
            String query = "UPDATE AngajatiMY SET Marca=@nrcode,Nume=@nnome,Prenume=@ncognome,Strada=@ncitta,DataAngajarii=@ninizio, " +
             "DataLichidarii=@nscadenza,Sex=@nses,NumarTelefon=@nteldom,AdresaEmail=@nemail, DataNedeterminat=@ninizio,NumarIdentificarePersonala=@nrid," +
             "IdTipPostDeLucru=@IdTipPostDeLucru," + 
             "IdPostDeLucru=@IdPostDeLucru," +
             "IdEchipa=@IdEchipa," +
             "IdLinie=@IdLinie," +
             "IdDepartament=@IdDepartament," +
             "IdIncadrare=@IdIncadrare," +
             "IdLoculNasterii=@IdLoculNasterii,IdNivelStudiu=@IdNivelStudiu,IdLocalitate=@IdLocalitate," +
             "CC=@CC," +
             "DataModificare=GETDATE()" +
             " WHERE Marca=@nrcode AND Dmonth=@Dmonth AND Dyear=YEAR(GETDATE())";
            //IdIntervalDeLucru=@IdIntervalDeLucru,IdBanca=@IdBanca,
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@nrcode", nrcode);
                command.Parameters.AddWithValue("@nrid", nrid);
                command.Parameters.AddWithValue("@nses", nses);
                command.Parameters.AddWithValue("@ncognome", ncognome);
                command.Parameters.AddWithValue("@nnome", nnome);
                command.Parameters.AddWithValue("@ncitta", ncitta);
                command.Parameters.AddWithValue("@nteldom", nteldom);
                command.Parameters.AddWithValue("@nreparto", nreparto);
                command.Parameters.AddWithValue("@nlinea", nlinea);
                command.Parameters.AddWithValue("@nfase", nfase);
                command.Parameters.AddWithValue("@nemail", nemail);
                command.Parameters.AddWithValue("@nmansione", nmansione);
                command.Parameters.AddWithValue("@nlivelo", nlivelo);
                command.Parameters.AddWithValue("@ndiretti", ndiretti);
                command.Parameters.AddWithValue("@nnascita", nnascita);
                command.Parameters.AddWithValue("@ntipodi", ntipodi);
                command.Parameters.AddWithValue("@ninizio", ninizio);
                command.Parameters.AddWithValue("@nscadenza", nscadenza);
                command.Parameters.AddWithValue("@IdTipPostDeLucru", IdTipPostDeLucru);
                command.Parameters.AddWithValue("@IdPostDeLucru", IdPostDeLucru);
                command.Parameters.AddWithValue("@IdEchipa", IdEchipa);
                command.Parameters.AddWithValue("@IdLinie", IdLinie);
                command.Parameters.AddWithValue("@IdDepartament", IdDepartament);
                command.Parameters.AddWithValue("@IdIncadrare", IdIncadrare);
                command.Parameters.AddWithValue("@IdLoculNasterii", IdLoculNasterii);
                command.Parameters.AddWithValue("@IdNivelStudiu", IdNivelStudiu);
                command.Parameters.AddWithValue("@IdLocalitate", IdLocalitate); 
                command.Parameters.AddWithValue("@cc", cc);
                 
                command.Parameters.AddWithValue("@Dmonth", Dmonth);

                connection.Open();
                int result = command.ExecuteNonQuery();

                if (result < 0)
                    Console.WriteLine("Error inserting data into Database!");
            }
        }

    }
}

 
