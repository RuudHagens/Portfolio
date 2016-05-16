namespace TypingGame
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
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.lblCorrect = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblMissed = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblTotal = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblAccuracy = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblDificulty = new System.Windows.Forms.ToolStripStatusLabel();
            this.difficultyProgressBar = new System.Windows.Forms.ToolStripProgressBar();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // listBox1
            // 
            this.listBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 72F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 108;
            this.listBox1.Location = new System.Drawing.Point(0, -1);
            this.listBox1.MultiColumn = true;
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(604, 112);
            this.listBox1.TabIndex = 0;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 800;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lblCorrect,
            this.lblMissed,
            this.lblTotal,
            this.lblAccuracy,
            this.lblDificulty,
            this.difficultyProgressBar});
            this.statusStrip1.Location = new System.Drawing.Point(0, 101);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(599, 22);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // lblCorrect
            // 
            this.lblCorrect.Name = "lblCorrect";
            this.lblCorrect.Size = new System.Drawing.Size(58, 17);
            this.lblCorrect.Text = "Correct: 0";
            // 
            // lblMissed
            // 
            this.lblMissed.Name = "lblMissed";
            this.lblMissed.Size = new System.Drawing.Size(56, 17);
            this.lblMissed.Text = "missed: 0";
            // 
            // lblTotal
            // 
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(46, 17);
            this.lblTotal.Text = "Total: 0";
            // 
            // lblAccuracy
            // 
            this.lblAccuracy.Name = "lblAccuracy";
            this.lblAccuracy.Size = new System.Drawing.Size(78, 17);
            this.lblAccuracy.Text = "Accuracy: 0%";
            // 
            // lblDificulty
            // 
            this.lblDificulty.Name = "lblDificulty";
            this.lblDificulty.Size = new System.Drawing.Size(244, 17);
            this.lblDificulty.Spring = true;
            this.lblDificulty.Text = "Dificulty:";
            this.lblDificulty.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // difficultyProgressBar
            // 
            this.difficultyProgressBar.AutoSize = false;
            this.difficultyProgressBar.Maximum = 701;
            this.difficultyProgressBar.Name = "difficultyProgressBar";
            this.difficultyProgressBar.Size = new System.Drawing.Size(100, 16);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(599, 123);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.listBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.Text = "Form1";
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyDown);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel lblCorrect;
        private System.Windows.Forms.ToolStripStatusLabel lblMissed;
        private System.Windows.Forms.ToolStripStatusLabel lblTotal;
        private System.Windows.Forms.ToolStripStatusLabel lblAccuracy;
        private System.Windows.Forms.ToolStripStatusLabel lblDificulty;
        private System.Windows.Forms.ToolStripProgressBar difficultyProgressBar;
    }
}

