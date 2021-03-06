﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class Views_Produzione_Stiro :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            LoadData();
        }
        catch (Exception)
        {

            throw;
        }
       
    }

    public void LoadData(){
        lbl_time.Text = "STIRO LAYOUT - Loaded: " + DateTime.Now.ToLongTimeString();
        List<EmployeeEfficiency> EffList = new List<EmployeeEfficiency>();
        List<LineEfficiency> LineEffList = new List<LineEfficiency>();

        string shift = "";
        if (DateTime.Now.Hour >= 6 && DateTime.Now.Hour < 15)
        {
            shift = "MORNING";
        } else
        {
            shift = "AFTERNOON";
        }

        LineEffList = GetLineQuantity(2, DateTime.Now, shift);

        EffList = GetEmployeeEfficiency(2);


        if ((EffList != null))
        {
            int totalEff = 0;

            foreach (var item in LineEffList)
            {
                string line = item.Group.ToString();
                string value = item.PiecesDone.ToString();
                if (line == "CARTELLINO")
                {
                    CARTELLINO.InnerHtml = "tot:" + value;
                }
                else if (line == "PRESSA")
                {
                    PRESSA.InnerHtml = "tot:" + value;
                }
                else if (line == "ETICHETTE")
                {
                    ETICHETTE.InnerHtml = "tot:" + value;
                }
                else if (line == "MANICHINO")
                {
                    MANICHINO.InnerHtml = "tot:" + value;
                }
                else if (line == "RAMMENDO")
                {
                    RAMMENDO.InnerHtml = "tot:" + value;
                }
                else if (line == "PIEGO")
                {
                    PIEGO.InnerHtml = "tot:" + value;
                }
            }

            foreach (Label l in form1.Controls.OfType<Label>())
            {
                int macNumb = Convert.ToInt32(l.TabIndex);

                foreach (var item in EffList)
                {
                    if (macNumb == item.MachineNumber)
                    {
                        totalEff += item.Efficiency;
                        l.Text = item.Efficiency.ToString() + "%";
                        l.Attributes.Add("data-toggle", "tooltip");
                        l.Attributes.Add("data-html", "true");
                        l.Attributes.Add("qty", item.PiecesDone.ToString());
                        l.Attributes.Add("eff", item.Efficiency.ToString());
                        l.Attributes.Add("machine", item.MachineNumber.ToString());
                        l.Attributes.Add("title", "<p style='font-weight:600;font-size:20px;text-align:center;'>" + item.Employee + "</p> <p>Article: " + item.Article + "</p> " +
                            "<p>Line: " + item.Line + "</p> <p>Machine: " + item.MachineNumber + "</p> <p>Operation: " + item.Operation + "</p> <p>Order Name: " + item.OrderName + "</p>" +
                            "<p class='back-qty'>Qty: " + item.PiecesDone + "</p>");
                    }

                    if (l.Text.Length == 0)
                    {
                        l.Text = "&nbsp";
                    }
                }
            }
            int total = totalEff / EffList.Count;
            int reparto = totalEff / 48;
            lbl_eff_tot_prezente.Attributes.Add("eff", total.ToString());
            lbl_eff_tot_prezente.Text = "Eff. Prezente: " + total.ToString() + "%";

            lbl_eff_tot_reparto.Attributes.Add("eff", reparto.ToString());
            lbl_eff_tot_reparto.Text = "Eff. Reparto: " + reparto.ToString() + "%";
        }
    }

    public List<EmployeeEfficiency> GetEmployeeEfficiency(int sectorId)
    {
        string connectionString = "Data Source=192.168.96.37;Initial Catalog=ONLYOU; User Id=sa; Password=olimpiasknitting;";
        using (var con = new SqlConnection(connectionString))
        {
            var cmd = new SqlCommand()
            {
                CommandText = "[Employee_Current_Job_Efficiency]",
                CommandType = CommandType.StoredProcedure,
                Connection = con
            };
            cmd.Parameters.Add("@Sector_Id", SqlDbType.Int).Value = sectorId;
            var employeesEfficiency = new List<EmployeeEfficiency>();
            con.Open();
            var dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                var pauses = new CurrentJobPause[2];
                if (sectorId == 1)
                {
                    pauses[0] = new CurrentJobPause()
                    {
                        Start = new TimeSpan(10, 40, 0),
                        End = new TimeSpan(11, 0, 0)
                    };
                    pauses[1] = new CurrentJobPause()
                    {
                        Start = new TimeSpan(13, 10, 0),
                        End = new TimeSpan(13, 20, 0)
                    };
                }
                else if (sectorId == 2)
                {
                    TimeSpan secondShiftStart = new TimeSpan(15, 0, 0);
                    if (TimeSpan.Compare(DateTime.Now.TimeOfDay, secondShiftStart) == 1)
                    {
                        pauses[0] = new CurrentJobPause()
                        {
                            Start = new TimeSpan(18, 30, 0),
                            End = new TimeSpan(18, 50, 0)
                        };
                        pauses[1] = new CurrentJobPause()
                        {
                            Start = new TimeSpan(21, 0, 0),
                            End = new TimeSpan(21, 10, 0)
                        };
                    }
                    else
                    {
                        pauses[0] = new CurrentJobPause()
                        {
                            Start = new TimeSpan(11, 0, 0),
                            End = new TimeSpan(11, 20, 0)
                        };
                        pauses[1] = new CurrentJobPause()
                        {
                            Start = new TimeSpan(13, 0, 0),
                            End = new TimeSpan(13, 10, 0)
                        };
                    }
                }
                else if (sectorId == 8)
                {
                    pauses[0] = new CurrentJobPause()
                    {
                        Start = new TimeSpan(10, 30, 0),
                        End = new TimeSpan(11, 0, 0)
                    };
                }
                while (dr.Read())
                {
                    var machineNumber = Convert.ToInt32(dr[1]);
                    var jobStart = Convert.ToDateTime(dr[4]);
                    var hourNorm = Convert.ToDouble(dr[6]);
                    var piecesDone = Convert.ToInt32(dr[8]);
                    var position = Convert.ToInt32(dr[11]);

                    double totalPause = 0.0;
                    if (sectorId == 8)
                    {
                        if (TimeSpan.Compare(jobStart.TimeOfDay, pauses[0].End) == 1 ||
                                TimeSpan.Compare(DateTime.Now.TimeOfDay, pauses[0].Start) == -1)
                        {
                            totalPause = 0.0;
                        }
                        else
                        {
                            if (TimeSpan.Compare(jobStart.TimeOfDay, pauses[0].Start) == -1 &&
                            TimeSpan.Compare(DateTime.Now.TimeOfDay, pauses[0].End) == 1)
                            {
                                totalPause += pauses[0].End.Subtract(pauses[0].Start).Minutes;
                            }
                            else if (TimeSpan.Compare(jobStart.TimeOfDay, pauses[0].Start) == -1 &&
                                     TimeSpan.Compare(DateTime.Now.TimeOfDay, pauses[0].End) == -1)
                            {
                                totalPause += DateTime.Now.TimeOfDay.Subtract(pauses[0].Start).Minutes;
                            }
                        }
                    }
                    else
                    {
                        foreach (var pause in pauses)
                        {
                            if (TimeSpan.Compare(jobStart.TimeOfDay, pause.End) == 1 ||
                                TimeSpan.Compare(DateTime.Now.TimeOfDay, pause.Start) == -1)
                                continue;

                            if (TimeSpan.Compare(jobStart.TimeOfDay, pause.Start) == -1 &&
                                TimeSpan.Compare(DateTime.Now.TimeOfDay, pause.End) == 1)
                            {
                                totalPause += pause.End.Subtract(pause.Start).Minutes;
                            }
                            else if (TimeSpan.Compare(jobStart.TimeOfDay, pause.Start) == -1 &&
                                     TimeSpan.Compare(DateTime.Now.TimeOfDay, pause.End) == -1)
                            {
                                totalPause += DateTime.Now.TimeOfDay.Subtract(pause.Start).Minutes;
                            }
                        }
                    }

                    var minuteNorm = hourNorm / 60;
                    var workingTime = (DateTime.Now - jobStart).TotalMinutes - totalPause;
                    var eff = (int)Math.Round(piecesDone / (minuteNorm * workingTime) * 100, 0);

                    employeesEfficiency.Add(new EmployeeEfficiency
                    {
                        Employee = dr[0].ToString(),
                        MachineNumber = machineNumber,
                        OrderName = dr[2].ToString(),
                        Operation = dr[3].ToString(),
                        Efficiency = eff,
                        Article = dr[5].ToString(),
                        HourNorm = hourNorm,
                        Line = dr[7].ToString(),
                        PiecesDone = piecesDone,
                        Confection = dr[9].ToString(),
                        Groups = dr[10].ToString(),
                        Position = position

                    });
                }
            }
            else
            {
                con.Close();
                dr.Close();
                return null;
            }
            con.Close();
            dr.Close();
            return employeesEfficiency;
        }
    }
    public List<LineEfficiency> GetLineQuantity(int sectorId, DateTime selectedDate, string shift)
    {
        //"Data Source=KNRDP;Initial Catalog=ONLYOU; User Id=sa; Password=olimpiasknitting;"
        string connectionString = "Data Source=192.168.96.37;Initial Catalog=ONLYOU; User Id=sa; Password=olimpiasknitting;";
        using (var con = new SqlConnection(connectionString))
        {
            var cmd = new SqlCommand()
            {
                CommandText = "[Line_Pieces]",
                CommandType = CommandType.StoredProcedure,
                Connection = con
            };
            cmd.Parameters.Add("@Sector_Id", SqlDbType.Int).Value = sectorId;
            cmd.Parameters.Add("@Selected_Date", SqlDbType.DateTime).Value = selectedDate;
            cmd.Parameters.Add("@Shift", SqlDbType.NVarChar).Value = shift;
            var lineEfficiency = new List<LineEfficiency>();
            con.Open();
            var dr = cmd.ExecuteReader();
            if (sectorId == 2)
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        var pieces = Convert.ToInt32(dr[0]);
                        if (string.IsNullOrEmpty(dr[1].ToString()))
                            continue;
                        lineEfficiency.Add(new LineEfficiency()
                        {
                            PiecesDone = pieces,
                            Group = dr[1].ToString()
                        });
                    }
                }
                else
                {
                    con.Close();
                    dr.Close();
                    return null;
                }
            }
            else
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        var pieces = Convert.ToInt32(dr[1]);
                        lineEfficiency.Add(new LineEfficiency()
                        {
                            Line = dr[0].ToString(),
                            PiecesDone = pieces,
                            Group = dr[2].ToString()
                        });
                    }
                }
                else
                {
                    con.Close();
                    dr.Close();
                    return null;
                }
            }

            con.Close();
            dr.Close();
            return lineEfficiency;
        }
    }

    protected void Reload_Click(object sender, EventArgs e)
    {
        LoadData();
    }
}

public class CurrentJobPause
{
    public TimeSpan Start { get; set; }
    public TimeSpan End { get; set; }

}

