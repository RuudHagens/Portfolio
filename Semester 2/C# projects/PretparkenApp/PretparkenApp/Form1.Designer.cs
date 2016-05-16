namespace PretparkenApp
{
    partial class PretparkenApp
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
            this.cbPretparken = new System.Windows.Forms.ComboBox();
            this.lblPretpark = new System.Windows.Forms.Label();
            this.gbPretpark = new System.Windows.Forms.GroupBox();
            this.cbAttracties = new System.Windows.Forms.ComboBox();
            this.tbToegangsprijs = new System.Windows.Forms.TextBox();
            this.lblAttracties = new System.Windows.Forms.Label();
            this.lblToegangsprijs = new System.Windows.Forms.Label();
            this.GbAtractie = new System.Windows.Forms.GroupBox();
            this.lblBouwjaar = new System.Windows.Forms.Label();
            this.lblType = new System.Windows.Forms.Label();
            this.lblMinimumLengte = new System.Windows.Forms.Label();
            this.btnSim = new System.Windows.Forms.Button();
            this.lblKlantenPerUur = new System.Windows.Forms.Label();
            this.lblTotaalWinst = new System.Windows.Forms.Label();
            this.gbPretpark.SuspendLayout();
            this.GbAtractie.SuspendLayout();
            this.SuspendLayout();
            // 
            // cbPretparken
            // 
            this.cbPretparken.FormattingEnabled = true;
            this.cbPretparken.Location = new System.Drawing.Point(91, 6);
            this.cbPretparken.Name = "cbPretparken";
            this.cbPretparken.Size = new System.Drawing.Size(121, 21);
            this.cbPretparken.TabIndex = 0;
            this.cbPretparken.SelectedIndexChanged += new System.EventHandler(this.cbPretparken_SelectedIndexChanged);
            // 
            // lblPretpark
            // 
            this.lblPretpark.AutoSize = true;
            this.lblPretpark.Location = new System.Drawing.Point(12, 9);
            this.lblPretpark.Name = "lblPretpark";
            this.lblPretpark.Size = new System.Drawing.Size(73, 13);
            this.lblPretpark.TabIndex = 1;
            this.lblPretpark.Text = "Kies Pretpark:";
            // 
            // gbPretpark
            // 
            this.gbPretpark.Controls.Add(this.lblTotaalWinst);
            this.gbPretpark.Controls.Add(this.lblKlantenPerUur);
            this.gbPretpark.Controls.Add(this.btnSim);
            this.gbPretpark.Controls.Add(this.GbAtractie);
            this.gbPretpark.Controls.Add(this.cbAttracties);
            this.gbPretpark.Controls.Add(this.tbToegangsprijs);
            this.gbPretpark.Controls.Add(this.lblAttracties);
            this.gbPretpark.Controls.Add(this.lblToegangsprijs);
            this.gbPretpark.Location = new System.Drawing.Point(15, 33);
            this.gbPretpark.Name = "gbPretpark";
            this.gbPretpark.Size = new System.Drawing.Size(442, 319);
            this.gbPretpark.TabIndex = 2;
            this.gbPretpark.TabStop = false;
            this.gbPretpark.Text = "groupBox1";
            this.gbPretpark.Visible = false;
            // 
            // cbAttracties
            // 
            this.cbAttracties.FormattingEnabled = true;
            this.cbAttracties.Location = new System.Drawing.Point(88, 54);
            this.cbAttracties.Name = "cbAttracties";
            this.cbAttracties.Size = new System.Drawing.Size(237, 21);
            this.cbAttracties.TabIndex = 3;
            this.cbAttracties.SelectedIndexChanged += new System.EventHandler(this.cbAttracties_SelectedIndexChanged);
            // 
            // tbToegangsprijs
            // 
            this.tbToegangsprijs.Enabled = false;
            this.tbToegangsprijs.Location = new System.Drawing.Point(88, 24);
            this.tbToegangsprijs.Name = "tbToegangsprijs";
            this.tbToegangsprijs.Size = new System.Drawing.Size(237, 20);
            this.tbToegangsprijs.TabIndex = 2;
            // 
            // lblAttracties
            // 
            this.lblAttracties.AutoSize = true;
            this.lblAttracties.Location = new System.Drawing.Point(6, 54);
            this.lblAttracties.Name = "lblAttracties";
            this.lblAttracties.Size = new System.Drawing.Size(54, 13);
            this.lblAttracties.TabIndex = 1;
            this.lblAttracties.Text = "Attracties:";
            // 
            // lblToegangsprijs
            // 
            this.lblToegangsprijs.AutoSize = true;
            this.lblToegangsprijs.Location = new System.Drawing.Point(6, 27);
            this.lblToegangsprijs.Name = "lblToegangsprijs";
            this.lblToegangsprijs.Size = new System.Drawing.Size(76, 13);
            this.lblToegangsprijs.TabIndex = 0;
            this.lblToegangsprijs.Text = "Toegangsprijs:";
            // 
            // GbAtractie
            // 
            this.GbAtractie.Controls.Add(this.lblMinimumLengte);
            this.GbAtractie.Controls.Add(this.lblType);
            this.GbAtractie.Controls.Add(this.lblBouwjaar);
            this.GbAtractie.Location = new System.Drawing.Point(9, 81);
            this.GbAtractie.Name = "GbAtractie";
            this.GbAtractie.Size = new System.Drawing.Size(427, 103);
            this.GbAtractie.TabIndex = 4;
            this.GbAtractie.TabStop = false;
            this.GbAtractie.Text = "groupBox1";
            this.GbAtractie.Visible = false;
            // 
            // lblBouwjaar
            // 
            this.lblBouwjaar.AutoSize = true;
            this.lblBouwjaar.Location = new System.Drawing.Point(6, 28);
            this.lblBouwjaar.Name = "lblBouwjaar";
            this.lblBouwjaar.Size = new System.Drawing.Size(35, 13);
            this.lblBouwjaar.TabIndex = 0;
            this.lblBouwjaar.Text = "label1";
            // 
            // lblType
            // 
            this.lblType.AutoSize = true;
            this.lblType.Location = new System.Drawing.Point(6, 51);
            this.lblType.Name = "lblType";
            this.lblType.Size = new System.Drawing.Size(35, 13);
            this.lblType.TabIndex = 1;
            this.lblType.Text = "label2";
            // 
            // lblMinimumLengte
            // 
            this.lblMinimumLengte.AutoSize = true;
            this.lblMinimumLengte.Location = new System.Drawing.Point(6, 74);
            this.lblMinimumLengte.Name = "lblMinimumLengte";
            this.lblMinimumLengte.Size = new System.Drawing.Size(35, 13);
            this.lblMinimumLengte.TabIndex = 2;
            this.lblMinimumLengte.Text = "label3";
            // 
            // btnSim
            // 
            this.btnSim.Location = new System.Drawing.Point(18, 191);
            this.btnSim.Name = "btnSim";
            this.btnSim.Size = new System.Drawing.Size(75, 23);
            this.btnSim.TabIndex = 5;
            this.btnSim.Text = "Simuleer uur";
            this.btnSim.UseVisualStyleBackColor = true;
            this.btnSim.Click += new System.EventHandler(this.btn_Click);
            // 
            // lblKlantenPerUur
            // 
            this.lblKlantenPerUur.AutoSize = true;
            this.lblKlantenPerUur.Location = new System.Drawing.Point(18, 221);
            this.lblKlantenPerUur.Name = "lblKlantenPerUur";
            this.lblKlantenPerUur.Size = new System.Drawing.Size(48, 13);
            this.lblKlantenPerUur.TabIndex = 6;
            this.lblKlantenPerUur.Text = "klanten: ";
            // 
            // lblTotaalWinst
            // 
            this.lblTotaalWinst.AutoSize = true;
            this.lblTotaalWinst.Location = new System.Drawing.Point(18, 238);
            this.lblTotaalWinst.Name = "lblTotaalWinst";
            this.lblTotaalWinst.Size = new System.Drawing.Size(40, 13);
            this.lblTotaalWinst.TabIndex = 7;
            this.lblTotaalWinst.Text = "Winst: ";
            // 
            // PretparkenApp
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(469, 364);
            this.Controls.Add(this.gbPretpark);
            this.Controls.Add(this.lblPretpark);
            this.Controls.Add(this.cbPretparken);
            this.Name = "PretparkenApp";
            this.Text = "PretparkenApp";
            this.gbPretpark.ResumeLayout(false);
            this.gbPretpark.PerformLayout();
            this.GbAtractie.ResumeLayout(false);
            this.GbAtractie.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbPretparken;
        private System.Windows.Forms.Label lblPretpark;
        private System.Windows.Forms.GroupBox gbPretpark;
        private System.Windows.Forms.ComboBox cbAttracties;
        private System.Windows.Forms.TextBox tbToegangsprijs;
        private System.Windows.Forms.Label lblAttracties;
        private System.Windows.Forms.Label lblToegangsprijs;
        private System.Windows.Forms.GroupBox GbAtractie;
        private System.Windows.Forms.Label lblBouwjaar;
        private System.Windows.Forms.Label lblMinimumLengte;
        private System.Windows.Forms.Label lblType;
        private System.Windows.Forms.Label lblTotaalWinst;
        private System.Windows.Forms.Label lblKlantenPerUur;
        private System.Windows.Forms.Button btnSim;
    }
}

