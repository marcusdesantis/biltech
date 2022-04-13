using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Reports
{
    public class MisurazioneList
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public double Peso { get; set; }
        public DateTime DataCreazione { get; set; }

        public DateTime ReportDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

    }
}
