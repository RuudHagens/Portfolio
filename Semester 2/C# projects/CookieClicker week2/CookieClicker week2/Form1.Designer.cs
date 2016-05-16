namespace CookieClicker_week2
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
            this.components = new System.ComponentModel.Container();
            this.pbCookie = new System.Windows.Forms.PictureBox();
            this.lblKps = new System.Windows.Forms.Label();
            this.lblKoekjes = new System.Windows.Forms.Label();
            this.gbUpgrades = new System.Windows.Forms.GroupBox();
            this.lblDeegrollerUpgrade = new System.Windows.Forms.Label();
            this.lblOvenUpgrade = new System.Windows.Forms.Label();
            this.lblBakkerUpgrade = new System.Windows.Forms.Label();
            this.btnDeegroller = new System.Windows.Forms.Button();
            this.btnOven = new System.Windows.Forms.Button();
            this.btnBakker = new System.Windows.Forms.Button();
            this.tmKps = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.pbCookie)).BeginInit();
            this.gbUpgrades.SuspendLayout();
            this.SuspendLayout();
            // 
            // pbCookie
            // 
            this.pbCookie.Image = global::CookieClicker_week2.Properties.Resources.Cookie;
            this.pbCookie.Location = new System.Drawing.Point(12, 108);
            this.pbCookie.Name = "pbCookie";
            this.pbCookie.Size = new System.Drawing.Size(294, 225);
            this.pbCookie.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pbCookie.TabIndex = 0;
            this.pbCookie.TabStop = false;
            this.pbCookie.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pbCookie_MouseDown);
            // 
            // lblKps
            // 
            this.lblKps.AutoSize = true;
            this.lblKps.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblKps.Location = new System.Drawing.Point(307, 22);
            this.lblKps.Name = "lblKps";
            this.lblKps.Size = new System.Drawing.Size(79, 25);
            this.lblKps.TabIndex = 1;
            this.lblKps.Text = "Kps: 0";
            // 
            // lblKoekjes
            // 
            this.lblKoekjes.AutoSize = true;
            this.lblKoekjes.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblKoekjes.Location = new System.Drawing.Point(307, 47);
            this.lblKoekjes.Name = "lblKoekjes";
            this.lblKoekjes.Size = new System.Drawing.Size(123, 25);
            this.lblKoekjes.TabIndex = 2;
            this.lblKoekjes.Text = "Koekjes: 0";
            // 
            // gbUpgrades
            // 
            this.gbUpgrades.Controls.Add(this.lblDeegrollerUpgrade);
            this.gbUpgrades.Controls.Add(this.lblOvenUpgrade);
            this.gbUpgrades.Controls.Add(this.lblBakkerUpgrade);
            this.gbUpgrades.Controls.Add(this.btnDeegroller);
            this.gbUpgrades.Controls.Add(this.btnOven);
            this.gbUpgrades.Controls.Add(this.btnBakker);
            this.gbUpgrades.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbUpgrades.Location = new System.Drawing.Point(312, 108);
            this.gbUpgrades.Name = "gbUpgrades";
            this.gbUpgrades.Size = new System.Drawing.Size(408, 231);
            this.gbUpgrades.TabIndex = 3;
            this.gbUpgrades.TabStop = false;
            this.gbUpgrades.Text = "Upgrades";
            // 
            // lblDeegrollerUpgrade
            // 
            this.lblDeegrollerUpgrade.AutoSize = true;
            this.lblDeegrollerUpgrade.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDeegrollerUpgrade.Location = new System.Drawing.Point(218, 179);
            this.lblDeegrollerUpgrade.Name = "lblDeegrollerUpgrade";
            this.lblDeegrollerUpgrade.Size = new System.Drawing.Size(110, 24);
            this.lblDeegrollerUpgrade.TabIndex = 5;
            this.lblDeegrollerUpgrade.Text = "+ 10 per klik";
            // 
            // lblOvenUpgrade
            // 
            this.lblOvenUpgrade.AutoSize = true;
            this.lblOvenUpgrade.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOvenUpgrade.Location = new System.Drawing.Point(218, 114);
            this.lblOvenUpgrade.Name = "lblOvenUpgrade";
            this.lblOvenUpgrade.Size = new System.Drawing.Size(83, 24);
            this.lblOvenUpgrade.TabIndex = 4;
            this.lblOvenUpgrade.Text = "+ 50 Kps";
            // 
            // lblBakkerUpgrade
            // 
            this.lblBakkerUpgrade.AutoSize = true;
            this.lblBakkerUpgrade.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBakkerUpgrade.Location = new System.Drawing.Point(218, 49);
            this.lblBakkerUpgrade.Name = "lblBakkerUpgrade";
            this.lblBakkerUpgrade.Size = new System.Drawing.Size(83, 24);
            this.lblBakkerUpgrade.TabIndex = 3;
            this.lblBakkerUpgrade.Text = "+ 10 Kps";
            // 
            // btnDeegroller
            // 
            this.btnDeegroller.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeegroller.Location = new System.Drawing.Point(6, 164);
            this.btnDeegroller.Name = "btnDeegroller";
            this.btnDeegroller.Size = new System.Drawing.Size(206, 61);
            this.btnDeegroller.TabIndex = 2;
            this.btnDeegroller.Text = "Deegroller (3500) : 0";
            this.btnDeegroller.UseVisualStyleBackColor = true;
            this.btnDeegroller.Click += new System.EventHandler(this.btnDeegroller_Click);
            // 
            // btnOven
            // 
            this.btnOven.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOven.Location = new System.Drawing.Point(6, 99);
            this.btnOven.Name = "btnOven";
            this.btnOven.Size = new System.Drawing.Size(206, 59);
            this.btnOven.TabIndex = 1;
            this.btnOven.Text = "Oven (2000) : 0";
            this.btnOven.UseVisualStyleBackColor = true;
            this.btnOven.Click += new System.EventHandler(this.btnOven_Click);
            // 
            // btnBakker
            // 
            this.btnBakker.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBakker.Location = new System.Drawing.Point(6, 34);
            this.btnBakker.Name = "btnBakker";
            this.btnBakker.Size = new System.Drawing.Size(206, 59);
            this.btnBakker.TabIndex = 0;
            this.btnBakker.Text = "Bakker (100) : 0";
            this.btnBakker.UseVisualStyleBackColor = true;
            this.btnBakker.Click += new System.EventHandler(this.btnBakker_Click);
            // 
            // tmKps
            // 
            this.tmKps.Enabled = true;
            this.tmKps.Interval = 1000;
            this.tmKps.Tick += new System.EventHandler(this.tmKps_Tick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.NavajoWhite;
            this.ClientSize = new System.Drawing.Size(732, 351);
            this.Controls.Add(this.gbUpgrades);
            this.Controls.Add(this.lblKoekjes);
            this.Controls.Add(this.lblKps);
            this.Controls.Add(this.pbCookie);
            this.Name = "Form1";
            this.Text = "CookieClicker";
            ((System.ComponentModel.ISupportInitialize)(this.pbCookie)).EndInit();
            this.gbUpgrades.ResumeLayout(false);
            this.gbUpgrades.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pbCookie;
        private System.Windows.Forms.Label lblKps;
        private System.Windows.Forms.Label lblKoekjes;
        private System.Windows.Forms.GroupBox gbUpgrades;
        private System.Windows.Forms.Label lblDeegrollerUpgrade;
        private System.Windows.Forms.Label lblOvenUpgrade;
        private System.Windows.Forms.Label lblBakkerUpgrade;
        private System.Windows.Forms.Button btnDeegroller;
        private System.Windows.Forms.Button btnOven;
        private System.Windows.Forms.Button btnBakker;
        private System.Windows.Forms.Timer tmKps;
    }
}

