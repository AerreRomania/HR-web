using System;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

public partial class RaportAbsente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["IdUtilizator"] != null)
        //{
        //    if (!GlobalClass.VerificareAcces("Raport numar AngajatiViewLastMonth", Session["IdUtilizator"].ToString()))
        //        Response.Redirect("AccesInterzis.aspx");
        //    else
        //        
        //}
        //else
        //    Response.Redirect("AccesInterzis.aspx");

        //dtame.Text = DateTime.Now.ToShortDateString();
        //String hourss = DateTime.Now.ToString("HH", System.Globalization.DateTimeFormatInfo.InvariantInfo);
        //String minutess = DateTime.Now.ToString("mm", System.Globalization.DateTimeFormatInfo.InvariantInfo);

        //if (Convert.ToInt32(hourss) >= 7 && Convert.ToInt32(hourss) <= 14)
        //{
        //    txtprima.Attributes.Add("style", "color:green;");
        //    txtSecondo.Attributes.Add("style", "color:red;");
        //    txtThird.Attributes.Add("style", "color:red;");

        //    StatusPrima.Text = "active";
        //    StatusSecondo.Text = "inactive";
        //    StatusThird.Text = "incative";
        //}

        //if (Convert.ToInt32(hourss) >= 15 && Convert.ToInt32(hourss) <= 23)
        //{
        //    txtSecondo.Attributes.Add("style", "color:green;");
        //    txtprima.Attributes.Add("style", "color:red;");
        //    txtThird.Attributes.Add("style", "color:red;");

        //    StatusPrima.Text = "inactive";
        //    StatusSecondo.Text = "active";
        //    StatusThird.Text = "incative";

        //}

        //if (Convert.ToInt32(hourss) >= 23)
        //{
        //    txtSecondo.Attributes.Add("style", "color:red;");
        //    txtprima.Attributes.Add("style", "color:red;");
        //    txtThird.Attributes.Add("style", "color:green;");

        //    StatusPrima.Text = "inactive";
        //    StatusSecondo.Text = "inactive";
        //    StatusThird.Text = "active";
        //}

        //if (Convert.ToInt32(hourss) >= 0 && Convert.ToInt32(hourss) <= 6)
        //{
        //    txtSecondo.Attributes.Add("style", "color:red;");
        //    txtprima.Attributes.Add("style", "color:red;");
        //    txtThird.Attributes.Add("style", "color:green;");

        //    StatusPrima.Text = "inactive";
        //    StatusSecondo.Text = "inactive";
        //    StatusThird.Text = "active";

        //}

        //LoadDataFirst();
        //LoadDataSecond();
        //LoadDataThird();


        ListaAni();

        ClientScript.RegisterStartupScript(Page.GetType(), "key", "show_filter()", true);

    }

    private void ListaAni()
    {
        DataClassWbmOlimpias dcWbmOlimpias = new DataClassWbmOlimpias();
        DateTime Inceput = dcWbmOlimpias.Angajatis.Min(x => x.DataAngajarii);
        DateTime Curent = DateTime.Now.AddYears(-1);
        string An;
        //while(Curent >= Inceput)
        //{
        //    Curent = Curent.AddYears(-1);
        //    An = Curent.Year.ToString();
        //    ddlFiltruAn.Items.Add(new ListItem(An, An));
        //}

        //An = Curent.Year.ToString();
        //An = "2020";
        //ddlFiltruAn.Items.Add(new ListItem("2018", "2018"));

        ddlFiltruAn.Attributes.Add("onChange", "Lista();");
        ddlFilterTip.Attributes.Add("onChange", "ListaFilter();");
    }


    private void LoadDataFirst()
    {

        //DECLARE AngajatiViewLastMonthValues
        int _anaAmminiQ = 0;
        int _anaTessQ = 0;
        int _anaStiroQ = 0;
        int _anaConfAQ = 0;
        int _anaConfBQ = 0;

        DataTable _dtAmmini = GetDataAssentGridsAmministrazione("AMMINISTRAZIONE", 5);
        DataTable _dtConfA = GetDataAssentGridsFirstShift("CONFEZIONE A", 2);
        DataTable _dtConfB = GetDataAssentGridsFirstShift("CONFEZIONE B", 14);
        DataTable _dtStiro = GetDataAssentGridsStiro("STIRO", 1);
        DataTable _dtTess = GetDataAssentGridsFirstShift("TESSITURA", 3);

        grd_ass_Ammin.DataSource = _dtAmmini;
        grd_ass_Ammin.DataBind();
        grd_ass_ConfA.DataSource = _dtConfA;
        grd_ass_ConfA.DataBind();
        grd_ass_ConfB.DataSource = _dtConfB;
        grd_ass_ConfB.DataBind();
        grd_ass_Stiro.DataSource = _dtStiro;
        grd_ass_Stiro.DataBind();
        grd_ass_Tess.DataSource = _dtTess;
        grd_ass_Tess.DataBind();

        _anaAmminiQ = LoadAnagraficheFirst(_anaAmminiQ, 5);
        _anaTessQ = LoadAnagraficheFirst(_anaTessQ, 3);
        _anaStiroQ = LoadAnagraficheFirst(_anaStiroQ, 1);
        _anaConfAQ = LoadAnagraficheFirst(_anaConfAQ, 2);
        _anaConfBQ = LoadAnagraficheFirst(_anaConfBQ, 14);


        //DECLARE AssentValues
        int _assAmminiQ = _dtAmmini.Rows.Count;
        int _assTessQ = _dtTess.Rows.Count;
        int _assStiroQ = _dtStiro.Rows.Count;
        int _assConfAQ = _dtConfA.Rows.Count;
        int _assConfBQ = _dtConfB.Rows.Count;
        //DECLARE PercentValues
        string _perAmminiQ = string.Empty;
        string _perStiroQ = string.Empty;
        string _perConfAQ = string.Empty;
        string _perConfBQ = string.Empty;
        string _perTessQ = string.Empty;

        try
        {
            _perAmminiQ = (decimal.Divide(_assAmminiQ, _anaAmminiQ) * 100).ToString("n2");

        }
        catch (Exception)
        {

            _perAmminiQ = "0";
        }

        try
        {
            _perStiroQ = (decimal.Divide(_assStiroQ, _anaStiroQ) * 100).ToString("n2");

        }
        catch (Exception)
        {
            _perStiroQ = "0";
        }

        try
        {
            _perTessQ = (decimal.Divide(_assTessQ, _anaTessQ) * 100).ToString("n2");

        }
        catch (Exception)
        {
            _perTessQ = "0";
        }

        try
        {
            _perConfAQ = (decimal.Divide(_assConfAQ, _anaConfAQ) * 100).ToString("n2");
        }
        catch (Exception)
        {

            _perConfAQ = "0";
        }

        try
        {
            _perConfBQ = (decimal.Divide(_assConfBQ, _anaConfBQ) * 100).ToString("n2");

        }
        catch (Exception)
        {
            _perConfBQ = "0";
        }


        int _totaleQ = _assAmminiQ + _assStiroQ + _assConfAQ + _assConfBQ + _assTessQ;

        _assConfA.Text = _assConfAQ.ToString();
        _assConfB.Text = _assConfBQ.ToString();
        _assStiro.Text = _assStiroQ.ToString();
        _assTess.Text = _assTessQ.ToString();
        _assAmmini.Text = _assAmminiQ.ToString();

        _perConfA.Text = _perConfAQ;
        _perConfB.Text = _perConfBQ;
        _perStiro.Text = _perStiroQ;
        _perTess.Text = _perTessQ;
        _perAmmini.Text = _perAmminiQ;

        _totale.Text = _totaleQ.ToString();
    }
    private void LoadDataSecond()
    {

        //DECLARE AngajatiViewLastMonthValues
        int _anaTessQ = 0;
        int _anaStiroQ = 0;

        DataTable _dtStiro = GetDataAssentGridsStiroSecond("STIRO", 1);
        DataTable _dTess = GetDataAssentGridsTessituraSecond("TESSITURA", 3);


        _anaTessQ = LoadAnagraficheSecond(_anaTessQ, 3);
        _anaStiroQ = LoadAnagraficheSecond(_anaStiroQ, 1);

        //DECLARE AssentValues
        int _assTessQ = _dTess.Rows.Count;
        int _assStiroQ = _dtStiro.Rows.Count;

        //DECLARE PercentValues

        string _perStiroQ = string.Empty;
        string _perTessQ = string.Empty;

        try
        {
            if ((decimal.Divide(_assStiroQ, _anaStiroQ) * 100) > 100)
            {
                _perStiroQ = "100.00";
            }
            else
            {
                _perStiroQ = (decimal.Divide(_assStiroQ, _anaStiroQ) * 100).ToString("n2");
            }

        }
        catch (Exception)
        {

            _perStiroQ = "0";

        }


        try
        {
            if ((decimal.Divide(_assTessQ, _anaTessQ) * 100) > 100)
            {
                _perTessQ = "100.00";
            }
            else
            {
                _perTessQ = (decimal.Divide(_assTessQ, _anaTessQ) * 100).ToString("n2");
            }

        }
        catch (Exception)
        {

            _perTessQ = "0";

        }


        int _totaleQ = _assStiroQ + _assTessQ;
        _totaleS.Text = _totaleQ.ToString();

        _assStiroS.Text = _assStiroQ.ToString();
        _perStiroS.Text = _perStiroQ.ToString();

        _assTessS.Text = _assTessQ.ToString();
        _perTessS.Text = _perTessQ.ToString();


        grd_ass_StiroS.DataSource = _dtStiro;
        grd_ass_StiroS.DataBind();

        grd_ass_TessS.DataSource = _dTess;
        grd_ass_TessS.DataBind();

    }
    private void LoadDataThird()
    {

        //DECLARE AngajatiViewLastMonthValues
        int _anaTessQ = 0;

        DataTable _dTess = GetDataAssentGridsTessituraThird("TESSITURA", 3);


        _anaTessQ = LoadAnagraficheThird(_anaTessQ, 3);

        //DECLARE AssentValues
        int _assTessQ = _dTess.Rows.Count;

        //DECLARE PercentValues

        string _perTessQ = string.Empty;

        try
        {
            if ((decimal.Divide(_assTessQ, _anaTessQ) * 100) > 100)
            {
                _perTessQ = "0";
            }
            else
            {
                _perTessQ = (decimal.Divide(_assTessQ, _anaTessQ) * 100).ToString("n2");
            }

        }
        catch (Exception)
        {

            _perTessQ = "0";

        }


        int _totaleQ = _assTessQ;
        _totaleT.Text = _totaleQ.ToString();

        _assTessT.Text = _assTessQ.ToString();
        _perTessT.Text = _perTessQ.ToString();


        grd_ass_TessT.DataSource = _dTess;
        grd_ass_TessT.DataBind();

    }

    //Badge - Anagrafihce First Shift
    public static int LoadBadgeFirst(int count, string Departament)
    {
        try
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT COUNT(DISTINCT dbo.BadgeView.IdRnum) From dbo.BadgeView " +
                "INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca " +
                "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id WHERE dbo.BadgeView.Time >= '05:50:00' AND dbo.BadgeView.Time <= '14:00:00' " +
                "AND dbo.BadgeView.Departament = '" + Departament + "' and CONCAT('20',dbo.BadgeView.Year) = YEAR(GETDATE()) " +
                "and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0";
            SqlCommand cmd = new SqlCommand(query, conn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return count;
        }
        catch (Exception)
        {
            throw;
        }
    }
    public static int LoadAnagraficheFirst(int count, int IdDepartament)
    {
        try
        {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = string.Empty;
            if (IdDepartament == 1)
            {
                query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) FROM dbo.AngajatiViewLastMonth " +
                    "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                    "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                    "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                    "WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01' " +
                    "AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 " +
                    "AND AngajatiViewLastMonth.IdShift=2";

            }
            else if (IdDepartament == 5)
            {
                query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) FROM dbo.AngajatiViewLastMonth " +
                        "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                        "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                        "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                        "WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01' " +
                        "AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39";
            }
            else
            {
                query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) FROM dbo.AngajatiViewLastMonth " +
                    "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                    "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                    "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                    "WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
                    " AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39  AND AngajatiViewLastMonth.IdShift=2";

            }
            SqlCommand cmd = new SqlCommand(query, conn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return count;

        }
        catch (Exception)
        {
            throw;
        }
    }

    //Badge - Anagrafiche Second Shift
    public static int LoadBadgeSecond(int count, string Departament)
    {
        try
        {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT COUNT(DISTINCT dbo.BadgeView.IdRnum) From dbo.BadgeView INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id WHERE dbo.BadgeView.Time >= '14:00:00' AND dbo.BadgeView.Time <= '22:00:00' AND dbo.BadgeView.Departament = '" + Departament + "' and CONCAT('20',dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0";
            SqlCommand cmd = new SqlCommand(query, conn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            return count;

        }
        catch (Exception)
        {
            throw;
        }
    }
    public static int LoadAnagraficheSecond(int count, int IdDepartament)
    {
        try
        {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = string.Empty;
            if (IdDepartament == 1)
            {

                query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) FROM dbo.AngajatiViewLastMonth " +
                       "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                       "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                       "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                       "WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01' " +
                       "AND dbo.AngajatiViewLastMonth.IdShift='2' AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 " +
                       "AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39";
            }
            else
            {
                query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) " +
                        "FROM dbo.AngajatiViewLastMonth " +
                        "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                        "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                        "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                        "WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01' " +
                        "AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.IdShift=3";

            }
            SqlCommand cmd = new SqlCommand(query, conn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return count;

        }
        catch (Exception)
        {

            throw;
        }
    }
    //Anagrafiche Third Shift
    public static int LoadAnagraficheThird(int count, int IdDepartament)
    {
        try
        {

            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
            conn.Open();
            string query = string.Empty;

            query = "SELECT COUNT(DISTINCT dbo.AngajatiViewLastMonth.Marca) FROM dbo.AngajatiViewLastMonth " +
                    "INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id " +
                    "INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id " +
                    "INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id " +
                    "WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01' " +
                    "AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.IdShift=1";


            SqlCommand cmd = new SqlCommand(query, conn);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            return count;

        }
        catch (Exception)
        {

            throw;
        }
    }



    //Assenteismo Grid First Shift
    public DataTable GetDataAssentGridsFirstShift(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume AS Nome,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
            "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
            "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
            "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
            "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.IdShift=2 AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
            "   AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdShift <> 4 " +
            "AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
            "  From dbo.BadgeView" +
            "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
            "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
            "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
            "  WHERE dbo.BadgeView.Time >= '05:00:00' AND dbo.BadgeView.Time <= '14:00:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
            "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";

        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Second Shift
    public DataTable GetDataAssentGridsSecondShift(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.IdShift=3 AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "   AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdShift <> 5 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '15:00:00' AND dbo.BadgeView.Time <= '23:00:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Amministrazione 
    public DataTable GetDataAssentGridsAmministrazione(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "  AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '05:50:00' AND dbo.BadgeView.Time <= '14:00:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Stiro - First Shift
    public DataTable GetDataAssentGridsStiro(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "  AND dbo.AngajatiViewLastMonth.IdShift=2  AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '05:50:00' AND dbo.BadgeView.Time <= '14:00:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Stiro - Second Shift
    public DataTable GetDataAssentGridsStiroSecond(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "  AND dbo.AngajatiViewLastMonth.IdShift=3 AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '12:00:00' AND dbo.BadgeView.Time <= '23:55:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Tessitura - Second Shift     
    public DataTable GetDataAssentGridsTessituraSecond(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = '" + IdDepartament + "' AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "  AND dbo.AngajatiViewLastMonth.IdShift=3 AND dbo.AngajatiViewLastMonth.IdShift<>2 AND dbo.AngajatiViewLastMonth.IdShift<>1 AND AngajatiViewLastMonth.IdShift <> 4 AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '13:00:00' AND dbo.BadgeView.Time <= '23:55:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

    //Assenteismo Grid Tessitura - Third Shift
    public DataTable GetDataAssentGridsTessituraThird(string Departament, int IdDepartament)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["WbmOlimpiasConnectionString"].ConnectionString);
        conn.Open();
        string query = "  SELECT dbo.AngajatiViewLastMonth.Marca, AngajatiViewLastMonth.Nume,AngajatiViewLastMonth.Prenume,dbo.PosturiDeLucru.PostDeLucru FROM AngajatiViewLastMonth" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  INNER JOIN dbo.PosturiDeLucru ON dbo.AngajatiViewLastMonth.IdPostDeLucru = dbo.PosturiDeLucru.Id" +
    "  WHERE dbo.AngajatiViewLastMonth.IdDepartament = " + IdDepartament + " AND dbo.AngajatiViewLastMonth.DataLichidarii = '0001-01-01'" +
    "  AND dbo.AngajatiViewLastMonth.IdShift=1 AND dbo.AngajatiViewLastMonth.IdShift<>2 AND AngajatiViewLastMonth.IdShift <> 4 AND dbo.AngajatiViewLastMonth.IdLinie <> 30 AND AngajatiViewLastMonth.IdLinie <> 33 AND AngajatiViewLastMonth.IdLinie <> 37 AND AngajatiViewLastMonth.IdLinie <> 39 AND AngajatiViewLastMonth.Marca NOT IN(SELECT  DISTINCT dbo.BadgeView.IdRnum" +
    "  From dbo.BadgeView" +
    "  INNER JOIN dbo.AngajatiViewLastMonth ON dbo.BadgeView.IdRnum = dbo.AngajatiViewLastMonth.Marca" +
    "  INNER JOIN dbo.Departamente ON dbo.AngajatiViewLastMonth.IdDepartament = dbo.Departamente.Id" +
    "  INNER JOIN dbo.Linii ON dbo.AngajatiViewLastMonth.IdLinie = dbo.Linii.Id" +
    "  WHERE dbo.BadgeView.Time >= '22:00:00' AND dbo.BadgeView.Time <= '24:00:00' AND dbo.BadgeView.Time >= '00:00:00' AND dbo.BadgeView.Time <= '05:00:00' AND dbo.BadgeView.Departament = '" + Departament + "'" +
    "  and CONCAT('20', dbo.BadgeView.Year) = YEAR(GETDATE()) and dbo.BadgeView.Month = MONTH(GETDATE()) AND dbo.BadgeView.Day = DAY(GETDATE()) AND[IO] = 0)";
        SqlCommand cmd = new SqlCommand(query, conn);

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
        conn.Close();
        return dt;
    }

  

    protected void grd_ass_ConfA_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Text = "R-Code:";
            e.Row.Cells[1].Text = "Nome:";
            e.Row.Cells[2].Text = "Cognome:";
            e.Row.Cells[3].Text = "Mansione:";
        }

        e.Row.Cells[0].Attributes.Add("style", "width:60px;");
        e.Row.Cells[1].Attributes.Add("style", "width:70px;");
        e.Row.Cells[2].Attributes.Add("style", "width:100px;");
        e.Row.Cells[3].Attributes.Add("style", "width:200px;");

    }
}