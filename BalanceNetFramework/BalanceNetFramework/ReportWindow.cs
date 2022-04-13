using BalanceNetFramework.Data;
using BalanceNetFramework.Models;
using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BalanceNetFramework
{
    public partial class ReportWindow : Form
    {
        public ReportWindow()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            //GetReport(DateTime.Now,DateTime.Now);
        }

        private void GetReport(DateTime startDate, DateTime endDate)
        {
            ReportModel reportModel = new ReportModel();
            reportModel.CreateReport(startDate, endDate);

            //reportViewer1.LocalReport.DataSources.Add(new reportModel);
            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("misurazioneReport", reportModel.ListMisurazione));
            reportViewer1.LocalReport.DataSources.Add(new ReportDataSource("misurazioneList", reportModel.ListMisurazione));

            //misurazioneReport.DataSource = reportModel;
            //MisurazioneListBindingSource.DataSource = reportModel.ListMisurazione;
            this.reportViewer1.RefreshReport();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.reportViewer1.LocalReport.DataSources.Clear();
            var fromDate = datesStart.Value;
            var toDate = dateEnd.Value;
            if (fromDate > toDate)
            {
                MessageBox.Show("The start date cannot be later than the end date.");
            }
            else
            {
               GetReport(fromDate, toDate);
            }


        }
    }
}
