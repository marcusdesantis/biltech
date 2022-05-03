
namespace BalanceNetFramework
{
    partial class ReportWindow
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panelDate = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.dateStart = new System.Windows.Forms.DateTimePicker();
            this.dateEnd = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.checkFilterDate = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cbBalanceReport = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbProductReport = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnFilterWeight = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.panelDate.SuspendLayout();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "BalanceNetFramework.Reports.MeasureReport.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(216, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(930, 737);
            this.reportViewer1.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.panelDate);
            this.panel1.Controls.Add(this.checkFilterDate);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.cbBalanceReport);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.cbProductReport);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.btnFilterWeight);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(216, 737);
            this.panel1.TabIndex = 1;
            // 
            // panelDate
            // 
            this.panelDate.Controls.Add(this.label1);
            this.panelDate.Controls.Add(this.dateStart);
            this.panelDate.Controls.Add(this.dateEnd);
            this.panelDate.Controls.Add(this.label2);
            this.panelDate.Location = new System.Drawing.Point(14, 198);
            this.panelDate.Name = "panelDate";
            this.panelDate.Size = new System.Drawing.Size(185, 130);
            this.panelDate.TabIndex = 18;
            this.panelDate.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(-3, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(93, 18);
            this.label1.TabIndex = 4;
            this.label1.Text = "Data inizio:";
            // 
            // dateStart
            // 
            this.dateStart.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateStart.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dateStart.Location = new System.Drawing.Point(0, 33);
            this.dateStart.Name = "dateStart";
            this.dateStart.Size = new System.Drawing.Size(167, 26);
            this.dateStart.TabIndex = 2;
            // 
            // dateEnd
            // 
            this.dateEnd.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateEnd.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dateEnd.Location = new System.Drawing.Point(0, 85);
            this.dateEnd.Name = "dateEnd";
            this.dateEnd.Size = new System.Drawing.Size(167, 26);
            this.dateEnd.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(-4, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(80, 18);
            this.label2.TabIndex = 5;
            this.label2.Text = "Data fine:";
            // 
            // checkFilterDate
            // 
            this.checkFilterDate.AutoSize = true;
            this.checkFilterDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checkFilterDate.Location = new System.Drawing.Point(16, 181);
            this.checkFilterDate.Name = "checkFilterDate";
            this.checkFilterDate.Size = new System.Drawing.Size(186, 22);
            this.checkFilterDate.TabIndex = 17;
            this.checkFilterDate.Text = "Per mezzo della data";
            this.checkFilterDate.UseVisualStyleBackColor = true;
            this.checkFilterDate.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(12, 76);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(197, 18);
            this.label5.TabIndex = 16;
            this.label5.Text = "Per mezzo della bilancia:";
            // 
            // cbBalanceReport
            // 
            this.cbBalanceReport.AllowDrop = true;
            this.cbBalanceReport.DropDownHeight = 156;
            this.cbBalanceReport.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cbBalanceReport.IntegralHeight = false;
            this.cbBalanceReport.Location = new System.Drawing.Point(15, 97);
            this.cbBalanceReport.Name = "cbBalanceReport";
            this.cbBalanceReport.Size = new System.Drawing.Size(168, 28);
            this.cbBalanceReport.TabIndex = 15;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(13, 126);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(191, 18);
            this.label4.TabIndex = 14;
            this.label4.Text = "Per mezzo del prodotto:";
            // 
            // cbProductReport
            // 
            this.cbProductReport.AllowDrop = true;
            this.cbProductReport.DropDownHeight = 156;
            this.cbProductReport.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cbProductReport.IntegralHeight = false;
            this.cbProductReport.Location = new System.Drawing.Point(16, 147);
            this.cbProductReport.Name = "cbProductReport";
            this.cbProductReport.Size = new System.Drawing.Size(168, 28);
            this.cbProductReport.TabIndex = 13;
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(12, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(170, 47);
            this.label3.TabIndex = 6;
            this.label3.Text = "Riepilogo del peso";
            // 
            // btnFilterWeight
            // 
            this.btnFilterWeight.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnFilterWeight.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFilterWeight.Location = new System.Drawing.Point(13, 334);
            this.btnFilterWeight.Name = "btnFilterWeight";
            this.btnFilterWeight.Size = new System.Drawing.Size(167, 38);
            this.btnFilterWeight.TabIndex = 1;
            this.btnFilterWeight.Text = "Applica";
            this.btnFilterWeight.UseVisualStyleBackColor = false;
            this.btnFilterWeight.Click += new System.EventHandler(this.button2_Click);
            // 
            // ReportWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1146, 737);
            this.Controls.Add(this.reportViewer1);
            this.Controls.Add(this.panel1);
            this.Name = "ReportWindow";
            this.Text = "Riepilogo del peso";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panelDate.ResumeLayout(false);
            this.panelDate.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dateEnd;
        private System.Windows.Forms.DateTimePicker dateStart;
        private System.Windows.Forms.Button btnFilterWeight;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbBalanceReport;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbProductReport;
        private System.Windows.Forms.Panel panelDate;
        private System.Windows.Forms.CheckBox checkFilterDate;
    }
}