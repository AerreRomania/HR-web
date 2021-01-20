
using System;

namespace  OlimpiasKnitting.Client.Entities
{

    public class EfficiencyData
    {

        public string Line { get; set; }

        public string Employee { get; set; }

        public string Commessa { get; set; }

        public string Article { get; set; }

        public double Norm { get; set; }

        public string Operation { get; set; }

        public DateTime FirstClick { get; set; }

        public DateTime ClickTime { get; set; }

        public int ArticleOperation { get; set; }

        public double? JobEfficiency { get; set; }

        public long? SpentTime { get; set; }

        public int JobId { get; set; }
    }
}