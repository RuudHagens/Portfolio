using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace bankrekening
{
    public partial class BankrekeningForm : Form
    {
        //datavelden
        private Bankrekening bankrekeningLinks;
        private Bankrekening bankrekeningRechts;
        
        public BankrekeningForm()
        {
            InitializeComponent();
            bankrekeningLinks = new Bankrekening ( "Duck, Dagobert", 1000);
            bankrekeningRechts = new Bankrekening ( "Gans, Gijs", 1000 );
        }

        public void Updatelabels()
        {
            lblSaldo1.Text = "Saldo: € " + bankrekeningLinks.Saldo;
            lblSaldo2.Text = "Saldo: € " + bankrekeningRechts.Saldo;
        }

        private void btnOverMakenRechts_Click(object sender, EventArgs e)
        {
            decimal bedrag3 = Convert.ToDecimal(nudInt1.Text) + (Convert.ToDecimal(nudDouble1.Text) / 100);
            bankrekeningLinks.MaakOverNaar(bankrekeningRechts, bedrag3);
            Updatelabels();
        }

        private void btnOverMakenLinks_Click(object sender, EventArgs e)
        {
            decimal bedrag4 = Convert.ToDecimal(nudInt2.Text) + (Convert.ToDecimal(nudDouble2.Text) / 100);
            bankrekeningRechts.MaakOverNaar(bankrekeningLinks, bedrag4);
            Updatelabels();           
        }

        private void btnOpnemen1_Click(object sender, EventArgs e)
        {
            decimal bedrag1 = Convert.ToDecimal(nudInt1.Text) + (Convert.ToDecimal(nudDouble1.Text) / 100);
            bankrekeningLinks.NeemOp(bedrag1);
            Updatelabels();
        }

        private void btnStorten1_Click(object sender, EventArgs e)
        {
            decimal bedrag1 = Convert.ToDecimal(nudInt1.Text) + (Convert.ToDecimal(nudDouble1.Text) / 100);
            bankrekeningLinks.Stort(bedrag1);
            Updatelabels();
        }

        private void btnOpnemen2_Click(object sender, EventArgs e)
        {
            decimal bedrag2 = Convert.ToDecimal(nudInt2.Text) + (Convert.ToDecimal(nudDouble2.Text) / 100);
            bankrekeningRechts.NeemOp(bedrag2);
            Updatelabels();
        }

        private void btnStorten2_Click(object sender, EventArgs e)
        {
            decimal bedrag2 = Convert.ToDecimal(nudInt2.Text) + (Convert.ToDecimal(nudDouble2.Text) / 100);
            bankrekeningRechts.Stort(bedrag2);
            Updatelabels();
        }

    }
}
