namespace dinnerparty
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
            this.label1 = new System.Windows.Forms.Label();
            this.nudPeople = new System.Windows.Forms.NumericUpDown();
            this.cbFancy = new System.Windows.Forms.CheckBox();
            this.cbHealty = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lblCost = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.nudPeople)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Number of people";
            // 
            // nudPeople
            // 
            this.nudPeople.Location = new System.Drawing.Point(13, 30);
            this.nudPeople.Name = "nudPeople";
            this.nudPeople.Size = new System.Drawing.Size(91, 20);
            this.nudPeople.TabIndex = 1;
            this.nudPeople.ValueChanged += new System.EventHandler(this.nudPeople_ValueChanged);
            // 
            // cbFancy
            // 
            this.cbFancy.AutoSize = true;
            this.cbFancy.Location = new System.Drawing.Point(13, 57);
            this.cbFancy.Name = "cbFancy";
            this.cbFancy.Size = new System.Drawing.Size(113, 17);
            this.cbFancy.TabIndex = 2;
            this.cbFancy.Text = "Fancy decorations";
            this.cbFancy.UseVisualStyleBackColor = true;
            this.cbFancy.CheckedChanged += new System.EventHandler(this.cbFancy_CheckedChanged);
            // 
            // cbHealty
            // 
            this.cbHealty.AutoSize = true;
            this.cbHealty.Location = new System.Drawing.Point(13, 81);
            this.cbHealty.Name = "cbHealty";
            this.cbHealty.Size = new System.Drawing.Size(88, 17);
            this.cbHealty.TabIndex = 3;
            this.cbHealty.Text = "Healty option";
            this.cbHealty.UseVisualStyleBackColor = true;
            this.cbHealty.CheckedChanged += new System.EventHandler(this.cbHealty_CheckedChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(13, 105);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Cost:";
            // 
            // lblCost
            // 
            this.lblCost.AutoSize = true;
            this.lblCost.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lblCost.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCost.Location = new System.Drawing.Point(55, 105);
            this.lblCost.Name = "lblCost";
            this.lblCost.Size = new System.Drawing.Size(41, 15);
            this.lblCost.TabIndex = 5;
            this.lblCost.Text = "$0.00";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(141, 136);
            this.Controls.Add(this.lblCost);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cbHealty);
            this.Controls.Add(this.cbFancy);
            this.Controls.Add(this.nudPeople);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.nudPeople)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown nudPeople;
        private System.Windows.Forms.CheckBox cbFancy;
        private System.Windows.Forms.CheckBox cbHealty;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblCost;
    }
}

