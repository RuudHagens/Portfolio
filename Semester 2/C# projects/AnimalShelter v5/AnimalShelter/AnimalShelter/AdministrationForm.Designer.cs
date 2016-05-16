namespace AnimalShelter
{
    partial class AdministrationForm
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
            this.cbAnimalType = new System.Windows.Forms.ComboBox();
            this.btnCreate = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.tbChipRegitrationNumber = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.tbName = new System.Windows.Forms.TextBox();
            this.tbBadHabits = new System.Windows.Forms.TextBox();
            this.dtpDateOfBirth = new System.Windows.Forms.DateTimePicker();
            this.dtpLastWalkDate = new System.Windows.Forms.DateTimePicker();
            this.lbAvailable = new System.Windows.Forms.ListBox();
            this.lbReserved = new System.Windows.Forms.ListBox();
            this.btnSwitch = new System.Windows.Forms.Button();
            this.cbReserved = new System.Windows.Forms.CheckBox();
            this.label7 = new System.Windows.Forms.Label();
            this.cbGender = new System.Windows.Forms.ComboBox();
            this.btnForEach = new System.Windows.Forms.Button();
            this.btnSort = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnLoad = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // cbAnimalType
            // 
            this.cbAnimalType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbAnimalType.FormattingEnabled = true;
            this.cbAnimalType.Items.AddRange(new object[] {
            "cat",
            "dog"});
            this.cbAnimalType.Location = new System.Drawing.Point(12, 12);
            this.cbAnimalType.Name = "cbAnimalType";
            this.cbAnimalType.Size = new System.Drawing.Size(121, 21);
            this.cbAnimalType.TabIndex = 0;
            // 
            // btnCreate
            // 
            this.btnCreate.Location = new System.Drawing.Point(139, 10);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(64, 23);
            this.btnCreate.TabIndex = 1;
            this.btnCreate.Text = "Create";
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(209, 10);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // tbChipRegitrationNumber
            // 
            this.tbChipRegitrationNumber.Location = new System.Drawing.Point(137, 36);
            this.tbChipRegitrationNumber.Name = "tbChipRegitrationNumber";
            this.tbChipRegitrationNumber.Size = new System.Drawing.Size(147, 20);
            this.tbChipRegitrationNumber.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 39);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(123, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Chip registration number:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(9, 65);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Name:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(9, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Date of birth:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(9, 118);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Is reserved:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(9, 144);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "Bad habits:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(9, 170);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(79, 13);
            this.label6.TabIndex = 9;
            this.label6.Text = "Last walk date:";
            // 
            // tbName
            // 
            this.tbName.Location = new System.Drawing.Point(53, 62);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(231, 20);
            this.tbName.TabIndex = 10;
            // 
            // tbBadHabits
            // 
            this.tbBadHabits.Location = new System.Drawing.Point(74, 141);
            this.tbBadHabits.Name = "tbBadHabits";
            this.tbBadHabits.Size = new System.Drawing.Size(210, 20);
            this.tbBadHabits.TabIndex = 13;
            // 
            // dtpDateOfBirth
            // 
            this.dtpDateOfBirth.Location = new System.Drawing.Point(82, 86);
            this.dtpDateOfBirth.Name = "dtpDateOfBirth";
            this.dtpDateOfBirth.Size = new System.Drawing.Size(202, 20);
            this.dtpDateOfBirth.TabIndex = 14;
            // 
            // dtpLastWalkDate
            // 
            this.dtpLastWalkDate.Location = new System.Drawing.Point(94, 164);
            this.dtpLastWalkDate.Name = "dtpLastWalkDate";
            this.dtpLastWalkDate.Size = new System.Drawing.Size(190, 20);
            this.dtpLastWalkDate.TabIndex = 15;
            // 
            // lbAvailable
            // 
            this.lbAvailable.FormattingEnabled = true;
            this.lbAvailable.Location = new System.Drawing.Point(291, 10);
            this.lbAvailable.Name = "lbAvailable";
            this.lbAvailable.Size = new System.Drawing.Size(471, 147);
            this.lbAvailable.TabIndex = 17;
            // 
            // lbReserved
            // 
            this.lbReserved.FormattingEnabled = true;
            this.lbReserved.Location = new System.Drawing.Point(291, 168);
            this.lbReserved.Name = "lbReserved";
            this.lbReserved.Size = new System.Drawing.Size(471, 147);
            this.lbReserved.TabIndex = 18;
            // 
            // btnSwitch
            // 
            this.btnSwitch.Location = new System.Drawing.Point(12, 217);
            this.btnSwitch.Name = "btnSwitch";
            this.btnSwitch.Size = new System.Drawing.Size(145, 23);
            this.btnSwitch.TabIndex = 19;
            this.btnSwitch.Text = "Switch list";
            this.btnSwitch.UseVisualStyleBackColor = true;
            this.btnSwitch.Click += new System.EventHandler(this.btnSwitch_Click);
            // 
            // cbReserved
            // 
            this.cbReserved.AutoSize = true;
            this.cbReserved.Location = new System.Drawing.Point(77, 117);
            this.cbReserved.Name = "cbReserved";
            this.cbReserved.Size = new System.Drawing.Size(71, 17);
            this.cbReserved.TabIndex = 20;
            this.cbReserved.Text = "true/false";
            this.cbReserved.UseVisualStyleBackColor = true;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(12, 193);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(45, 13);
            this.label7.TabIndex = 21;
            this.label7.Text = "Gender:";
            // 
            // cbGender
            // 
            this.cbGender.FormattingEnabled = true;
            this.cbGender.Location = new System.Drawing.Point(63, 190);
            this.cbGender.Name = "cbGender";
            this.cbGender.Size = new System.Drawing.Size(222, 21);
            this.cbGender.TabIndex = 22;
            // 
            // btnForEach
            // 
            this.btnForEach.Location = new System.Drawing.Point(12, 246);
            this.btnForEach.Name = "btnForEach";
            this.btnForEach.Size = new System.Drawing.Size(145, 23);
            this.btnForEach.TabIndex = 23;
            this.btnForEach.Text = "toon habbit and last walk";
            this.btnForEach.UseVisualStyleBackColor = true;
            this.btnForEach.Click += new System.EventHandler(this.btnForEach_Click);
            // 
            // btnSort
            // 
            this.btnSort.Location = new System.Drawing.Point(12, 275);
            this.btnSort.Name = "btnSort";
            this.btnSort.Size = new System.Drawing.Size(145, 23);
            this.btnSort.TabIndex = 24;
            this.btnSort.Text = "sort chipnumber";
            this.btnSort.UseVisualStyleBackColor = true;
            this.btnSort.Click += new System.EventHandler(this.btnSort_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(12, 304);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(145, 23);
            this.btnSave.TabIndex = 25;
            this.btnSave.Text = "Save list";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnLoad
            // 
            this.btnLoad.Location = new System.Drawing.Point(12, 333);
            this.btnLoad.Name = "btnLoad";
            this.btnLoad.Size = new System.Drawing.Size(145, 23);
            this.btnLoad.TabIndex = 26;
            this.btnLoad.Text = "Load list";
            this.btnLoad.UseVisualStyleBackColor = true;
            this.btnLoad.Click += new System.EventHandler(this.btnLoad_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // AdministrationForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 366);
            this.Controls.Add(this.btnLoad);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnSort);
            this.Controls.Add(this.btnForEach);
            this.Controls.Add(this.cbGender);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.cbReserved);
            this.Controls.Add(this.btnSwitch);
            this.Controls.Add(this.lbReserved);
            this.Controls.Add(this.lbAvailable);
            this.Controls.Add(this.dtpLastWalkDate);
            this.Controls.Add(this.dtpDateOfBirth);
            this.Controls.Add(this.tbBadHabits);
            this.Controls.Add(this.tbName);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbChipRegitrationNumber);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnCreate);
            this.Controls.Add(this.cbAnimalType);
            this.Name = "AdministrationForm";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbAnimalType;
        private System.Windows.Forms.Button btnCreate;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.TextBox tbChipRegitrationNumber;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox tbName;
        private System.Windows.Forms.TextBox tbBadHabits;
        private System.Windows.Forms.DateTimePicker dtpDateOfBirth;
        private System.Windows.Forms.DateTimePicker dtpLastWalkDate;
        private System.Windows.Forms.ListBox lbAvailable;
        private System.Windows.Forms.ListBox lbReserved;
        private System.Windows.Forms.Button btnSwitch;
        private System.Windows.Forms.CheckBox cbReserved;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox cbGender;
        private System.Windows.Forms.Button btnForEach;
        private System.Windows.Forms.Button btnSort;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnLoad;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;

    }
}

