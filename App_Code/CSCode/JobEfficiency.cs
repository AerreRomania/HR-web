
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OlimpiasKnitting.Client.Entities
{
    public class JobEfficiency
    {
        public int EfficiencyID { get; set; }

        public long SpentTime { get; set; }

        public double Efficiency { get; set; }
        [Key]
        public int RealizariID { get; set; }

        
        //public int EntityId
        //{
        //    get
        //    {
        //        return EfficiencyID;
        //    }

        //    set
        //    {
        //        EfficiencyID = value;
        //    }
        //}
    }
}