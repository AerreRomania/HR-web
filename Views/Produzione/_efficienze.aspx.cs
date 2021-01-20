
using OlimpiasKnitting.Client.Entities;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Views_Produzione_efficienze : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int Departament = Convert.ToInt32(Request.QueryString["departament"]);

        if (Departament == 1)
        {
            pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn active' data-name='all' >All</a>"));
            for (int i = 1; i <= 24; i++)
            {
                pnl_filter_btns.Controls.Add(new LiteralControl("<a href='#' class='btn filter-btn' data-name='LINEA" + i+" ' >Linea "+i+"</a>"));
            } 
        } else if (Departament == 2)
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

        if (Request.QueryString["date"] == null) {
            newGrid.DataSource = GetDailyEfficiency(DateTime.Now, Departament);
            newGrid.DataBind();

            if (Departament == 2)
            {
                newGrid1.DataSource = GetDailyEfficiency(DateTime.Now, Departament);
                newGrid1.DataBind();
            }

            if (newGrid.Rows.Count > 0)
            {
                newGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            if (newGrid1.Rows.Count > 0)
            {
                newGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        else
        {

            string selectedDate = Request.QueryString["date"].ToString();
            IFormatProvider culture = new CultureInfo("en-US", true);
            DateTime dateVal = DateTime.ParseExact(selectedDate, "dd/MM/yyyy",CultureInfo.InvariantCulture);
            try
            {
                newGrid.DataSource = GetDailyEfficiency(Convert.ToDateTime(dateVal), Departament);
                newGrid.DataBind();

                if (Departament == 2)
                {
                    newGrid1.DataSource = GetDailyEfficiency(Convert.ToDateTime(dateVal), Departament);
                    newGrid1.DataBind();
                }
                if (newGrid.Rows.Count > 0)
                {
                    newGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                if (newGrid1.Rows.Count > 0)
                {
                    newGrid1.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wrong Date:" + dateVal + "')", true);
            }

        }
    }
     

    public List<Efficiency> GetDailyEfficiency(DateTime date, int sector)
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
                         join jobEfficiency in entityContext.JobEfficiencySet on realizari.Id equals jobEfficiency.RealizariID into ps
                         from jobEfficiency in ps.DefaultIfEmpty()
                         where
                         butoane.Data.Day == date.Day &&
                         butoane.Data.Month == date.Month &&
                         butoane.Data.Year == date.Year &&
                         opeartiArticole.IdOperatie == operati.Id &&
                         masini.IdSector == sector

                         select new EfficiencyData
                         {
                             Line = masini.Linie,
                             Employee = angajati.Angajat,
                             FirstClick = realizari.FirstWrite ?? realizari.Creat,
                             ClickTime = butoane.Data,
                             Commessa = commessa.NrComanda,
                             Article = articole.Articol,
                             Norm = opeartiArticole.BucatiButon > 1 ? opeartiArticole.BucatiOra / opeartiArticole.BucatiButon : opeartiArticole.BucatiOra,
                             Operation = operati.Operatie,
                             ArticleOperation = opeartiArticole.Id,
                             JobEfficiency = jobEfficiency.Efficiency,
                             SpentTime = jobEfficiency.SpentTime,
                             JobId = realizari.Id
                         }).AsParallel()
                           .OrderBy(opa => opa.Article)
                           .ThenBy(aid => aid.ArticleOperation)
                           .ThenBy(a => a.ClickTime)
                           .GroupBy(x => x.Commessa)
                           .Select(xll => new EfficiencyByCommessa
                           {
                               Commessa = xll.Key,
                               EfficiencyByArticle = xll.GroupBy(grp => grp.Article).Select(x => new EfficiencyByArticle
                               {
                                   Article = x.Key,
                                   EfficiencyByPhase = x.GroupBy(grp => grp.Operation)

                                 .Select(d => new EfficiencyByPhase
                                 {
                                     Phase = d.Key,
                                     EmployeeData = d.GroupBy(grp => grp.Employee)
                                     .Select(id => new
                                     {
                                         Name = id.Key,
                                         Line = id.Select(e => e.Line).First(),
                                         Commessa = id.Select(e => e.Commessa).First(),
                                         Article = id.Select(e => e.Article).First(),
                                         Phase = id.Select(e => e.Operation).First(),
                                         Norm = id.Select(n => n.Norm).First(),
                                         ArticlePhase = id.Select(n => n.ArticleOperation).First(),

                                         Clicks = id.Select(a => a.ClickTime),
                                         H7Clicks = id.Where(a => a.ClickTime.Hour == 7).Select(a => a.ClickTime),
                                         H8Clicks = id.Where(a => a.ClickTime.Hour == 8).Select(a => a.ClickTime),
                                         H9Clicks = id.Where(a => a.ClickTime.Hour == 9).Select(a => a.ClickTime),
                                         H10Clicks = id.Where(a => a.ClickTime.Hour == 10).Select(a => a.ClickTime),
                                         H11Clicks = id.Where(a => a.ClickTime.Hour == 11).Select(a => a.ClickTime),
                                         H12Clicks = id.Where(a => a.ClickTime.Hour == 12).Select(a => a.ClickTime),
                                         H13Clicks = id.Where(a => a.ClickTime.Hour == 13).Select(a => a.ClickTime),
                                         H14Clicks = id.Where(a => a.ClickTime.Hour == 14).Select(a => a.ClickTime),

                                         H7Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 7 ?
                                         id.Select(a => a.FirstClick).FirstOrDefault() :
                                         id.Where(e => e.ClickTime.Hour == 7).Select(a => a.ClickTime).FirstOrDefault(),

                                         H7Stop = id.Where(e => e.ClickTime.Hour == 7).Select(a => a.ClickTime).LastOrDefault(),

                                         H8Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 8 ?
                                         id.Select(a => a.FirstClick).FirstOrDefault() :
                                         id.Where(e => e.ClickTime.Hour == 8).Select(a => a.ClickTime).FirstOrDefault(),

                                         H8Stop = id.Where(e => e.ClickTime.Hour == 8).Select(a => a.ClickTime).LastOrDefault(),

                                         H9Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 9 ?
                                         id.Select(a => a.FirstClick).FirstOrDefault() :
                                         id.Where(e => e.ClickTime.Hour == 9).Select(a => a.ClickTime).FirstOrDefault(),

                                         H9Stop = id.Where(e => e.ClickTime.Hour == 9).Select(a => a.ClickTime).LastOrDefault(),

                                         H10Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 10 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 10).Select(a => a.ClickTime).FirstOrDefault(),
                                         H10Stop = id.Where(e => e.ClickTime.Hour == 10).Select(a => a.ClickTime).LastOrDefault(),

                                         H11Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 11 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 11).Select(a => a.ClickTime).FirstOrDefault(),
                                         H11Stop = id.Where(e => e.ClickTime.Hour == 11).Select(a => a.ClickTime).LastOrDefault(),

                                         H12Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 12 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 12).Select(a => a.ClickTime).FirstOrDefault(),
                                         H12Stop = id.Where(e => e.ClickTime.Hour == 12).Select(a => a.ClickTime).LastOrDefault(),

                                         H13Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 13 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 13).Select(a => a.ClickTime).FirstOrDefault(),
                                         H13Stop = id.Where(e => e.ClickTime.Hour == 13).Select(a => a.ClickTime).LastOrDefault(),

                                         H14Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 14 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 14).Select(a => a.ClickTime).FirstOrDefault(),
                                         H14Stop = id.Where(e => e.ClickTime.Hour == 14).Select(a => a.ClickTime).LastOrDefault(),

                                         H15Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 15 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 15).Select(a => a.ClickTime).FirstOrDefault(),
                                         H15Stop = id.Where(e => e.ClickTime.Hour == 15).Select(a => a.ClickTime).LastOrDefault(),

                                         H16Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 16 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 16).Select(a => a.ClickTime).FirstOrDefault(),
                                         H16Stop = id.Where(e => e.ClickTime.Hour == 16).Select(a => a.ClickTime).LastOrDefault(),

                                         H17Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 17 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 17).Select(a => a.ClickTime).FirstOrDefault(),
                                         H17Stop = id.Where(e => e.ClickTime.Hour == 17).Select(a => a.ClickTime).LastOrDefault(),

                                         H18Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 18 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 18).Select(a => a.ClickTime).FirstOrDefault(),
                                         H18Stop = id.Where(e => e.ClickTime.Hour == 18).Select(a => a.ClickTime).LastOrDefault(),

                                         H19Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 19 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 19).Select(a => a.ClickTime).FirstOrDefault(),
                                         H19Stop = id.Where(e => e.ClickTime.Hour == 19).Select(a => a.ClickTime).LastOrDefault(),

                                         H20Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 20 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 20).Select(a => a.ClickTime).FirstOrDefault(),
                                         H20Stop = id.Where(e => e.ClickTime.Hour == 20).Select(a => a.ClickTime).LastOrDefault(),

                                         H21Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 21 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 21).Select(a => a.ClickTime).FirstOrDefault(),
                                         H21Stop = id.Where(e => e.ClickTime.Hour == 21).Select(a => a.ClickTime).LastOrDefault(),

                                         H22Start = id.Select(a => a.FirstClick.Hour).FirstOrDefault() == 22 ? id.Select(a => a.FirstClick).FirstOrDefault() : id.Where(e => e.ClickTime.Hour == 22).Select(a => a.ClickTime).FirstOrDefault(),
                                         H22Stop = id.Where(e => e.ClickTime.Hour == 22).Select(a => a.ClickTime).LastOrDefault(),


                                         H7 = id.Count(e => e.ClickTime.Hour == 7),
                                         H8 = id.Count(e => e.ClickTime.Hour == 8),
                                         H9 = id.Count(e => e.ClickTime.Hour == 9),
                                         H10 = id.Count(e => e.ClickTime.Hour == 10),
                                         H11 = id.Count(e => e.ClickTime.Hour == 11),
                                         H12 = id.Count(e => e.ClickTime.Hour == 12),
                                         H13 = id.Count(e => e.ClickTime.Hour == 13),
                                         H14 = id.Count(e => e.ClickTime.Hour == 14),
                                         H15 = id.Count(e => e.ClickTime.Hour == 15),
                                         H16 = id.Count(e => e.ClickTime.Hour == 16),
                                         H17 = id.Count(e => e.ClickTime.Hour == 17),
                                         H18 = id.Count(e => e.ClickTime.Hour == 18),
                                         H19 = id.Count(e => e.ClickTime.Hour == 19),
                                         H20 = id.Count(e => e.ClickTime.Hour == 20),
                                         H21 = id.Count(e => e.ClickTime.Hour == 21),
                                         H22 = id.Count(e => e.ClickTime.Hour == 22),
                                         SpentTime = id.Select(n => n.SpentTime).Distinct().Sum(),
                                         JobEfficiency = id.Select(te => te.JobEfficiency).Distinct().Average(),
                                         JobId = id.Select(s => s.JobId).First()
                                     })
                                         .Select(id => new
                                         {
                                             id.Line,
                                             id.Name,
                                             id.Commessa,
                                             id.Article,
                                             id.Phase,
                                             id.Norm,
                                             id.ArticlePhase,
                                             id.H7Start,
                                             id.H7Stop,
                                             id.H8Start,
                                             id.H8Stop,
                                             id.H9Start,
                                             id.H9Stop,
                                             id.H10Start,
                                             id.H10Stop,
                                             id.H11Start,
                                             id.H11Stop,
                                             id.H12Start,
                                             id.H12Stop,
                                             id.H13Start,
                                             id.H13Stop,
                                             id.H14Start,
                                             id.H14Stop,
                                             id.H15Start,
                                             id.H15Stop,
                                             id.H16Start,
                                             id.H16Stop,
                                             id.H17Start,
                                             id.H17Stop,
                                             id.H18Start,
                                             id.H18Stop,
                                             id.H19Start,
                                             id.H19Stop,
                                             id.H20Start,
                                             id.H20Stop,
                                             id.H21Start,
                                             id.H21Stop,
                                             id.H22Start,
                                             id.H22Stop,
                                             id.Clicks,
                                             id.H7Clicks,
                                             id.H8Clicks,
                                             id.H9Clicks,
                                             id.H10Clicks,
                                             id.H11Clicks,
                                             id.H12Clicks,
                                             id.H13Clicks,
                                             id.H14Clicks,

                                             H7 = id.H7.EfficiencyForElapsedTime(id.H7Start, id.H7Stop, id.Norm),

                                             H8 = id.H8.EfficiencyForElapsedTime(id.H8Start, id.H8Stop, id.Norm),

                                             H9 = id.H9.EfficiencyForElapsedTime(id.H9Start, id.H9Stop, id.Norm),

                                             H10 = sector == 1
                                                 ? id.H10 / (id.Norm / 3 * 2) * 100
                                                 : id.H10Stop.IsOneHour(id.H10Start)
                                                     ? id.H10 / id.Norm * 100
                                                     : id.H10.EfficiencyForElapsedTime(id.H10Start, id.H10Stop, id.Norm),

                                             H11 = sector == 2
                                                 ? id.H11 / (id.Norm / 3 * 2) * 100
                                                 : id.H11Stop.IsOneHour(id.H11Start)
                                                     ? id.H11 / id.Norm * 100
                                                     : id.H11.EfficiencyForElapsedTime(id.H11Start, id.H11Stop, id.Norm),

                                             H12 = id.H12.EfficiencyForElapsedTime(id.H12Start, id.H12Stop, id.Norm),
                                             H13 = id.H13.EfficiencyForElapsedTime(id.H13Start, id.H13Stop, id.Norm),
                                             H14 = id.H14.EfficiencyForElapsedTime(id.H14Start, id.H14Stop, id.Norm),

                                             H15 = id.H15.EfficiencyForElapsedTime(id.H15Start, id.H15Stop, id.Norm),
                                             H16 = id.H16.EfficiencyForElapsedTime(id.H16Start, id.H16Stop, id.Norm),
                                             H17 = id.H17.EfficiencyForElapsedTime(id.H17Start, id.H17Stop, id.Norm),
                                             H18 = id.H18Stop.IsOneHour(id.H18Start) ? id.H18 / (id.Norm / 3 * 2) * 100 : id.H18.EfficiencyForElapsedTime(id.H18Start, id.H18Stop, id.Norm),
                                             H19 = id.H19.EfficiencyForElapsedTime(id.H19Start, id.H19Stop, id.Norm),
                                             H20 = id.H20.EfficiencyForElapsedTime(id.H20Start, id.H20Stop, id.Norm),
                                             H21 = id.H21Stop.IsOneHour(id.H21Start) ? id.H21 / (id.Norm / 6 * 5) * 100 : id.H21.EfficiencyForElapsedTime(id.H21Start, id.H21Stop, id.Norm),
                                             H22 = id.H22.EfficiencyForElapsedTime(id.H21Start, id.H21Stop, id.Norm),

                                             SpentTimeOnJob = TimeSpan.FromTicks(id.SpentTime ?? 0),
                                             id.JobEfficiency,
                                             id.JobId
                                         })
                                         .Select(id => new Efficiency
                                         {
                                             Line = id.Line,
                                             Name = id.Name,
                                             Commessa = id.Commessa,
                                             Article = id.Article,
                                             Phase = id.Phase,
                                             Norm = id.Norm,
                                             ArticlePhase = id.ArticlePhase,
                                             Clicks = id.Clicks,
                                             H7Clicks = id.H7Clicks,
                                             H8Clicks = id.H8Clicks,
                                             H9Clicks = id.H9Clicks,
                                             H10Clicks = id.H10Clicks,
                                             H11Clicks = id.H11Clicks,
                                             H12Clicks = id.H12Clicks,
                                             H13Clicks = id.H13Clicks,
                                             H14Clicks = id.H14Clicks,
                                             H7Start = id.H7Start,
                                             H7Stop = id.H7Stop,
                                             H8Start = id.H8Start,
                                             H8Stop = id.H8Stop,
                                             H9Start = id.H9Start,
                                             H9Stop = id.H9Stop,
                                             H10Start = id.H10Start,
                                             H10Stop = id.H10Stop,
                                             H11Start = id.H11Start,
                                             H11Stop = id.H11Stop,
                                             H12Start = id.H12Start,
                                             H12Stop = id.H12Stop,
                                             H13Start = id.H13Start,
                                             H13Stop = id.H13Stop,
                                             H14Start = id.H14Start,
                                             H14Stop = id.H14Stop,
                                             H15Start = id.H15Start,
                                             H15Stop = id.H15Stop,
                                             H16Start = id.H16Start,
                                             H16Stop = id.H16Stop,
                                             H17Start = id.H17Start,
                                             H17Stop = id.H17Stop,
                                             H18Start = id.H18Start,
                                             H18Stop = id.H18Stop,
                                             H19Start = id.H19Start,
                                             H19Stop = id.H19Stop,
                                             H20Start = id.H20Start,
                                             H20Stop = id.H20Stop,
                                             H21Start = id.H21Start,
                                             H21Stop = id.H21Stop,
                                             H22Start = id.H22Start,
                                             H22Stop = id.H22Stop,
                                             H7 = id.H7,
                                             H8 = id.H8,
                                             H9 = id.H9,
                                             H10 = id.H10,
                                             H11 = id.H11,
                                             H12 = id.H12,
                                             H13 = id.H13,
                                             H14 = id.H14,
                                             H15 = id.H15,
                                             H16 = id.H16,
                                             H17 = id.H17,
                                             H18 = id.H18,
                                             H19 = id.H19,
                                             H20 = id.H20,
                                             H21 = id.H21,
                                             H22 = id.H22,
                                             SpentTimeOnJob = id.SpentTimeOnJob,
                                             TotalFirst = id.JobEfficiency,
                                             TotalSecond = new[] { id.H15, id.H16, id.H17, id.H18, id.H19, id.H20, id.H21, id.H22 }.Where(c => c != 0).DefaultIfEmpty().Average(),
                                             JobEfficiency = id.JobEfficiency,
                                             JobId = id.JobId
                                         })
                                 })
                               })
                           }); ;


            var data = query.SelectMany(x => x.EfficiencyByArticle).SelectMany(y => y.EfficiencyByPhase).SelectMany(z => z.EmployeeData).ToList();

            var duplicates = data.GroupBy(x => x.Name).Where(x => x.Count() > 1).ToList();

            foreach (var elements in duplicates)
            {
                if (elements.Select(a => a.JobEfficiency).Any())
                {
                    double totalTimeForJobs = elements.Sum(s => s.SpentTimeOnJob.TotalMinutes);
                    double weightedAverage = Convert.ToInt32(elements.Sum(a => a.SpentTimeOnJob.TotalMinutes / totalTimeForJobs * a.JobEfficiency));
                    foreach (var element in elements)
                    {
                        data.Remove(element);
                        element.WeightedAverage = weightedAverage;
                        data.Add(element);
                    }
                }
            } 

            return data.ToList();
        }
    }
}



public static class RealizariExtensions
{

    public static double EfficiencyForElapsedTime(this int pieces, DateTime start, DateTime end, double norm)
    {
        if (pieces == 0) return 0;
        var timeOnJob = (end - start).TotalMinutes;
        var timeForPiece = 60 / norm;
        var efficiencyPerPhase = timeOnJob / timeForPiece;
        var efficiency = pieces / efficiencyPerPhase * 100;
        return efficiency >= 200 ? 0 : efficiency;
    }

    public static bool IsOneHour(this DateTime end, DateTime start)
    {
        return (end - start).TotalMinutes >= 50;
    }
}