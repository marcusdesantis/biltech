
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
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dateEnd = new System.Windows.Forms.DateTimePicker();
            this.datesStart = new System.Windows.Forms.DateTimePicker();
            this.button2 = new System.Windows.Forms.Button();
            this.cbProductR = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.cbBalanceR = new System.Windows.Forms.ComboBox();
            this.checkFilterDate = new System.Windows.Forms.CheckBox();
            this.panelDate = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.panelDate.SuspendLayout();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "BalanceNetFramework.Reports.MisurazioneReport.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(207, 0);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(660, 523);
            this.reportViewer1.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.panelDate);
            this.panel1.Controls.Add(this.checkFilterDate);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.cbBalanceR);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.cbProductR);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.button2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(207, 523);
            this.panel1.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(12, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(170, 47);
            this.label3.TabIndex = 6;
            this.label3.Text = "Rapporto delle pesate";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(-4, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 18);
            this.label2.TabIndex = 5;
            this.label2.Text = "End date:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(-3, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 18);
            this.label1.TabIndex = 4;
            this.label1.Text = "Start date:";
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
            // datesStart
            // 
            this.datesStart.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.datesStart.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.datesStart.Location = new System.Drawing.Point(0, 33);
            this.datesStart.Name = "datesStart";
            this.datesStart.Size = new System.Drawing.Size(167, 26);
            this.datesStart.TabIndex = 2;
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.SystemColors.ControlLight;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(14, 345);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(167, 38);
            this.button2.TabIndex = 1;
            this.button2.Text = "Apply";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // cbProductR
            // 
            this.cbProductR.AllowDrop = true;
            this.cbProductR.DropDownHeight = 156;
            this.cbProductR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cbProductR.IntegralHeight = false;
            this.cbProductR.Location = new System.Drawing.Point(16, 147);
            this.cbProductR.Name = "cbProductR";
            this.cbProductR.Size = new System.Drawing.Size(168, 28);
            this.cbProductR.TabIndex = 13;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(13, 126);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(150, 18);
            this.label4.TabIndex = 14;
            this.label4.Text = "Select the product:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(12, 76);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(151, 18);
            this.label5.TabIndex = 16;
            this.label5.Text = "Select the balance:";
            // 
            // cbBalanceR
            // 
            this.cbBalanceR.AllowDrop = true;
            this.cbBalanceR.DropDownHeight = 156;
            this.cbBalanceR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.cbBalanceR.IntegralHeight = false;
            this.cbBalanceR.Location = new System.Drawing.Point(15, 97);
            this.cbBalanceR.Name = "cbBalanceR";
            this.cbBalanceR.Size = new System.Drawing.Size(168, 28);
            this.cbBalanceR.TabIndex = 15;
            // 
            // checkFilterDate
            // 
            this.checkFilterDate.AutoSize = true;
            this.checkFilterDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checkFilterDate.Location = new System.Drawing.Point(16, 181);
            this.checkFilterDate.Name = "checkFilterDate";
            this.checkFilterDate.Size = new System.Drawing.Size(124, 22);
            this.checkFilterDate.TabIndex = 17;
            this.checkFilterDate.Text = "Filter by date";
            this.checkFilterDate.UseVisualStyleBackColor = true;
            this.checkFilterDate.CheckedChanged += new System.EventHandler(this.checkBox1_CheckedChanged);
            // 
            // panelDate
            // 
            this.panelDate.Controls.Add(this.label1);
            this.panelDate.Controls.Add(this.datesStart);
            this.panelDate.Controls.Add(this.dateEnd);
            this.panelDate.Controls.Add(this.label2);
            this.panelDate.Location = new System.Drawing.Point(15, 209);
            this.panelDate.Name = "panelDate";
            this.panelDate.Size = new System.Drawing.Size(185, 130);
            this.panelDate.TabIndex = 18;
            this.panelDate.Visible = false;
            // 
            // ReportWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(867, 523);
            this.Controls.Add(this.reportViewer1);
            this.Controls.Add(this.panel1);
            this.Name = "ReportWindow";
            this.Text = "Report Pesare";
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
        private System.Windows.Forms.DateTimePicker datesStart;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbBalanceR;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbProductR;
        private System.Windows.Forms.Panel panelDate;
        private System.Windows.Forms.CheckBox checkFilterDate;
    }
}