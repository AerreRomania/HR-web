using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Intervali
    {

        public class IntervaliByCommessa
        {
            public string Commessa { get; set; }

            public IEnumerable<IntervaliByArticle> IntervaliByArticle { get; set; }
        }

        public class IntervaliByArticle
        {

            public string Article { get; set; }

            public IEnumerable<IntervaliByPhase> IntervaliByPhase { get; set; }
        }

        public class IntervaliByPhase
        {

            public string Phase { get; set; }

            public IEnumerable<IntervaliData> EmployeeData { get; set; }
        }

        public class IntervaliData
        {

            public string Line { get; set; }

            public string Name { get; set; }

            public string Commessa { get; set; }

            public string Article { get; set; }

            public string Phase { get; set; }

            public int ArticlePhase { get; set; }

            public double Norm { get; set; }

            public int H7 { get; set; }

            public int H8 { get; set; }

            public int H9 { get; set; }

            public int H10 { get; set; }

            public int H11 { get; set; }

            public int H12 { get; set; }

            public int H13 { get; set; }

            public int H14 { get; set; }

            public int H15 { get; set; }

            public int H16 { get; set; }

            public int H17 { get; set; }

            public int H18 { get; set; }

            public int H19 { get; set; }

            public int H20 { get; set; }

            public int H21 { get; set; }

            public int H22 { get; set; }

            public int TotalFirst { get; set; }

            public int TotalSecond { get; set; }

        public int H7Duration { get; set; }

        public int H8Duration { get; set; }

        public int H9Duration { get; set; }

        public int H10Duration { get; set; }

        public int H11Duration { get; set; }

        public int H12Duration { get; set; }

        public int H13Duration { get; set; }

        public int H14Duration { get; set; }

        public int H15Duration { get; set; }

        public int H16Duration { get; set; }

        public int H17Duration { get; set; }

        public int H18Duration { get; set; }

        public int H19Duration { get; set; }

        public int H20Duration { get; set; }

        public int H21Duration { get; set; }

        public int H22Duration { get; set; }
         
    }
    }
