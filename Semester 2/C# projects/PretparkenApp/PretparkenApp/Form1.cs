using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PretparkenApp
{
    public partial class PretparkenApp : Form
    {
        List<Pretpark> pretparken;
        int klantenPerUur;
        double winst;
        int simcount;

        public PretparkenApp()
        {
            InitializeComponent();
            pretparken = new List<Pretpark>();
            Pretpark efteling = new Pretpark("Efteling", 37);
            efteling.VoegAttractieToe(new Attractie("Python", 1981, "Achtbaan", 120));
            efteling.VoegAttractieToe(new Attractie("Carnaval Festival", 1984, "Darkride", 0));
            efteling.VoegAttractieToe(new Attractie("De Vliegende Hollander", 2007, "Achtbaan", 120));
            efteling.VoegAttractieToe(new Attractie("Droomvlucht", 1993, "Darkride", 0));
            efteling.VoegAttractieToe(new Attractie("Fata Morgana", 1986, "Darkride", 0));
            efteling.VoegAttractieToe(new Attractie("Gondoletta", 1981, "Rondvaart", 0));
            efteling.VoegAttractieToe(new Attractie("Vogel Rok", 1998, "Achtbaan", 120));

            pretparken.Add(efteling);

            Pretpark toverland = new Pretpark("Toverland", 24.5);
            toverland.VoegAttractieToe(new Attractie("Backstroke", 2004, "Waterride", 96));
            toverland.VoegAttractieToe(new Attractie("Booster Bike", 2004, "Achtbaan", 140));
            toverland.VoegAttractieToe(new Attractie("Djengu River", 2013, "Waterride", 100));
            toverland.VoegAttractieToe(new Attractie("Dwervelwind", 2012, "Achtbaan", 100));
            toverland.VoegAttractieToe(new Attractie("Troy", 2007, "Achtbaan", 120));
            pretparken.Add(toverland);

            cbPretparken.DataSource = pretparken;
            cbPretparken.DisplayMember = "Naam";

        }

        private void cbPretparken_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Validate();
            GbAtractie.Visible = false;
            cbAttracties.Items.Clear();
            foreach (Pretpark p in pretparken)
            {
                if (p.Naam == cbPretparken.Text)
                {
                    gbPretpark.Text = cbPretparken.Text;
                    gbPretpark.Visible = true;
                    tbToegangsprijs.Text = Convert.ToString(p.Toegangsprijs);
                    foreach (Attractie a in p.Atracties)
                    {
                        cbAttracties.Items.Add(a.Naam);
                    }    
                }            
            }
        }

        private void cbAttracties_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Validate();
            cbAttracties.Items.Clear();
            foreach (Pretpark p in pretparken)
            {
                if (p.Naam == cbPretparken.Text)
                {
                    foreach (Attractie a in p.Atracties)
                    {
                        cbAttracties.Items.Add(a.Naam);
                        if (a.Naam == cbAttracties.Text)
                        {
                            GbAtractie.Visible = true;
                            GbAtractie.Text = cbAttracties.Text;
                            lblBouwjaar.Text = Convert.ToString(a.Bouwjaar);
                            lblType.Text = a.Type;
                            lblMinimumLengte.Text = Convert.ToString(a.Minimalelengte);
                        }
                    }
                }
            }
        }

        private void btn_Click(object sender, EventArgs e)
        {
            if (simcount <10)
            {
                Random klanten = new Random();
                klantenPerUur += klanten.Next(4, 801);                
                lblKlantenPerUur.Text = "klanten: " + Convert.ToString(klantenPerUur);
                simcount++;                
            }
            else if (simcount == 10)
            {
                winst = klantenPerUur * Convert.ToDouble(tbToegangsprijs.Text);
                lblTotaalWinst.Text = "Winst: " + Convert.ToString(winst);
                simcount++;
            }
            else if (simcount == 11)
            {
                simcount = 0;
                klantenPerUur = 0;
                winst = 0;
                lblKlantenPerUur.Text = "klanten: ";
                lblTotaalWinst.Text = "Winst: ";
            }
            
        }
    }
}
