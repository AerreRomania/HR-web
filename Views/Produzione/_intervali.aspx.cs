using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using OfficeOpenXml.FormulaParsing.Excel.Functions.Math;
using OlimpiasKnitting.Client.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class Views_Produzione_intervali : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {
        int Departament = Convert.ToInt32(Request.QueryString["Departament"]);
         
        DateTime newDate = new DateTime();
        //try
        //{
        //    selectedDate = Request.QueryString["date"].ToString();
        //}
        //catch (Exception)
        //{

        //    selectedDate = DateTime.Now.ToString();
        //}

        //DateTime newDate = new DateTime();
        //if (string.IsNullOrEmpty(selectedDate))
        //{
        //    newDate = DateTime.Now;
        //}
        //else
        //{
        //    IFormatProvider culture = new CultureInfo("en-US", true);
        //    DateTime dateVal = DateTime.ParseExact(selectedDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //    newDate = Convert.ToDateTime(selectedDate);
        //}

        if (Request.QueryString["date"] == null)
        {
            newDate = DateTime.Now;
        } else
        {
            IFormatProvider culture = new CultureInfo("en-US", true);
            DateTime dateVal = DateTime.ParseExact(Request.QueryString["date"], "dd/MM/yyyy", CultureInfo.InvariantCulture);
            newDate = Convert.ToDateTime(Request.QueryString["date"]);
        }


        var getDailyIntervali = GetDailyIntervali(newDate, Departament);


        if (Departament == 1)
        {
            GetWorkingTimePerHour(getDailyIntervali, newDate);

            newGrid.DataSource = getDailyIntervali;
            newGrid.DataBind();
        }
        else if (Departament == 2)
        {
            GetWorkingTimePerHourStiro(getDailyIntervali, newDate);

            newGrid.DataSource = getDailyIntervali;
            newGrid.DataBind();

            newGrid1.DataSource = getDailyIntervali;
            newGrid1.DataBind();

        }


        if (Departament == 1)
        {
            pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn active' data-name='all' >All</a>"));
            for (int i = 1; i <= 24; i++)
            {
                pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn' data-name='LINEA" + i + " ' >Linea " + i + "</a>"));
            }
        }
        else if (Departament == 2)
        {
            pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btns active turno-prima' data-name='turno-prima' >Prima Turno</a>"));
            pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btns mr-4 turno-secondo' data-name='turno-secondo' >Secondo Turno</a>"));
            pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn active' data-name='all' >All</a>"));

            for (int i = 1; i <= 3; i++)
            {
                pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn' data-name='LINEA" + i + " ' >Linea " + i + "</a>"));
            }

            pnl_filter_secondo.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btns  turno-prima' data-name='turno-prima' >Prima Turno</a>"));
            pnl_filter_secondo.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btns mr-4 active turno-secondo' data-name='turno-secondo' >Secondo Turno</a>"));
            pnl_filter_secondo.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn active' data-name='all' >All</a>"));

            for (int i = 1; i <= 3; i++)
            {
                pnl_filter_secondo.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn' data-name='LINEA" + i + " ' >Linea " + i + "</a>"));
            }
        }


        //if (Request.QueryString["date"] == null)
        //{
        //    var getDailyIntervali = GetDailyIntervali(DateTime.Now, Departament);
        //    GetWorkingTimePerHourStiro(getDailyIntervali, DateTime.Now);
        //    newGrid.DataSource = GetDailyIntervali(DateTime.Now, Departament);
        //    newGrid.DataBind();

        //    if (Departament == 2)
        //    {

        //        newGrid1.DataSource = GetDailyIntervali(DateTime.Now, Departament);
        //        newGrid1.DataBind();
        //    }

        //    if (newGrid.Rows.Count > 0)
        //    {
        //        newGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }

        //    if (newGrid1.Rows.Count > 0)
        //    {
        //        newGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //}
        //else
        //{

        //    string selectedDate = Request.QueryString["date"].ToString();
        //    IFormatProvider culture = new CultureInfo("en-US", true);
        //    DateTime dateVal = DateTime.ParseExact(selectedDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //    try
        //    {
        //        GetWorkingTimePerHourStiro(GetDailyIntervali(Convert.ToDateTime(dateVal),2), Convert.ToDateTime(dateVal));
        //        newGrid.DataSource = GetDailyIntervali(Convert.ToDateTime(dateVal), Departament);
        //        newGrid.DataBind();

        //        if (Departament == 2)
        //        {
        //            newGrid1.DataSource = GetDailyIntervali(Convert.ToDateTime(dateVal), Departament);
        //            newGrid1.DataBind();
        //        }
        //        if (newGrid.Rows.Count > 0)
        //        {
        //            newGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //        if (newGrid1.Rows.Count > 0)
        //        {
        //            newGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Date:" + dateVal + "')", true);
        //    }
        //} 
            if (newGrid.Rows.Count > 0)
        {
            newGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
            if (newGrid1.Rows.Count > 0)
        {
            newGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
         

    public List<Intervali.IntervaliData> GetDailyIntervali(DateTime date, int sector)
    {
        using (OYContext entityContext = new OYContext())
        {
            entityContext.Database.CommandTimeout = 0;

            var query = (from realizari in entityContext.RealizariSet
                         join angajati in entityContext.AngajatiSet on realizari.IdAngajat equals angajati.Id
                         join butoane in entityContext.ButoaneSet on realizari.Id equals butoane.IdRealizare
                         join commessa in entityContext.CommessaSet on realizari.IdComanda equals commessa.Id
                         join masini in entityContext.MasiniSet on realizari.IdMasina equals masini.Id
                         join articole in entityContext.ArticoleSet on commessa.IdArticol equals articole.Id
                         join operati in entityContext.OperatiiSet on realizari.IdOperatie equals operati.Id
                         join opeartiArticole in entityContext.OperatiiArticolSet on articole.Id equals opeartiArticole.IdArticol
                         where
                         butoane.Data.Day == date.Day &&
                         butoane.Data.Month == date.Month &&
                         butoane.Data.Year == date.Year &&
                         opeartiArticole.IdOperatie == operati.Id &&
                         masini.IdSector == sector
                         select new OrderData
                         {
                             Line = masini.Linie,
                             Employee = angajati.Angajat,
                             ClickTime = butoane.Data,
                             Commessa = commessa.NrComanda,
                             Article = articole.Articol,
                             Norm = opeartiArticole.BucatiOra,/*opeartiArticole.BucatiButon > 1 ? opeartiArticole.BucatiOra * opeartiArticole.BucatiButon : opeartiArticole.BucatiOra*/
                             Operation = operati.Operatie,
                             ArticleOperation = opeartiArticole.Id,
                             BucatiButton = opeartiArticole.BucatiButon
                         })
                .AsParallel()
                //.OrderBy(opa => opa.Article)
                //.ThenBy(aid => aid.ArticleOperation)
                .GroupBy(x => x.Article)
                .Select(x => new Intervali.IntervaliByArticle
                {
                    Article = x.Key,
                    IntervaliByPhase = x.GroupBy(grp => grp.Operation)
                        .Select(d => new Intervali.IntervaliByPhase
                        {
                            Phase = d.Key,
                            EmployeeData = d.GroupBy(grp => grp.Employee)
                                .Select(id => new Intervali.IntervaliData
                                {
                                    Line = id.Select(e => e.Line).First(),
                                    Name = id.Key,
                                    Commessa = id.Select(e => e.Commessa).First(),
                                    Article = id.Select(e => e.Article).First(),
                                    Phase = id.Select(e => e.Operation).First(),
                                    Norm = id.Select(n => n.Norm).First(),
                                    ArticlePhase = id.Select(n => n.ArticleOperation).First(),
                                    H7 = id.Count(e => e.ClickTime.Hour == 7) * id.Select(a => a.BucatiButton).First(),
                                    H8 = id.Count(e => e.ClickTime.Hour == 8) * id.Select(a => a.BucatiButton).First(),
                                    H9 = id.Count(e => e.ClickTime.Hour == 9) * id.Select(a => a.BucatiButton).First(),
                                    H10 = id.Count(e => e.ClickTime.Hour == 10) * id.Select(a => a.BucatiButton).First(),
                                    H11 = id.Count(e => e.ClickTime.Hour == 11) * id.Select(a => a.BucatiButton).First(),
                                    H12 = id.Count(e => e.ClickTime.Hour == 12) * id.Select(a => a.BucatiButton).First(),
                                    H13 = id.Count(e => e.ClickTime.Hour == 13) * id.Select(a => a.BucatiButton).First(),
                                    H14 = id.Count(e => e.ClickTime.Hour == 14) * id.Select(a => a.BucatiButton).First(),
                                    H15 = id.Count(e => e.ClickTime.Hour == 15) * id.Select(a => a.BucatiButton).First(),
                                    H16 = id.Count(e => e.ClickTime.Hour == 16) * id.Select(a => a.BucatiButton).First(),
                                    H17 = id.Count(e => e.ClickTime.Hour == 17) * id.Select(a => a.BucatiButton).First(),
                                    H18 = id.Count(e => e.ClickTime.Hour == 18) * id.Select(a => a.BucatiButton).First(),
                                    H19 = id.Count(e => e.ClickTime.Hour == 19) * id.Select(a => a.BucatiButton).First(),
                                    H20 = id.Count(e => e.ClickTime.Hour == 20) * id.Select(a => a.BucatiButton).First(),
                                    H21 = id.Count(e => e.ClickTime.Hour == 21) * id.Select(a => a.BucatiButton).First(),
                                    H22 = id.Count(e => e.ClickTime.Hour == 22) * id.Select(a => a.BucatiButton).First(),
                                    TotalFirst = id.Count(e => e.ClickTime.Hour >= 7 && e.ClickTime.Hour <= 14) * id.Select(a => a.BucatiButton).First(),
                                    TotalSecond = id.Count(e => e.ClickTime.Hour >= 15 && e.ClickTime.Hour <= 23) * id.Select(a => a.BucatiButton).First()
                                })
                        })
                });

            return query.SelectMany(x => x.IntervaliByPhase).SelectMany(y => y.EmployeeData).ToList();
        }
    }
    private List<Operatii> _operations;
    private List<Realizari> _jobs;
    private List<Angajati> _sectorEmployees;
    private void GetWorkingTimePerHour(List<Intervali.IntervaliData> _intervali, DateTime newDate)
    {
        LoadDailyJobs(newDate);
        LoadPhases(1);
        LoadEmployees(1);

        if (newDate.Date == DateTime.Now.Date)
        {
            foreach (var interval in _intervali)
            {
                var employee = _sectorEmployees.FirstOrDefault(x => x.Angajat == interval.Name);
                if (employee == null)
                    continue;
                var operation = _operations.FirstOrDefault(o => o.Operatie == interval.Phase);
                if (operation == null)
                    continue;

                var specificJobs = (from s in _jobs
                                    where s.IdOperatie == operation.Id &&
                                    s.IdAngajat == employee.Id
                                    select s).ToArray();

                if (specificJobs.Length == 0)
                    continue;

                foreach (var job in specificJobs)
                { 
                     DateTime? lastWrite = new DateTime();
                    if (job.LastWrite == null)
                    {
                        lastWrite = DateTime.Now;
                    }
                    else
                    {
                        lastWrite = job.LastWrite;
                    }
                    if (job.Creat.Hour == 7 || job.Creat.Hour == 6)
                    {
                        interval.H7Duration += lastWrite.Value.Hour > 7 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H7Duration += 0;

                    if (job.Creat.Hour == 8)
                    {
                        interval.H8Duration += lastWrite.Value.Hour > 8 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 8 && job.Creat.Hour < 8)
                        interval.H8Duration += 60;
                    else if (lastWrite.Value.Hour == 8)
                        interval.H8Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H8Duration += 0;

                    if (job.Creat.Hour == 9)
                    {
                        interval.H9Duration += lastWrite.Value.Hour > 9 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 9 && job.Creat.Hour < 9)
                        interval.H9Duration += 60;
                    else if (lastWrite.Value.Hour == 9)
                        interval.H9Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H9Duration += 0;

                    if (job.Creat.Hour == 10)
                    {
                        interval.H10Duration += lastWrite.Value.Hour > 10 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                40,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 10 && job.Creat.Hour < 10)
                        interval.H10Duration += 40;
                    else if (lastWrite.Value.Hour == 10)
                        interval.H10Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H10Duration += 0;

                    if (job.Creat.Hour == 11)
                    {
                        interval.H11Duration += lastWrite.Value.Hour > 11 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 11 && job.Creat.Hour < 11)
                        interval.H11Duration += 60;
                    else if (lastWrite.Value.Hour == 11)
                        interval.H11Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H11Duration += 0;

                    if (job.Creat.Hour == 12)
                    {
                        interval.H12Duration += lastWrite.Value.Hour > 12 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 12 && job.Creat.Hour < 12)
                        interval.H12Duration += 60;
                    else if (lastWrite.Value.Hour == 12)
                        interval.H12Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H12Duration += 0;

                    if (job.Creat.Hour == 13)
                    {
                        interval.H13Duration += lastWrite.Value.Hour > 13 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 13 && job.Creat.Hour < 13)
                        interval.H13Duration += 50;
                    else if (lastWrite.Value.Hour == 13)
                        interval.H13Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H13Duration += 0;

                    if (job.Creat.Hour == 14)
                    {
                        interval.H14Duration += lastWrite.Value.Hour > 14 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 14 && job.Creat.Hour < 14)
                        interval.H14Duration += (int)lastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0)).TotalMinutes;
                    else if (lastWrite.Value.Hour == 14)
                        interval.H14Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H14Duration += 0;
                }
            }
        }
        else
        {
            foreach (var interval in _intervali)
            {
                var employee = _sectorEmployees.FirstOrDefault(x => x.Angajat == interval.Name);
                if (employee == null)
                    continue;
                var operation = _operations.FirstOrDefault(o => o.Operatie == interval.Phase);
                if (operation == null)
                    continue;

                var specificJobs = (from s in _jobs
                                    where s.IdOperatie == operation.Id &&
                                    s.IdAngajat == employee.Id
                                    select s).ToArray();

                if (specificJobs.Length == 0)
                    continue;

                foreach (var job in specificJobs)
                {
                    if (job.LastWrite == null)
                        continue;

                    if (job.Creat.Hour == 7 || job.Creat.Hour == 6)
                    {
                        interval.H7Duration += job.LastWrite.Value.Hour > 7 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H7Duration += 0;

                    if (job.Creat.Hour == 8)
                    {
                        interval.H8Duration += job.LastWrite.Value.Hour > 8 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 8 && job.Creat.Hour < 8)
                        interval.H8Duration += 60;
                    else if (job.LastWrite.Value.Hour == 8)
                        interval.H8Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H8Duration += 0;

                    if (job.Creat.Hour == 9)
                    {
                        interval.H9Duration += job.LastWrite.Value.Hour > 9 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 9 && job.Creat.Hour < 9)
                        interval.H9Duration += 60;
                    else if (job.LastWrite.Value.Hour == 9)
                        interval.H9Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H9Duration += 0;

                    if (job.Creat.Hour == 10)
                    {
                        interval.H10Duration += job.LastWrite.Value.Hour > 10 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                40,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 10 && job.Creat.Hour < 10)
                        interval.H10Duration += 40;
                    else if (job.LastWrite.Value.Hour == 10)
                        interval.H10Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H10Duration += 0;

                    if (job.Creat.Hour == 11)
                    {
                        interval.H11Duration += job.LastWrite.Value.Hour > 11 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 11 && job.Creat.Hour < 11)
                        interval.H11Duration += 60;
                    else if (job.LastWrite.Value.Hour == 11)
                        interval.H11Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H11Duration += 0;

                    if (job.Creat.Hour == 12)
                    {
                        interval.H12Duration += job.LastWrite.Value.Hour > 12 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 12 && job.Creat.Hour < 12)
                        interval.H12Duration += 60;
                    else if (job.LastWrite.Value.Hour == 12)
                        interval.H12Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H12Duration += 0;

                    if (job.Creat.Hour == 13)
                    {
                        interval.H13Duration += job.LastWrite.Value.Hour > 13 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 13 && job.Creat.Hour < 13)
                        interval.H13Duration += 50;
                    else if (job.LastWrite.Value.Hour == 13)
                        interval.H13Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H13Duration += 0;

                    if (job.Creat.Hour == 14)
                    {
                        interval.H14Duration += job.LastWrite.Value.Hour > 14 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 14 && job.Creat.Hour < 14)
                        interval.H14Duration += (int)job.LastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0)).TotalMinutes;
                    else if (job.LastWrite.Value.Hour == 14)
                        interval.H14Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H14Duration += 0;
                }
            }
        }

    }
    private void LoadPhases( int idSector)
    {
        _operations = new List<Operatii>();
        using (var c = new OYContext()) {
            _operations = (from o in c.OperatiiSet
                           where o.IdSector == idSector
                           select o).ToList();
        };
        
    }
    private void LoadDailyJobs(DateTime newDate)
    {
        _jobs = new List<Realizari>();
        using (var c = new OYContext())
        {
            _jobs = (from o in c.RealizariSet
                           where o.Creat.Year == newDate.Year && 
                           o.Creat.Month == newDate.Month &&
                           o.Creat.Day == newDate.Day
                           select o).ToList();
        };
    }
    private void LoadEmployees(int idSector)
    {
        _sectorEmployees = new List<Angajati>(); 
        using (var c = new OYContext())
        {
            _sectorEmployees = (from o in c.AngajatiSet
                           where o.IdSector == idSector
                                select o).ToList();
        };
        
    }
    private void GetWorkingTimePerHourStiro(List<Intervali.IntervaliData> _intervali, DateTime newDate)
    {
        LoadDailyJobs(newDate);
        LoadPhases(2);
        LoadEmployees(2);

        if (newDate == DateTime.Now.Date)
        {
            foreach (var interval in _intervali)
            {
                var employee = _sectorEmployees.FirstOrDefault(x => x.Angajat == interval.Name);
                if (employee == null)
                    continue;
                var operation = _operations.FirstOrDefault(o => o.Operatie == interval.Phase);
                if (operation == null)
                    continue;

                var specificJobs = (from s in _jobs
                                    where s.IdOperatie == operation.Id &&
                                    s.IdAngajat == employee.Id
                                    select s).ToArray();

                if (specificJobs.Length == 0)
                    continue;

                foreach (var job in specificJobs)
                {
                    DateTime? lastWrite = new DateTime();
                    if (job.LastWrite == null)
                    {
                        lastWrite = DateTime.Now;
                    }
                    else
                    {
                        lastWrite = job.LastWrite;
                    }
                    if (job.Creat.Hour == 7 || job.Creat.Hour == 6)
                    {
                        interval.H7Duration += lastWrite.Value.Hour > 7 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H7Duration += 0;

                    if (job.Creat.Hour == 8)
                    {
                        interval.H8Duration += lastWrite.Value.Hour > 8 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 8 && job.Creat.Hour < 8)
                        interval.H8Duration += 60;
                    else if (lastWrite.Value.Hour == 8)
                        interval.H8Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H8Duration += 0;

                    if (job.Creat.Hour == 9)
                    {
                        interval.H9Duration += lastWrite.Value.Hour > 9 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 9 && job.Creat.Hour < 9)
                        interval.H9Duration += 60;
                    else if (lastWrite.Value.Hour == 9)
                        interval.H9Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H9Duration += 0;

                    if (job.Creat.Hour == 10)
                    {
                        interval.H10Duration += lastWrite.Value.Hour > 10 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 10 && job.Creat.Hour < 10)
                        interval.H10Duration += 60;
                    else if (lastWrite.Value.Hour == 10)
                        interval.H10Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H10Duration += 0;

                    if (job.Creat.Hour == 11)
                    {
                        interval.H11Duration += lastWrite.Value.Hour > 11 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 11 && job.Creat.Hour < 11)
                        interval.H11Duration += 40;
                    else if (lastWrite.Value.Hour == 11)
                        interval.H11Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                20,
                                0
                                )).TotalMinutes;
                    else
                        interval.H11Duration += 0;

                    if (job.Creat.Hour == 12)
                    {
                        interval.H12Duration += lastWrite.Value.Hour > 12 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 12 && job.Creat.Hour < 12)
                        interval.H12Duration += 60;
                    else if (lastWrite.Value.Hour == 12)
                        interval.H12Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H12Duration += 0;

                    if (job.Creat.Hour == 13)
                    {
                        interval.H13Duration += lastWrite.Value.Hour > 13 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 13 && job.Creat.Hour < 13)
                        interval.H13Duration += 50;
                    else if (lastWrite.Value.Hour == 13)
                        interval.H13Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H13Duration += 0;

                    if (job.Creat.Hour == 14)
                    {
                        interval.H14Duration += lastWrite.Value.Hour > 14 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 14 && job.Creat.Hour < 14)
                        interval.H14Duration += (int)lastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0)).TotalMinutes;
                    else if (lastWrite.Value.Hour == 14)
                        interval.H14Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H14Duration += 0;

                    if (job.Creat.Hour == 15 )
                    {
                        interval.H15Duration += lastWrite.Value.Hour > 15 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                16,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H15Duration += 0;

                    if (job.Creat.Hour == 16)
                    {
                        interval.H16Duration += lastWrite.Value.Hour > 16 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                17,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 16 && job.Creat.Hour < 16)
                        interval.H16Duration += 60;
                    else if (lastWrite.Value.Hour == 16)
                        interval.H16Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                16,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H16Duration += 0;

                    if (job.Creat.Hour == 17)
                    {
                        interval.H17Duration += lastWrite.Value.Hour > 17 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                18,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 17 && job.Creat.Hour < 17)
                        interval.H17Duration += 60;
                    else if (lastWrite.Value.Hour == 17)
                        interval.H17Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                17,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H17Duration += 0;

                    if (job.Creat.Hour == 18)
                    {
                        if (lastWrite.Value.Hour > 18)
                        {
                            interval.H18Duration += (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                19,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes - 20;
                        }
                        else
                        {
                            if (lastWrite.Value < new DateTime(job.Creat.Year, job.Creat.Month, job.Creat.Day, 18, 30, 0))
                            {
                                interval.H18Duration += (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                            }
                            else
                            {
                                interval.H18Duration += (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes - 20;
                            }
                        }
                    }
                    else if (lastWrite.Value.Hour > 18 && job.Creat.Hour < 18)
                        interval.H18Duration += 40;
                    else if (lastWrite.Value.Hour == 18)
                        interval.H18Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                18,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H18Duration += 0;

                    if (job.Creat.Hour == 19)
                    {
                        interval.H19Duration += lastWrite.Value.Hour > 19 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                20,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 19 && job.Creat.Hour < 19)
                        interval.H19Duration += 60;
                    else if (lastWrite.Value.Hour == 19)
                        interval.H19Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                19,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H19Duration += 0;

                    if (job.Creat.Hour == 20)
                    {
                        interval.H20Duration += lastWrite.Value.Hour > 20 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                21,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 20 && job.Creat.Hour < 20)
                        interval.H20Duration += 60;
                    else if (lastWrite.Value.Hour == 20)
                        interval.H20Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                20,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H20Duration += 0;

                    if (job.Creat.Hour == 21)
                    {
                        interval.H21Duration += lastWrite.Value.Hour > 21 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 21 && job.Creat.Hour < 21)
                        interval.H21Duration += 50;
                    else if (lastWrite.Value.Hour == 21)
                        interval.H21Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                21,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H21Duration += 0;

                    if (job.Creat.Hour == 22)
                    {
                        interval.H22Duration += lastWrite.Value.Hour > 22 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                23,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)lastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (lastWrite.Value.Hour > 22 && job.Creat.Hour < 22)
                        interval.H22Duration += (int)lastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0)).TotalMinutes;
                    else if (lastWrite.Value.Hour == 22)
                        interval.H22Duration += (int)lastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H22Duration += 0;
                }
            }
             
        }
        else
        {
            foreach (var interval in _intervali)
            {
                var employee = _sectorEmployees.FirstOrDefault(x => x.Angajat == interval.Name);
                if (employee == null)
                    continue;
                var operation = _operations.FirstOrDefault(o => o.Operatie == interval.Phase);
                if (operation == null)
                    continue;

                var specificJobs = (from s in _jobs
                                    where s.IdOperatie == operation.Id &&
                                    s.IdAngajat == employee.Id
                                    select s).ToArray();

                if (specificJobs.Length == 0)
                    continue;

                foreach (var job in specificJobs)
                {
                    if (job.LastWrite == null)
                        continue;

                    if (job.Creat.Hour == 7 || job.Creat.Hour == 6)
                    {
                        interval.H7Duration += job.LastWrite.Value.Hour > 7 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H7Duration += 0;

                    if (job.Creat.Hour == 8)
                    {
                        interval.H8Duration += job.LastWrite.Value.Hour > 8 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 8 && job.Creat.Hour < 8)
                        interval.H8Duration += 60;
                    else if (job.LastWrite.Value.Hour == 8)
                        interval.H8Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                8,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H8Duration += 0;

                    if (job.Creat.Hour == 9)
                    {
                        interval.H9Duration += job.LastWrite.Value.Hour > 9 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 9 && job.Creat.Hour < 9)
                        interval.H9Duration += 60;
                    else if (job.LastWrite.Value.Hour == 9)
                        interval.H9Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                9,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H9Duration += 0;

                    if (job.Creat.Hour == 10)
                    {
                        interval.H10Duration += job.LastWrite.Value.Hour > 10 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 10 && job.Creat.Hour < 10)
                        interval.H10Duration += 60;
                    else if (job.LastWrite.Value.Hour == 10)
                        interval.H10Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                10,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H10Duration += 0;

                    if (job.Creat.Hour == 11)
                    {
                        interval.H11Duration += job.LastWrite.Value.Hour > 11 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 11 && job.Creat.Hour < 11)
                        interval.H11Duration += 40;
                    else if (job.LastWrite.Value.Hour == 11)
                        interval.H11Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                11,
                                20,
                                0
                                )).TotalMinutes;
                    else
                        interval.H11Duration += 0;

                    if (job.Creat.Hour == 12)
                    {
                        interval.H12Duration += job.LastWrite.Value.Hour > 12 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 12 && job.Creat.Hour < 12)
                        interval.H12Duration += 60;
                    else if (job.LastWrite.Value.Hour == 12)
                        interval.H12Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                12,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H12Duration += 0;

                    if (job.Creat.Hour == 13)
                    {
                        interval.H13Duration += job.LastWrite.Value.Hour > 13 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 13 && job.Creat.Hour < 13)
                        interval.H13Duration += 50;
                    else if (job.LastWrite.Value.Hour == 13)
                        interval.H13Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                13,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H13Duration += 0;

                    if (job.Creat.Hour == 14)
                    {
                        interval.H14Duration += job.LastWrite.Value.Hour > 14 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 14 && job.Creat.Hour < 14)
                        interval.H14Duration += (int)job.LastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0)).TotalMinutes;
                    else if (job.LastWrite.Value.Hour == 14)
                        interval.H14Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                14,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H14Duration += 0;

                    if (job.Creat.Hour == 15 )
                    {
                        interval.H15Duration += job.LastWrite.Value.Hour > 15 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                16,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else
                        interval.H15Duration += 0;

                    if (job.Creat.Hour == 16)
                    {
                        interval.H16Duration += job.LastWrite.Value.Hour > 16 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                17,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 16 && job.Creat.Hour < 16)
                        interval.H16Duration += 60;
                    else if (job.LastWrite.Value.Hour == 16)
                        interval.H16Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                16,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H16Duration += 0;

                    if (job.Creat.Hour == 17)
                    {
                        interval.H17Duration += job.LastWrite.Value.Hour > 17 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                18,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 17 && job.Creat.Hour < 17)
                        interval.H17Duration += 60;
                    else if (job.LastWrite.Value.Hour == 17)
                        interval.H17Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                17,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H17Duration += 0;

                    if (job.Creat.Hour == 18)
                    {
                        if (job.LastWrite.Value.Hour > 18)
                        {
                            interval.H18Duration += (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                19,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes - 20;
                        }
                        else
                        {
                            if (job.LastWrite.Value < new DateTime(job.Creat.Year, job.Creat.Month, job.Creat.Day, 18, 30, 0))
                            {
                                interval.H18Duration += (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                            }
                            else
                            {
                                interval.H18Duration += (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes - 20;
                            }
                        }
                    }
                    else if (job.LastWrite.Value.Hour > 18 && job.Creat.Hour < 18)
                        interval.H18Duration += 40;
                    else if (job.LastWrite.Value.Hour == 18)
                        interval.H18Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                18,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H18Duration += 0;

                    if (job.Creat.Hour == 19)
                    {
                        interval.H19Duration += job.LastWrite.Value.Hour > 19 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                20,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 19 && job.Creat.Hour < 19)
                        interval.H19Duration += 60;
                    else if (job.LastWrite.Value.Hour == 19)
                        interval.H19Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                19,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H19Duration += 0;

                    if (job.Creat.Hour == 20)
                    {
                        interval.H20Duration += job.LastWrite.Value.Hour > 20 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                21,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 20 && job.Creat.Hour < 20)
                        interval.H20Duration += 60;
                    else if (job.LastWrite.Value.Hour == 20)
                        interval.H20Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                20,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H20Duration += 0;

                    if (job.Creat.Hour == 21)
                    {
                        interval.H21Duration += job.LastWrite.Value.Hour > 21 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 21 && job.Creat.Hour < 21)
                        interval.H21Duration += 50;
                    else if (job.LastWrite.Value.Hour == 21)
                        interval.H21Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                21,
                                10,
                                0
                                )).TotalMinutes;
                    else
                        interval.H21Duration += 0;

                    if (job.Creat.Hour == 22)
                    {
                        interval.H22Duration += job.LastWrite.Value.Hour > 22 ?
                            (int)new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                23,
                                0,
                                0
                                ).Subtract(job.Creat).TotalMinutes :
                                (int)job.LastWrite.Value.Subtract(job.Creat).TotalMinutes;
                    }
                    else if (job.LastWrite.Value.Hour > 22 && job.Creat.Hour < 22)
                        interval.H22Duration += (int)job.LastWrite.Value.Subtract(
                            new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0)).TotalMinutes;
                    else if (job.LastWrite.Value.Hour == 22)
                        interval.H22Duration += (int)job.LastWrite.Value.Subtract(
                                new DateTime(
                                job.Creat.Year,
                                job.Creat.Month,
                                job.Creat.Day,
                                22,
                                0,
                                0
                                )).TotalMinutes;
                    else
                        interval.H22Duration += 0;
                }
            } 
        }

    }
    
}