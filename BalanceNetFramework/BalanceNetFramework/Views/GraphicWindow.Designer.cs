
namespace BalanceNetFramework
{
    partial class GraphicWindow
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.graphicMisurazione = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.btnReport = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.graphicMisurazione)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1146, 44);
            this.panel1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(466, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(235, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Le ultime cinque misurazioni";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.tableLayoutPanel1);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 44);
            this.panel2.Name = "panel2";
            this.panel2.Padding = new System.Windows.Forms.Padding(10);
            this.panel2.Size = new System.Drawing.Size(1146, 693);
            this.panel2.TabIndex = 1;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.Controls.Add(this.panel3, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.btnReport, 1, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(10, 10);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 1;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1126, 673);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.graphicMisurazione);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(3, 3);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(894, 667);
            this.panel3.TabIndex = 0;
            // 
            // graphicMisurazione
            // 
            chartArea1.Name = "ChartArea1";
            this.graphicMisurazione.ChartAreas.Add(chartArea1);
            this.graphicMisurazione.Dock = System.Windows.Forms.DockStyle.Fill;
            legend1.Name = "Legend1";
            this.graphicMisurazione.Legends.Add(legend1);
            this.graphicMisurazione.Location = new System.Drawing.Point(0, 0);
            this.graphicMisurazione.Margin = new System.Windows.Forms.Padding(0);
            this.graphicMisurazione.Name = "graphicMisurazione";
            this.graphicMisurazione.Padding = new System.Windows.Forms.Padding(3);
            series1.ChartArea = "ChartArea1";
            series1.Legend = "Legend1";
            series1.Name = "Peso";
            this.graphicMisurazione.Series.Add(series1);
            this.graphicMisurazione.Size = new System.Drawing.Size(894, 667);
            this.graphicMisurazione.TabIndex = 0;
            this.graphicMisurazione.Text = "chart1";
            // 
            // btnReport
            // 
            this.btnReport.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnReport.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnReport.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.btnReport.Location = new System.Drawing.Point(903, 12);
            this.btnReport.Margin = new System.Windows.Forms.Padding(3, 12, 3, 3);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(220, 30);
            this.btnReport.TabIndex = 20;
            this.btnReport.Text = "Segnala il peso";
            this.btnReport.UseVisualStyleBackColor = true;
            this.btnReport.Click += new System.EventHandler(this.btnMeasurement_Click);
            // 
            // GraphicWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.ClientSize = new System.Drawing.Size(1146, 737);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "GraphicWindow";
            this.Text = "Misurazione";
            this.Load += new System.EventHandler(this.GraphicWindow_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.graphicMisurazione)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.DataVisualization.Charting.Chart graphicMisurazione;
        private System.Windows.Forms.Button btnReport;
    }
}