using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CookieClicker_week2
{
    public partial class Form1 : Form
    {
        KoekjesController koekjescontroller = new KoekjesController();
        Upgrade bakker = new Upgrade("Bakker", 10, 100, 150);
        Upgrade oven = new Upgrade("Oven", 50, 2000, 450);
        Upgrade deegroller = new Upgrade("Deegroller", 0, 3500, 700);

        public Form1()
        {            
            InitializeComponent();
        }

        private void btnBakker_Click(object sender, EventArgs e)
        {
            if (koekjescontroller.Koekjes >= bakker.Prijs)
            {
                koekjescontroller.Kps += bakker.Kps;
                koekjescontroller.Koekjes -= bakker.Prijs;
                bakker.Prijs += bakker.Prijsinterval;
                bakker.Aantal += 1;
                lblKps.Text = "kps: " + koekjescontroller.Kps;
                btnBakker.Text = bakker.Naam + " (" + bakker.Prijs + ") " + ": " + bakker.Aantal;
                lblKoekjes.Refresh();
            }
        }

        private void btnOven_Click(object sender, EventArgs e)
        {
            if (koekjescontroller.Koekjes >= oven.Prijs)
            {
                koekjescontroller.Kps += oven.Kps;
                koekjescontroller.Koekjes -= oven.Prijs;
                oven.Prijs += oven.Prijsinterval;
                oven.Aantal += 1;
                lblKps.Text = "kps: " + koekjescontroller.Kps;
                btnOven.Text = oven.Naam + " (" + oven.Prijs + ") " + ": " + oven.Aantal;
                lblKoekjes.Refresh();
            }
        }

        private void btnDeegroller_Click(object sender, EventArgs e)
        {
            if (koekjescontroller.Koekjes >= deegroller.Prijs)
            {
                koekjescontroller.KoekjesPerKlik += 10;
                koekjescontroller.Koekjes -= deegroller.Prijs;
                deegroller.Aantal += 1;
                btnDeegroller.Text = deegroller.Naam + " (" + deegroller.Prijs + ") " + ": " + deegroller.Aantal;
                lblKoekjes.Refresh();
            }
        }

        private void tmKps_Tick(object sender, EventArgs e)
        {
            koekjescontroller.Koekjes += koekjescontroller.Kps;
            lblKoekjes.Text = "Koekjes: " + koekjescontroller.Koekjes;
            this.Refresh();
        }

        private void pbCookie_MouseDown(object sender, MouseEventArgs e)
        {
            koekjescontroller.Koekjes += koekjescontroller.KoekjesPerKlik;
            lblKoekjes.Text = "Koekjes: " + koekjescontroller.Koekjes;  
        }
    }
}
