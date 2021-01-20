
using System;
using System.Collections.Generic;

namespace OlimpiasKnitting.Client.Entities
{

    public class EfficiencyByCommessa
    {

        public string Commessa { get; set; }

        public IEnumerable<EfficiencyByArticle> EfficiencyByArticle { get; set; }
    }

    public class EfficiencyByArticle
    {

        public string Article { get; set; }

        public IEnumerable<EfficiencyByPhase> EfficiencyByPhase { get; set; }
    }

    public class EfficiencyByPhase
    {

        public string Phase { get; set; }

        public IEnumerable<Efficiency> EmployeeData { get; set; }
    }

    public class Efficiency
    {

        public string Line { get; set; }

        public string Name { get; set; }

        public string Commessa { get; set; }

        public string Article { get; set; }

        public string Phase { get; set; }

        public int ArticlePhase { get; set; }

        public double Norm { get; set; }

        public IEnumerable<DateTime> Clicks { get; set; }
        public IEnumerable<DateTime> H7Clicks { get; set; }
        public IEnumerable<DateTime> H8Clicks { get; set; }
        public IEnumerable<DateTime> H9Clicks { get; set; }
        public IEnumerable<DateTime> H10Clicks { get; set; }
        public IEnumerable<DateTime> H11Clicks { get; set; }
        public IEnumerable<DateTime> H12Clicks { get; set; }
        public IEnumerable<DateTime> H13Clicks { get; set; }
        public IEnumerable<DateTime> H14Clicks { get; set; }
        public DateTime FirstClick { get; set; }

        public DateTime H7Start { get; set; }

        public DateTime H7Stop { get; set; }

        public double H7 { get; set; }

        public DateTime H8Start { get; set; }

        public DateTime H8Stop { get; set; }

        public double H8 { get; set; }

        public DateTime H9Start { get; set; }

        public DateTime H9Stop { get; set; }

        public double H9 { get; set; }

        public DateTime H10Start { get; set; }

        public DateTime H10Stop { get; set; }

        public double H10 { get; set; }

        public DateTime H11Start { get; set; }

        public DateTime H11Stop { get; set; }

        public double H11 { get; set; }

        public DateTime H12Start { get; set; }

        public DateTime H12Stop { get; set; }

        public double H12 { get; set; }

        public DateTime H13Start { get; set; }

        public DateTime H13Stop { get; set; }

        public double H13 { get; set; }

        public DateTime H14Start { get; set; }

        public DateTime H14Stop { get; set; }

        public double H14 { get; set; }

        public DateTime H15Start { get; set; }

        public DateTime H15Stop { get; set; }

        public double H15 { get; set; }

        public DateTime H16Start { get; set; }

        public DateTime H16Stop { get; set; }

        public double H16 { get; set; }

        public DateTime H17Start { get; set; }

        public DateTime H17Stop { get; set; }

        public double H17 { get; set; }

        public DateTime H18Start { get; set; }

        public DateTime H18Stop { get; set; }

        public double H18 { get; set; }

        public DateTime H19Start { get; set; }

        public DateTime H19Stop { get; set; }

        public double H19 { get; set; }

        public DateTime H20Start { get; set; }

        public DateTime H20Stop { get; set; }

        public double H20 { get; set; }

        public DateTime H21Start { get; set; }

        public DateTime H21Stop { get; set; }

        public double H21 { get; set; }

        public DateTime H22Start { get; set; }

        public DateTime H22Stop { get; set; }

        public double H22 { get; set; }
        public double WeightedAverage { get; set; }


        public double? TotalFirst { get; set; }

        public double? TotalSecond { get; set; }

        public double? JobEfficiency { get; set; }

        public int JobId { get; set; }
        public TimeSpan SpentTimeOnJob  { get; set; }

    }
}