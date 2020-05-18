using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Sinotico : System.Web.UI.Page
{
        public List<Button> _list_of_machines = new List<Button>();
        public List<Button> _list_of_lines = new List<Button>();
        public List<Button> _list_of_blocks = new List<Button>();
        public List<Label> _list_of_labels = new List<Label>();
        public List<string> _lst_shifts = new List<string>();
        protected List<Button> _list_of_buttons = new List<Button>();
        public DataTable _tbl_machines = new DataTable();
        public List<CurrentInfo> _list_of_currents = new List<CurrentInfo>();
        //public static SqlConnection _sql_con = new SqlConnection("Data Source=DESKTOP-73N2AAV\\CRISTISQL;Initial Catalog=Sinotico;Integrated Security=SSPI;");
        public string ConnectionString = "Server=192.168.96.17;Database=Sinotico;User Id=sa;Password=onlyouolimpias;";
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentInfo();
        if (!Page.IsPostBack)
        {
            Set_shift_array(new StringBuilder());

            _lst_shifts = new List<string>();
            GetCurrentShift();
            createObjectsAddEvents();
            fromDateCalendar.Text = DateTime.Now.ToString("yyyy-MM-dd");
            toDateCalendar.Text = DateTime.Now.ToString("yyyy-MM-dd");
            CallProcedures();

            ViewState["_lst_shifts"] = _lst_shifts;
        }
        else
        {
            createObjectsAddEvents();
        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        enableControls(true);
    }


    private void getCurrentInfo()
    {
        _list_of_currents = new List<CurrentInfo>();
        using (SqlConnection _sql_con = new SqlConnection(ConnectionString))
        {
            var cmd = new SqlCommand("get_current_info", _sql_con)
            {
                CommandType = CommandType.StoredProcedure
            };

            _sql_con.Open();

            var dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    _list_of_currents.Add(new CurrentInfo(dr[0].ToString(),
                        dr[1].ToString(), dr[2].ToString(), dr[3].ToString()));
                }
            }
            _sql_con.Close();
            dr.Close();
        }
    }

    private void createObjectsAddEvents()
    {
        CreateObjectGroups();
        cbNight.CheckedChanged += Shift_CheckedChanges;
        cbMorning.CheckedChanged += Shift_CheckedChanges;
        cbAfternoon.CheckedChanged += Shift_CheckedChanges;
        cbNight.Style.Add("display", "none");
        cbMorning.Style.Add("display", "none");
        cbAfternoon.Style.Add("display", "none");
        btn_cbNight.Click += shiftToggle;
        btn_cbMorning.Click += shiftToggle;
        btn_cbAfternoon.Click += shiftToggle;
    }

    private void shiftToggle(object sender, EventArgs eventArgs)
    {
        System.Threading.Thread.Sleep(1000);
        var button = (Button)sender;
        var checkBox = button.ID.Split('_')[1];
        if (checkBox.Equals("cbNight"))
        {
            cbNight.Checked = cbNight.Checked ? false : true;
            changeImageOfCheckBox(cbNight, button);
        }
        else if (checkBox.Equals("cbMorning"))
        {
            cbMorning.Checked = cbMorning.Checked ? false : true;
            changeImageOfCheckBox(cbMorning, button);
        }
        else
        {
            cbAfternoon.Checked = cbAfternoon.Checked ? false : true;
            changeImageOfCheckBox(cbAfternoon, button);
        }
    }

    private void enableControls(bool enable)
    {
        cbNight.Enabled = enable;
        cbAfternoon.Enabled = enable;
        cbMorning.Enabled = enable; ;
        btn_GetData.Enabled = enable;
        btn_cbNight.Enabled = enable;
        btn_cbMorning.Enabled = enable;
        btn_cbAfternoon.Enabled = enable;
        btn_CurrentDate.Enabled = enable;
    }



    private void changeImageOfCheckBox(CheckBox checkBox, Button button)
    {
        EventArgs e = null;
        Shift_CheckedChanges((object)checkBox, e);
        checkBox.Style.Add("display", "none");
        if (checkBox.Checked)
        {
            button.Style.Add("background-image", "./resources/img/machine_small.gif");
        }
        else
        {
            button.Style.Add("background-image", "./resources/img/MachinePic.png");
        }
    }

    private void Shift_CheckedChanges(object sender, EventArgs eventArgs)
    {

        //elementsEnable(false);
        if (ViewState["_lst_shifts"] != null)
        {
            _lst_shifts = (List<string>)ViewState["_lst_shifts"];
        }

        var chk = (CheckBox)sender;

        if (chk.Checked)
        {
            _lst_shifts.Add(chk.ID);
        }
        else
        {
            _lst_shifts.Remove(chk.ID);
        }

        ViewState["_lst_shifts"] = _lst_shifts;

        Get_shift_array().Clear();
        Get_shift_array().Append(',');

        for (var i = 0; i <= _lst_shifts.Count - 1; i++)
        {
            var item = _lst_shifts[i].Remove(0, 2); //remove cb

            Get_shift_array().Append(item + ',');
        }

        CallProcedures();
    }

    private static DateTime _from_date1;

    public static DateTime Get_from_date()
    {
        return _from_date1;
    }

    public static void Set_from_date(DateTime value)
    {
        _from_date1 = value;
    }

    private static DateTime _to_date1;

    public static DateTime Get_to_date()
    {
        return _to_date1;
    }

    public static void Set_to_date(DateTime value)
    {
        _to_date1 = value;
    }

    private void CreateObjectGroups()
    {
        _list_of_machines = new List<Button>();
        _list_of_lines = new List<Button>();
        _list_of_blocks = new List<Button>();
        _list_of_labels = new List<Label>();

        foreach (Panel panelGroup in new Panel[] { Panel1, Panel2, Panel3 })  //Goes through all sub-groups
        {
            // Collects all machines to their list

            if (!panelGroup.Visible) continue;

            foreach (var machine in (from lbl in panelGroup.Controls.OfType<Button>()
                                     where lbl.ID.Substring(0, 1) == "P"
                                     select lbl).ToList())
            {
                machine.OnClientClick = "return false;";
                _list_of_machines.Add(machine);
            }

            foreach (var label in (from lbl in panelGroup.Controls.OfType<Label>()
                                   where lbl.ID.Substring(0, 2) == "LP"
                                   select lbl).ToList())
            {
                _list_of_labels.Add(label);
            }

            // Collects all lines in their list    

            foreach (var line in (from lbl in panelGroup.Controls.OfType<Button>()
                                  where lbl.ID.Substring(0, 1) == "L"
                                  select lbl).ToList())
            {
                line.OnClientClick = "return false;";
                _list_of_lines.Add(line);
            }

            // Collects all blocks in their list

            foreach (var block in (from lbl in panelGroup.Controls.OfType<Button>()
                                   where lbl.ID.Substring(0, 1) == "S"
                                   select lbl).ToList())
            {
                block.OnClientClick= "return false;";
                _list_of_blocks.Add(block);
            }

            lbl_TotDept.OnClientClick= "return false;";
        }
    }

    private static System.Text.StringBuilder _shift_array1;

    public static System.Text.StringBuilder Get_shift_array()
    {
        return _shift_array1;
    }

    public static void Set_shift_array(System.Text.StringBuilder value)
    {
        _shift_array1 = value;
    }

    private void GetCurrentShift()
    {
        // Recognize current time of day to compare with shifts time interval
        var curTime = DateTime.Now.TimeOfDay;

        var nightShiftStart = new TimeSpan(23, 0, 0);
        var nightShiftEnd = new TimeSpan(7, 0, 0);
        var morningShiftStart = new TimeSpan(7, 0, 0);
        var morningShiftEnd = new TimeSpan(15, 0, 0);
        var afternShiftStart = new TimeSpan(15, 0, 0);
        var afternShiftEnd = new TimeSpan(23, 0, 0);

        // Recognize shifts using current times

        if (nightShiftStart > nightShiftEnd && curTime > nightShiftStart || curTime < nightShiftEnd)
        {
            cbNight.Checked = true;
            cbMorning.Checked = false;
            cbAfternoon.Checked = false;

            btn_cbNight.Style.Add("background-image", "./resources/img/machine_small.gif");
            Get_shift_array().Append(",Night,");
            _lst_shifts.Add("cbNight");
        }
        else if (curTime > morningShiftStart && curTime < morningShiftEnd)
        {
            cbMorning.Checked = true;
            cbNight.Checked = false;
            cbAfternoon.Checked = false;
            //changeImageOfCheckBox(cbNight, btn_cbNight);
            //changeImageOfCheckBox(cbAfternoon, btn_cbAfternoon);
            btn_cbMorning.Style.Add("background-image", "./resources/img/machine_small.gif");
            Get_shift_array().Append(",Morning,");
            _lst_shifts.Add("cbMorning");

        }
        else if (curTime > afternShiftStart && curTime < afternShiftEnd)
        {
            cbAfternoon.Checked = true;
            cbNight.Checked = false;
            cbMorning.Checked = false;
            //changeImageOfCheckBox(cbMorning, btn_cbMorning);
            //changeImageOfCheckBox(cbNight, btn_cbNight);
            btn_cbAfternoon.Style.Add("background-image", "./resources/img/machine_small.gif");
            Get_shift_array().Append(",Afternoon,");
            _lst_shifts.Add("cbAfternoon");

        }

    }


    private void CallProcedures()
    {
        //var start = fromDateCalendar.SelectedDate;
        //var end = toDateCalendar.SelectedDate;
        var start = DateTime.ParseExact(fromDateCalendar.Text, "yyyy-MM-dd", null);
        var end = DateTime.ParseExact(toDateCalendar.Text, "yyyy-MM-dd", null);


        if (start == DateTime.MinValue)
        {
            start = DateTime.Now;
            end = DateTime.Now;
        }

        if (end.Subtract(start).Days < 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First date must be before second date')", true);
            return;
        }

        Set_from_date(new DateTime(start.Year, start.Month, start.Day));
        Set_to_date(new DateTime(end.Year, end.Month, end.Day));

        //lblFromDate.Text = start.ToString("dd/MM/yyyy");
        //lblToDate.Text = end.ToString("dd/MM/yyyy");
        // Checks date selection by user
        var ts = (Get_to_date().Subtract(Get_from_date()));
        if (ts.TotalDays < 0)
        {
            //MessageBox.Show("Invalid date selection.");
            return;
        }

        _tbl_machines = new DataTable();
        //string ConnectionString = "Data Source=DESKTOP-73N2AAV\\CRISTISQL;Initial Catalog=Sinotico;Integrated Security=SSPI;";
        using (SqlConnection _sql_con = new SqlConnection(ConnectionString))
        {
            if (_sql_con.State == ConnectionState.Open) _sql_con.Close();

            var cmd = new SqlCommand("get_data", _sql_con)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.Add("@finesse", SqlDbType.VarChar).Value = ",3,7,14,";
            cmd.Parameters.Add("@from_date", SqlDbType.DateTime).Value = Get_from_date();
            cmd.Parameters.Add("@to_date", SqlDbType.DateTime).Value = Get_to_date();
            cmd.Parameters.Add("@shift", SqlDbType.VarChar).Value = Get_shift_array().ToString();

            cmd.Parameters.Add("@file_name", SqlDbType.VarChar).Value = string.Empty;

            _sql_con.Open();
            var dr = cmd.ExecuteReader();
            _tbl_machines.Load(dr);
            _sql_con.Close();
            dr.Close();
        }

        foreach (var label in _list_of_labels)
        {
            Label myLabel = (Label)label;
            foreach (var currentInfo in _list_of_currents)
            {
                if (myLabel.ID.Remove(0, 2) != currentInfo.MachineNumber.ToString())
                    continue;
                myLabel.Text = "macc " + currentInfo.MachineNumber + "<br>" + "fin " + currentInfo.Gaudge.ToString();
            }

            if (myLabel.Text.Equals(""))
            {
                myLabel.Text = "macc " + myLabel.ID.Remove(0, 2) + "<br>" + "fin:no data";
            }
        }

        foreach (var machine in _list_of_machines)
        {
            machine.Text = default(string);

            foreach (DataRow row in _tbl_machines.Rows)
            {
                if (machine.ID.Remove(0, 1) != row[0].ToString()) continue;

                var eff = string.Concat(Math.Round(Convert.ToDouble(row[1]), 0).ToString(), "%");
                machine.Text = eff;
                setMachineColor((Button)machine);

                //machine.ToolTip = "macc " + machine.ID.Remove(0, 1) + "\n" + "fin#";
            }
        }

        foreach (var mchn in _list_of_machines)
        {
            if (string.IsNullOrEmpty(mchn.Text))
            {
                mchn.Text = string.Concat("0", "%");
                mchn.Style["color"] = "#FF0000";
                mchn.Style.Add("background-image", "url(./resources/img/MachinePic.png)");
                mchn.Style.Add("padding-bottom", "45%");
                //mchn.ToolTip = "macc " + mchn.ID.Remove(0, 1) + "\n" + "fin#";
            }
        }

        GetTotals();

    }


    private void GetTotals()
    {
        var machineRange = new[] { 1, 14 };     //starts from line 1
        var count = 1;
        var curLineNumber = 1;


        for (int m = 1; m <= 210; m++)
        {
            count++;

            if (count < 14) continue;

            foreach (var line in _list_of_lines.Where(p => p.ID == "L" + curLineNumber.ToString()))
            {
                line.Text = GetMachinesDataInRange(_list_of_machines, machineRange[0], machineRange[1], 0);
                setMachineColor((Button)line);
                line.Style.Add("padding-bottom", "30px");
            }

            count = 1;
            machineRange = new int[] {
                    machineRange[1] + 1,
                    machineRange[1] + 14 };

            curLineNumber++;
        }

        S1.Text = GetMachinesDataInRange(_list_of_lines, 1, 5, 1);
        setMachineColor(S1);
        S2.Text = GetMachinesDataInRange(_list_of_lines, 6, 10, 1);
        setMachineColor(S2);
        S3.Text = GetMachinesDataInRange(_list_of_lines, 11, 15, 1);
        setMachineColor(S3);
        lbl_TotDept.Text = GetMachinesDataInRange(_list_of_blocks, 1, 3, 1);
        setMachineColor(lbl_TotDept);
    }

    private void setMachineColor(Button button)
    {
        string color = verifyEfficiency(button.Text);
        string gif = "gif" + color + ".gif";
        string url = "url(./resources/img/" + gif + ")";
        if (color.Equals("other"))
        {
            url = "url(./resources/img/MachinePic.png)";
            button.Style.Add("background-image", url);
            button.Style.Add("color", "red");
        }
        else
        {
            button.Style.Add("background-image", url);
            if (color.Equals("yellow"))
            {
                button.Style.Add("color", "#FFBF44");
            }
            else
            {
                button.Style.Add("color", color);
            }
        }
        button.Style.Add("padding-bottom", "45%");
    }


    private string verifyEfficiency(string machineText)
    {
        var machineTextArray = machineText.Split('%');
        var efficiency = machineTextArray[0];
        if (Double.Parse(efficiency) > 90)
        {
            return "green";
        }
        else if (Double.Parse(efficiency) <= 90 && Double.Parse(efficiency) > 85)
        {
            return "yellow";
        }
        else if (Double.Parse(efficiency) <= 85 && Double.Parse(efficiency) > 0)
        {
            return "red";
        }
        else
        {
            return "other";
        }
    }

    private string GetMachinesDataInRange(List<Button> lst, int from_mac, int to_mac, int round)
    {
        var tmpStr = "";
        var machineRegNumb = 0;
        var value = 0.0;
        var counter = 0;
        double result = 0;
        foreach (var item in lst)
        {
            if (item.BackColor == Color.DimGray) continue;

            else if (item.Text == string.Empty) continue;

            machineRegNumb = Convert.ToInt32(item.ID.Remove(0, 1));

            if (machineRegNumb >= from_mac && machineRegNumb <= to_mac)
            {
                counter++;
                var efficiency = item.Text.Split('%')[0];
                double.TryParse(efficiency, out result);
                value += result;
            }
        }
        //if (Factorial(counter) != 0) tmpStr = Math.Round(value / Factorial(counter), round).ToString();
        tmpStr = counter != 0 ? Math.Round(value / counter, round).ToString() : string.Empty;
        counter = 0;

        return tmpStr.ToString() + "%";
    }


    //private int Factorial(int n)
    //// recursive version
    //{
    //    if (n == 1) return n;
    //    else return n * Factorial(n - 1);
    //}
    public void getCurrentDateData(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        Set_shift_array(new StringBuilder());

        _lst_shifts = new List<string>();
        GetCurrentShift();
        createObjectsAddEvents();
        fromDateCalendar.Text = DateTime.Now.ToString("yyyy-MM-dd");
        toDateCalendar.Text = DateTime.Now.ToString("yyyy-MM-dd");
        CallProcedures();
        changeImageOfCheckBox(cbMorning, btn_cbMorning);
        changeImageOfCheckBox(cbAfternoon, btn_cbAfternoon);
        changeImageOfCheckBox(cbNight, btn_cbNight);

        ViewState["_lst_shifts"] = _lst_shifts;
    }

    public void getData(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        CallProcedures();
    }

    private string cheatText()
    {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 3; i++)
        {
            stringBuilder.AppendLine();
        }

        return stringBuilder.ToString();
    }
}

/// <summary>
/// Class that deliver machines' properties from current resource.
/// </summary>
public class CurrentInfo
{
    #region Constructors

    public CurrentInfo() { }

    public CurrentInfo(string machine, string gaudge, string fileName, string speed)
    {
        MachineNumber = machine;
        Gaudge = gaudge;
        FileName = fileName;
        Speed = speed;
    }

    #endregion

    #region Properties

    public string MachineNumber { get; set; }

    public string Gaudge { get; set; }

    public string FileName { get; set; }

    public string Speed { get; set; }

    #endregion
}
