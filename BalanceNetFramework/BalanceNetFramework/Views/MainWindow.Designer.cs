﻿
namespace BalanceNetFramework
{
    partial class MainWindow
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainWindow));
            this.panelBalance = new System.Windows.Forms.Panel();
            this.lblPesoBalance = new System.Windows.Forms.Label();
            this.txtErrorMessage = new System.Windows.Forms.Label();
            this.panelProduct = new System.Windows.Forms.Panel();
            this.btnTare = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSend = new System.Windows.Forms.Button();
            this.boxCommand = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbProduct = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.btnConnect = new System.Windows.Forms.Button();
            this.cbBalance = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panelConnectionInformation = new System.Windows.Forms.Panel();
            this.lblModello = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.lblParser = new System.Windows.Forms.Label();
            this.lblWeightConvertion = new System.Windows.Forms.Label();
            this.lblCommand = new System.Windows.Forms.Label();
            this.lblHandShake = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.labelS = new System.Windows.Forms.Label();
            this.lblParity = new System.Windows.Forms.Label();
            this.lblStopBit = new System.Windows.Forms.Label();
            this.lblDataBits = new System.Windows.Forms.Label();
            this.lblBaudRate = new System.Windows.Forms.Label();
            this.lblPorto = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblP = new System.Windows.Forms.Label();
            this.btnDisconnect = new System.Windows.Forms.Button();
            this.btnMeasurement = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.detailProduct = new System.Windows.Forms.Label();
            this.lblAlerta = new System.Windows.Forms.Label();
            this.balanceGauge = new AGaugeApp.AGauge();
            this.panelBalance.SuspendLayout();
            this.panelProduct.SuspendLayout();
            this.panelConnectionInformation.SuspendLayout();
            this.panel1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelBalance
            // 
            this.panelBalance.Controls.Add(this.lblAlerta);
            this.panelBalance.Controls.Add(this.detailProduct);
            this.panelBalance.Controls.Add(this.lblPesoBalance);
            this.panelBalance.Controls.Add(this.balanceGauge);
            resources.ApplyResources(this.panelBalance, "panelBalance");
            this.panelBalance.Name = "panelBalance";
            // 
            // lblPesoBalance
            // 
            resources.ApplyResources(this.lblPesoBalance, "lblPesoBalance");
            this.lblPesoBalance.Name = "lblPesoBalance";
            // 
            // txtErrorMessage
            // 
            resources.ApplyResources(this.txtErrorMessage, "txtErrorMessage");
            this.txtErrorMessage.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.txtErrorMessage.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.txtErrorMessage.Name = "txtErrorMessage";
            // 
            // panelProduct
            // 
            this.panelProduct.Controls.Add(this.btnTare);
            this.panelProduct.Controls.Add(this.btnReset);
            this.panelProduct.Controls.Add(this.btnSend);
            this.panelProduct.Controls.Add(this.boxCommand);
            this.panelProduct.Controls.Add(this.label4);
            this.panelProduct.Controls.Add(this.cbProduct);
            this.panelProduct.Controls.Add(this.label3);
            resources.ApplyResources(this.panelProduct, "panelProduct");
            this.panelProduct.Name = "panelProduct";
            // 
            // btnTare
            // 
            resources.ApplyResources(this.btnTare, "btnTare");
            this.btnTare.Name = "btnTare";
            this.btnTare.UseVisualStyleBackColor = true;
            this.btnTare.Click += new System.EventHandler(this.btnTare_Click);
            // 
            // btnReset
            // 
            resources.ApplyResources(this.btnReset, "btnReset");
            this.btnReset.Name = "btnReset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSend
            // 
            resources.ApplyResources(this.btnSend, "btnSend");
            this.btnSend.Name = "btnSend";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // boxCommand
            // 
            resources.ApplyResources(this.boxCommand, "boxCommand");
            this.boxCommand.Name = "boxCommand";
            // 
            // label4
            // 
            resources.ApplyResources(this.label4, "label4");
            this.label4.Name = "label4";
            // 
            // cbProduct
            // 
            resources.ApplyResources(this.cbProduct, "cbProduct");
            this.cbProduct.FormattingEnabled = true;
            this.cbProduct.Name = "cbProduct";
            this.cbProduct.SelectedIndexChanged += new System.EventHandler(this.cbProduct_SelectedIndexChanged);
            // 
            // label3
            // 
            resources.ApplyResources(this.label3, "label3");
            this.label3.Name = "label3";
            // 
            // btnConnect
            // 
            resources.ApplyResources(this.btnConnect, "btnConnect");
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // cbBalance
            // 
            this.cbBalance.AllowDrop = true;
            this.cbBalance.DropDownHeight = 156;
            resources.ApplyResources(this.cbBalance, "cbBalance");
            this.cbBalance.Name = "cbBalance";
            this.cbBalance.SelectedIndexChanged += new System.EventHandler(this.cbBalance_SelectedIndexChanged);
            // 
            // label2
            // 
            resources.ApplyResources(this.label2, "label2");
            this.label2.Name = "label2";
            // 
            // panelConnectionInformation
            // 
            this.panelConnectionInformation.Controls.Add(this.lblModello);
            this.panelConnectionInformation.Controls.Add(this.label19);
            this.panelConnectionInformation.Controls.Add(this.label7);
            this.panelConnectionInformation.Controls.Add(this.label8);
            this.panelConnectionInformation.Controls.Add(this.lblParser);
            this.panelConnectionInformation.Controls.Add(this.lblWeightConvertion);
            this.panelConnectionInformation.Controls.Add(this.lblCommand);
            this.panelConnectionInformation.Controls.Add(this.lblHandShake);
            this.panelConnectionInformation.Controls.Add(this.label16);
            this.panelConnectionInformation.Controls.Add(this.label17);
            this.panelConnectionInformation.Controls.Add(this.label1);
            this.panelConnectionInformation.Controls.Add(this.label13);
            this.panelConnectionInformation.Controls.Add(this.label12);
            this.panelConnectionInformation.Controls.Add(this.labelS);
            this.panelConnectionInformation.Controls.Add(this.lblParity);
            this.panelConnectionInformation.Controls.Add(this.lblStopBit);
            this.panelConnectionInformation.Controls.Add(this.lblDataBits);
            this.panelConnectionInformation.Controls.Add(this.lblBaudRate);
            this.panelConnectionInformation.Controls.Add(this.lblPorto);
            this.panelConnectionInformation.Controls.Add(this.label5);
            this.panelConnectionInformation.Controls.Add(this.lblP);
            resources.ApplyResources(this.panelConnectionInformation, "panelConnectionInformation");
            this.panelConnectionInformation.Name = "panelConnectionInformation";
            // 
            // lblModello
            // 
            resources.ApplyResources(this.lblModello, "lblModello");
            this.lblModello.Name = "lblModello";
            // 
            // label19
            // 
            resources.ApplyResources(this.label19, "label19");
            this.label19.Name = "label19";
            // 
            // label7
            // 
            resources.ApplyResources(this.label7, "label7");
            this.label7.Name = "label7";
            // 
            // label8
            // 
            resources.ApplyResources(this.label8, "label8");
            this.label8.Name = "label8";
            // 
            // lblParser
            // 
            resources.ApplyResources(this.lblParser, "lblParser");
            this.lblParser.Name = "lblParser";
            // 
            // lblWeightConvertion
            // 
            resources.ApplyResources(this.lblWeightConvertion, "lblWeightConvertion");
            this.lblWeightConvertion.Name = "lblWeightConvertion";
            // 
            // lblCommand
            // 
            resources.ApplyResources(this.lblCommand, "lblCommand");
            this.lblCommand.Name = "lblCommand";
            // 
            // lblHandShake
            // 
            resources.ApplyResources(this.lblHandShake, "lblHandShake");
            this.lblHandShake.Name = "lblHandShake";
            // 
            // label16
            // 
            resources.ApplyResources(this.label16, "label16");
            this.label16.Name = "label16";
            // 
            // label17
            // 
            resources.ApplyResources(this.label17, "label17");
            this.label17.Name = "label17";
            // 
            // label1
            // 
            resources.ApplyResources(this.label1, "label1");
            this.label1.Name = "label1";
            // 
            // label13
            // 
            resources.ApplyResources(this.label13, "label13");
            this.label13.Name = "label13";
            // 
            // label12
            // 
            resources.ApplyResources(this.label12, "label12");
            this.label12.Name = "label12";
            // 
            // labelS
            // 
            resources.ApplyResources(this.labelS, "labelS");
            this.labelS.Name = "labelS";
            // 
            // lblParity
            // 
            resources.ApplyResources(this.lblParity, "lblParity");
            this.lblParity.Name = "lblParity";
            // 
            // lblStopBit
            // 
            resources.ApplyResources(this.lblStopBit, "lblStopBit");
            this.lblStopBit.Name = "lblStopBit";
            // 
            // lblDataBits
            // 
            resources.ApplyResources(this.lblDataBits, "lblDataBits");
            this.lblDataBits.Name = "lblDataBits";
            // 
            // lblBaudRate
            // 
            resources.ApplyResources(this.lblBaudRate, "lblBaudRate");
            this.lblBaudRate.Name = "lblBaudRate";
            // 
            // lblPorto
            // 
            resources.ApplyResources(this.lblPorto, "lblPorto");
            this.lblPorto.Name = "lblPorto";
            // 
            // label5
            // 
            resources.ApplyResources(this.label5, "label5");
            this.label5.Name = "label5";
            // 
            // lblP
            // 
            resources.ApplyResources(this.lblP, "lblP");
            this.lblP.Name = "lblP";
            // 
            // btnDisconnect
            // 
            resources.ApplyResources(this.btnDisconnect, "btnDisconnect");
            this.btnDisconnect.Name = "btnDisconnect";
            this.btnDisconnect.UseVisualStyleBackColor = true;
            this.btnDisconnect.Click += new System.EventHandler(this.btnDisconnect_Click);
            // 
            // btnMeasurement
            // 
            resources.ApplyResources(this.btnMeasurement, "btnMeasurement");
            this.btnMeasurement.Name = "btnMeasurement";
            this.btnMeasurement.UseVisualStyleBackColor = true;
            this.btnMeasurement.Click += new System.EventHandler(this.btnMeasurement_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.cbBalance);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.btnMeasurement);
            this.panel1.Controls.Add(this.btnConnect);
            this.panel1.Controls.Add(this.btnDisconnect);
            this.panel1.Controls.Add(this.txtErrorMessage);
            resources.ApplyResources(this.panel1, "panel1");
            this.panel1.Name = "panel1";
            // 
            // tableLayoutPanel1
            // 
            resources.ApplyResources(this.tableLayoutPanel1, "tableLayoutPanel1");
            this.tableLayoutPanel1.Controls.Add(this.panelProduct, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.panelBalance, 1, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            // 
            // detailProduct
            // 
            resources.ApplyResources(this.detailProduct, "detailProduct");
            this.detailProduct.Name = "detailProduct";
            // 
            // lblAlerta
            // 
            resources.ApplyResources(this.lblAlerta, "lblAlerta");
            this.lblAlerta.Name = "lblAlerta";
            // 
            // balanceGauge
            // 
            resources.ApplyResources(this.balanceGauge, "balanceGauge");
            this.balanceGauge.BaseArcColor = System.Drawing.Color.Gray;
            this.balanceGauge.BaseArcRadius = 150;
            this.balanceGauge.BaseArcStart = 135;
            this.balanceGauge.BaseArcSweep = 270;
            this.balanceGauge.BaseArcWidth = 2;
            this.balanceGauge.Cap_Idx = ((byte)(1));
            this.balanceGauge.CapColors = new System.Drawing.Color[] {
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black};
            this.balanceGauge.CapPosition = new System.Drawing.Point(10, 10);
            this.balanceGauge.CapsPosition = new System.Drawing.Point[] {
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10)};
            this.balanceGauge.CapsText = new string[] {
        "",
        "",
        "",
        "",
        ""};
            this.balanceGauge.CapText = "";
            this.balanceGauge.Center = new System.Drawing.Point(190, 190);
            this.balanceGauge.MaxValue = 400F;
            this.balanceGauge.MinValue = 0F;
            this.balanceGauge.Name = "balanceGauge";
            this.balanceGauge.NeedleColor1 = AGaugeApp.AGauge.NeedleColorEnum.Gray;
            this.balanceGauge.NeedleColor2 = System.Drawing.Color.DimGray;
            this.balanceGauge.NeedleRadius = 160;
            this.balanceGauge.NeedleType = 0;
            this.balanceGauge.NeedleWidth = 5;
            this.balanceGauge.Range_Idx = ((byte)(0));
            this.balanceGauge.RangeColor = System.Drawing.Color.LightGreen;
            this.balanceGauge.RangeEnabled = true;
            this.balanceGauge.RangeEndValue = 300F;
            this.balanceGauge.RangeInnerRadius = 130;
            this.balanceGauge.RangeOuterRadius = 150;
            this.balanceGauge.RangesColor = new System.Drawing.Color[] {
        System.Drawing.Color.LightGreen,
        System.Drawing.Color.Red,
        System.Drawing.SystemColors.Control,
        System.Drawing.SystemColors.Control,
        System.Drawing.SystemColors.Control};
            this.balanceGauge.RangesEnabled = new bool[] {
        true,
        true,
        false,
        false,
        false};
            this.balanceGauge.RangesEndValue = new float[] {
        300F,
        400F,
        0F,
        0F,
        0F};
            this.balanceGauge.RangesInnerRadius = new int[] {
        130,
        130,
        70,
        70,
        70};
            this.balanceGauge.RangesOuterRadius = new int[] {
        150,
        150,
        80,
        80,
        80};
            this.balanceGauge.RangesStartValue = new float[] {
        0F,
        300F,
        0F,
        0F,
        0F};
            this.balanceGauge.RangeStartValue = 0F;
            this.balanceGauge.ScaleLinesInterColor = System.Drawing.Color.Black;
            this.balanceGauge.ScaleLinesInterInnerRadius = 400;
            this.balanceGauge.ScaleLinesInterOuterRadius = 80;
            this.balanceGauge.ScaleLinesInterWidth = 100;
            this.balanceGauge.ScaleLinesMajorColor = System.Drawing.Color.Black;
            this.balanceGauge.ScaleLinesMajorInnerRadius = 150;
            this.balanceGauge.ScaleLinesMajorOuterRadius = 130;
            this.balanceGauge.ScaleLinesMajorStepValue = 50F;
            this.balanceGauge.ScaleLinesMajorWidth = 2;
            this.balanceGauge.ScaleLinesMinorColor = System.Drawing.Color.Black;
            this.balanceGauge.ScaleLinesMinorInnerRadius = 150;
            this.balanceGauge.ScaleLinesMinorNumOf = 10;
            this.balanceGauge.ScaleLinesMinorOuterRadius = 130;
            this.balanceGauge.ScaleLinesMinorWidth = 1;
            this.balanceGauge.ScaleNumbersColor = System.Drawing.Color.Black;
            this.balanceGauge.ScaleNumbersFormat = "";
            this.balanceGauge.ScaleNumbersRadius = 175;
            this.balanceGauge.ScaleNumbersRotation = 1;
            this.balanceGauge.ScaleNumbersStartScaleLine = 1;
            this.balanceGauge.ScaleNumbersStepScaleLines = 1;
            this.balanceGauge.Tag = "aGauge1";
            this.balanceGauge.Value = 0F;
            // 
            // MainWindow
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panelConnectionInformation);
            this.Name = "MainWindow";
            this.Load += new System.EventHandler(this.MainWindow_Load);
            this.panelBalance.ResumeLayout(false);
            this.panelProduct.ResumeLayout(false);
            this.panelProduct.PerformLayout();
            this.panelConnectionInformation.ResumeLayout(false);
            this.panelConnectionInformation.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label txtErrorMessage;
        private System.Windows.Forms.Panel panelProduct;
        private System.Windows.Forms.Button btnTare;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnSend;
        private System.Windows.Forms.TextBox boxCommand;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.ComboBox cbBalance;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panelConnectionInformation;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label lblParser;
        private System.Windows.Forms.Label lblWeightConvertion;
        private System.Windows.Forms.Label lblHandShake;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label labelS;
        private System.Windows.Forms.Label lblParity;
        private System.Windows.Forms.Label lblStopBit;
        private System.Windows.Forms.Label lblDataBits;
        private System.Windows.Forms.Label lblBaudRate;
        private System.Windows.Forms.Label lblPorto;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblP;
        public System.Windows.Forms.ComboBox cbProduct;
        public System.Windows.Forms.Label lblCommand;
        public System.Windows.Forms.Panel panelBalance;
        public System.Windows.Forms.Label lblModello;
        private System.Windows.Forms.Button btnDisconnect;
        public System.Windows.Forms.Label lblPesoBalance;
        private System.Windows.Forms.Button btnMeasurement;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        public AGaugeApp.AGauge balanceGauge;
        public System.Windows.Forms.Label detailProduct;
        public System.Windows.Forms.Label lblAlerta;
    }
}
