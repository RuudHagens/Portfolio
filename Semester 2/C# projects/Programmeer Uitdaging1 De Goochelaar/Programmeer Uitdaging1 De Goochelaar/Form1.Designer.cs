namespace Programmeer_Uitdaging1_De_Goochelaar
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
            this.dgvRonde1 = new System.Windows.Forms.DataGridView();
            this.c1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.c2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.c3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.c4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblRonde1GekozenRij = new System.Windows.Forms.Label();
            this.lblHuidigeRonde = new System.Windows.Forms.Label();
            this.dgvRonde2 = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblRonde2GekozenRij = new System.Windows.Forms.Label();
            this.btnVorige = new System.Windows.Forms.Button();
            this.btnVolgende = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.lblGelukt = new System.Windows.Forms.Label();
            this.lblOvereenkomend = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRonde1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRonde2)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvRonde1
            // 
            this.dgvRonde1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRonde1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.c1,
            this.c2,
            this.c3,
            this.c4});
            this.dgvRonde1.Location = new System.Drawing.Point(12, 38);
            this.dgvRonde1.Name = "dgvRonde1";
            this.dgvRonde1.Size = new System.Drawing.Size(445, 150);
            this.dgvRonde1.TabIndex = 0;
            // 
            // c1
            // 
            this.c1.HeaderText = "c1";
            this.c1.Name = "c1";
            this.c1.ReadOnly = true;
            // 
            // c2
            // 
            this.c2.HeaderText = "c2";
            this.c2.Name = "c2";
            this.c2.ReadOnly = true;
            // 
            // c3
            // 
            this.c3.HeaderText = "c3";
            this.c3.Name = "c3";
            this.c3.ReadOnly = true;
            // 
            // c4
            // 
            this.c4.HeaderText = "c4";
            this.c4.Name = "c4";
            this.c4.ReadOnly = true;
            // 
            // lblRonde1GekozenRij
            // 
            this.lblRonde1GekozenRij.AutoSize = true;
            this.lblRonde1GekozenRij.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRonde1GekozenRij.Location = new System.Drawing.Point(8, 191);
            this.lblRonde1GekozenRij.Name = "lblRonde1GekozenRij";
            this.lblRonde1GekozenRij.Size = new System.Drawing.Size(51, 20);
            this.lblRonde1GekozenRij.TabIndex = 2;
            this.lblRonde1GekozenRij.Text = "label1";
            // 
            // lblHuidigeRonde
            // 
            this.lblHuidigeRonde.AutoSize = true;
            this.lblHuidigeRonde.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHuidigeRonde.Location = new System.Drawing.Point(463, 38);
            this.lblHuidigeRonde.Name = "lblHuidigeRonde";
            this.lblHuidigeRonde.Size = new System.Drawing.Size(74, 20);
            this.lblHuidigeRonde.TabIndex = 3;
            this.lblHuidigeRonde.Text = "Ronde: 1";
            // 
            // dgvRonde2
            // 
            this.dgvRonde2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRonde2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn4});
            this.dgvRonde2.Location = new System.Drawing.Point(12, 214);
            this.dgvRonde2.Name = "dgvRonde2";
            this.dgvRonde2.Size = new System.Drawing.Size(445, 150);
            this.dgvRonde2.TabIndex = 4;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.HeaderText = "c1";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.HeaderText = "c2";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.HeaderText = "c3";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            this.dataGridViewTextBoxColumn3.ReadOnly = true;
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.HeaderText = "c4";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            this.dataGridViewTextBoxColumn4.ReadOnly = true;
            // 
            // lblRonde2GekozenRij
            // 
            this.lblRonde2GekozenRij.AutoSize = true;
            this.lblRonde2GekozenRij.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRonde2GekozenRij.Location = new System.Drawing.Point(8, 367);
            this.lblRonde2GekozenRij.Name = "lblRonde2GekozenRij";
            this.lblRonde2GekozenRij.Size = new System.Drawing.Size(51, 20);
            this.lblRonde2GekozenRij.TabIndex = 5;
            this.lblRonde2GekozenRij.Text = "label1";
            // 
            // btnVorige
            // 
            this.btnVorige.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVorige.Location = new System.Drawing.Point(467, 61);
            this.btnVorige.Name = "btnVorige";
            this.btnVorige.Size = new System.Drawing.Size(134, 33);
            this.btnVorige.TabIndex = 6;
            this.btnVorige.Text = "Vorige ronde";
            this.btnVorige.UseVisualStyleBackColor = true;
            this.btnVorige.Click += new System.EventHandler(this.btnVorige_Click);
            // 
            // btnVolgende
            // 
            this.btnVolgende.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVolgende.Location = new System.Drawing.Point(467, 100);
            this.btnVolgende.Name = "btnVolgende";
            this.btnVolgende.Size = new System.Drawing.Size(134, 33);
            this.btnVolgende.TabIndex = 7;
            this.btnVolgende.Text = "Volgende ronde";
            this.btnVolgende.UseVisualStyleBackColor = true;
            this.btnVolgende.Click += new System.EventHandler(this.btnVolgende_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(8, 399);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 20);
            this.label1.TabIndex = 8;
            this.label1.Text = "Uitkomst:";
            // 
            // lblGelukt
            // 
            this.lblGelukt.AutoSize = true;
            this.lblGelukt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblGelukt.Location = new System.Drawing.Point(234, 399);
            this.lblGelukt.Name = "lblGelukt";
            this.lblGelukt.Size = new System.Drawing.Size(51, 20);
            this.lblGelukt.TabIndex = 10;
            this.lblGelukt.Text = "label2";
            // 
            // lblOvereenkomend
            // 
            this.lblOvereenkomend.AutoSize = true;
            this.lblOvereenkomend.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOvereenkomend.Location = new System.Drawing.Point(90, 399);
            this.lblOvereenkomend.Name = "lblOvereenkomend";
            this.lblOvereenkomend.Size = new System.Drawing.Size(0, 20);
            this.lblOvereenkomend.TabIndex = 9;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(676, 434);
            this.Controls.Add(this.lblGelukt);
            this.Controls.Add(this.lblOvereenkomend);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnVolgende);
            this.Controls.Add(this.btnVorige);
            this.Controls.Add(this.lblRonde2GekozenRij);
            this.Controls.Add(this.dgvRonde2);
            this.Controls.Add(this.lblHuidigeRonde);
            this.Controls.Add(this.lblRonde1GekozenRij);
            this.Controls.Add(this.dgvRonde1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRonde1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRonde2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvRonde1;
        private System.Windows.Forms.DataGridViewTextBoxColumn c1;
        private System.Windows.Forms.DataGridViewTextBoxColumn c2;
        private System.Windows.Forms.DataGridViewTextBoxColumn c3;
        private System.Windows.Forms.DataGridViewTextBoxColumn c4;
        private System.Windows.Forms.Label lblRonde1GekozenRij;
        private System.Windows.Forms.Label lblHuidigeRonde;
        private System.Windows.Forms.DataGridView dgvRonde2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.Label lblRonde2GekozenRij;
        private System.Windows.Forms.Button btnVorige;
        private System.Windows.Forms.Button btnVolgende;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblGelukt;
        private System.Windows.Forms.Label lblOvereenkomend;


    }
}

