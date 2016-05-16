namespace Demo_Sorteren
{
    partial class SorteerForm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btSorteerGroente = new System.Windows.Forms.Button();
            this.lbGroente = new System.Windows.Forms.ListBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btSorteerVakken = new System.Windows.Forms.Button();
            this.lbVakken = new System.Windows.Forms.ListBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btSorteerOpAantalPaginas = new System.Windows.Forms.Button();
            this.btSorteerOpAuteur = new System.Windows.Forms.Button();
            this.btSorteerOpTitel = new System.Windows.Forms.Button();
            this.lbBoeken = new System.Windows.Forms.ListBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btSorteerGroente);
            this.groupBox1.Controls.Add(this.lbGroente);
            this.groupBox1.Location = new System.Drawing.Point(13, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(228, 288);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Sorteren List<string>";
            // 
            // btSorteerGroente
            // 
            this.btSorteerGroente.Location = new System.Drawing.Point(7, 252);
            this.btSorteerGroente.Name = "btSorteerGroente";
            this.btSorteerGroente.Size = new System.Drawing.Size(203, 30);
            this.btSorteerGroente.TabIndex = 1;
            this.btSorteerGroente.Text = "Sorteer";
            this.btSorteerGroente.UseVisualStyleBackColor = true;
            this.btSorteerGroente.Click += new System.EventHandler(this.btSorteerGroente_Click);
            // 
            // lbGroente
            // 
            this.lbGroente.FormattingEnabled = true;
            this.lbGroente.Location = new System.Drawing.Point(7, 20);
            this.lbGroente.Name = "lbGroente";
            this.lbGroente.Size = new System.Drawing.Size(203, 225);
            this.lbGroente.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btSorteerVakken);
            this.groupBox2.Controls.Add(this.lbVakken);
            this.groupBox2.Location = new System.Drawing.Point(265, 13);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(350, 288);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Sorteren IComparable";
            // 
            // btSorteerVakken
            // 
            this.btSorteerVakken.Location = new System.Drawing.Point(7, 252);
            this.btSorteerVakken.Name = "btSorteerVakken";
            this.btSorteerVakken.Size = new System.Drawing.Size(337, 30);
            this.btSorteerVakken.TabIndex = 1;
            this.btSorteerVakken.Text = "Sorteer";
            this.btSorteerVakken.UseVisualStyleBackColor = true;
            this.btSorteerVakken.Click += new System.EventHandler(this.btSorteerVakken_Click);
            // 
            // lbVakken
            // 
            this.lbVakken.FormattingEnabled = true;
            this.lbVakken.Location = new System.Drawing.Point(7, 20);
            this.lbVakken.Name = "lbVakken";
            this.lbVakken.Size = new System.Drawing.Size(337, 225);
            this.lbVakken.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btSorteerOpAantalPaginas);
            this.groupBox3.Controls.Add(this.btSorteerOpAuteur);
            this.groupBox3.Controls.Add(this.btSorteerOpTitel);
            this.groupBox3.Controls.Add(this.lbBoeken);
            this.groupBox3.Location = new System.Drawing.Point(13, 320);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(596, 288);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Sorteren IComparer";
            // 
            // btSorteerOpAantalPaginas
            // 
            this.btSorteerOpAantalPaginas.Location = new System.Drawing.Point(427, 251);
            this.btSorteerOpAantalPaginas.Name = "btSorteerOpAantalPaginas";
            this.btSorteerOpAantalPaginas.Size = new System.Drawing.Size(163, 30);
            this.btSorteerOpAantalPaginas.TabIndex = 3;
            this.btSorteerOpAantalPaginas.Text = "Sorteer op aantal paginas\r\n";
            this.btSorteerOpAantalPaginas.UseVisualStyleBackColor = true;
            this.btSorteerOpAantalPaginas.Click += new System.EventHandler(this.btSorteerOpAantalPaginas_Click);
            // 
            // btSorteerOpAuteur
            // 
            this.btSorteerOpAuteur.Location = new System.Drawing.Point(215, 251);
            this.btSorteerOpAuteur.Name = "btSorteerOpAuteur";
            this.btSorteerOpAuteur.Size = new System.Drawing.Size(163, 30);
            this.btSorteerOpAuteur.TabIndex = 2;
            this.btSorteerOpAuteur.Text = "Sorteer op auteur";
            this.btSorteerOpAuteur.UseVisualStyleBackColor = true;
            this.btSorteerOpAuteur.Click += new System.EventHandler(this.btSorteerOpAuteur_Click);
            // 
            // btSorteerOpTitel
            // 
            this.btSorteerOpTitel.Location = new System.Drawing.Point(7, 251);
            this.btSorteerOpTitel.Name = "btSorteerOpTitel";
            this.btSorteerOpTitel.Size = new System.Drawing.Size(163, 30);
            this.btSorteerOpTitel.TabIndex = 1;
            this.btSorteerOpTitel.Text = "Sorteer op titel";
            this.btSorteerOpTitel.UseVisualStyleBackColor = true;
            this.btSorteerOpTitel.Click += new System.EventHandler(this.btSorteerOpTitel_Click);
            // 
            // lbBoeken
            // 
            this.lbBoeken.FormattingEnabled = true;
            this.lbBoeken.Location = new System.Drawing.Point(7, 20);
            this.lbBoeken.Name = "lbBoeken";
            this.lbBoeken.Size = new System.Drawing.Size(583, 225);
            this.lbBoeken.TabIndex = 0;
            // 
            // SorteerForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(627, 710);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "SorteerForm";
            this.Text = "Demo Sorteren";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btSorteerGroente;
        private System.Windows.Forms.ListBox lbGroente;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ListBox lbVakken;
        private System.Windows.Forms.Button btSorteerVakken;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btSorteerOpAantalPaginas;
        private System.Windows.Forms.Button btSorteerOpAuteur;
        private System.Windows.Forms.Button btSorteerOpTitel;
        private System.Windows.Forms.ListBox lbBoeken;
    }
}

