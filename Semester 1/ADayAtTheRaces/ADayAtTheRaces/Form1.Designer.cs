namespace ADayAtTheRaces
{
    partial class Form1
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
            this.pbDog1 = new System.Windows.Forms.PictureBox();
            this.pbTrack = new System.Windows.Forms.PictureBox();
            this.pbDog2 = new System.Windows.Forms.PictureBox();
            this.pbDog3 = new System.Windows.Forms.PictureBox();
            this.pbDog4 = new System.Windows.Forms.PictureBox();
            this.rbtnJoe = new System.Windows.Forms.RadioButton();
            this.rbtnBob = new System.Windows.Forms.RadioButton();
            this.rbtnAl = new System.Windows.Forms.RadioButton();
            this.gboxBetPalor = new System.Windows.Forms.GroupBox();
            this.lblAlBet = new System.Windows.Forms.Label();
            this.lblBobBet = new System.Windows.Forms.Label();
            this.lblJoebet = new System.Windows.Forms.Label();
            this.btnRace = new System.Windows.Forms.Button();
            this.nudDog = new System.Windows.Forms.NumericUpDown();
            this.label4 = new System.Windows.Forms.Label();
            this.lblBet = new System.Windows.Forms.Label();
            this.nudBet = new System.Windows.Forms.NumericUpDown();
            this.btnBet = new System.Windows.Forms.Button();
            this.lblName = new System.Windows.Forms.Label();
            this.lblMinimumBet = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbTrack)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog4)).BeginInit();
            this.gboxBetPalor.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudDog)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudBet)).BeginInit();
            this.SuspendLayout();
            // 
            // pbDog1
            // 
            this.pbDog1.Image = global::ADayAtTheRaces.Properties.Resources.dog;
            this.pbDog1.Location = new System.Drawing.Point(5, 12);
            this.pbDog1.Name = "pbDog1";
            this.pbDog1.Size = new System.Drawing.Size(75, 21);
            this.pbDog1.TabIndex = 1;
            this.pbDog1.TabStop = false;
            // 
            // pbTrack
            // 
            this.pbTrack.Image = global::ADayAtTheRaces.Properties.Resources.racetrack;
            this.pbTrack.Location = new System.Drawing.Point(0, -2);
            this.pbTrack.Name = "pbTrack";
            this.pbTrack.Size = new System.Drawing.Size(600, 196);
            this.pbTrack.TabIndex = 0;
            this.pbTrack.TabStop = false;
            // 
            // pbDog2
            // 
            this.pbDog2.Image = global::ADayAtTheRaces.Properties.Resources.dog;
            this.pbDog2.Location = new System.Drawing.Point(5, 57);
            this.pbDog2.Name = "pbDog2";
            this.pbDog2.Size = new System.Drawing.Size(75, 21);
            this.pbDog2.TabIndex = 2;
            this.pbDog2.TabStop = false;
            // 
            // pbDog3
            // 
            this.pbDog3.Image = global::ADayAtTheRaces.Properties.Resources.dog;
            this.pbDog3.Location = new System.Drawing.Point(5, 110);
            this.pbDog3.Name = "pbDog3";
            this.pbDog3.Size = new System.Drawing.Size(75, 22);
            this.pbDog3.TabIndex = 3;
            this.pbDog3.TabStop = false;
            // 
            // pbDog4
            // 
            this.pbDog4.Image = global::ADayAtTheRaces.Properties.Resources.dog;
            this.pbDog4.Location = new System.Drawing.Point(5, 160);
            this.pbDog4.Name = "pbDog4";
            this.pbDog4.Size = new System.Drawing.Size(75, 22);
            this.pbDog4.TabIndex = 4;
            this.pbDog4.TabStop = false;
            // 
            // rbtnJoe
            // 
            this.rbtnJoe.AutoSize = true;
            this.rbtnJoe.Location = new System.Drawing.Point(6, 37);
            this.rbtnJoe.Name = "rbtnJoe";
            this.rbtnJoe.Size = new System.Drawing.Size(115, 17);
            this.rbtnJoe.TabIndex = 5;
            this.rbtnJoe.TabStop = true;
            this.rbtnJoe.Text = "Joe has 100 bucks";
            this.rbtnJoe.UseVisualStyleBackColor = true;
            this.rbtnJoe.CheckedChanged += new System.EventHandler(this.rbtnJoe_CheckedChanged);
            // 
            // rbtnBob
            // 
            this.rbtnBob.AutoSize = true;
            this.rbtnBob.Location = new System.Drawing.Point(6, 58);
            this.rbtnBob.Name = "rbtnBob";
            this.rbtnBob.Size = new System.Drawing.Size(117, 17);
            this.rbtnBob.TabIndex = 6;
            this.rbtnBob.TabStop = true;
            this.rbtnBob.Text = "Bob has 100 bucks";
            this.rbtnBob.UseVisualStyleBackColor = true;
            this.rbtnBob.CheckedChanged += new System.EventHandler(this.rbtnBob_CheckedChanged);
            // 
            // rbtnAl
            // 
            this.rbtnAl.AutoSize = true;
            this.rbtnAl.Location = new System.Drawing.Point(6, 81);
            this.rbtnAl.Name = "rbtnAl";
            this.rbtnAl.Size = new System.Drawing.Size(107, 17);
            this.rbtnAl.TabIndex = 7;
            this.rbtnAl.TabStop = true;
            this.rbtnAl.Text = "Al has 100 bucks";
            this.rbtnAl.UseVisualStyleBackColor = true;
            this.rbtnAl.CheckedChanged += new System.EventHandler(this.rbtnAl_CheckedChanged);
            // 
            // gboxBetPalor
            // 
            this.gboxBetPalor.Controls.Add(this.lblAlBet);
            this.gboxBetPalor.Controls.Add(this.lblBobBet);
            this.gboxBetPalor.Controls.Add(this.lblJoebet);
            this.gboxBetPalor.Controls.Add(this.btnRace);
            this.gboxBetPalor.Controls.Add(this.nudDog);
            this.gboxBetPalor.Controls.Add(this.label4);
            this.gboxBetPalor.Controls.Add(this.lblBet);
            this.gboxBetPalor.Controls.Add(this.nudBet);
            this.gboxBetPalor.Controls.Add(this.btnBet);
            this.gboxBetPalor.Controls.Add(this.lblName);
            this.gboxBetPalor.Controls.Add(this.lblMinimumBet);
            this.gboxBetPalor.Controls.Add(this.rbtnJoe);
            this.gboxBetPalor.Controls.Add(this.rbtnAl);
            this.gboxBetPalor.Controls.Add(this.rbtnBob);
            this.gboxBetPalor.Location = new System.Drawing.Point(12, 201);
            this.gboxBetPalor.Name = "gboxBetPalor";
            this.gboxBetPalor.Size = new System.Drawing.Size(576, 154);
            this.gboxBetPalor.TabIndex = 8;
            this.gboxBetPalor.TabStop = false;
            this.gboxBetPalor.Text = "Betting Palor";
            // 
            // lblAlBet
            // 
            this.lblAlBet.AutoSize = true;
            this.lblAlBet.Location = new System.Drawing.Point(145, 83);
            this.lblAlBet.Name = "lblAlBet";
            this.lblAlBet.Size = new System.Drawing.Size(42, 13);
            this.lblAlBet.TabIndex = 21;
            this.lblAlBet.Text = "lblAlBet";
            // 
            // lblBobBet
            // 
            this.lblBobBet.AutoSize = true;
            this.lblBobBet.Location = new System.Drawing.Point(145, 60);
            this.lblBobBet.Name = "lblBobBet";
            this.lblBobBet.Size = new System.Drawing.Size(52, 13);
            this.lblBobBet.TabIndex = 20;
            this.lblBobBet.Text = "lblBobBet";
            // 
            // lblJoebet
            // 
            this.lblJoebet.AutoSize = true;
            this.lblJoebet.Location = new System.Drawing.Point(145, 37);
            this.lblJoebet.Name = "lblJoebet";
            this.lblJoebet.Size = new System.Drawing.Size(49, 13);
            this.lblJoebet.TabIndex = 19;
            this.lblJoebet.Text = "lblJoebet";
            // 
            // btnRace
            // 
            this.btnRace.Font = new System.Drawing.Font("Microsoft Sans Serif", 48F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRace.Location = new System.Drawing.Point(324, 16);
            this.btnRace.Name = "btnRace";
            this.btnRace.Size = new System.Drawing.Size(246, 132);
            this.btnRace.TabIndex = 18;
            this.btnRace.Text = "Race!";
            this.btnRace.UseVisualStyleBackColor = true;
            this.btnRace.Click += new System.EventHandler(this.btnRace_Click);
            // 
            // nudDog
            // 
            this.nudDog.Location = new System.Drawing.Point(262, 120);
            this.nudDog.Maximum = new decimal(new int[] {
            4,
            0,
            0,
            0});
            this.nudDog.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudDog.Name = "nudDog";
            this.nudDog.Size = new System.Drawing.Size(38, 20);
            this.nudDog.TabIndex = 17;
            this.nudDog.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(145, 123);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(111, 13);
            this.label4.TabIndex = 16;
            this.label4.Text = "Bucks on dog number";
            // 
            // lblBet
            // 
            this.lblBet.AutoSize = true;
            this.lblBet.Location = new System.Drawing.Point(145, 16);
            this.lblBet.Name = "lblBet";
            this.lblBet.Size = new System.Drawing.Size(28, 13);
            this.lblBet.TabIndex = 12;
            this.lblBet.Text = "Bets";
            // 
            // nudBet
            // 
            this.nudBet.Location = new System.Drawing.Point(97, 120);
            this.nudBet.Maximum = new decimal(new int[] {
            15,
            0,
            0,
            0});
            this.nudBet.Minimum = new decimal(new int[] {
            5,
            0,
            0,
            0});
            this.nudBet.Name = "nudBet";
            this.nudBet.Size = new System.Drawing.Size(42, 20);
            this.nudBet.TabIndex = 11;
            this.nudBet.Value = new decimal(new int[] {
            5,
            0,
            0,
            0});
            // 
            // btnBet
            // 
            this.btnBet.Location = new System.Drawing.Point(50, 118);
            this.btnBet.Name = "btnBet";
            this.btnBet.Size = new System.Drawing.Size(41, 23);
            this.btnBet.TabIndex = 10;
            this.btnBet.Text = "bets";
            this.btnBet.UseVisualStyleBackColor = true;
            this.btnBet.Click += new System.EventHandler(this.btnBet_Click);
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(9, 122);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(35, 13);
            this.lblName.TabIndex = 9;
            this.lblName.Text = "Name";
            // 
            // lblMinimumBet
            // 
            this.lblMinimumBet.AutoSize = true;
            this.lblMinimumBet.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMinimumBet.Location = new System.Drawing.Point(6, 16);
            this.lblMinimumBet.Name = "lblMinimumBet";
            this.lblMinimumBet.Size = new System.Drawing.Size(135, 13);
            this.lblMinimumBet.TabIndex = 8;
            this.lblMinimumBet.Text = "Minimumbet is 5 bucks";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 367);
            this.Controls.Add(this.gboxBetPalor);
            this.Controls.Add(this.pbDog4);
            this.Controls.Add(this.pbDog3);
            this.Controls.Add(this.pbDog2);
            this.Controls.Add(this.pbDog1);
            this.Controls.Add(this.pbTrack);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pbDog1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbTrack)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDog4)).EndInit();
            this.gboxBetPalor.ResumeLayout(false);
            this.gboxBetPalor.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudDog)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudBet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pbTrack;
        private System.Windows.Forms.PictureBox pbDog1;
        private System.Windows.Forms.PictureBox pbDog2;
        private System.Windows.Forms.PictureBox pbDog3;
        private System.Windows.Forms.PictureBox pbDog4;
        private System.Windows.Forms.RadioButton rbtnJoe;
        private System.Windows.Forms.RadioButton rbtnBob;
        private System.Windows.Forms.RadioButton rbtnAl;
        private System.Windows.Forms.GroupBox gboxBetPalor;
        private System.Windows.Forms.Button btnRace;
        private System.Windows.Forms.NumericUpDown nudDog;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lblBet;
        private System.Windows.Forms.NumericUpDown nudBet;
        private System.Windows.Forms.Button btnBet;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label lblMinimumBet;
        private System.Windows.Forms.Label lblAlBet;
        private System.Windows.Forms.Label lblBobBet;
        private System.Windows.Forms.Label lblJoebet;
    }
}

