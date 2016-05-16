namespace Game_Project
{
    partial class Hangman
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Hangman));
            this.gbRaden = new System.Windows.Forms.GroupBox();
            this.tbWord = new System.Windows.Forms.TextBox();
            this.tbLetter = new System.Windows.Forms.TextBox();
            this.btnWord = new System.Windows.Forms.Button();
            this.btnLetter = new System.Windows.Forms.Button();
            this.gbWord = new System.Windows.Forms.GroupBox();
            this.lblMiss = new System.Windows.Forms.Label();
            this.lblLength = new System.Windows.Forms.Label();
            this.gbGallow = new System.Windows.Forms.GroupBox();
            this.pnGallow = new System.Windows.Forms.Panel();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnInstruction = new System.Windows.Forms.Button();
            this.gbRaden.SuspendLayout();
            this.gbWord.SuspendLayout();
            this.gbGallow.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbRaden
            // 
            this.gbRaden.Controls.Add(this.tbWord);
            this.gbRaden.Controls.Add(this.tbLetter);
            this.gbRaden.Controls.Add(this.btnWord);
            this.gbRaden.Controls.Add(this.btnLetter);
            resources.ApplyResources(this.gbRaden, "gbRaden");
            this.gbRaden.Name = "gbRaden";
            this.gbRaden.TabStop = false;
            // 
            // tbWord
            // 
            resources.ApplyResources(this.tbWord, "tbWord");
            this.tbWord.Name = "tbWord";
            // 
            // tbLetter
            // 
            resources.ApplyResources(this.tbLetter, "tbLetter");
            this.tbLetter.Name = "tbLetter";
            // 
            // btnWord
            // 
            resources.ApplyResources(this.btnWord, "btnWord");
            this.btnWord.Name = "btnWord";
            this.btnWord.UseVisualStyleBackColor = true;
            this.btnWord.Click += new System.EventHandler(this.btnWoord_Click_1);
            // 
            // btnLetter
            // 
            resources.ApplyResources(this.btnLetter, "btnLetter");
            this.btnLetter.Name = "btnLetter";
            this.btnLetter.UseVisualStyleBackColor = true;
            this.btnLetter.Click += new System.EventHandler(this.btnLetter_Click_1);
            // 
            // gbWord
            // 
            this.gbWord.Controls.Add(this.lblMiss);
            this.gbWord.Controls.Add(this.lblLength);
            resources.ApplyResources(this.gbWord, "gbWord");
            this.gbWord.Name = "gbWord";
            this.gbWord.TabStop = false;
            // 
            // lblMiss
            // 
            resources.ApplyResources(this.lblMiss, "lblMiss");
            this.lblMiss.Name = "lblMiss";
            // 
            // lblLength
            // 
            resources.ApplyResources(this.lblLength, "lblLength");
            this.lblLength.Name = "lblLength";
            // 
            // gbGallow
            // 
            this.gbGallow.Controls.Add(this.pnGallow);
            resources.ApplyResources(this.gbGallow, "gbGallow");
            this.gbGallow.Name = "gbGallow";
            this.gbGallow.TabStop = false;
            // 
            // pnGallow
            // 
            resources.ApplyResources(this.pnGallow, "pnGallow");
            this.pnGallow.Name = "pnGallow";
            // 
            // btnExit
            // 
            resources.ApplyResources(this.btnExit, "btnExit");
            this.btnExit.Name = "btnExit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnInstruction
            // 
            resources.ApplyResources(this.btnInstruction, "btnInstruction");
            this.btnInstruction.Name = "btnInstruction";
            this.btnInstruction.UseVisualStyleBackColor = true;
            this.btnInstruction.Click += new System.EventHandler(this.btnInstruction_Click);
            // 
            // Hangman
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.btnInstruction);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.gbRaden);
            this.Controls.Add(this.gbWord);
            this.Controls.Add(this.gbGallow);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Hangman";
            this.Shown += new System.EventHandler(this.Hangman_Shown_1);
            this.gbRaden.ResumeLayout(false);
            this.gbRaden.PerformLayout();
            this.gbWord.ResumeLayout(false);
            this.gbWord.PerformLayout();
            this.gbGallow.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbRaden;
        private System.Windows.Forms.TextBox tbWord;
        private System.Windows.Forms.TextBox tbLetter;
        private System.Windows.Forms.Button btnWord;
        private System.Windows.Forms.Button btnLetter;
        private System.Windows.Forms.GroupBox gbWord;
        private System.Windows.Forms.Label lblMiss;
        private System.Windows.Forms.Label lblLength;
        private System.Windows.Forms.GroupBox gbGallow;
        private System.Windows.Forms.Panel pnGallow;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnInstruction;

    }
}