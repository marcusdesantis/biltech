using BalanceNetFramework.Reports;
using BalanceNetFramework.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Models
{
    public class ReportModel
    {
        public DateTime ReportDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public List<MeasureList> ListMisurazione { get; set; }
        public List<MisurazioneModel> ReportByDatePeriod { get; set; }

        public void CreateReport(DateTime fromDate, DateTime toDate, int? idBalance, int? idProduct)
        {
            ReportDate = DateTime.Now;
            StartDate = fromDate;
            EndDate = toDate;

            var getReport = new ManagerBalance();
            var result = getReport.GetReport(fromDate, toDate, idBalance, idProduct);

            ListMisurazione = new List<MeasureList>();
            foreach (System.Data.DataRow rows in result.Rows)
            {
                var misurazioneList = new MeasureList()
                {
                    Id = Convert.ToInt32(rows[0]),
                    Nome = Convert.ToString(rows[1]),
                    Peso = Convert.ToDouble(rows[2]),
                    DataCreazione = Convert.ToDateTime(rows[3]),
                    ReportDate = DateTime.Now,
                    StartDate = fromDate,
                    EndDate = toDate

                };
                ListMisurazione.Add(misurazioneList);
            }


        }

    }
}
