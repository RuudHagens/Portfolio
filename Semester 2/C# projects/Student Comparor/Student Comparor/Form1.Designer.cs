namespace Student_Comparor
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
            this.lblNaam = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblAddres = new System.Windows.Forms.Label();
            this.tbNummer = new System.Windows.Forms.TextBox();
            this.tbNaam = new System.Windows.Forms.TextBox();
            this.tbAddres = new System.Windows.Forms.TextBox();
            this.btnToevoegen = new System.Windows.Forms.Button();
            this.lbStudent = new System.Windows.Forms.ListBox();
            this.btnNummer = new System.Windows.Forms.Button();
            this.lblSort = new System.Windows.Forms.Label();
            this.btnNaam = new System.Windows.Forms.Button();
            this.btnAddres = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblNaam
            // 
            this.lblNaam.AutoSize = true;
            this.lblNaam.Location = new System.Drawing.Point(12, 9);
            this.lblNaam.Name = "lblNaam";
            this.lblNaam.Size = new System.Drawing.Size(49, 13);
            this.lblNaam.TabIndex = 0;
            this.lblNaam.Text = "Nummer:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Naam:";
            // 
            // lblAddres
            // 
            this.lblAddres.AutoSize = true;
            this.lblAddres.Location = new System.Drawing.Point(12, 61);
            this.lblAddres.Name = "lblAddres";
            this.lblAddres.Size = new System.Drawing.Size(43, 13);
            this.lblAddres.TabIndex = 2;
            this.lblAddres.Text = "Addres:";
            // 
            // tbNummer
            // 
            this.tbNummer.Location = new System.Drawing.Point(67, 6);
            this.tbNummer.MaxLength = 6;
            this.tbNummer.Name = "tbNummer";
            this.tbNummer.Size = new System.Drawing.Size(129, 20);
            this.tbNummer.TabIndex = 3;
            this.tbNummer.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbNummer_KeyPress);
            // 
            // tbNaam
            // 
            this.tbNaam.Location = new System.Drawing.Point(56, 32);
            this.tbNaam.Name = "tbNaam";
            this.tbNaam.Size = new System.Drawing.Size(140, 20);
            this.tbNaam.TabIndex = 4;
            // 
            // tbAddres
            // 
            this.tbAddres.Location = new System.Drawing.Point(61, 58);
            this.tbAddres.Name = "tbAddres";
            this.tbAddres.Size = new System.Drawing.Size(135, 20);
            this.tbAddres.TabIndex = 5;
            // 
            // btnToevoegen
            // 
            this.btnToevoegen.Location = new System.Drawing.Point(12, 84);
            this.btnToevoegen.Name = "btnToevoegen";
            this.btnToevoegen.Size = new System.Drawing.Size(113, 23);
            this.btnToevoegen.TabIndex = 6;
            this.btnToevoegen.Text = "Student toevoegen";
            this.btnToevoegen.UseVisualStyleBackColor = true;
            this.btnToevoegen.Click += new System.EventHandler(this.btnToevoegen_Click);
            // 
            // lbStudent
            // 
            this.lbStudent.FormattingEnabled = true;
            this.lbStudent.Location = new System.Drawing.Point(216, 32);
            this.lbStudent.Name = "lbStudent";
            this.lbStudent.Size = new System.Drawing.Size(369, 173);
            this.lbStudent.TabIndex = 7;
            // 
            // btnNummer
            // 
            this.btnNummer.Location = new System.Drawing.Point(281, 9);
            this.btnNummer.Name = "btnNummer";
            this.btnNummer.Size = new System.Drawing.Size(75, 23);
            this.btnNummer.TabIndex = 8;
            this.btnNummer.Text = "Nummer";
            this.btnNummer.UseVisualStyleBackColor = true;
            this.btnNummer.Click += new System.EventHandler(this.btnNummer_Click);
            // 
            // lblSort
            // 
            this.lblSort.AutoSize = true;
            this.lblSort.Location = new System.Drawing.Point(216, 14);
            this.lblSort.Name = "lblSort";
            this.lblSort.Size = new System.Drawing.Size(59, 13);
            this.lblSort.TabIndex = 9;
            this.lblSort.Text = "Sorteer op:";
            // 
            // btnNaam
            // 
            this.btnNaam.Location = new System.Drawing.Point(362, 9);
            this.btnNaam.Name = "btnNaam";
            this.btnNaam.Size = new System.Drawing.Size(75, 23);
            this.btnNaam.TabIndex = 10;
            this.btnNaam.Text = "Naam";
            this.btnNaam.UseVisualStyleBackColor = true;
            this.btnNaam.Click += new System.EventHandler(this.btnNaam_Click);
            // 
            // btnAddres
            // 
            this.btnAddres.Location = new System.Drawing.Point(443, 9);
            this.btnAddres.Name = "btnAddres";
            this.btnAddres.Size = new System.Drawing.Size(75, 23);
            this.btnAddres.TabIndex = 11;
            this.btnAddres.Text = "Addres";
            this.btnAddres.UseVisualStyleBackColor = true;
            this.btnAddres.Click += new System.EventHandler(this.btnAddres_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(597, 216);
            this.Controls.Add(this.btnAddres);
            this.Controls.Add(this.btnNaam);
            this.Controls.Add(this.lblSort);
            this.Controls.Add(this.btnNummer);
            this.Controls.Add(this.lbStudent);
            this.Controls.Add(this.btnToevoegen);
            this.Controls.Add(this.tbAddres);
            this.Controls.Add(this.tbNaam);
            this.Controls.Add(this.tbNummer);
            this.Controls.Add(this.lblAddres);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblNaam);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblNaam;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblAddres;
        private System.Windows.Forms.TextBox tbNummer;
        private System.Windows.Forms.TextBox tbNaam;
        private System.Windows.Forms.TextBox tbAddres;
        private System.Windows.Forms.Button btnToevoegen;
        private System.Windows.Forms.ListBox lbStudent;
        private System.Windows.Forms.Button btnNummer;
        private System.Windows.Forms.Label lblSort;
        private System.Windows.Forms.Button btnNaam;
        private System.Windows.Forms.Button btnAddres;
    }
}

