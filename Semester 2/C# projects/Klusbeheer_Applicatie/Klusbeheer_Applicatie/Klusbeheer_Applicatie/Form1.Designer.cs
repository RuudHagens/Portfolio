namespace Klusbeheer_Applicatie
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
            this.gbAdres = new System.Windows.Forms.GroupBox();
            this.lbAdres = new System.Windows.Forms.Label();
            this.tbPlaats = new System.Windows.Forms.TextBox();
            this.lbPlaats = new System.Windows.Forms.Label();
            this.tbHuisnummer = new System.Windows.Forms.TextBox();
            this.lbHuisnummer = new System.Windows.Forms.Label();
            this.tbStraat = new System.Windows.Forms.TextBox();
            this.lbStraat = new System.Windows.Forms.Label();
            this.gbGereedschap = new System.Windows.Forms.GroupBox();
            this.lbDatumKeuring = new System.Windows.Forms.Label();
            this.dtpDatumKeuring = new System.Windows.Forms.DateTimePicker();
            this.tbGewicht = new System.Windows.Forms.TextBox();
            this.lbGewicht = new System.Windows.Forms.Label();
            this.tbNaam = new System.Windows.Forms.TextBox();
            this.lbNaam = new System.Windows.Forms.Label();
            this.tbURL = new System.Windows.Forms.TextBox();
            this.cbAccu = new System.Windows.Forms.CheckBox();
            this.tbVermogen = new System.Windows.Forms.TextBox();
            this.lbVermogen = new System.Windows.Forms.Label();
            this.btnLaadPlaatje = new System.Windows.Forms.Button();
            this.pbGereedschap = new System.Windows.Forms.PictureBox();
            this.rbMachine = new System.Windows.Forms.RadioButton();
            this.tbArtikelnummer = new System.Windows.Forms.TextBox();
            this.rbHandgereedschap = new System.Windows.Forms.RadioButton();
            this.rtikelnummer = new System.Windows.Forms.Label();
            this.tbPrijs = new System.Windows.Forms.TextBox();
            this.lbPrijs = new System.Windows.Forms.Label();
            this.btnGereedschap = new System.Windows.Forms.Button();
            this.lbDatumAanschaf = new System.Windows.Forms.Label();
            this.dtpDatumAanschaf = new System.Windows.Forms.DateTimePicker();
            this.tbMerk = new System.Windows.Forms.TextBox();
            this.lbMerk = new System.Windows.Forms.Label();
            this.tbBeschrijving = new System.Windows.Forms.TextBox();
            this.lbBeschrijving = new System.Windows.Forms.Label();
            this.gbKLus = new System.Windows.Forms.GroupBox();
            this.btnVulKist = new System.Windows.Forms.Button();
            this.lbGereedschappen = new System.Windows.Forms.ListBox();
            this.btnGereedschapNaam = new System.Windows.Forms.Button();
            this.btnMaakKlus = new System.Windows.Forms.Button();
            this.lbEindDatum = new System.Windows.Forms.Label();
            this.lbStartdatum = new System.Windows.Forms.Label();
            this.dtpEindDatum = new System.Windows.Forms.DateTimePicker();
            this.dtpStartDatum = new System.Windows.Forms.DateTimePicker();
            this.cbWerkzaamheden = new System.Windows.Forms.ComboBox();
            this.btnKlus = new System.Windows.Forms.Button();
            this.gbWerknemer = new System.Windows.Forms.GroupBox();
            this.btnSaveVoorraad = new System.Windows.Forms.Button();
            this.btnSortHand = new System.Windows.Forms.Button();
            this.btnSort = new System.Windows.Forms.Button();
            this.btnZoekArtikel = new System.Windows.Forms.Button();
            this.tbGereedschappen = new System.Windows.Forms.TextBox();
            this.btnGereedschappen = new System.Windows.Forms.Button();
            this.lbAanschafDatum = new System.Windows.Forms.Label();
            this.dtpAanschafDatum = new System.Windows.Forms.DateTimePicker();
            this.tbZoekArtikelnummer = new System.Windows.Forms.TextBox();
            this.lbArtikelnummer = new System.Windows.Forms.Label();
            this.gbAdres.SuspendLayout();
            this.gbGereedschap.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGereedschap)).BeginInit();
            this.gbKLus.SuspendLayout();
            this.gbWerknemer.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbAdres
            // 
            this.gbAdres.Controls.Add(this.lbAdres);
            this.gbAdres.Controls.Add(this.tbPlaats);
            this.gbAdres.Controls.Add(this.lbPlaats);
            this.gbAdres.Controls.Add(this.tbHuisnummer);
            this.gbAdres.Controls.Add(this.lbHuisnummer);
            this.gbAdres.Controls.Add(this.tbStraat);
            this.gbAdres.Controls.Add(this.lbStraat);
            this.gbAdres.Location = new System.Drawing.Point(1020, 426);
            this.gbAdres.Name = "gbAdres";
            this.gbAdres.Size = new System.Drawing.Size(316, 121);
            this.gbAdres.TabIndex = 13;
            this.gbAdres.TabStop = false;
            this.gbAdres.Text = "Adres";
            // 
            // lbAdres
            // 
            this.lbAdres.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
            this.lbAdres.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbAdres.Location = new System.Drawing.Point(19, 38);
            this.lbAdres.Name = "lbAdres";
            this.lbAdres.Size = new System.Drawing.Size(91, 35);
            this.lbAdres.TabIndex = 11;
            this.lbAdres.Text = "Adres";
            // 
            // tbPlaats
            // 
            this.tbPlaats.Location = new System.Drawing.Point(208, 77);
            this.tbPlaats.Name = "tbPlaats";
            this.tbPlaats.Size = new System.Drawing.Size(100, 20);
            this.tbPlaats.TabIndex = 10;
            this.tbPlaats.Tag = "t";
            this.tbPlaats.Text = "Utrecht";
            // 
            // lbPlaats
            // 
            this.lbPlaats.AutoSize = true;
            this.lbPlaats.Location = new System.Drawing.Point(136, 81);
            this.lbPlaats.Name = "lbPlaats";
            this.lbPlaats.Size = new System.Drawing.Size(36, 13);
            this.lbPlaats.TabIndex = 9;
            this.lbPlaats.Text = "Plaats";
            // 
            // tbHuisnummer
            // 
            this.tbHuisnummer.Location = new System.Drawing.Point(208, 47);
            this.tbHuisnummer.Name = "tbHuisnummer";
            this.tbHuisnummer.Size = new System.Drawing.Size(100, 20);
            this.tbHuisnummer.TabIndex = 6;
            this.tbHuisnummer.Text = "20";
            // 
            // lbHuisnummer
            // 
            this.lbHuisnummer.AutoSize = true;
            this.lbHuisnummer.Location = new System.Drawing.Point(137, 50);
            this.lbHuisnummer.Name = "lbHuisnummer";
            this.lbHuisnummer.Size = new System.Drawing.Size(65, 13);
            this.lbHuisnummer.TabIndex = 5;
            this.lbHuisnummer.Text = "Huisnummer";
            // 
            // tbStraat
            // 
            this.tbStraat.Location = new System.Drawing.Point(208, 13);
            this.tbStraat.Name = "tbStraat";
            this.tbStraat.Size = new System.Drawing.Size(100, 20);
            this.tbStraat.TabIndex = 4;
            this.tbStraat.Text = "Bovengracht";
            // 
            // lbStraat
            // 
            this.lbStraat.AutoSize = true;
            this.lbStraat.Location = new System.Drawing.Point(136, 16);
            this.lbStraat.Name = "lbStraat";
            this.lbStraat.Size = new System.Drawing.Size(35, 13);
            this.lbStraat.TabIndex = 3;
            this.lbStraat.Text = "Straat";
            // 
            // gbGereedschap
            // 
            this.gbGereedschap.Controls.Add(this.lbDatumKeuring);
            this.gbGereedschap.Controls.Add(this.dtpDatumKeuring);
            this.gbGereedschap.Controls.Add(this.tbGewicht);
            this.gbGereedschap.Controls.Add(this.lbGewicht);
            this.gbGereedschap.Controls.Add(this.tbNaam);
            this.gbGereedschap.Controls.Add(this.lbNaam);
            this.gbGereedschap.Controls.Add(this.tbURL);
            this.gbGereedschap.Controls.Add(this.cbAccu);
            this.gbGereedschap.Controls.Add(this.tbVermogen);
            this.gbGereedschap.Controls.Add(this.lbVermogen);
            this.gbGereedschap.Controls.Add(this.btnLaadPlaatje);
            this.gbGereedschap.Controls.Add(this.pbGereedschap);
            this.gbGereedschap.Controls.Add(this.rbMachine);
            this.gbGereedschap.Controls.Add(this.tbArtikelnummer);
            this.gbGereedschap.Controls.Add(this.rbHandgereedschap);
            this.gbGereedschap.Controls.Add(this.rtikelnummer);
            this.gbGereedschap.Controls.Add(this.tbPrijs);
            this.gbGereedschap.Controls.Add(this.lbPrijs);
            this.gbGereedschap.Controls.Add(this.btnGereedschap);
            this.gbGereedschap.Controls.Add(this.lbDatumAanschaf);
            this.gbGereedschap.Controls.Add(this.dtpDatumAanschaf);
            this.gbGereedschap.Controls.Add(this.tbMerk);
            this.gbGereedschap.Controls.Add(this.lbMerk);
            this.gbGereedschap.Controls.Add(this.tbBeschrijving);
            this.gbGereedschap.Controls.Add(this.lbBeschrijving);
            this.gbGereedschap.Location = new System.Drawing.Point(28, 12);
            this.gbGereedschap.Name = "gbGereedschap";
            this.gbGereedschap.Size = new System.Drawing.Size(454, 517);
            this.gbGereedschap.TabIndex = 16;
            this.gbGereedschap.TabStop = false;
            this.gbGereedschap.Text = "Aanmaken Gereedschap";
            // 
            // lbDatumKeuring
            // 
            this.lbDatumKeuring.Location = new System.Drawing.Point(50, 212);
            this.lbDatumKeuring.Name = "lbDatumKeuring";
            this.lbDatumKeuring.Size = new System.Drawing.Size(100, 20);
            this.lbDatumKeuring.TabIndex = 53;
            this.lbDatumKeuring.Text = "Datum Keuring";
            this.lbDatumKeuring.Visible = false;
            // 
            // dtpDatumKeuring
            // 
            this.dtpDatumKeuring.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDatumKeuring.Location = new System.Drawing.Point(174, 206);
            this.dtpDatumKeuring.Name = "dtpDatumKeuring";
            this.dtpDatumKeuring.Size = new System.Drawing.Size(127, 20);
            this.dtpDatumKeuring.TabIndex = 52;
            this.dtpDatumKeuring.Visible = false;
            // 
            // tbGewicht
            // 
            this.tbGewicht.Location = new System.Drawing.Point(171, 155);
            this.tbGewicht.Name = "tbGewicht";
            this.tbGewicht.Size = new System.Drawing.Size(129, 20);
            this.tbGewicht.TabIndex = 51;
            this.tbGewicht.Text = "1500";
            // 
            // lbGewicht
            // 
            this.lbGewicht.AutoSize = true;
            this.lbGewicht.Location = new System.Drawing.Point(50, 158);
            this.lbGewicht.Name = "lbGewicht";
            this.lbGewicht.Size = new System.Drawing.Size(64, 13);
            this.lbGewicht.TabIndex = 50;
            this.lbGewicht.Text = "Gewicht (gr)";
            // 
            // tbNaam
            // 
            this.tbNaam.Location = new System.Drawing.Point(171, 53);
            this.tbNaam.Name = "tbNaam";
            this.tbNaam.Size = new System.Drawing.Size(129, 20);
            this.tbNaam.TabIndex = 49;
            this.tbNaam.Text = "Hamer";
            // 
            // lbNaam
            // 
            this.lbNaam.AutoSize = true;
            this.lbNaam.Location = new System.Drawing.Point(50, 53);
            this.lbNaam.Name = "lbNaam";
            this.lbNaam.Size = new System.Drawing.Size(35, 13);
            this.lbNaam.TabIndex = 48;
            this.lbNaam.Text = "Naam";
            // 
            // tbURL
            // 
            this.tbURL.Location = new System.Drawing.Point(196, 477);
            this.tbURL.Name = "tbURL";
            this.tbURL.Size = new System.Drawing.Size(214, 20);
            this.tbURL.TabIndex = 46;
            this.tbURL.Text = "C:/Users/verwa_000/Desktop/Hamer.jpg";
            // 
            // cbAccu
            // 
            this.cbAccu.AutoSize = true;
            this.cbAccu.Location = new System.Drawing.Point(48, 267);
            this.cbAccu.Name = "cbAccu";
            this.cbAccu.Size = new System.Drawing.Size(51, 17);
            this.cbAccu.TabIndex = 45;
            this.cbAccu.Text = "Accu";
            this.cbAccu.UseVisualStyleBackColor = true;
            this.cbAccu.Visible = false;
            // 
            // tbVermogen
            // 
            this.tbVermogen.Location = new System.Drawing.Point(187, 244);
            this.tbVermogen.Name = "tbVermogen";
            this.tbVermogen.Size = new System.Drawing.Size(113, 20);
            this.tbVermogen.TabIndex = 43;
            this.tbVermogen.Text = "1.5Ah ";
            this.tbVermogen.Visible = false;
            // 
            // lbVermogen
            // 
            this.lbVermogen.Location = new System.Drawing.Point(49, 235);
            this.lbVermogen.Name = "lbVermogen";
            this.lbVermogen.Size = new System.Drawing.Size(100, 20);
            this.lbVermogen.TabIndex = 42;
            this.lbVermogen.Text = "Vermogen";
            this.lbVermogen.Visible = false;
            // 
            // btnLaadPlaatje
            // 
            this.btnLaadPlaatje.Location = new System.Drawing.Point(196, 404);
            this.btnLaadPlaatje.Name = "btnLaadPlaatje";
            this.btnLaadPlaatje.Size = new System.Drawing.Size(79, 64);
            this.btnLaadPlaatje.TabIndex = 41;
            this.btnLaadPlaatje.Text = "Laad plaatje";
            this.btnLaadPlaatje.UseVisualStyleBackColor = true;
            this.btnLaadPlaatje.Click += new System.EventHandler(this.btnLaadPlaatje_Click);
            // 
            // pbGereedschap
            // 
            this.pbGereedschap.Location = new System.Drawing.Point(10, 359);
            this.pbGereedschap.Name = "pbGereedschap";
            this.pbGereedschap.Size = new System.Drawing.Size(151, 155);
            this.pbGereedschap.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pbGereedschap.TabIndex = 40;
            this.pbGereedschap.TabStop = false;
            // 
            // rbMachine
            // 
            this.rbMachine.AutoSize = true;
            this.rbMachine.Location = new System.Drawing.Point(48, 325);
            this.rbMachine.Name = "rbMachine";
            this.rbMachine.Size = new System.Drawing.Size(66, 17);
            this.rbMachine.TabIndex = 1;
            this.rbMachine.Text = "Machine";
            this.rbMachine.UseVisualStyleBackColor = true;
            this.rbMachine.CheckedChanged += new System.EventHandler(this.rbMachine_CheckedChanged);
            // 
            // tbArtikelnummer
            // 
            this.tbArtikelnummer.Location = new System.Drawing.Point(171, 27);
            this.tbArtikelnummer.Name = "tbArtikelnummer";
            this.tbArtikelnummer.Size = new System.Drawing.Size(129, 20);
            this.tbArtikelnummer.TabIndex = 39;
            this.tbArtikelnummer.Text = "536";
            // 
            // rbHandgereedschap
            // 
            this.rbHandgereedschap.AutoSize = true;
            this.rbHandgereedschap.Checked = true;
            this.rbHandgereedschap.Location = new System.Drawing.Point(48, 298);
            this.rbHandgereedschap.Name = "rbHandgereedschap";
            this.rbHandgereedschap.Size = new System.Drawing.Size(113, 17);
            this.rbHandgereedschap.TabIndex = 0;
            this.rbHandgereedschap.TabStop = true;
            this.rbHandgereedschap.Text = "Handgereedschap";
            this.rbHandgereedschap.UseVisualStyleBackColor = true;
            // 
            // rtikelnummer
            // 
            this.rtikelnummer.AutoSize = true;
            this.rtikelnummer.Location = new System.Drawing.Point(49, 34);
            this.rtikelnummer.Name = "rtikelnummer";
            this.rtikelnummer.Size = new System.Drawing.Size(73, 13);
            this.rtikelnummer.TabIndex = 38;
            this.rtikelnummer.Text = "Artikelnummer";
            // 
            // tbPrijs
            // 
            this.tbPrijs.Location = new System.Drawing.Point(171, 131);
            this.tbPrijs.Name = "tbPrijs";
            this.tbPrijs.Size = new System.Drawing.Size(113, 20);
            this.tbPrijs.TabIndex = 37;
            this.tbPrijs.Text = "7,50";
            // 
            // lbPrijs
            // 
            this.lbPrijs.AutoSize = true;
            this.lbPrijs.Location = new System.Drawing.Point(49, 134);
            this.lbPrijs.Name = "lbPrijs";
            this.lbPrijs.Size = new System.Drawing.Size(56, 13);
            this.lbPrijs.TabIndex = 36;
            this.lbPrijs.Text = "Prijs (euro)";
            // 
            // btnGereedschap
            // 
            this.btnGereedschap.Location = new System.Drawing.Point(196, 321);
            this.btnGereedschap.Name = "btnGereedschap";
            this.btnGereedschap.Size = new System.Drawing.Size(79, 64);
            this.btnGereedschap.TabIndex = 31;
            this.btnGereedschap.Text = "Voeg toe gereedschap";
            this.btnGereedschap.UseVisualStyleBackColor = true;
            this.btnGereedschap.Click += new System.EventHandler(this.btnGereedschap_Click);
            // 
            // lbDatumAanschaf
            // 
            this.lbDatumAanschaf.Location = new System.Drawing.Point(49, 187);
            this.lbDatumAanschaf.Name = "lbDatumAanschaf";
            this.lbDatumAanschaf.Size = new System.Drawing.Size(100, 20);
            this.lbDatumAanschaf.TabIndex = 30;
            this.lbDatumAanschaf.Text = "Datum Aanschaf";
            // 
            // dtpDatumAanschaf
            // 
            this.dtpDatumAanschaf.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDatumAanschaf.Location = new System.Drawing.Point(173, 181);
            this.dtpDatumAanschaf.Name = "dtpDatumAanschaf";
            this.dtpDatumAanschaf.Size = new System.Drawing.Size(127, 20);
            this.dtpDatumAanschaf.TabIndex = 29;
            // 
            // tbMerk
            // 
            this.tbMerk.Location = new System.Drawing.Point(173, 105);
            this.tbMerk.Name = "tbMerk";
            this.tbMerk.Size = new System.Drawing.Size(113, 20);
            this.tbMerk.TabIndex = 25;
            this.tbMerk.Text = "Stanley";
            // 
            // lbMerk
            // 
            this.lbMerk.AutoSize = true;
            this.lbMerk.Location = new System.Drawing.Point(49, 101);
            this.lbMerk.Name = "lbMerk";
            this.lbMerk.Size = new System.Drawing.Size(31, 13);
            this.lbMerk.TabIndex = 20;
            this.lbMerk.Text = "Merk";
            // 
            // tbBeschrijving
            // 
            this.tbBeschrijving.Location = new System.Drawing.Point(173, 79);
            this.tbBeschrijving.Name = "tbBeschrijving";
            this.tbBeschrijving.Size = new System.Drawing.Size(250, 20);
            this.tbBeschrijving.TabIndex = 19;
            this.tbBeschrijving.Text = "Houten steel";
            // 
            // lbBeschrijving
            // 
            this.lbBeschrijving.AutoSize = true;
            this.lbBeschrijving.Location = new System.Drawing.Point(50, 73);
            this.lbBeschrijving.Name = "lbBeschrijving";
            this.lbBeschrijving.Size = new System.Drawing.Size(64, 13);
            this.lbBeschrijving.TabIndex = 18;
            this.lbBeschrijving.Text = "Beschrijving";
            // 
            // gbKLus
            // 
            this.gbKLus.Controls.Add(this.btnVulKist);
            this.gbKLus.Controls.Add(this.lbGereedschappen);
            this.gbKLus.Controls.Add(this.btnGereedschapNaam);
            this.gbKLus.Controls.Add(this.btnMaakKlus);
            this.gbKLus.Controls.Add(this.lbEindDatum);
            this.gbKLus.Controls.Add(this.lbStartdatum);
            this.gbKLus.Controls.Add(this.dtpEindDatum);
            this.gbKLus.Controls.Add(this.dtpStartDatum);
            this.gbKLus.Controls.Add(this.cbWerkzaamheden);
            this.gbKLus.Controls.Add(this.btnKlus);
            this.gbKLus.Location = new System.Drawing.Point(939, 12);
            this.gbKLus.Name = "gbKLus";
            this.gbKLus.Size = new System.Drawing.Size(488, 404);
            this.gbKLus.TabIndex = 21;
            this.gbKLus.TabStop = false;
            this.gbKLus.Text = "Aanmaken Klus";
            // 
            // btnVulKist
            // 
            this.btnVulKist.Location = new System.Drawing.Point(21, 267);
            this.btnVulKist.Name = "btnVulKist";
            this.btnVulKist.Size = new System.Drawing.Size(104, 48);
            this.btnVulKist.TabIndex = 41;
            this.btnVulKist.Text = "Vul gereedschapkist";
            this.btnVulKist.UseVisualStyleBackColor = true;
            this.btnVulKist.Click += new System.EventHandler(this.btnVulKist_Click);
            // 
            // lbGereedschappen
            // 
            this.lbGereedschappen.FormattingEnabled = true;
            this.lbGereedschappen.Location = new System.Drawing.Point(260, 4);
            this.lbGereedschappen.Name = "lbGereedschappen";
            this.lbGereedschappen.SelectionMode = System.Windows.Forms.SelectionMode.MultiSimple;
            this.lbGereedschappen.Size = new System.Drawing.Size(195, 368);
            this.lbGereedschappen.TabIndex = 40;
            // 
            // btnGereedschapNaam
            // 
            this.btnGereedschapNaam.Location = new System.Drawing.Point(21, 195);
            this.btnGereedschapNaam.Name = "btnGereedschapNaam";
            this.btnGereedschapNaam.Size = new System.Drawing.Size(92, 48);
            this.btnGereedschapNaam.TabIndex = 39;
            this.btnGereedschapNaam.Text = "Show Gereedschap naam";
            this.btnGereedschapNaam.UseVisualStyleBackColor = true;
            this.btnGereedschapNaam.Click += new System.EventHandler(this.btnGereedschapNaam_Click);
            // 
            // btnMaakKlus
            // 
            this.btnMaakKlus.Location = new System.Drawing.Point(16, 131);
            this.btnMaakKlus.Name = "btnMaakKlus";
            this.btnMaakKlus.Size = new System.Drawing.Size(92, 41);
            this.btnMaakKlus.TabIndex = 34;
            this.btnMaakKlus.Text = "Maak klus aan";
            this.btnMaakKlus.UseVisualStyleBackColor = true;
            this.btnMaakKlus.Click += new System.EventHandler(this.btnMaakKlus_Click);
            // 
            // lbEindDatum
            // 
            this.lbEindDatum.AutoSize = true;
            this.lbEindDatum.Location = new System.Drawing.Point(18, 95);
            this.lbEindDatum.Name = "lbEindDatum";
            this.lbEindDatum.Size = new System.Drawing.Size(60, 13);
            this.lbEindDatum.TabIndex = 33;
            this.lbEindDatum.Text = "Eind datum";
            // 
            // lbStartdatum
            // 
            this.lbStartdatum.AutoSize = true;
            this.lbStartdatum.Location = new System.Drawing.Point(18, 56);
            this.lbStartdatum.Name = "lbStartdatum";
            this.lbStartdatum.Size = new System.Drawing.Size(61, 13);
            this.lbStartdatum.TabIndex = 32;
            this.lbStartdatum.Text = "Start datum";
            // 
            // dtpEindDatum
            // 
            this.dtpEindDatum.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpEindDatum.Location = new System.Drawing.Point(85, 95);
            this.dtpEindDatum.Name = "dtpEindDatum";
            this.dtpEindDatum.Size = new System.Drawing.Size(127, 20);
            this.dtpEindDatum.TabIndex = 31;
            // 
            // dtpStartDatum
            // 
            this.dtpStartDatum.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpStartDatum.Location = new System.Drawing.Point(85, 50);
            this.dtpStartDatum.Name = "dtpStartDatum";
            this.dtpStartDatum.Size = new System.Drawing.Size(127, 20);
            this.dtpStartDatum.TabIndex = 30;
            // 
            // cbWerkzaamheden
            // 
            this.cbWerkzaamheden.FormattingEnabled = true;
            this.cbWerkzaamheden.Items.AddRange(new object[] {
            "Loodgieterswerk",
            "Electriciteit",
            "Timmerwerk",
            "Metselen",
            "Schilderen"});
            this.cbWerkzaamheden.Location = new System.Drawing.Point(16, 19);
            this.cbWerkzaamheden.Name = "cbWerkzaamheden";
            this.cbWerkzaamheden.Size = new System.Drawing.Size(121, 21);
            this.cbWerkzaamheden.TabIndex = 19;
            this.cbWerkzaamheden.Text = "Klus type";
            // 
            // btnKlus
            // 
            this.btnKlus.Location = new System.Drawing.Point(21, 337);
            this.btnKlus.Name = "btnKlus";
            this.btnKlus.Size = new System.Drawing.Size(87, 48);
            this.btnKlus.TabIndex = 18;
            this.btnKlus.Text = "Sla klus op";
            this.btnKlus.UseVisualStyleBackColor = true;
            // 
            // gbWerknemer
            // 
            this.gbWerknemer.Controls.Add(this.btnSaveVoorraad);
            this.gbWerknemer.Controls.Add(this.btnSortHand);
            this.gbWerknemer.Controls.Add(this.btnSort);
            this.gbWerknemer.Controls.Add(this.btnZoekArtikel);
            this.gbWerknemer.Controls.Add(this.tbGereedschappen);
            this.gbWerknemer.Controls.Add(this.btnGereedschappen);
            this.gbWerknemer.Controls.Add(this.lbAanschafDatum);
            this.gbWerknemer.Controls.Add(this.dtpAanschafDatum);
            this.gbWerknemer.Controls.Add(this.tbZoekArtikelnummer);
            this.gbWerknemer.Controls.Add(this.lbArtikelnummer);
            this.gbWerknemer.Location = new System.Drawing.Point(518, 12);
            this.gbWerknemer.Name = "gbWerknemer";
            this.gbWerknemer.Size = new System.Drawing.Size(415, 534);
            this.gbWerknemer.TabIndex = 46;
            this.gbWerknemer.TabStop = false;
            this.gbWerknemer.Text = "Seek, sort & show gereedschappen";
            // 
            // btnSaveVoorraad
            // 
            this.btnSaveVoorraad.Location = new System.Drawing.Point(39, 301);
            this.btnSaveVoorraad.Name = "btnSaveVoorraad";
            this.btnSaveVoorraad.Size = new System.Drawing.Size(75, 41);
            this.btnSaveVoorraad.TabIndex = 38;
            this.btnSaveVoorraad.Text = "Sla voorraad op";
            this.btnSaveVoorraad.UseVisualStyleBackColor = true;
            this.btnSaveVoorraad.Click += new System.EventHandler(this.btnSaveVoorraad_Click);
            // 
            // btnSortHand
            // 
            this.btnSortHand.Location = new System.Drawing.Point(39, 244);
            this.btnSortHand.Name = "btnSortHand";
            this.btnSortHand.Size = new System.Drawing.Size(110, 45);
            this.btnSortHand.TabIndex = 37;
            this.btnSortHand.Text = "Sort Handgereedschap";
            this.btnSortHand.UseVisualStyleBackColor = true;
            this.btnSortHand.Click += new System.EventHandler(this.btnSortHand_Click);
            // 
            // btnSort
            // 
            this.btnSort.Location = new System.Drawing.Point(39, 187);
            this.btnSort.Name = "btnSort";
            this.btnSort.Size = new System.Drawing.Size(86, 45);
            this.btnSort.TabIndex = 36;
            this.btnSort.Text = "Sort Gereedschap";
            this.btnSort.UseVisualStyleBackColor = true;
            this.btnSort.Click += new System.EventHandler(this.btnSort_Click);
            // 
            // btnZoekArtikel
            // 
            this.btnZoekArtikel.Location = new System.Drawing.Point(292, 440);
            this.btnZoekArtikel.Name = "btnZoekArtikel";
            this.btnZoekArtikel.Size = new System.Drawing.Size(89, 55);
            this.btnZoekArtikel.TabIndex = 28;
            this.btnZoekArtikel.Text = "Zoek op artikelnummer";
            this.btnZoekArtikel.UseVisualStyleBackColor = true;
            // 
            // tbGereedschappen
            // 
            this.tbGereedschappen.Location = new System.Drawing.Point(172, 38);
            this.tbGereedschappen.Multiline = true;
            this.tbGereedschappen.Name = "tbGereedschappen";
            this.tbGereedschappen.Size = new System.Drawing.Size(199, 366);
            this.tbGereedschappen.TabIndex = 35;
            this.tbGereedschappen.Text = "Gereedschappen";
            // 
            // btnGereedschappen
            // 
            this.btnGereedschappen.Location = new System.Drawing.Point(39, 38);
            this.btnGereedschappen.Name = "btnGereedschappen";
            this.btnGereedschappen.Size = new System.Drawing.Size(86, 48);
            this.btnGereedschappen.TabIndex = 34;
            this.btnGereedschappen.Text = "Show Gereedschap compleet";
            this.btnGereedschappen.UseVisualStyleBackColor = true;
            this.btnGereedschappen.Click += new System.EventHandler(this.btnGereedschappen_Click);
            // 
            // lbAanschafDatum
            // 
            this.lbAanschafDatum.Location = new System.Drawing.Point(25, 480);
            this.lbAanschafDatum.Name = "lbAanschafDatum";
            this.lbAanschafDatum.Size = new System.Drawing.Size(100, 39);
            this.lbAanschafDatum.TabIndex = 30;
            this.lbAanschafDatum.Text = "Datum keuring";
            // 
            // dtpAanschafDatum
            // 
            this.dtpAanschafDatum.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpAanschafDatum.Location = new System.Drawing.Point(139, 484);
            this.dtpAanschafDatum.Name = "dtpAanschafDatum";
            this.dtpAanschafDatum.Size = new System.Drawing.Size(102, 20);
            this.dtpAanschafDatum.TabIndex = 29;
            // 
            // tbZoekArtikelnummer
            // 
            this.tbZoekArtikelnummer.Location = new System.Drawing.Point(139, 440);
            this.tbZoekArtikelnummer.Name = "tbZoekArtikelnummer";
            this.tbZoekArtikelnummer.Size = new System.Drawing.Size(76, 20);
            this.tbZoekArtikelnummer.TabIndex = 19;
            this.tbZoekArtikelnummer.Text = "WM536-XJ";
            // 
            // lbArtikelnummer
            // 
            this.lbArtikelnummer.AutoSize = true;
            this.lbArtikelnummer.Location = new System.Drawing.Point(25, 440);
            this.lbArtikelnummer.Name = "lbArtikelnummer";
            this.lbArtikelnummer.Size = new System.Drawing.Size(73, 13);
            this.lbArtikelnummer.TabIndex = 18;
            this.lbArtikelnummer.Text = "Artikelnummer";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1362, 559);
            this.Controls.Add(this.gbWerknemer);
            this.Controls.Add(this.gbGereedschap);
            this.Controls.Add(this.gbKLus);
            this.Controls.Add(this.gbAdres);
            this.Name = "Form1";
            this.Text = "Klusbeheer";
            this.gbAdres.ResumeLayout(false);
            this.gbAdres.PerformLayout();
            this.gbGereedschap.ResumeLayout(false);
            this.gbGereedschap.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbGereedschap)).EndInit();
            this.gbKLus.ResumeLayout(false);
            this.gbKLus.PerformLayout();
            this.gbWerknemer.ResumeLayout(false);
            this.gbWerknemer.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnKlus;
        private System.Windows.Forms.GroupBox gbAdres;
        private System.Windows.Forms.Label lbAdres;
        private System.Windows.Forms.TextBox tbPlaats;
        private System.Windows.Forms.Label lbPlaats;
        private System.Windows.Forms.TextBox tbHuisnummer;
        private System.Windows.Forms.Label lbHuisnummer;
        private System.Windows.Forms.TextBox tbStraat;
        private System.Windows.Forms.Label lbStraat;
        private System.Windows.Forms.GroupBox gbGereedschap;
        private System.Windows.Forms.TextBox tbBeschrijving;
        private System.Windows.Forms.Label lbBeschrijving;
        private System.Windows.Forms.TextBox tbMerk;
        private System.Windows.Forms.Label lbMerk;
        private System.Windows.Forms.DateTimePicker dtpDatumAanschaf;
        private System.Windows.Forms.Button btnGereedschap;
        private System.Windows.Forms.Label lbDatumAanschaf;
        private System.Windows.Forms.TextBox tbPrijs;
        private System.Windows.Forms.Label lbPrijs;
        private System.Windows.Forms.TextBox tbArtikelnummer;
        private System.Windows.Forms.Label rtikelnummer;
        // private System.Windows.Forms.Button btnProfiel;
        private System.Windows.Forms.GroupBox gbKLus;
        private System.Windows.Forms.RadioButton rbMachine;
        private System.Windows.Forms.RadioButton rbHandgereedschap;
        private System.Windows.Forms.PictureBox pbGereedschap;
        private System.Windows.Forms.Button btnLaadPlaatje;
        private System.Windows.Forms.TextBox tbVermogen;
        private System.Windows.Forms.Label lbVermogen;
        private System.Windows.Forms.CheckBox cbAccu;
        private System.Windows.Forms.TextBox tbURL;
        private System.Windows.Forms.GroupBox gbWerknemer;
        private System.Windows.Forms.Button btnZoekArtikel;
        private System.Windows.Forms.Button btnGereedschappen;
        private System.Windows.Forms.Label lbAanschafDatum;
        private System.Windows.Forms.DateTimePicker dtpAanschafDatum;
        private System.Windows.Forms.TextBox tbZoekArtikelnummer;
        private System.Windows.Forms.Label lbArtikelnummer;
        private System.Windows.Forms.Button btnSort;
        private System.Windows.Forms.Button btnSortHand;
        private System.Windows.Forms.ComboBox cbWerkzaamheden;
        private System.Windows.Forms.Label lbEindDatum;
        private System.Windows.Forms.Label lbStartdatum;
        private System.Windows.Forms.DateTimePicker dtpEindDatum;
        private System.Windows.Forms.DateTimePicker dtpStartDatum;
        private System.Windows.Forms.Button btnMaakKlus;
        private System.Windows.Forms.Button btnSaveVoorraad;
        private System.Windows.Forms.Button btnGereedschapNaam;
        private System.Windows.Forms.TextBox tbGereedschappen;
        private System.Windows.Forms.ListBox lbGereedschappen;
        private System.Windows.Forms.TextBox tbNaam;
        private System.Windows.Forms.Label lbNaam;
        private System.Windows.Forms.Button btnVulKist;
        private System.Windows.Forms.TextBox tbGewicht;
        private System.Windows.Forms.Label lbGewicht;
        private System.Windows.Forms.Label lbDatumKeuring;
        private System.Windows.Forms.DateTimePicker dtpDatumKeuring;
     
    }
}

