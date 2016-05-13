namespace Trekking
{
    partial class TrekkingForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TrekkingForm));
            this.pbGetal = new System.Windows.Forms.PictureBox();
            this.lbNummers = new System.Windows.Forms.ListBox();
            this.btnStop = new System.Windows.Forms.Button();
            this.btnLaatZien = new System.Windows.Forms.Button();
            this.btnSorteer = new System.Windows.Forms.Button();
            this.btnSerie = new System.Windows.Forms.Button();
            this.btnTrek = new System.Windows.Forms.Button();
            this.btnStart = new System.Windows.Forms.Button();
            this.tbAantalGewenst = new System.Windows.Forms.TextBox();
            this.tbMaxwaarde = new System.Windows.Forms.TextBox();
            this.lblMaxwaarde = new System.Windows.Forms.Label();
            this.lblAantalGewenst = new System.Windows.Forms.Label();
            this.animationImageList = new System.Windows.Forms.ImageList(this.components);
            this.animationTimer = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pbGetal)).BeginInit();
            this.SuspendLayout();
            // 
            // pbGetal
            // 
            this.pbGetal.Image = ((System.Drawing.Image)(resources.GetObject("pbGetal.Image")));
            this.pbGetal.Location = new System.Drawing.Point(12, 12);
            this.pbGetal.Name = "pbGetal";
            this.pbGetal.Size = new System.Drawing.Size(256, 256);
            this.pbGetal.TabIndex = 0;
            this.pbGetal.TabStop = false;
            // 
            // lbNummers
            // 
            this.lbNummers.FormattingEnabled = true;
            this.lbNummers.Location = new System.Drawing.Point(283, 12);
            this.lbNummers.Name = "lbNummers";
            this.lbNummers.Size = new System.Drawing.Size(390, 82);
            this.lbNummers.TabIndex = 1;
            // 
            // btnStop
            // 
            this.btnStop.Location = new System.Drawing.Point(598, 105);
            this.btnStop.Name = "btnStop";
            this.btnStop.Size = new System.Drawing.Size(75, 23);
            this.btnStop.TabIndex = 2;
            this.btnStop.Text = "Stop";
            this.btnStop.UseVisualStyleBackColor = true;
            this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
            // 
            // btnLaatZien
            // 
            this.btnLaatZien.Location = new System.Drawing.Point(598, 134);
            this.btnLaatZien.Name = "btnLaatZien";
            this.btnLaatZien.Size = new System.Drawing.Size(75, 23);
            this.btnLaatZien.TabIndex = 3;
            this.btnLaatZien.Text = "Laat zien";
            this.btnLaatZien.UseVisualStyleBackColor = true;
            this.btnLaatZien.Click += new System.EventHandler(this.btnLaatZien_Click);
            // 
            // btnSorteer
            // 
            this.btnSorteer.Location = new System.Drawing.Point(598, 163);
            this.btnSorteer.Name = "btnSorteer";
            this.btnSorteer.Size = new System.Drawing.Size(75, 23);
            this.btnSorteer.TabIndex = 4;
            this.btnSorteer.Text = "Sorteer";
            this.btnSorteer.UseVisualStyleBackColor = true;
            this.btnSorteer.Click += new System.EventHandler(this.btnSorteer_Click);
            // 
            // btnSerie
            // 
            this.btnSerie.Location = new System.Drawing.Point(598, 192);
            this.btnSerie.Name = "btnSerie";
            this.btnSerie.Size = new System.Drawing.Size(75, 23);
            this.btnSerie.TabIndex = 5;
            this.btnSerie.Text = "Serie";
            this.btnSerie.UseVisualStyleBackColor = true;
            this.btnSerie.Click += new System.EventHandler(this.btnSerie_Click);
            // 
            // btnTrek
            // 
            this.btnTrek.Location = new System.Drawing.Point(598, 221);
            this.btnTrek.Name = "btnTrek";
            this.btnTrek.Size = new System.Drawing.Size(75, 23);
            this.btnTrek.TabIndex = 6;
            this.btnTrek.Text = "Trek";
            this.btnTrek.UseVisualStyleBackColor = true;
            this.btnTrek.Click += new System.EventHandler(this.btnTrek_Click);
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(598, 250);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(75, 23);
            this.btnStart.TabIndex = 7;
            this.btnStart.Text = "Start";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // tbAantalGewenst
            // 
            this.tbAantalGewenst.Location = new System.Drawing.Point(514, 250);
            this.tbAantalGewenst.MaxLength = 2;
            this.tbAantalGewenst.Name = "tbAantalGewenst";
            this.tbAantalGewenst.Size = new System.Drawing.Size(52, 20);
            this.tbAantalGewenst.TabIndex = 8;
            // 
            // tbMaxwaarde
            // 
            this.tbMaxwaarde.Location = new System.Drawing.Point(514, 224);
            this.tbMaxwaarde.MaxLength = 2;
            this.tbMaxwaarde.Name = "tbMaxwaarde";
            this.tbMaxwaarde.Size = new System.Drawing.Size(52, 20);
            this.tbMaxwaarde.TabIndex = 9;
            // 
            // lblMaxwaarde
            // 
            this.lblMaxwaarde.AutoSize = true;
            this.lblMaxwaarde.Location = new System.Drawing.Point(443, 227);
            this.lblMaxwaarde.Name = "lblMaxwaarde";
            this.lblMaxwaarde.Size = new System.Drawing.Size(65, 13);
            this.lblMaxwaarde.TabIndex = 10;
            this.lblMaxwaarde.Text = "Maxwaarde:";
            // 
            // lblAantalGewenst
            // 
            this.lblAantalGewenst.AutoSize = true;
            this.lblAantalGewenst.Location = new System.Drawing.Point(423, 253);
            this.lblAantalGewenst.Name = "lblAantalGewenst";
            this.lblAantalGewenst.Size = new System.Drawing.Size(85, 13);
            this.lblAantalGewenst.TabIndex = 11;
            this.lblAantalGewenst.Text = "Aantal Gewenst:";
            // 
            // animationImageList
            // 
            this.animationImageList.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("animationImageList.ImageStream")));
            this.animationImageList.TransparentColor = System.Drawing.Color.Transparent;
            this.animationImageList.Images.SetKeyName(0, "P00.png");
            this.animationImageList.Images.SetKeyName(1, "P01.png");
            this.animationImageList.Images.SetKeyName(2, "P02.png");
            this.animationImageList.Images.SetKeyName(3, "P03.png");
            this.animationImageList.Images.SetKeyName(4, "P04.png");
            this.animationImageList.Images.SetKeyName(5, "P05.png");
            this.animationImageList.Images.SetKeyName(6, "P06.png");
            this.animationImageList.Images.SetKeyName(7, "P07.png");
            this.animationImageList.Images.SetKeyName(8, "P08.png");
            this.animationImageList.Images.SetKeyName(9, "P09.png");
            this.animationImageList.Images.SetKeyName(10, "P10.png");
            this.animationImageList.Images.SetKeyName(11, "P11.png");
            this.animationImageList.Images.SetKeyName(12, "P12.png");
            this.animationImageList.Images.SetKeyName(13, "P13.png");
            this.animationImageList.Images.SetKeyName(14, "P14.png");
            this.animationImageList.Images.SetKeyName(15, "P15.png");
            this.animationImageList.Images.SetKeyName(16, "P16.png");
            this.animationImageList.Images.SetKeyName(17, "P17.png");
            this.animationImageList.Images.SetKeyName(18, "P18.png");
            this.animationImageList.Images.SetKeyName(19, "P19.png");
            this.animationImageList.Images.SetKeyName(20, "P20.png");
            this.animationImageList.Images.SetKeyName(21, "P21.png");
            this.animationImageList.Images.SetKeyName(22, "P22.png");
            this.animationImageList.Images.SetKeyName(23, "P23.png");
            this.animationImageList.Images.SetKeyName(24, "P24.png");
            this.animationImageList.Images.SetKeyName(25, "P25.png");
            this.animationImageList.Images.SetKeyName(26, "P26.png");
            this.animationImageList.Images.SetKeyName(27, "P27.png");
            this.animationImageList.Images.SetKeyName(28, "P28.png");
            this.animationImageList.Images.SetKeyName(29, "P29.png");
            this.animationImageList.Images.SetKeyName(30, "P30.png");
            this.animationImageList.Images.SetKeyName(31, "P31.png");
            this.animationImageList.Images.SetKeyName(32, "P32.png");
            this.animationImageList.Images.SetKeyName(33, "P33.png");
            this.animationImageList.Images.SetKeyName(34, "P34.png");
            this.animationImageList.Images.SetKeyName(35, "P35.png");
            this.animationImageList.Images.SetKeyName(36, "P36.png");
            this.animationImageList.Images.SetKeyName(37, "P37.png");
            this.animationImageList.Images.SetKeyName(38, "P38.png");
            this.animationImageList.Images.SetKeyName(39, "P39.png");
            this.animationImageList.Images.SetKeyName(40, "P40.png");
            this.animationImageList.Images.SetKeyName(41, "P41.png");
            this.animationImageList.Images.SetKeyName(42, "P42.png");
            this.animationImageList.Images.SetKeyName(43, "P43.png");
            this.animationImageList.Images.SetKeyName(44, "P44.png");
            this.animationImageList.Images.SetKeyName(45, "P45.png");
            this.animationImageList.Images.SetKeyName(46, "P46.png");
            this.animationImageList.Images.SetKeyName(47, "P47.png");
            this.animationImageList.Images.SetKeyName(48, "P48.png");
            this.animationImageList.Images.SetKeyName(49, "P49.png");
            this.animationImageList.Images.SetKeyName(50, "P50.png");
            this.animationImageList.Images.SetKeyName(51, "P51.png");
            this.animationImageList.Images.SetKeyName(52, "P52.png");
            this.animationImageList.Images.SetKeyName(53, "P53.png");
            this.animationImageList.Images.SetKeyName(54, "P54.png");
            this.animationImageList.Images.SetKeyName(55, "P55.png");
            this.animationImageList.Images.SetKeyName(56, "P56.png");
            this.animationImageList.Images.SetKeyName(57, "P57.png");
            this.animationImageList.Images.SetKeyName(58, "P58.png");
            this.animationImageList.Images.SetKeyName(59, "P59.png");
            this.animationImageList.Images.SetKeyName(60, "P60.png");
            this.animationImageList.Images.SetKeyName(61, "P61.png");
            this.animationImageList.Images.SetKeyName(62, "P62.png");
            this.animationImageList.Images.SetKeyName(63, "P63.png");
            this.animationImageList.Images.SetKeyName(64, "P64.png");
            this.animationImageList.Images.SetKeyName(65, "P65.png");
            this.animationImageList.Images.SetKeyName(66, "P66.png");
            this.animationImageList.Images.SetKeyName(67, "P67.png");
            this.animationImageList.Images.SetKeyName(68, "P68.png");
            this.animationImageList.Images.SetKeyName(69, "P69.png");
            this.animationImageList.Images.SetKeyName(70, "P70.png");
            this.animationImageList.Images.SetKeyName(71, "P71.png");
            this.animationImageList.Images.SetKeyName(72, "P72.png");
            this.animationImageList.Images.SetKeyName(73, "P73.png");
            this.animationImageList.Images.SetKeyName(74, "P74.png");
            this.animationImageList.Images.SetKeyName(75, "P75.png");
            this.animationImageList.Images.SetKeyName(76, "P76.png");
            this.animationImageList.Images.SetKeyName(77, "P77.png");
            this.animationImageList.Images.SetKeyName(78, "P78.png");
            this.animationImageList.Images.SetKeyName(79, "P79.png");
            this.animationImageList.Images.SetKeyName(80, "P80.png");
            this.animationImageList.Images.SetKeyName(81, "P81.png");
            this.animationImageList.Images.SetKeyName(82, "P82.png");
            this.animationImageList.Images.SetKeyName(83, "P83.png");
            this.animationImageList.Images.SetKeyName(84, "P84.png");
            this.animationImageList.Images.SetKeyName(85, "P85.png");
            this.animationImageList.Images.SetKeyName(86, "P86.png");
            this.animationImageList.Images.SetKeyName(87, "P87.png");
            this.animationImageList.Images.SetKeyName(88, "P88.png");
            this.animationImageList.Images.SetKeyName(89, "P89.png");
            this.animationImageList.Images.SetKeyName(90, "P90.png");
            this.animationImageList.Images.SetKeyName(91, "P91.png");
            this.animationImageList.Images.SetKeyName(92, "P92.png");
            this.animationImageList.Images.SetKeyName(93, "P93.png");
            this.animationImageList.Images.SetKeyName(94, "P94.png");
            this.animationImageList.Images.SetKeyName(95, "P95.png");
            this.animationImageList.Images.SetKeyName(96, "P96.png");
            this.animationImageList.Images.SetKeyName(97, "P97.png");
            this.animationImageList.Images.SetKeyName(98, "P98.png");
            this.animationImageList.Images.SetKeyName(99, "P99.png");
            this.animationImageList.Images.SetKeyName(100, "PXX.png");
            // 
            // animationTimer
            // 
            this.animationTimer.Interval = 1500;
            this.animationTimer.Tick += new System.EventHandler(this.animationTimer_Tick);
            // 
            // TrekkingForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(685, 282);
            this.Controls.Add(this.lblAantalGewenst);
            this.Controls.Add(this.lblMaxwaarde);
            this.Controls.Add(this.tbMaxwaarde);
            this.Controls.Add(this.tbAantalGewenst);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.btnTrek);
            this.Controls.Add(this.btnSerie);
            this.Controls.Add(this.btnSorteer);
            this.Controls.Add(this.btnLaatZien);
            this.Controls.Add(this.btnStop);
            this.Controls.Add(this.lbNummers);
            this.Controls.Add(this.pbGetal);
            this.Name = "TrekkingForm";
            this.Text = "Trekking loterij";
            ((System.ComponentModel.ISupportInitialize)(this.pbGetal)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbGetal;
        private System.Windows.Forms.ListBox lbNummers;
        private System.Windows.Forms.Button btnStop;
        private System.Windows.Forms.Button btnLaatZien;
        private System.Windows.Forms.Button btnSorteer;
        private System.Windows.Forms.Button btnSerie;
        private System.Windows.Forms.Button btnTrek;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.TextBox tbAantalGewenst;
        private System.Windows.Forms.TextBox tbMaxwaarde;
        private System.Windows.Forms.Label lblMaxwaarde;
        private System.Windows.Forms.Label lblAantalGewenst;
        private System.Windows.Forms.ImageList animationImageList;
        private System.Windows.Forms.Timer animationTimer;
    }
}

