using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Klusbeheer_Applicatie
{
    public partial class Form1 : Form
    {
        private Voorraad voorraad = new Voorraad();
        public Form1()
        {
            InitializeComponent();
            voorraad.LaadGereedschappen();
            UpdateGereedschappen();
        }
        public void UpdateGereedschappen() // Vul de textbox met alle gereedschappen uit de voorraad.
        {
            tbGereedschappen.Clear();
            foreach (Gereedschap gereedschap in voorraad.Gereedschappen)
            {
                tbGereedschappen.Text += gereedschap;
            }
        }
        private void btnLaadPlaatje_Click(object sender, EventArgs e)
        {
            if (rbHandgereedschap.Checked)
            {
                tbURL.Text = @"C:\Users\Gebruiker\Desktop\2SE233\Hamer.jpg";
                pbGereedschap.ImageLocation = tbURL.Text;
            }
            else
            {
                tbURL.Text = @"C:\Users\Gebruiker\Desktop\2SE233\Boor.jpg";
                pbGereedschap.ImageLocation = tbURL.Text;
            }
        }

        private void btnGereedschap_Click(object sender, EventArgs e)
        {
            if (rbHandgereedschap.Checked)
            {
                voorraad.VoegToe(new HandGereedschap(dtpDatumAanschaf.Value, Convert.ToInt32(tbArtikelnummer.Text), tbBeschrijving.Text, Convert.ToInt32(tbGewicht.Text), tbMerk.Text, tbNaam.Text, pbGereedschap.Image, Convert.ToDecimal(tbPrijs.Text)));
                MessageBox.Show(tbNaam.Text + " is toegevoegd aan de voorraad.");
            }
            else if (rbMachine.Checked)
            {
                voorraad.VoegToe(new Machine(dtpDatumAanschaf.Value, Convert.ToInt32(tbArtikelnummer.Text), tbBeschrijving.Text, Convert.ToInt32(tbGewicht.Text), tbMerk.Text, tbNaam.Text, pbGereedschap.Image, Convert.ToDecimal(tbPrijs.Text), cbAccu.Checked, dtpDatumKeuring.Value, tbVermogen.Text));
                MessageBox.Show(tbNaam.Text + " is toegevoegd aan de voorraad.");
            }
        }

        private void rbMachine_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMachine.Checked)
            {
                lbDatumKeuring.Visible = true;
                dtpDatumKeuring.Visible = true;
                lbVermogen.Visible = true;
                tbVermogen.Visible = true;
                cbAccu.Visible = true;
            }
            else
            {
                lbDatumKeuring.Visible = false;
                dtpDatumKeuring.Visible = false;
                lbVermogen.Visible = false;
                tbVermogen.Visible = false;
                cbAccu.Visible = false;
            }
        }

        private void btnGereedschappen_Click(object sender, EventArgs e)
        {
            UpdateGereedschappen();
        }

        private void btnSort_Click(object sender, EventArgs e)
        {
            voorraad.SorteerOpAanschafDatum();
            UpdateGereedschappen();
        }

        private void btnSortHand_Click(object sender, EventArgs e)
        {
            tbGereedschappen.Clear();
            foreach(HandGereedschap gereedschap in voorraad.SorteerOpPrijsMerk())
            {
                tbGereedschappen.Text += gereedschap;
            }
        }

        private void btnSaveVoorraad_Click(object sender, EventArgs e)
        {
            if (tbGereedschappen.Text != "")
            {
                voorraad.SlaGereedschappenOp();
            }
            else
            {
                MessageBox.Show("De lijst met gereedschappen is leeg.");
            }
        }

        private void btnMaakKlus_Click(object sender, EventArgs e)
        {
            Klus klus = new Klus(dtpStartDatum.Value, dtpEindDatum.Value, cbWerkzaamheden.SelectedText, new Adres(tbHuisnummer.Text, tbPlaats.Text, tbStraat.Text));
        }

        private void btnGereedschapNaam_Click(object sender, EventArgs e)
        {
            foreach (Gereedschap gereedschap in voorraad.Gereedschappen)
            {
                lbGereedschappen.Items.Add(gereedschap);
            }
        }

        private void btnVulKist_Click(object sender, EventArgs e)
        {
            GereedschapsKist kist = new GereedschapsKist();
            int totaalGewicht = 0;
            try
            {
                foreach (Gereedschap gereedschap in lbGereedschappen.SelectedItems)
                {
                    kist.VoegToe(gereedschap);
                    totaalGewicht = totaalGewicht + gereedschap.Gewicht;
                }
                if (totaalGewicht > 150000) //Gram
                {
                    throw new GewichtsException("De gereedschapskist is te zwaar!");
                }
            }
            catch (GewichtsException exc)
            {
                MessageBox.Show(exc.Message);
            }
        }
    }
}
