namespace ADVoorbeeld
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
            this.btnLogin = new System.Windows.Forms.Button();
            this.tbNaam = new System.Windows.Forms.TextBox();
            this.tbWachtwoord = new System.Windows.Forms.TextBox();
            this.lblLoginStatus = new System.Windows.Forms.Label();
            this.lbInfo = new System.Windows.Forms.ListBox();
            this.btnVraagInfo = new System.Windows.Forms.Button();
            this.tbNaamInfo = new System.Windows.Forms.TextBox();
            this.lblTitel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(16, 79);
            this.btnLogin.Margin = new System.Windows.Forms.Padding(4);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(64, 28);
            this.btnLogin.TabIndex = 0;
            this.btnLogin.Text = "Login";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // tbNaam
            // 
            this.tbNaam.Location = new System.Drawing.Point(16, 15);
            this.tbNaam.Margin = new System.Windows.Forms.Padding(4);
            this.tbNaam.Name = "tbNaam";
            this.tbNaam.Size = new System.Drawing.Size(132, 22);
            this.tbNaam.TabIndex = 1;
            this.tbNaam.Text = "admin";
            // 
            // tbWachtwoord
            // 
            this.tbWachtwoord.Location = new System.Drawing.Point(16, 47);
            this.tbWachtwoord.Margin = new System.Windows.Forms.Padding(4);
            this.tbWachtwoord.Name = "tbWachtwoord";
            this.tbWachtwoord.Size = new System.Drawing.Size(132, 22);
            this.tbWachtwoord.TabIndex = 2;
            this.tbWachtwoord.Text = "Welkom01";
            // 
            // lblLoginStatus
            // 
            this.lblLoginStatus.AutoSize = true;
            this.lblLoginStatus.Location = new System.Drawing.Point(103, 91);
            this.lblLoginStatus.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblLoginStatus.Name = "lblLoginStatus";
            this.lblLoginStatus.Size = new System.Drawing.Size(20, 17);
            this.lblLoginStatus.TabIndex = 3;
            this.lblLoginStatus.Text = "...";
            // 
            // lbInfo
            // 
            this.lbInfo.FormattingEnabled = true;
            this.lbInfo.ItemHeight = 16;
            this.lbInfo.Location = new System.Drawing.Point(263, 15);
            this.lbInfo.Margin = new System.Windows.Forms.Padding(4);
            this.lbInfo.Name = "lbInfo";
            this.lbInfo.Size = new System.Drawing.Size(681, 212);
            this.lbInfo.TabIndex = 4;
            // 
            // btnVraagInfo
            // 
            this.btnVraagInfo.Location = new System.Drawing.Point(260, 231);
            this.btnVraagInfo.Margin = new System.Windows.Forms.Padding(4);
            this.btnVraagInfo.Name = "btnVraagInfo";
            this.btnVraagInfo.Size = new System.Drawing.Size(100, 28);
            this.btnVraagInfo.TabIndex = 5;
            this.btnVraagInfo.Text = "vraag info";
            this.btnVraagInfo.UseVisualStyleBackColor = true;
            this.btnVraagInfo.Click += new System.EventHandler(this.btnVraagInfo_Click);
            // 
            // tbNaamInfo
            // 
            this.tbNaamInfo.Location = new System.Drawing.Point(368, 235);
            this.tbNaamInfo.Margin = new System.Windows.Forms.Padding(4);
            this.tbNaamInfo.Name = "tbNaamInfo";
            this.tbNaamInfo.Size = new System.Drawing.Size(132, 22);
            this.tbNaamInfo.TabIndex = 6;
            this.tbNaamInfo.Text = "admin";
            // 
            // lblTitel
            // 
            this.lblTitel.AutoSize = true;
            this.lblTitel.Location = new System.Drawing.Point(16, 231);
            this.lblTitel.Name = "lblTitel";
            this.lblTitel.Size = new System.Drawing.Size(46, 17);
            this.lblTitel.TabIndex = 7;
            this.lblTitel.Text = "label1";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(690, 299);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(46, 17);
            this.label1.TabIndex = 8;
            this.label1.Text = "label1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1101, 495);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblTitel);
            this.Controls.Add(this.tbNaamInfo);
            this.Controls.Add(this.btnVraagInfo);
            this.Controls.Add(this.lbInfo);
            this.Controls.Add(this.lblLoginStatus);
            this.Controls.Add(this.tbWachtwoord);
            this.Controls.Add(this.tbNaam);
            this.Controls.Add(this.btnLogin);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.TextBox tbNaam;
        private System.Windows.Forms.TextBox tbWachtwoord;
        private System.Windows.Forms.Label lblLoginStatus;
        private System.Windows.Forms.ListBox lbInfo;
        private System.Windows.Forms.Button btnVraagInfo;
        private System.Windows.Forms.TextBox tbNaamInfo;
        private System.Windows.Forms.Label lblTitel;
        private System.Windows.Forms.Label label1;
    }
}

