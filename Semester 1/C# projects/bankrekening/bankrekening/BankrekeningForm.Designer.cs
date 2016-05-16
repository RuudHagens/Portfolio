namespace bankrekening
{
    partial class BankrekeningForm
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
            this.lblReknr1 = new System.Windows.Forms.Label();
            this.lblNaam1 = new System.Windows.Forms.Label();
            this.lblSaldo1 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnOpnemen1 = new System.Windows.Forms.Button();
            this.btnStorten1 = new System.Windows.Forms.Button();
            this.btnOverMakenRechts = new System.Windows.Forms.Button();
            this.btnOverMakenLinks = new System.Windows.Forms.Button();
            this.lblReknr2 = new System.Windows.Forms.Label();
            this.lblNaam2 = new System.Windows.Forms.Label();
            this.lblSaldo2 = new System.Windows.Forms.Label();
            this.btnStorten2 = new System.Windows.Forms.Button();
            this.btnOpnemen2 = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.nudInt1 = new System.Windows.Forms.NumericUpDown();
            this.nudDouble1 = new System.Windows.Forms.NumericUpDown();
            this.nudInt2 = new System.Windows.Forms.NumericUpDown();
            this.nudDouble2 = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.nudInt1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDouble1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudInt2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDouble2)).BeginInit();
            this.SuspendLayout();
            // 
            // lblReknr1
            // 
            this.lblReknr1.AutoSize = true;
            this.lblReknr1.Location = new System.Drawing.Point(12, 9);
            this.lblReknr1.Name = "lblReknr1";
            this.lblReknr1.Size = new System.Drawing.Size(120, 13);
            this.lblReknr1.TabIndex = 0;
            this.lblReknr1.Text = "Rekeningnummer: 2001";
            // 
            // lblNaam1
            // 
            this.lblNaam1.AutoSize = true;
            this.lblNaam1.Location = new System.Drawing.Point(12, 35);
            this.lblNaam1.Name = "lblNaam1";
            this.lblNaam1.Size = new System.Drawing.Size(120, 13);
            this.lblNaam1.TabIndex = 1;
            this.lblNaam1.Text = "Naam:  Duck. Dagobert";
            // 
            // lblSaldo1
            // 
            this.lblSaldo1.AutoSize = true;
            this.lblSaldo1.Location = new System.Drawing.Point(12, 62);
            this.lblSaldo1.Name = "lblSaldo1";
            this.lblSaldo1.Size = new System.Drawing.Size(73, 13);
            this.lblSaldo1.TabIndex = 2;
            this.lblSaldo1.Text = "Saldo: € 1000";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(83, 222);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(10, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = ",";
            // 
            // btnOpnemen1
            // 
            this.btnOpnemen1.Location = new System.Drawing.Point(133, 212);
            this.btnOpnemen1.Name = "btnOpnemen1";
            this.btnOpnemen1.Size = new System.Drawing.Size(75, 23);
            this.btnOpnemen1.TabIndex = 6;
            this.btnOpnemen1.Text = "Opnemen";
            this.btnOpnemen1.UseVisualStyleBackColor = true;
            this.btnOpnemen1.Click += new System.EventHandler(this.btnOpnemen1_Click);
            // 
            // btnStorten1
            // 
            this.btnStorten1.Location = new System.Drawing.Point(133, 241);
            this.btnStorten1.Name = "btnStorten1";
            this.btnStorten1.Size = new System.Drawing.Size(75, 23);
            this.btnStorten1.TabIndex = 7;
            this.btnStorten1.Text = "Storten";
            this.btnStorten1.UseVisualStyleBackColor = true;
            this.btnStorten1.Click += new System.EventHandler(this.btnStorten1_Click);
            // 
            // btnOverMakenRechts
            // 
            this.btnOverMakenRechts.Location = new System.Drawing.Point(242, 112);
            this.btnOverMakenRechts.Name = "btnOverMakenRechts";
            this.btnOverMakenRechts.Size = new System.Drawing.Size(75, 23);
            this.btnOverMakenRechts.TabIndex = 8;
            this.btnOverMakenRechts.Text = ">>";
            this.btnOverMakenRechts.UseVisualStyleBackColor = true;
            this.btnOverMakenRechts.Click += new System.EventHandler(this.btnOverMakenRechts_Click);
            // 
            // btnOverMakenLinks
            // 
            this.btnOverMakenLinks.Location = new System.Drawing.Point(242, 141);
            this.btnOverMakenLinks.Name = "btnOverMakenLinks";
            this.btnOverMakenLinks.Size = new System.Drawing.Size(75, 23);
            this.btnOverMakenLinks.TabIndex = 9;
            this.btnOverMakenLinks.Text = "<<";
            this.btnOverMakenLinks.UseVisualStyleBackColor = true;
            this.btnOverMakenLinks.Click += new System.EventHandler(this.btnOverMakenLinks_Click);
            // 
            // lblReknr2
            // 
            this.lblReknr2.AutoSize = true;
            this.lblReknr2.Location = new System.Drawing.Point(353, 9);
            this.lblReknr2.Name = "lblReknr2";
            this.lblReknr2.Size = new System.Drawing.Size(120, 13);
            this.lblReknr2.TabIndex = 10;
            this.lblReknr2.Text = "Rekeningnummer: 2002";
            // 
            // lblNaam2
            // 
            this.lblNaam2.AutoSize = true;
            this.lblNaam2.Location = new System.Drawing.Point(353, 35);
            this.lblNaam2.Name = "lblNaam2";
            this.lblNaam2.Size = new System.Drawing.Size(89, 13);
            this.lblNaam2.TabIndex = 11;
            this.lblNaam2.Text = "Naam: Gans. Gijs";
            // 
            // lblSaldo2
            // 
            this.lblSaldo2.AutoSize = true;
            this.lblSaldo2.Location = new System.Drawing.Point(353, 62);
            this.lblSaldo2.Name = "lblSaldo2";
            this.lblSaldo2.Size = new System.Drawing.Size(73, 13);
            this.lblSaldo2.TabIndex = 12;
            this.lblSaldo2.Text = "Saldo: € 1000";
            // 
            // btnStorten2
            // 
            this.btnStorten2.Location = new System.Drawing.Point(474, 241);
            this.btnStorten2.Name = "btnStorten2";
            this.btnStorten2.Size = new System.Drawing.Size(75, 23);
            this.btnStorten2.TabIndex = 17;
            this.btnStorten2.Text = "Storten";
            this.btnStorten2.UseVisualStyleBackColor = true;
            this.btnStorten2.Click += new System.EventHandler(this.btnStorten2_Click);
            // 
            // btnOpnemen2
            // 
            this.btnOpnemen2.Location = new System.Drawing.Point(474, 212);
            this.btnOpnemen2.Name = "btnOpnemen2";
            this.btnOpnemen2.Size = new System.Drawing.Size(75, 23);
            this.btnOpnemen2.TabIndex = 16;
            this.btnOpnemen2.Text = "Opnemen";
            this.btnOpnemen2.UseVisualStyleBackColor = true;
            this.btnOpnemen2.Click += new System.EventHandler(this.btnOpnemen2_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(424, 222);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(10, 13);
            this.label8.TabIndex = 14;
            this.label8.Text = ",";
            // 
            // nudInt1
            // 
            this.nudInt1.Location = new System.Drawing.Point(12, 215);
            this.nudInt1.Maximum = new decimal(new int[] {
            -559939585,
            902409669,
            54,
            0});
            this.nudInt1.Name = "nudInt1";
            this.nudInt1.Size = new System.Drawing.Size(70, 20);
            this.nudInt1.TabIndex = 18;
            this.nudInt1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // nudDouble1
            // 
            this.nudDouble1.Location = new System.Drawing.Point(90, 215);
            this.nudDouble1.Maximum = new decimal(new int[] {
            99,
            0,
            0,
            0});
            this.nudDouble1.Name = "nudDouble1";
            this.nudDouble1.Size = new System.Drawing.Size(42, 20);
            this.nudDouble1.TabIndex = 19;
            this.nudDouble1.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // nudInt2
            // 
            this.nudInt2.Location = new System.Drawing.Point(356, 215);
            this.nudInt2.Maximum = new decimal(new int[] {
            -402653185,
            -1613725636,
            54210108,
            0});
            this.nudInt2.Name = "nudInt2";
            this.nudInt2.Size = new System.Drawing.Size(70, 20);
            this.nudInt2.TabIndex = 20;
            this.nudInt2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // nudDouble2
            // 
            this.nudDouble2.Location = new System.Drawing.Point(432, 215);
            this.nudDouble2.Maximum = new decimal(new int[] {
            99,
            0,
            0,
            0});
            this.nudDouble2.Name = "nudDouble2";
            this.nudDouble2.Size = new System.Drawing.Size(41, 20);
            this.nudDouble2.TabIndex = 21;
            this.nudDouble2.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // BankrekeningForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(559, 270);
            this.Controls.Add(this.nudDouble2);
            this.Controls.Add(this.nudInt2);
            this.Controls.Add(this.nudDouble1);
            this.Controls.Add(this.nudInt1);
            this.Controls.Add(this.btnStorten2);
            this.Controls.Add(this.btnOpnemen2);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.lblSaldo2);
            this.Controls.Add(this.lblNaam2);
            this.Controls.Add(this.lblReknr2);
            this.Controls.Add(this.btnOverMakenLinks);
            this.Controls.Add(this.btnOverMakenRechts);
            this.Controls.Add(this.btnStorten1);
            this.Controls.Add(this.btnOpnemen1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.lblSaldo1);
            this.Controls.Add(this.lblNaam1);
            this.Controls.Add(this.lblReknr1);
            this.Name = "BankrekeningForm";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.nudInt1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDouble1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudInt2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudDouble2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblReknr1;
        private System.Windows.Forms.Label lblNaam1;
        private System.Windows.Forms.Label lblSaldo1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnOpnemen1;
        private System.Windows.Forms.Button btnStorten1;
        private System.Windows.Forms.Button btnOverMakenRechts;
        private System.Windows.Forms.Button btnOverMakenLinks;
        private System.Windows.Forms.Label lblReknr2;
        private System.Windows.Forms.Label lblNaam2;
        private System.Windows.Forms.Label lblSaldo2;
        private System.Windows.Forms.Button btnStorten2;
        private System.Windows.Forms.Button btnOpnemen2;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.NumericUpDown nudInt1;
        private System.Windows.Forms.NumericUpDown nudDouble1;
        private System.Windows.Forms.NumericUpDown nudInt2;
        private System.Windows.Forms.NumericUpDown nudDouble2;
    }
}

